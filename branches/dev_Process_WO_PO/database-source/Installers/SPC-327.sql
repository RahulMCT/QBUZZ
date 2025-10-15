-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-327.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC327  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-327.log

SET SERVEROUT ON
SET TIMING ON
SET VERIFY OFF
SET SQLBLANKLINES ON
SET HEADING OFF
SET DEFINE OFF;

BEGIN
  DBMS_OUTPUT.ENABLE (buffer_size => NULL);
END;
/

PROMPT ...Start of SPC-327.sql

PROMPT ...Creating trigger COMP_UPD_WOS_QBZ

CREATE OR REPLACE TRIGGER COMP_UPD_WOS_QBZ
FOR INSERT OR UPDATE ON U5WOSUPP
COMPOUND TRIGGER
  --local variables
  TYPE            newwoscodetype     IS TABLE OF u5wosupp.ou_wo%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwospartype      IS TABLE OF u5wosupp.ou_parts%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwosacttype      IS TABLE OF u5wosupp.ou_act%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwoscomtype      IS TABLE OF u5wosupp.ou_comment%TYPE INDEX BY BINARY_INTEGER;

  newevtcode      newwoscodetype ;
  newevtpar       newwospartype ;
  newevtact       newwosacttype;
  newevtcom       newwoscomtype;

  countit         NUMBER;
  ccountit        NUMBER;
  pcountit        NUMBER;
  hcountit        NUMBER;
  cnt             NUMBER := 0;
  cnt1            NUMBER := 0;
  total_cost      r5events.evt_udfnum09%type;
  cuser           r5users.usr_code%type;
  clang           r5users.usr_lang%type;
  cadtext         r5addetails.add_text%type;

AFTER EACH ROW IS
BEGIN
  IF :new.ou_parts IS NOT NULL
   OR :new.ou_amt IS NOT NULL
   OR :new.ou_hrs IS NOT NULL 
   OR :new.ou_catalogue IS NOT NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newevtcode(cnt)  := :new.ou_wo;
     newevtact(cnt)   := :new.ou_act;
  END IF;
  IF :NEW.ou_comment IS NOT NULL THEN
    --save record for statement level processing
     cnt1              := cnt1 + 1;
     newevtcode(cnt1)  := :new.ou_wo;
     newevtcom(cnt1)   := :new.ou_comment;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i in 1..cnt
  LOOP
    SELECT MAX(ouhrs),MAX(ouamt),MAX(ouParts),MAX(oucatparts) INTO hcountit,pcountit,countit,ccountit FROM(
    SELECT
    COUNT(ou_hrs)        over (partition by ou_wo,ou_act)              ouhrs
    ,COUNT(ou_amt)       over (partition by ou_wo,ou_act)              ouamt
    ,COUNT(ou_parts)     over (partition by ou_wo,ou_act,ou_parts)     ouparts
    ,COUNT(ou_catalogue) over (partition by ou_wo,ou_act,ou_catalogue) oucatparts
    FROM U5WOSUPP
    WHERE ou_wo = newevtcode(i)
    AND ou_act  = newevtact(i));
    --same Part or Labor or FixAmt cannot be entered twice for same activity
    IF hcountit > 1
     OR pcountit > 1
     OR ccountit > 1
     OR countit > 1 THEN
      o7err.raise_error('COMP_UPD_WOS_QBZ','TRIG',16);
    --either Labor or FixAmt can be entered for same activity
    ELSIF pcountit = 1 AND hcountit = 1 THEN
      o7err.raise_error('COMP_UPD_WOS_QBZ','TRIG',17);
    END IF;--countit >= 1
    --Fetch Total cost of each line
    SELECT SUM((NVL(ou_qty,0) * NVL (ou_catprice,0))
              +(NVL(ou_hrs,0) * NVL (ou_pricep,0))
              + NVL(ou_amt,0)
              + (NVL (ou_partqty,0) * NVL (ou_partprice,0))) INTO total_cost
    FROM u5wosupp
    WHERE ou_wo = newevtcode(i);    
    --updating total cost
    UPDATE r5events
    SET evt_udfnum09 = total_cost
    WHERE evt_code   = newevtcode(i)
    AND NVL(evt_udfnum09,-999999) <> total_cost;
  END LOOP;
  FOR j in 1..cnt1
  LOOP
    FOR i IN (SELECT ou_comment
             FROM u5wosupp
             WHERE ou_wo = newevtcode(j)
             AND ou_comment IS NOT NULL
             ORDER BY ou_line)
    LOOP
      cadtext := cadtext||CHR(13)||i.ou_comment;
    END LOOP;--i ou_comment loop
    cadtext := SUBSTR(cadtext,INSTR(cadtext,CHR(13))+1,LENGTH(cadtext));
    --update comments
    UPDATE r5addetails
    SET add_text = cadtext
    WHERE add_code = newevtcode(j)
    AND   add_rentity = 'EVNT'
    AND   add_type = '+';
    IF SQL%NOTFOUND THEN
      cuser := NVL( o7sess.cur_user, '*' );
      SELECT usr_lang INTO clang
      FROM r5users
      WHERE usr_code = cuser;
      INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                              ,add_code, add_lang, add_line, add_print, add_text
                              , add_user, add_updatecount)
                       VALUES ('EVNT','EVNT','+','*'
                              ,newevtcode(j),clang,10,'+',newevtcom(j)
                              ,cuser,0);
    END IF;--SQL%NOTFOUND
  END LOOP;--j
END AFTER STATEMENT;

END COMP_UPD_WOS_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_WOS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_DEL_WOS_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_DEL_WOS_QBZ
FOR DELETE ON U5WOSUPP
COMPOUND TRIGGER
  --local variables
  TYPE            oldwoscodetype     IS TABLE OF u5wosupp.ou_wo%TYPE INDEX BY BINARY_INTEGER;

  oldevtcode      oldwoscodetype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  total_cost      r5events.evt_udfnum09%type;

AFTER EACH ROW IS
BEGIN
     --save record for statement level processing
     cnt              := cnt + 1;
     oldevtcode(cnt)  := :OLD.ou_wo;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    --Fetch Total cost of each line
    SELECT SUM((NVL(ou_qty,0) * NVL (ou_catprice,0))
              +(NVL(ou_hrs,0) * NVL (ou_pricep,0))
              + NVL(ou_amt,0)
              + (NVL (ou_partqty,0) * NVL (ou_partprice,0))) INTO total_cost
    FROM u5wosupp
    WHERE ou_wo = oldevtcode(i);    
    total_cost := NVL(total_cost,0);
    --updating total cost
    UPDATE r5events
    SET evt_udfnum09 = total_cost
    WHERE evt_code   = oldevtcode(i)
    AND NVL(evt_udfnum09,-999999) <> total_cost;    
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_DEL_WOS_QBZ;
/
SHOW ERRORS TRIGGER COMP_DEL_WOS_QBZ
PROMPT

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-327.sql', '12-04-2023', 'QBZ-EAM 11.7', 'Changes Qbuzz');

COMMIT;

PROMPT ...END of SPC-327.log

SPOOL OFF