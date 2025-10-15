-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5wocont.trg.sql
--
-- Description : Triggers on u5wocont
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 26-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Creating trigger POSINSUPD_WOC_QBZ
PROMPT

CREATE OR REPLACE TRIGGER POSINSUPD_WOC_QBZ
AFTER INSERT OR UPDATE ON u5wocont
FOR EACH ROW
BEGIN
  --insert and update case
  IF :NEW.ctl_status = 'G' THEN
    UPDATE r5events
    SET evt_udfchar23   = :NEW.ctl_seq,
        evt_udfchkbox02 = '+',
        evt_status      = 'IC'
    WHERE evt_status    = 'AG'
    --AND evt_jobtype    <> 'SCH'
    AND evt_org         = :NEW.ctl_org
    AND  evt_udfchar19  = :NEW.ctl_ven;   -----In Control
  END IF; --- ctl_status = G
  --update case
  IF UPDATING
   AND :NEW.ctl_status = 'WCC' THEN
    UPDATE r5events
    SET   evt_status      = 'TF'
    WHERE evt_status      IN ('IC','CA')
    AND   evt_udfchar23   = :NEW.ctl_seq
    AND   evt_udfchar19   = :NEW.ctl_ven
    AND   evt_udfchkbox02 = '+';   ----To be invoiced
    UPDATE r5events
    SET   evt_status      = 'DI'
    WHERE evt_status      = 'IC'
    AND   evt_udfchar23   = :NEW.ctl_seq
    AND   evt_udfchar19   = :NEW.ctl_ven
    AND   evt_udfchkbox02 = '-';   ----To be invoiced
  END IF; ----ctl_status = WCC
END POSINSUPD_WOC_QBZ;
/
SHOW ERRORS TRIGGER POSINSUPD_WOC_QBZ
PROMPT

PROMPT ...Creating trigger PREINS_WOC_QBZ
PROMPT
CREATE OR REPLACE TRIGGER PREINS_WOC_QBZ
BEFORE INSERT ON U5WOCONT
FOR EACH ROW
DECLARE
   countit    NUMBER;
BEGIN
 /*SELECT COUNT(1) INTO countit
 FROM u5wocont
 WHERE ctl_ven = :NEW.ctl_ven
 AND   ctl_org = :NEW.ctl_org
 AND TO_CHAR(ctl_wccreated,'MM') = to_char(sysdate,'MM');
 IF countit >= 1 THEN
   o7err.raise_error('PREINS_WOC_QBZ','TRIG',1);
 END IF;*/ ---countit >= 1
 :NEW.ctl_stadesc := CASE WHEN :NEW.ctl_status = 'G'   THEN 'Gegenereerd'
                          WHEN :NEW.ctl_status = 'SC'  THEN 'Leverancier gecontroleerd'
                          WHEN :NEW.ctl_status = 'WCC' THEN 'Controle afgerond'
                     ELSE '-'
                     END; ---- Assign status description
END PREINS_WOC_QBZ;
/
SHOW ERRORS TRIGGER PREINS_WOC_QBZ
PROMPT

PROMPT ...Creating trigger PREUPD_WOC_QBZ2
PROMPT
CREATE OR REPLACE TRIGGER PREUPD_WOC_QBZ2
BEFORE UPDATE ON U5WOCONT
FOR EACH ROW
BEGIN
  --sync WO Status description
  IF :new.ctl_status <> :old.ctl_status THEN
    :NEW.ctl_stadesc := CASE WHEN :NEW.ctl_status = 'G'   THEN 'Gegenereerd'
                             WHEN :NEW.ctl_status = 'SC'  THEN 'Leverancier gecontroleerd'
                             WHEN :NEW.ctl_status = 'WCC' THEN 'Controle afgerond'
                             ELSE '-'
                        END;  ---- Assign status description
  END IF; --:new.ctl_status <> :old.ctl_status
END PREUPD_WOC_QBZ2;
/
SHOW ERRORS TRIGGER PREUPD_WOC_QBZ2
PROMPT

PROMPT ...Creating error texts R5EVENTS
DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOC01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREINS_WOC_QBZ') AND ers_code in ('QBZWOC01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREINS_WOC_QBZ', 'TRIG', NULL, 1, 'QBZWOC01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOC01', 'only one record can be created for one month','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOC01', 'er kan slechts één record voor één maand worden gemaakt','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT