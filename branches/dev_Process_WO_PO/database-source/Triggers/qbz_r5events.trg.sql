-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5events.trg.sql
--
-- Description : Triggers on r5events
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 06-09-2022 - MCT - SPC-254 - Creation
-- 0002 29-08-2023 - MCT - SPC-417 - updated trigger COMP_UPD_EVT_QBZ to populate location from PPM objects to evt_udfchar40
-- 0003 30-08-2024 - MCT - SPC-494 - Add costs of child work order (along with parents work order) in Damage | Additional costs tab.
-- 0004 26-11-2024 - MCT - SPC-610 - Populate Priority from Problem Code | Group tab, change in 12.2 upgrade
-- 0005 24-12-2024 - MCT - SPC-615 - Populate CostCode from r5objects, to be used at the time PO generation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_r5events.trg.sql
PROMPT

PROMPT ...Creating trigger PREUPD_EVT_QBZ
CREATE OR REPLACE TRIGGER PREUPD_EVT_QBZ
BEFORE UPDATE ON r5events
FOR EACH ROW
DECLARE
   countit    NUMBER;
   countit1   NUMBER;
   ngroup     r5users.usr_group%type;
   cuser      r5users.usr_code%type;
BEGIN
  IF nvl(:new.evt_priority,'@#$%') <> 'C'
   AND :new.evt_status = 'EVO'
   AND :old.evt_status IN ('W','IBL') THEN
    o7err.raise_error('PREUPD_EVT_QBZ','TRIG',1);
  END IF;   --Status 'EVO' priority not equal to 'C' Raise Err
  IF :new.evt_status = 'IBL' AND :new.evt_udfchar19 is NULL THEN
    o7err.raise_error('PREUPD_EVT_QBZ','TRIG',4);
  END IF;  ----- Supplier is null
  --No records in new tab Raise Err
  IF (:new.evt_status = 'AG' AND :old.evt_status = 'TCS') THEN
    cuser:= NVL( o7sess.cur_user, '*' );
    SELECT usr_group INTO ngroup FROM r5users WHERE usr_code = cuser;
    --count of new tab supplier
    SELECT COUNT(1) INTO countit FROM U5WOSUPP WHERE ou_wo = :new.evt_code;
    IF countit = 0 THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',2);
    END IF;  ----countit = 0
  END IF;   ----evt_status = TCS to AG

  IF :new.evt_type IN ('JOB','PPM') AND :new.evt_status = 'TCS' AND :old.evt_status = 'AG' THEN
    IF :new.evt_jobtype = 'SCH' THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'SCH'
    SELECT COUNT(1) INTO countit FROM r5companies WHERE COM_CODE = :new.evt_udfchar19 AND COM_UDFCHKBOX02 = '-';
    IF :new.evt_jobtype = 'STO' AND countit = 1 THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'STO'
  END IF;   ----evt_type = 'JOB' AND evt_status = 'AG'
  --chckbox checked status updated to chk/agree
  IF :new.evt_udfchkbox02 = '+'
   AND :old.evt_status = 'DI' THEN
    :new.evt_status := 'CA';
  --status updated to agree chckbox checked
  ELSIF :new.evt_status = 'CA' THEN
    :new.evt_udfchkbox02 := '+';
  --status updated to dispute chckbox unchecked
  ELSIF :new.evt_status = 'DI' THEN
    :new.evt_udfchkbox02 := '-';
  --chckbox unchecked status updated to dispute
  ELSIF :new.evt_udfchkbox02 = '-'
   AND :old.evt_status = 'IC' THEN
    :new.evt_status := 'DI';
  END IF;---evt_udfchkbox02 = '+'
END PREUPD_EVT_QBZ;
/
SHOW ERRORS TRIGGER PREUPD_EVT_QBZ
PROMPT

PROMPT ...Creating trigger COMP_UPD_EVT_QBZ
CREATE OR REPLACE TRIGGER COMP_UPD_EVT_QBZ
FOR UPDATE ON R5EVENTS
COMPOUND TRIGGER
  --local variables
  TYPE             newevtcodetype     IS TABLE OF r5events.evt_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtorgtype      IS TABLE OF r5events.evt_org%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtstatustype   IS TABLE OF r5events.evt_status%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtrtypetype    IS TABLE OF r5events.evt_rtype%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtppopktype    IS TABLE OF r5events.evt_ppopk%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtsupptype     IS TABLE OF r5events.evt_udfchar19%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtobjtype      IS TABLE OF r5events.evt_object%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtobjorgtype   IS TABLE OF r5events.evt_object_org%TYPE INDEX BY BINARY_INTEGER;

  newevtcode       newevtcodetype ;
  newevtcode2      newevtcodetype ;
  newevtstatus     newevtstatustype ;
  oldevtstatus     newevtstatustype ;
  newevtrtype      newevtrtypetype ;
  newevtppopk      newevtppopktype ;
  newevtorg        newevtorgtype ;
  newevtsupp       newevtsupptype;
  newevtobj        newevtobjtype;
  newevtobjorg     newevtobjorgtype ;

  sevt_desc        r5events.evt_desc%type;
  sevt_prioritynew r5events.evt_priority%type;
  Sdesc            r5casemanagement.csm_udfchar03%type;
  countit          NUMBER;
  cnt              NUMBER := 0;
  cnt2             NUMBER := 0;
  cnt1             NUMBER;
  Ccode            u5dmcost.cos_case%type;
  Cdesc            u5dmcost.cos_costdesc%type;
  Ccost            u5dmcost.cos_cost%type;
  cuser            r5users.usr_code%type;
  createPO         BOOLEAN := FALSE;
  v_error          NUMBER;
  v_errmesg        VARCHAR2(512);
  nflag            NUMBER;
  sppo_location    r5ppmobjects.ppo_location%TYPE;
  sobj_udfchar17   r5objects.obj_udfchar17%TYPE;
  sobj_udfchar45   r5objects.obj_udfchar45%TYPE;

  CURSOR c_ppoloc (c_ppo_pk NUMBER) IS
    SELECT ppo_location
    FROM r5ppmobjects
    WHERE ppo_pk = c_ppo_pk;

  CURSOR c_obj (c_obj_code r5objects.obj_code%type,c_obj_org r5objects.obj_org%type) IS
    SELECT obj_udfchar17,obj_udfchar45
    FROM r5objects
    WHERE obj_code = c_obj_code
    AND obj_org    = c_obj_org;

BEFORE EACH ROW IS
BEGIN
  --for Qrane interface
  IF o7sess.cur_user = 'DATABRIDGEINTERNALUSER'
   AND :new.evt_jobtype IN ('STO','SCH') THEN
    --reset supplier as from Interface it is getting cleared
    IF :new.evt_udfchar19 IS NULL
     OR :new.evt_udfchar32 IS NULL
     OR :new.evt_udfchar45 IS NULL THEN
      --reset UDFs as from Interface it is getting cleared
      --supplier should already be set at the time of insert from one of the flex
      :new.evt_udfchar19 := :old.evt_udfchar19;
      --cost code should already be set at the time of insert from insert trigger
      IF :new.evt_udfchar32 IS NULL THEN
        --get Object details
        OPEN  c_obj (:new.evt_object,:new.evt_object_org);
        FETCH c_obj INTO sobj_udfchar17,sobj_udfchar45;
        CLOSE c_obj;
        :new.evt_udfchar32 := NVL(:old.evt_udfchar32,sobj_udfchar45);
      END IF; --:new.evt_udfchar32 IS NULL
      --set WO to udf, to be used for Qrane acknowledge
      :new.evt_udfchar45 := :new.evt_code;
    END IF; --:new.evt_udfchar45 IS NULL
    --update description from problem code
    sevt_desc := r5o7.o7get_desc('EN','RECO',:new.evt_reqm,NULL,NULL);
    IF :new.evt_desc <> sevt_desc THEN
      :new.evt_desc := sevt_desc;
    END IF;
    --update priority from problem code
    IF :new.evt_reqm IS NOT NULL THEN
      --get Priority from Problem Code
      BEGIN
        SELECT ccg_group
        INTO sevt_prioritynew
        FROM r5closingcodegroups
        WHERE ccg_closingcode = :new.evt_reqm
        AND ccg_entity        = 'RECO'
        ORDER BY ccg_group
        FETCH FIRST ROW ONLY;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          NULL;
      END;
      --update status on problem code change to higher category
      IF sevt_prioritynew IN ('A','B')
       AND :new.evt_priority = 'C'
       AND :new.evt_status = 'EVO' THEN
        --update status
        :new.evt_status := 'W';
      END IF; --sevt_prioritynew IN ('A','B')
      --populate priority
      :new.evt_priority := sevt_prioritynew;
    END IF; --:new.evt_reqm IS NOT NULL
  END IF; --o7sess.cur_user = 'DATABRIDGEINTERNALUSER'
END BEFORE EACH ROW;

AFTER EACH ROW IS
BEGIN
  IF UPDATING
   AND :new.evt_status  =  'AG'
   AND :new.evt_status  <> :old.evt_status
   AND :new.evt_rtype   IN ('JOB','PPM')
   AND :new.evt_udfchar19 IS NOT NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newevtcode(cnt)  := :new.evt_code;
     newevtorg(cnt)   := :new.evt_org;
     newevtsupp(cnt)  := :new.evt_udfchar19;
  END IF;
  --on status update send update to Qrane interface
  --if update happening from interface then send update to Qrane interface
  --do not sent WO callback to Qrane as this will be done from Damage screen
  IF :new.evt_udfchar06 IS NOT NULL
   AND :new.evt_jobtype IN ('STO')
   AND :new.evt_createdby = 'DATABRIDGEINTERNALUSER'
   AND ((o7sess.cur_user <> 'DATABRIDGEINTERNALUSER'
         AND ((:old.evt_status = 'IBQ' AND :new.evt_status = 'TC')
              OR (:old.evt_status = 'IBL' AND :new.evt_status = 'TCS')
              OR (:old.evt_status <> :new.evt_status AND :new.evt_status = 'CANC')))
        OR o7sess.cur_user = 'DATABRIDGEINTERNALUSER')
  THEN
    BEGIN
      nflag := TO_NUMBER(:new.evt_udfchar06);
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
      SELECT 'SYNCMAINTORDER','R5EVENTS',:new.evt_code,:new.evt_org,:new.evt_org,NULL
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                       WHERE xts_trantype = 'SYNCMAINTORDER'
                       AND   xts_keyfld1  = :new.evt_code);
    EXCEPTION
    WHEN OTHERS THEN
      NULL;
    END;
  END IF; --:new.evt_jobtype IN ('STO')
  --if WO status changed associate damage case WO status needs to be updated
  IF :old.evt_status  <> :new.evt_status THEN
     --save record for statement level processing
     cnt2               := cnt2 + 1;
     newevtcode2(cnt2)  := :new.evt_code;
     newevtstatus(cnt2) := :new.evt_status;
     oldevtstatus(cnt2) := :old.evt_status;
     newevtrtype(cnt2)  := :new.evt_rtype;
     newevtppopk(cnt2)  := :new.evt_ppopk;
     newevtobj(cnt2)    := :new.evt_object;
     newevtobjorg(cnt2) := :new.evt_object_org;
  END IF; --:old.status <> :new.evt_status
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR j in 1..cnt
  LOOP
    --count of supplier monthly check '-'
    SELECT COUNT(1) INTO countit
    FROM r5companies
    WHERE com_code = newevtsupp(j)
    AND com_udfchkbox02 = '-';
    IF countit = 1 THEN
      createPO := TRUE;
    END IF;  --countit = 1
    IF createPO THEN
      QBZ_AUTOPO(newevtorg(j),newevtcode(j),'WO'); --Create Auto PO
    END IF; --createPO
  END LOOP;
  --loop through PLSQL table count
  FOR i in 1..cnt2
  LOOP
    IF newevtstatus(i) = 'C' THEN
      BEGIN
        --get Case record directly associated with WO
        SELECT csm_code,csm_desc INTO Ccode,Cdesc
        FROM r5casemanagement
        WHERE csm_workorder = newevtcode2(i)
        AND   csm_rstatus    = 'O';
      EXCEPTION
          WHEN NO_DATA_FOUND THEN
          BEGIN
            --0003 - get Case record from Parent WO
            SELECT csm_code,csm_desc
            INTO Ccode,Cdesc
            FROM r5casemanagement
            WHERE csm_workorder IN (SELECT evt_code FROM
                                     (SELECT evt_code, LEVEL WOlevel
                                      FROM r5events
                                      START WITH evt_code = newevtcode2(i)
                                      CONNECT BY evt_code = PRIOR evt_parent) t
                                    ORDER BY WOlevel DESC
                                    FETCH FIRST ROW ONLY)
            AND csm_rstatus = 'O';
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
            NULL;
          END; --END EXCEPTION block
      END; --END main Begin block
      IF Ccode IS NOT NULL THEN
        --Count for WO's line exists.
        SELECT COUNT(1) INTO countit
        FROM u5dmcost
        WHERE cos_case = Ccode
        AND NVL(cos_wo,'-') = '+';
        --cost of work order
        Ccost := o7cost.tools2(newevtcode2(i))+o7cost.material2(newevtcode2(i))+o7cost.labour2(newevtcode2(i));
        IF countit = 0 THEN
          --Count for WO's line not exists.
          SELECT NVL(MAX(cos_line),0) INTO cnt1
          FROM u5dmcost
          WHERE cos_case = Ccode
          AND NVL(cos_wo,'-') = '-';
          cnt1  := cnt1+10;
          cuser := NVL( o7sess.cur_user, '*' );
          INSERT INTO u5dmcost(cos_case,cos_line,cos_costdesc,cos_costcode,cos_costcodedesc,cos_cost,cos_totalcost,createdby,created,cos_date,cos_wo)
          VALUES(Ccode,cnt1,Cdesc,'4405','betaalde schade reparatie algemeen',Ccost,NULL,cuser,SYSDATE,TRUNC(SYSDATE),'+');
        ELSE
          UPDATE u5dmcost
          SET cos_cost   = NVL(cos_cost,0) + NVL(Ccost,0)
          WHERE cos_case = Ccode
          AND cos_wo     = '+';
        END IF; --countit = 0
      END IF; --Ccode IS NOT NULL
    ELSIF newevtrtype(i) = 'PPM'
     AND oldevtstatus(i) = 'A'
     AND newevtstatus(i) = 'W' THEN
      --on release of PM WO, copy ppo_location to udfchar40
      OPEN  c_ppoloc (newevtppopk(i));
      FETCH c_ppoloc INTO sppo_location;
      CLOSE c_ppoloc;
      --get Object details
      OPEN  c_obj (newevtobj(i),newevtobjorg(i));
      FETCH c_obj INTO sobj_udfchar17,sobj_udfchar45;
      CLOSE c_obj;
      --Update WO with supplier and location
      IF sobj_udfchar17 IS NOT NULL THEN
        UPDATE r5events
        SET evt_udfchar19 = sobj_udfchar17
           ,evt_udfchar40 = CASE WHEN sobj_udfchar17 = '50406' THEN NVL(sppo_location,evt_udfchar40) ELSE evt_udfchar40 END
        WHERE evt_Code    = newevtcode2(i);
      END IF; --sobj_udfchar17 IS NOT NULL
    END IF; --newevtstatus "C"
    Sdesc := r5o7.o7get_desc('EN','UCOD', newevtstatus(i),'EVST', '');
    UPDATE r5casemanagement
    SET  csm_udfchar03             =  Sdesc
    WHERE csm_workorder            =  newevtcode2(i)
    AND  NVL(csm_udfchar03,'@#$%') <> Sdesc;
  END LOOP;
END AFTER STATEMENT;

END COMP_UPD_EVT_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_EVT_QBZ
PROMPT

PROMPT ...Creating trigger COMP_INS_EVT_QBZ
CREATE OR REPLACE TRIGGER COMP_INS_EVT_QBZ
FOR INSERT ON R5EVENTS
COMPOUND TRIGGER
  --local variables
  TYPE             newevtcodetype     IS TABLE OF r5events.evt_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtppopktype    IS TABLE OF r5events.evt_ppopk%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtobjtype      IS TABLE OF r5events.evt_object%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtobjorgtype   IS TABLE OF r5events.evt_object_org%TYPE INDEX BY BINARY_INTEGER;

  newevtcode       newevtcodetype ;
  newevtppopk      newevtppopktype ;
  newevtobj        newevtobjtype;
  newevtobjorg     newevtobjorgtype ;

  cnt              NUMBER := 0;
  cnt2             NUMBER := 0;
  sppo_location    r5ppmobjects.ppo_location%TYPE;
  sobj_udfchar17   r5objects.obj_udfchar17%TYPE;
  sobj_udfchar45   r5objects.obj_udfchar45%TYPE;

  CURSOR c_ppoloc (c_ppo_pk NUMBER) IS
    SELECT ppo_location
    FROM r5ppmobjects
    WHERE ppo_pk = c_ppo_pk;

  CURSOR c_obj (c_obj_code r5objects.obj_code%type,c_obj_org r5objects.obj_org%type) IS
    SELECT obj_udfchar17,obj_udfchar45
    FROM r5objects
    WHERE obj_code = c_obj_code
    AND obj_org    = c_obj_org;

AFTER EACH ROW IS
BEGIN
  --if WO status changed associate damage case WO status needs to be updated
  IF :new.evt_rtype = 'PPM'
   AND :new.evt_isstype = 'D' THEN
     --save record for statement level processing
     cnt               := cnt + 1;
     newevtcode(cnt)   := :new.evt_code;
     newevtppopk(cnt)  := :new.evt_ppopk;
     newevtobj(cnt)    := :new.evt_object;
     newevtobjorg(cnt) := :new.evt_object_org;
  END IF; --:new.evt_rtype = 'PPM'
  --populate cost code from Asset
  IF :new.evt_rtype IN ('JOB','PPM') THEN
     --save record for statement level processing
     cnt2               := cnt2 + 1;
     newevtcode(cnt2)   := :new.evt_code;
     newevtobj(cnt2)    := :new.evt_object;
     newevtobjorg(cnt2) := :new.evt_object_org;
  END IF; --:new.evt_rtype IN ('JOB','PPM')
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i in 1..cnt
  LOOP
    --on release of PM WO, copy ppo_location to udfchar40
    OPEN  c_ppoloc (newevtppopk(i));
    FETCH c_ppoloc INTO sppo_location;
    CLOSE c_ppoloc;
    --get Object details
    OPEN  c_obj (newevtobj(i),newevtobjorg(i));
    FETCH c_obj INTO sobj_udfchar17,sobj_udfchar45;
    CLOSE c_obj;
    --Update WO with supplier and location
    IF sobj_udfchar17 IS NOT NULL THEN
      UPDATE r5events
      SET evt_udfchar19 = sobj_udfchar17
         ,evt_udfchar40 = CASE WHEN sobj_udfchar17 = '50406' THEN NVL(sppo_location,evt_udfchar40) ELSE evt_udfchar40 END
      WHERE evt_Code    = newevtcode(i);
    END IF; --sobj_udfchar17 IS NOT NULL
  END LOOP; --i
  --loop through PLSQL table count
  FOR i in 1..cnt2
  LOOP
    --get Object details
    OPEN  c_obj (newevtobj(i),newevtobjorg(i));
    FETCH c_obj INTO sobj_udfchar17,sobj_udfchar45;
    CLOSE c_obj;
    --Update WO with supplier and location
    IF sobj_udfchar45 IS NOT NULL THEN
      UPDATE r5events
      SET evt_udfchar32 = sobj_udfchar45
      WHERE evt_Code    = newevtcode(i);
    END IF; --sobj_udfchar45 IS NOT NULL
  END LOOP; --i
END AFTER STATEMENT;

END COMP_INS_EVT_QBZ;
/
SHOW ERRORS TRIGGER COMP_INS_EVT_QBZ
PROMPT

PROMPT ...Creating error texts R5EVENTS
DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 1, 'QBZEVT01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT01', 'Status "Include in next planned maintenance" is not allowed with this priority.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT01', 'Status "Opnemen in volgend gepland onderhoud" is niet toegestaan ​​met deze prioriteit.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT02');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 2, 'QBZEVT02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT02', 'It is not allowed to change the status. Book materials and/or hours first.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT02', 'Het is niet toegestaan om de status te wijzigen. Boek eerst materialen en/of uren.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT03');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT03');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 3, 'QBZEVT03', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT03', 'Please enter work performed on Closing tab.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT03', 'Voer het uitgevoerde werk in op het tabblad Afsluiten.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT04');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 4, 'QBZEVT04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT04', 'Please enter Supplier.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT04', 'Voer Leverancier in.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT05');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT05');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 5, 'QBZEVT05', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT05', 'Not allowed for status change','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT05', 'Niet toegestaan ​​voor statuswijziging','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT06');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT06');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 6, 'QBZEVT06', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT06', 'The status cannot be changed when no hours or materials are booked','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT06', 'De status ''voltooid'' kan niet worden gekozen wanneer er geen uren of materialen geboekt zijn','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT

PROMPT ...End of qbz_r5events.trg.sql
PROMPT
