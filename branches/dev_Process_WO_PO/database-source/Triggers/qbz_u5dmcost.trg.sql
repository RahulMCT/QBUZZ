-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5dmcost.trg.sql
--
-- Description : Triggers on U5DMCOST
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 20-12-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Creating trigger COMP_INS_UDMCS_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_INS_UDMCS_QBZ
FOR INSERT ON U5DMCOST
COMPOUND TRIGGER
  --local variables
  TYPE            newcoscodetype     IS TABLE OF u5dmcost.cos_case%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcolinetype      IS TABLE OF u5dmcost.cos_line%TYPE INDEX BY BINARY_INTEGER;

  newcoscode      newcoscodetype ;
  newcosline      newcolinetype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  cSUM            u5dmcost.cos_totalcost%type;

AFTER EACH ROW IS
BEGIN
  --IF :NEW.cos_cost IS NOT NULL OR :NEW.cos_cost IS NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcoscode(cnt)  := :new.cos_case;
     newcosline(cnt)  := :new.cos_line;
  --END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    cSUM := qbz_sumcost(newcoscode(i),newcosline(i));--Fetch Total cost
    --updating present line total cost
    UPDATE u5dmcost
    SET cos_totalcost = cSUM
    WHERE cos_case = newcoscode(i)
    AND cos_line = newcosline(i);    
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_INS_UDMCS_QBZ;
/
SHOW ERRORS TRIGGER COMP_INS_UDMCS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_UPD_UDMCS_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_UPD_UDMCS_QBZ
FOR UPDATE ON U5DMCOST
COMPOUND TRIGGER
  --local variables
  TYPE            newcoscodetype     IS TABLE OF u5dmcost.cos_case%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcolinetype      IS TABLE OF u5dmcost.cos_line%TYPE INDEX BY BINARY_INTEGER;

  newcoscode      newcoscodetype ;
  newcosline      newcolinetype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  cSUM            u5dmcost.cos_totalcost%type;

AFTER EACH ROW IS
BEGIN
  IF (:NEW.cos_cost IS NOT NULL AND :NEW.cos_cost <> :OLD.cos_cost)
      OR (:NEW.cos_cost IS NOT NULL AND :OLD.cos_cost IS NULL) 
       OR (:NEW.cos_cost IS NULL AND :OLD.cos_cost IS NOT NULL) THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcoscode(cnt)  := :new.cos_case;
     newcosline(cnt)  := :new.cos_line;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    cSUM := qbz_sumcost(newcoscode(i),newcosline(i));--Fetch Total cost
    --updating present line total cost
    UPDATE u5dmcost
    SET cos_totalcost = cSUM
    WHERE cos_case = newcoscode(i)
    AND cos_line = newcosline(i)
    AND NVL(cos_totalcost,-999999) <> cSUM;
    --Loop for extra lines exists 
    FOR k IN (SELECT cos_line FROM u5dmcost WHERE cos_case = newcoscode(i) AND cos_line > newcosline(i)) LOOP
      cSUM := qbz_sumcost(newcoscode(i),k.cos_line);--Fetch Total cost
      --updating extra lines total cost
      UPDATE u5dmcost
      SET cos_totalcost = cSUM
      WHERE cos_case    = newcoscode(i)
      AND cos_line      = k.cos_line
      AND NVL(cos_totalcost,-999999) <> cSUM;
    END LOOP;--k loop
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_UPD_UDMCS_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_UDMCS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_DEL_UDMCS_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_DEL_UDMCS_QBZ
FOR DELETE ON U5DMCOST
COMPOUND TRIGGER
  --local variables
  TYPE            newcoscodetype     IS TABLE OF u5dmcost.cos_case%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcolinetype      IS TABLE OF u5dmcost.cos_line%TYPE INDEX BY BINARY_INTEGER;

  newcoscode      newcoscodetype ;
  newcosline      newcolinetype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  cSUM            u5dmcost.cos_totalcost%type;

AFTER EACH ROW IS
BEGIN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcoscode(cnt)  := :OLD.cos_case;
     newcosline(cnt)  := :OLD.cos_line;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    --Loop for extra lines exists 
    FOR k IN (SELECT cos_line FROM u5dmcost WHERE cos_case = newcoscode(i) AND cos_line > newcosline(i)) LOOP
      cSUM := qbz_sumcost(newcoscode(i),k.cos_line);--Fetch Total cost
      --updating extra lines total cost
      UPDATE u5dmcost
      SET cos_totalcost = cSUM
      WHERE cos_case    = newcoscode(i)
      AND cos_line      = k.cos_line;
    END LOOP;--k loop
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_DEL_UDMCS_QBZ;
/
SHOW ERRORS TRIGGER COMP_DEL_UDMCS_QBZ
PROMPT