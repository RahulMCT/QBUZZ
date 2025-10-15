-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-422_1.sql
--
-- Description :  New version Work Order Business Rules
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 28-09-2023  - MCT - SPC422  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-422_1.log

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

PROMPT ...Start of SPC-422_1.sql

PROMPT  ...Creating Procedure qbz_o7custom

CREATE OR REPLACE PROCEDURE qbz_o7custom
                          ( pv_objects IN VARCHAR2,
                            pv_date    IN VARCHAR2,
                            pv_title   IN VARCHAR2,
                            pv_desc    IN VARCHAR2) IS
lv_count  NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO lv_count
  FROM   r5custom
  WHERE  cus_objects   = UPPER(SUBSTR(pv_objects,1,30))
  AND    cus_title     = pv_title
  AND    cus_date      = TO_DATE(pv_date,'dd-mm-yyyy');

  IF lv_count = 0 THEN
    INSERT INTO r5custom( cus_date, cus_applied, cus_title, cus_objects, cus_desc)
    VALUES              ( TO_DATE(pv_date,'dd-mm-yyyy'), SYSDATE, pv_title, UPPER(SUBSTR(pv_objects,1,30)), SUBSTR(pv_desc,1,100));
  END IF;

END qbz_o7custom;
/
SHOW ERRORS PROCEDURE qbz_o7custom
PROMPT

PROMPT ...Created Procedure qbz_o7custom

PROMPT  ..Creating Function qbz_sumcstcost

CREATE OR REPLACE FUNCTION qbz_sumcstcost(csmcode IN VARCHAR)
RETURN NUMBER IS
/*
   001 SPC-422 - Add SD Schadeherstelkosten Cost to Total Cost
*/
cost   u5dmcost.cos_cost%type;
cost1   u5dmcost.cos_cost%type;
cost2   u5dmcost.cos_cost%type;
cost3   u5dmcost.cos_cost%type;
cost4   u5dmcost.cos_cost%type;
cost5   u5dmcost.cos_cost%type;
sumcost   u5dmcost.cos_cost%type;

BEGIN

  SELECT NVL(SUM(cos_cost),0) INTO cost  FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4406';
  SELECT NVL(SUM(cos_cost),0) INTO cost1 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4407';
  SELECT NVL(SUM(cos_cost),0) INTO cost2 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4413';
  SELECT NVL(SUM(cos_cost),0) INTO cost3 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4580';
  SELECT NVL(SUM(cos_cost),0) INTO cost4 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4505';
  SELECT NVL(SUM(COS_COST),0) INTO cost5 FROM U5DMCOST WHERE COS_CASE = csmcode AND COS_COSTCODE= '4405' AND COS_WO = '-';

  sumcost := cost+cost1+cost2+cost3+cost4+cost5;

  RETURN sumcost;
--return null if exception occurs
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END qbz_sumcstcost;
/

SHOW ERRORS FUNCTION qbz_sumcstcost
PROMPT

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

  CURSOR c_ppoloc (c_ppo_pk NUMBER) IS
    SELECT ppo_location
    FROM r5ppmobjects
    WHERE ppo_pk = c_ppo_pk;
  
  CURSOR c_obj (c_obj_code r5objects.obj_code%type,c_obj_org r5objects.obj_org%type) IS
    SELECT obj_udfchar17
    FROM r5objects
    WHERE obj_code = c_obj_code
    AND obj_org    = c_obj_org;

BEFORE EACH ROW IS
BEGIN
  --for Qrane interface
  IF o7sess.cur_user = 'DATABRIDGEINTERNALUSER'
   AND :new.evt_jobtype IN ('STO','SCH') THEN
    --reset supplier as from Interface it is getting cleared
    IF :new.evt_udfchar45 IS NULL
     OR :new.evt_udfchar19 IS NULL THEN
      --set WO to udf, to be used for Qrane acknowledge
      :new.evt_udfchar45 := :new.evt_code;
      --reset supplier as from Interface it is getting cleared
      --supplier should already be set at the time of insert from one of the flex
      :new.evt_udfchar19 := :old.evt_udfchar19;
    END IF; --:new.evt_udfchar45 IS NULL
    --update description from problem code
    sevt_desc := r5o7.o7get_desc('EN','RECO',:new.evt_reqm,NULL,NULL);
    IF :new.evt_desc <> sevt_desc THEN
      :new.evt_desc := sevt_desc;
    END IF;
    --update priority from problem code
    IF :new.evt_reqm IS NOT NULL THEN
      SELECT rqm_group INTO sevt_prioritynew FROM r5requircodes WHERE rqm_code = :new.evt_reqm;
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
  IF :new.evt_udfchar06 IS NOT NULL
   AND :new.evt_jobtype IN ('STO','SCH')
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
  END IF; --:new.evt_jobtype IN ('STO','SCH')
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
        SELECT csm_code,csm_desc INTO Ccode,Cdesc
        FROM r5casemanagement
        WHERE csm_workorder = newevtcode2(i)
        AND   csm_rstatus    = 'O';
      EXCEPTION
          WHEN NO_DATA_FOUND THEN
          NULL;
      END;
      IF Ccode IS NOT NULL THEN
        --Count for WO's line exists.
        SELECT COUNT(1) INTO countit
        FROM u5dmcost
        WHERE cos_case = Ccode
        AND NVL(cos_wo,'-') = '+';
        IF countit = 0 THEN
          --Count for WO's line not exists.
          SELECT NVL(MAX(cos_line),0) INTO cnt1
          FROM u5dmcost
          WHERE cos_case = Ccode
          AND NVL(cos_wo,'-') = '-';
          cnt1  := cnt1+10;
          --cost of work order
          Ccost := o7cost.tools2(newevtcode2(i))+o7cost.material2(newevtcode2(i))+o7cost.labour2(newevtcode2(i));
          cuser := NVL( o7sess.cur_user, '*' );
          INSERT INTO u5dmcost (cos_case, cos_line, cos_costdesc, cos_costcode, cos_costcodedesc, cos_cost, cos_totalcost, createdby, created, cos_date,cos_wo)
                         VALUES(Ccode, cnt1, Cdesc, '4405', 'betaalde schade reparatie algemeen', Ccost, NULL, cuser, SYSDATE, TRUNC(SYSDATE),'+');
        END IF;--countit
      END IF;--Ccode
    ELSIF newevtrtype(i) = 'PPM'
     AND oldevtstatus(i) = 'A'
     AND newevtstatus(i) = 'W' THEN
      --on release of PM WO, copy ppo_location to udfchar40
      OPEN  c_ppoloc (newevtppopk(i));
      FETCH c_ppoloc INTO sppo_location;
      CLOSE c_ppoloc;
      --get Object details
      OPEN  c_obj (newevtobj(i),newevtobjorg(i));
      FETCH c_obj INTO sobj_udfchar17;
      CLOSE c_obj;
      --Update WO with supplier and location
      IF sobj_udfchar17 IS NOT NULL THEN
        UPDATE r5events
        SET evt_udfchar19 = sobj_udfchar17
           ,evt_udfchar40 = CASE WHEN sobj_udfchar17 = '50406' THEN NVL(sppo_location,evt_udfchar40) ELSE evt_udfchar40 END         
        WHERE evt_Code    = newevtcode2(i);
      END IF;
    END IF;--newevtstatus "C"
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
PROMPT
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
  sppo_location    r5ppmobjects.ppo_location%TYPE;
  sobj_udfchar17   r5objects.obj_udfchar17%TYPE;

  CURSOR c_ppoloc (c_ppo_pk NUMBER) IS
    SELECT ppo_location
    FROM r5ppmobjects
    WHERE ppo_pk = c_ppo_pk;

  CURSOR c_obj (c_obj_code r5objects.obj_code%type,c_obj_org r5objects.obj_org%type) IS
    SELECT obj_udfchar17
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
    FETCH c_obj INTO sobj_udfchar17;
    CLOSE c_obj;
    --Update WO with supplier and location
    IF sobj_udfchar17 IS NOT NULL THEN
      UPDATE r5events
      SET evt_udfchar19 = sobj_udfchar17
         ,evt_udfchar40 = CASE WHEN sobj_udfchar17 = '50406' THEN NVL(sppo_location,evt_udfchar40) ELSE evt_udfchar40 END
      WHERE evt_Code    = newevtcode(i);
    END IF; --sobj_udfchar17 IS NOT NULL
  END LOOP; --i
END AFTER STATEMENT;

END COMP_INS_EVT_QBZ;
/
SHOW ERRORS TRIGGER COMP_INS_EVT_QBZ
PROMPT

UPDATE r5flexsql SET flx_active = '-',flx_comment = flx_comment||' Deactivated, moved to COMP_UPD_EVT_QBZ'
WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq IN (48,43) AND flx_active <> '-';

EXEC QBZ_O7CUSTOM( 'SPC-422_1.sql', '14-09-2023', 'QBZ-EAM 12.0', 'SPC-422_1.sql');

COMMIT;

PROMPT ...END of SPC-422_1.sql

SPOOL OFF

