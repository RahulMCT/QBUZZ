-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5wosupp.trg.sql
--
-- Description : Triggers on u5wosupp
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 13-Sep-2022 - MCT - SPC254 - Creation
-- 0002 05-Mar-2024 - MCT - SPC473 - Add different type of hours for one activity in new tab (WUJOBO) on WO screen (WSJOBO).
-- 0003 17-Mar-2025 - MCT - SPC643 - Round total cost up to 2 decimal places on WO record view.
-- -------------------------------------------------------------------------------
PROMPT ...Creating trigger PREUPD_U5WOS_QBZ

CREATE OR REPLACE TRIGGER PREUPD_U5WOS_QBZ
BEFORE UPDATE OR INSERT ON U5WOSUPP
FOR EACH ROW
DECLARE
  countit   NUMBER;
BEGIN
  --Quantity must be greater than 0
  IF :new.ou_qty <= 0
   OR (:new.ou_others = '+' AND :new.ou_partqty <= 0)THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  --Quantity must be greater than 0
  ELSIF :new.ou_amt < 0 THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  --Quantity must be greater than 0
  ELSIF :new.ou_hrs <= 0 THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  --Please enter Part Or Labor Hrs Or Fixed amount fields
  ELSIF :new.ou_act IS NOT NULL
   AND :new.ou_parts IS NULL
   AND :new.ou_amt IS NULL
   AND :new.ou_toh IS NULL
   AND :new.ou_others = '-' THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',15);
  --Please enter Quantity
  ELSIF :new.ou_parts IS NOT NULL
   AND :new.ou_qty IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',6);
  --Please enter Part
  ELSIF (:new.ou_parts IS NULL
   AND :new.ou_qty IS NOT NULL)
    OR (:new.ou_others = '+'
        AND (:new.ou_catalogue IS NULL
             OR :new.ou_partdesc IS NULL
             OR :new.ou_partqty IS NULL
             OR :new.ou_partuom IS NULL
             OR :new.ou_partprice IS NULL))THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',10);
  --Please enter No of Hrs
  ELSIF :new.ou_hrs IS NULL
   AND :new.ou_toh IS NOT NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',11);
  --Please enter Type of Hours
  ELSIF :new.ou_hrs IS NOT NULL
   AND :new.ou_toh IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',12);
  --Please enter Type and No of Hours
  ELSIF :new.ou_hrs IS NULL
   AND :new.ou_toh IS NULL
   AND :new.ou_pricep IS NOT NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',13);
  --Not allowed to enter Fixed price with Labor hours/Part
  ELSIF :new.ou_amt IS NOT NULL
   AND (:new.ou_hrs IS NOT NULL
        OR :new.ou_parts IS NOT NULL
        OR :new.ou_others = '+') THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',7);
  END IF;  ---new.ou_amt IS NOT NULL
END PREUPD_U5WOS_QBZ;
/
SHOW ERRORS TRIGGER PREUPD_U5WOS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_UPD_WOS_QBZ
CREATE OR REPLACE TRIGGER COMP_UPD_WOS_QBZ
FOR INSERT OR UPDATE ON U5WOSUPP
COMPOUND TRIGGER
  --local variables
  TYPE            newwoscodetype     IS TABLE OF u5wosupp.ou_wo%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwospartype      IS TABLE OF u5wosupp.ou_parts%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwosacttype      IS TABLE OF u5wosupp.ou_act%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwoscomtype      IS TABLE OF u5wosupp.ou_comment%TYPE INDEX BY BINARY_INTEGER;

  newevtcode      newwoscodetype;
  newevtpar       newwospartype;
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
    --0002
    SELECT MAX(ouhrs),MAX(ouamt),MAX(ouParts),MAX(oucatparts)
    INTO hcountit,pcountit,countit,ccountit
    FROM(
         SELECT
          COUNT(ou_hrs)       OVER (PARTITION BY ou_wo,ou_act,ou_toh)       ouhrs
         ,COUNT(ou_amt)       OVER (PARTITION BY ou_wo,ou_act,ou_toh)       ouamt
         ,COUNT(ou_parts)     OVER (PARTITION BY ou_wo,ou_act,ou_parts)     ouparts
         ,COUNT(ou_catalogue) OVER (PARTITION BY ou_wo,ou_act,ou_catalogue) oucatparts
         FROM U5WOSUPP
         WHERE ou_wo = newevtcode(i)
         AND ou_act  = newevtact(i)
        ) t;
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
    --UPDATE r5events
    --SET evt_udfnum09 = total_cost
    --WHERE evt_code   = newevtcode(i)
    --AND NVL(evt_udfnum09,-999999) <> total_cost;

    -- autonomously (since 20240327 by FVE):
    QBZ_UPDWO(newevtcode(i),total_cost,NULL,NULL);
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
      SELECT usr_lang INTO clang FROM r5users WHERE usr_code = cuser;
      INSERT INTO r5addetails
        (add_entity,add_rentity,add_type,add_rtype,add_code,add_lang,add_line,add_print,add_text,add_user,add_updatecount)
      VALUES
        ('EVNT','EVNT','+','*',newevtcode(j),clang,10,'+',newevtcom(j),cuser,0);
    END IF;--SQL%NOTFOUND
  END LOOP;--j
END AFTER STATEMENT;

END COMP_UPD_WOS_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_WOS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_DEL_WOS_QBZ
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
    SET evt_udfnum09 = ROUND(total_cost,2)
    WHERE evt_code   = oldevtcode(i)
    AND NVL(evt_udfnum09,-999999) <> total_cost;
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_DEL_WOS_QBZ;
/
SHOW ERRORS TRIGGER COMP_DEL_WOS_QBZ
PROMPT

PROMPT ...Creating error texts Of U5WOSUPP

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 5, 'QBZWOS01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'must be greater than 0','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'moet groter zijn dan 0','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS02');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 6, 'QBZWOS02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS02', 'Please enter Quantity','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS02', 'Vul a.u.b. Hoeveelheid in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS03');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS03');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 7, 'QBZWOS03', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS03', 'Not allowed to enter Fixed price with Labor hours/Part','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS03', 'Niet toegestaan ​​om Vaste prijs in te voeren met Arbeidsuren/Onderdeel','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS04');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 8, 'QBZWOS04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS04', 'Not allowed to enter Fixed price with Labor hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS04', 'Niet toegestaan ​​om Vaste prijs met Arbeidsuren in te voeren','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS05');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS05');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 9, 'QBZWOS05', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS05', 'Not allowed to enter Fixed price with Part','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS05', 'Niet toegestaan ​​om Vaste prijs in te voeren met Part','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS06');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS06');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 10, 'QBZWOS06', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Please enter Part details','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Voer de gegevens van het onderdeel in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS07');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS07');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 11, 'QBZWOS07', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS07', 'Please enter No of Hrs','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS07', 'Vul alstublieft het aantal uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS08');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS08');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 12, 'QBZWOS08', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS08', 'Please enter Type of Hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS08', 'Voer het type uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS09');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS09');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 13, 'QBZWOS09', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS09', 'Please enter Type and No of Hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS09', 'Voer het type en het aantal uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS10');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS10');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 14, 'QBZWOS10', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS10', 'Not allowed to update Amount','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS10', 'Niet toegestaan ​​om Bedrag bij te werken','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS11');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS11');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 15, 'QBZWOS11', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS11', 'Please enter Part Or Labor Hrs Or Fixed amount fields','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS11', 'Vul a.u.b. de velden Onderdeel of arbeidsuren of vast bedrag in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS12');
DELETE FROM r5errsource WHERE ers_source IN ( 'COMP_UPD_WOS_QBZ') AND ers_code in ('QBZWOS12');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'COMP_UPD_WOS_QBZ', 'TRIG', NULL, 16, 'QBZWOS12', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS12', 'Same Part or Labor or FixAmt cannot be entered twice for same activity.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS12', 'Hetzelfde Onderdeel of Arbeid of FixAmt kan niet tweemaal worden ingevoerd voor dezelfde activiteit.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS13');
DELETE FROM r5errsource WHERE ers_source IN ( 'COMP_UPD_WOS_QBZ') AND ers_code in ('QBZWOS13');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'COMP_UPD_WOS_QBZ', 'TRIG', NULL, 17, 'QBZWOS13', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS13', 'Not allowed to enter book hours or fixed price on same activity','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS13', 'Het is niet toegestaan ​​om boekuren of vaste prijs in te voeren voor dezelfde activiteit','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT