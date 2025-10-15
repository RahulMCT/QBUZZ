-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5orders.trg.sql
--
-- Description : Triggers on r5orders
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 001 19-Oct-2022 - MCT - SPC254 - Creation
-- 002 05-Mar-2024 - MCT - SPC452 - EAM - AFAS interface
-- 003 22-Jul-2024 - MCT - SPC567 - Restricted PO message to AFAS, only send with status changed to SAFS
-- 004 09-Dec-2024 - MCT - SPC615 - Populate AFAS CostCode on PO line from evt_udfchar32
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_r5orders.trg.sql
PROMPT

PROMPT ...Creating trigger COMP_UPD_ORD_QBZ
CREATE OR REPLACE TRIGGER COMP_UPD_ORD_QBZ
FOR UPDATE ON R5ORDERS
COMPOUND TRIGGER
  --local variables
  TYPE            newordcodetype     IS TABLE OF r5orders.ord_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newordorgtype      IS TABLE OF r5orders.ord_org%TYPE INDEX BY BINARY_INTEGER;

  newordcode      newordcodetype ;
  neworgorg       newordorgtype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  cnt2            NUMBER := 0;
  v_error         NUMBER;
  v_errmesg       VARCHAR2(4000);
  sChk            VARCHAR2(5);
  sSAFSPO         r5install.ins_desc%type;

AFTER EACH ROW IS
BEGIN
  IF :NEW.ord_status <> :OLD.ord_status THEN
    --create Auto PO receipt
    IF :NEW.ord_status = 'A2'
     AND :NEW.ord_udfchar05 = 'AUT'
    THEN
       --save record for statement level processing
       cnt              := cnt + 1;
       newordcode(cnt)  := :new.ord_code;
       neworgorg(cnt)   := :new.ord_org;
    END IF; --:NEW.ord_status = 'GA'
    --send message out to AFAS
    IF :NEW.ord_status = 'SAFS' THEN
    --IF :NEW.ord_status IN ('GA1','SAFS') THEN --0003
      --save record for statement level processing
      cnt2              := cnt2 + 1;
      newordcode(cnt2)  := :new.ord_code;
      neworgorg(cnt2)   := :new.ord_org;
    END IF; --:NEW.ord_status = 'SAFS'
  END IF; --:NEW.ord_status <> :OLD.ord_status
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    --Create Auto PO receipts
    qbz_autoporec(newordcode(i),neworgorg(i),v_error,v_errmesg);
    IF v_error <> 0 THEN
      RAISE_APPLICATION_ERROR(-20003,v_errmesg);
    END IF;
  END LOOP;
  --loop through PLSQL table count
  FOR i IN 1..cnt2
  LOOP
    --update PO lines udfs for - costCode from Asset, generalLedger from WO jobtype
    FOR c IN (SELECT orl_ordline,orl_order,orl_order_org,evt_udfchar32 costCode,evt_code  
                   ,(SELECT glcode FROM u5afasgenledger WHERE type = evt_jobtype FETCH FIRST ROW ONLY) generalLedger
              FROM r5orderlines
              JOIN r5events  ON(evt_code = orl_event)
              JOIN r5objects ON(obj_code = evt_object AND obj_org = evt_object_org)
              WHERE orl_order   = newordcode(i)
              AND orl_order_org = neworgorg(i))
    LOOP
      --raise error if generalLedger or Costcode missing
      IF c.costCode IS NULL
       OR c.generalLedger IS NULL THEN
        RAISE_APPLICATION_ERROR(-20003,'Either CostCode or GeneralLedger is blank for PO line:'||c.orl_ordline);
      ELSE
        UPDATE r5orderlines
        SET orl_udfchar20 = c.costCode
           ,orl_udfchar21 = c.generalLedger
        WHERE orl_order   = c.orl_order
        AND orl_order_org = c.orl_order_org
        AND orl_ordline   = c.orl_ordline
        AND orl_event     = c.evt_code;
      END IF;
    END LOOP; --c
    --send xml out to AFAS if enabled
    sSAFSPO := o7dflt('AFASPO',sChk);
    IF sSAFSPO = 'YES' THEN
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
      SELECT 'CHANGEPO','R5ORDERS',newordcode(i),neworgorg(i),neworgorg(i),NULL
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                       WHERE xts_trantype = 'CHANGEPO'
                       AND   xts_keyfld1  = newordcode(i)
                       AND   xts_keyfld2  = neworgorg(i));
    END IF; --sSAFSPO = 'YES'
  END LOOP; --i
END AFTER STATEMENT;

END COMP_UPD_ORD_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_ORD_QBZ
PROMPT

PROMPT ...End of qbz_r5orders.trg.sql
PROMPT
