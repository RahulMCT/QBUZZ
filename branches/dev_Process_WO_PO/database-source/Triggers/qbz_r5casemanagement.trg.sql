-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5casemanagement.trg.sql
--
-- Description : Triggers on r5casemanagement
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 19-12-2022 - MCT - SPC254 - Creation
-- 0002 13-06-2024 - MCT - SPC494 - Add costs of child work order (along with parents work order) in Damage | Additional costs tab.
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_r5casemanagement.trg.sql
PROMPT

PROMPT ...Creating trigger PREINS_CSM_QBZ
CREATE OR REPLACE TRIGGER PREINS_CSM_QBZ
BEFORE INSERT ON r5casemanagement
FOR EACH ROW
DECLARE
countit    NUMBER;
cnt        NUMBER;
Ccost      u5dmcost.cos_cost%type;
cuser      r5users.usr_code%type;
BEGIN
  IF :NEW.csm_workorder IS NOT NULL THEN
    BEGIN
      SELECT SUM(o7cost.tools2(evt_code)+o7cost.material2(evt_code)+o7cost.labour2(evt_code)) INTO Ccost
      FROM r5events
      WHERE evt_code IN(SELECT evt_code
                        FROM r5events
                        START WITH evt_code = :NEW.csm_workorder
                        CONNECT BY PRIOR evt_code = evt_parent)
      AND evt_status = 'C';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN;
    END;
    --Count for WO's line exists.
    SELECT COUNT(1) INTO countit
    FROM u5dmcost
    WHERE cos_case = :NEW.csm_code
    AND NVL(cos_wo,'-') = '+';
    IF countit = 0 THEN
      --Count for WO's line not exists.
      SELECT NVL(MAX(cos_line),0) INTO cnt
      FROM u5dmcost
      WHERE cos_case = :NEW.csm_code
      AND NVL(cos_wo,'-') = '-';
      cnt := cnt+10;
      INSERT INTO u5dmcost
        (cos_case,cos_line,cos_costdesc,cos_costcode,cos_costcodedesc,cos_cost,cos_totalcost,createdby,created,cos_date,cos_wo)
      VALUES
        (:NEW.csm_code,cnt,:NEW.csm_desc,'4405','betaalde schade reparatie algemeen',Ccost,NULL,cuser,SYSDATE,TRUNC(SYSDATE),'+');
    END IF;--countit
  END IF;
END PREINS_CSM_QBZ;
/
SHOW ERRORS TRIGGER PREINS_CSM_QBZ
PROMPT

/*PREUPD_CSM_QBZ trigger moved to compound trigger*/
--DROP TRIGGER PREUPD_CSM_QBZ;

PROMPT ...Creating trigger COMP_UPD_CSM_QBZ
CREATE OR REPLACE TRIGGER COMP_UPD_CSM_QBZ
FOR UPDATE ON R5CASEMANAGEMENT
COMPOUND TRIGGER
  --local variables
  TYPE            newcsmcodetype     IS TABLE OF r5casemanagement.csm_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcsmdesctype     IS TABLE OF r5casemanagement.csm_desc%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcsmwotype       IS TABLE OF r5casemanagement.csm_workorder%TYPE INDEX BY BINARY_INTEGER;

  newcsmcode      newcsmcodetype;
  newcsmcode2     newcsmcodetype;
  newcsmcode3     newcsmcodetype;
  newcsmdesc      newcsmdesctype;
  newcsmwo        newcsmwotype;

  cnt             NUMBER := 0;
  cnt2            NUMBER := 0;
  cnt3            NUMBER := 0;
  countit         NUMBER;
  cnt1            NUMBER;
  Ccost           u5dmcost.cos_cost%type;
  cemplye         r5personnel.per_code%type;
  cuser           r5users.usr_code%type;
  nflag           NUMBER;

AFTER EACH ROW IS
BEGIN
  IF (:NEW.csm_object IS NOT NULL AND :NEW.csm_object <> :OLD.csm_object)
      OR (:NEW.csm_object IS NOT NULL AND :OLD.csm_object IS NULL)
       OR (:NEW.csm_object IS NULL AND :OLD.csm_object IS NOT NULL) THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcsmcode(cnt)  := :new.csm_code;
  END IF;
  IF (:NEW.csm_workorder IS NOT NULL AND :OLD.csm_workorder <> :NEW.csm_workorder)
      OR (:NEW.csm_workorder IS NOT NULL AND :OLD.csm_workorder IS NULL)
       OR (:NEW.csm_workorder IS NULL AND :OLD.csm_workorder IS NOT NULL) THEN
     --save record for statement level processing
     cnt2               := cnt2 + 1;
     newcsmcode2(cnt2)  := :new.csm_code;
     newcsmwo(cnt2)     := :new.csm_workorder;
     newcsmdesc(cnt2)   := :new.csm_desc;
  END IF;
  --When STATUS is changed to IBH. Fill CSM_ASSIGNEDTO with employee that is linked to the user
  IF :old.csm_status <> :new.csm_status
      AND :new.csm_status = 'IBH' THEN
     --save record for statement level processing
     cnt3               := cnt3 + 1;
     newcsmcode3(cnt3)  := :new.csm_code;
  END IF;

  --on status update send update to Qrane interface
  --if update happening from interface then send update to Qrane interface
  IF :new.csm_udfchar02 IS NOT NULL
   AND :new.csm_casetype IN ('SCH')
   AND :new.csm_createdby = 'DATABRIDGEINTERNALUSER'
   AND ((o7sess.cur_user <> 'DATABRIDGEINTERNALUSER'
         AND (:old.csm_status <> :new.csm_status AND :new.csm_status IN ('C','CANC')))
        OR o7sess.cur_user = 'DATABRIDGEINTERNALUSER')
  THEN
    BEGIN
      nflag := TO_NUMBER(:new.csm_udfchar02);
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
      SELECT 'CSMGMT','R5CASEMANAGEMENT',:new.csm_code,NULL,:new.csm_org,NULL
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                       WHERE xts_trantype = 'CSMGMT'
                       AND   xts_keyfld1  = :new.csm_code);
    EXCEPTION
    WHEN OTHERS THEN
      NULL;
    END;
  END IF; --:new.csm_udfchar02 IS NOT NULL
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    UPDATE r5casemanagement
    SET csm_udfchar01 = (SELECT obj_alias
                         FROM r5objects
                         WHERE obj_code = csm_object
                         AND   obj_org  = csm_object_org)
    WHERE csm_code    =  newcsmcode(i);
  END LOOP;--i loop
  --loop through PLSQL table count
  FOR j IN 1..cnt2
  LOOP
    IF newcsmwo(j) IS NULL THEN
      UPDATE r5events
      SET  evt_casemanagement  =  NULL
      WHERE evt_casemanagement =  newcsmcode2(j);
    ELSE
      UPDATE r5events
      SET  evt_casemanagement             =  newcsmcode2(j)
      WHERE evt_code                      =  newcsmwo(j)
      AND  NVL(evt_casemanagement,'!@#$') <> newcsmcode2(j);
    END IF;
    IF newcsmwo(j) IS NOT NULL THEN
      BEGIN
        SELECT SUM(o7cost.tools2(evt_code)+o7cost.material2(evt_code)+o7cost.labour2(evt_code)) INTO Ccost
        FROM r5events
        WHERE evt_code IN(SELECT evt_code
                          FROM r5events
                          START WITH evt_code = newcsmwo(j)
                          CONNECT BY PRIOR evt_code = evt_parent)
        AND evt_status = 'C';
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
      END;
    END IF;
    IF Ccost IS NOT NULL THEN
      --Count for WO's line exists.
      SELECT COUNT(1) INTO countit
      FROM u5dmcost
      WHERE cos_case = newcsmcode2(j)
      AND NVL(cos_wo,'-') = '+';
      IF countit = 0 THEN
        --Count for WO's line not exists.
        SELECT NVL(MAX(cos_line),0) INTO cnt1
        FROM u5dmcost
        WHERE cos_case = newcsmcode2(j)
        AND NVL(cos_wo,'-') = '-';
        cnt1  := cnt1+10;
        cuser := NVL( o7sess.cur_user, '*' );
        INSERT INTO u5dmcost
          (cos_case,cos_line,cos_costdesc,cos_costcode,cos_costcodedesc,cos_cost,cos_totalcost,createdby,created,cos_date,cos_wo)
        VALUES
          (newcsmcode2(j),cnt1,newcsmdesc(j),'4405','betaalde schade reparatie algemeen',Ccost,NULL,cuser,SYSDATE,TRUNC(SYSDATE),'+');
      END IF;--countit
    END IF;--Ccost
  END LOOP;--j loop

  FOR k in 1..cnt3
  LOOP
    cuser := NVL( o7sess.cur_user, '*' );
    BEGIN
      SELECT per_code INTO cemplye FROM r5personnel WHERE per_user = cuser;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      NULL;
    END;
    IF cemplye IS NOT NULL THEN
      UPDATE r5casemanagement
      SET csm_assignedto = cemplye
      WHERE csm_code = newcsmcode3(k)
      AND NVL(csm_assignedto,'!@#$') <> cemplye;
    END IF;
  END LOOP;--k loop
END AFTER STATEMENT;

END COMP_UPD_CSM_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_CSM_QBZ
PROMPT

PROMPT ...End of qbz_r5casemanagement.trg.sql
PROMPT
