-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-325.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 05-04-2023  - MCT - SPC325  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-325.log

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

PROMPT ...Start of SPC-325.sql
/*Flex is moved to compound trigger*/
/*R5EVENTS,POST-UPDATE,46*/

PROMPT ...Creating trigger COMP_UPD_EVT_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_UPD_EVT_QBZ
FOR UPDATE ON R5EVENTS
COMPOUND TRIGGER
  --local variables
  TYPE             newevtcodetype     IS TABLE OF r5events.evt_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtorgtype      IS TABLE OF r5events.evt_org%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtstatustype   IS TABLE OF r5events.evt_status%TYPE INDEX BY BINARY_INTEGER;
  TYPE             newevtsupptype     IS TABLE OF r5events.evt_udfchar19%TYPE INDEX BY BINARY_INTEGER;

  newevtcode       newevtcodetype ;
  newevtcode2      newevtcodetype ;
  newevtstatus     newevtstatustype ;
  newevtorg        newevtorgtype ;
  newevtsupp       newevtsupptype;

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
   AND :NEW.evt_status  =  'AG'
   AND :NEW.evt_status  <> :OLD.evt_status
   AND :NEW.evt_rtype   IN ('JOB','PPM')
   AND :NEW.evt_udfchar19 IS NOT NULL THEN
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
   AND ((o7sess.cur_user <> 'DATABRIDGEINTERNALUSER'
         AND ((:old.evt_status = 'IBQ' AND :new.evt_status = 'TC')
              OR (:old.evt_status = 'IBL' AND :new.evt_status = 'TCS')
              OR (:old.evt_status <> :new.evt_status AND :new.evt_status = 'CANC')))
        OR o7sess.cur_user = 'DATABRIDGEINTERNALUSER')
  THEN
    INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
    SELECT 'SYNCMAINTORDER','R5EVENTS',:new.evt_code,:new.evt_org,:new.evt_org,NULL
    FROM dual
    WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                     WHERE xts_trantype = 'SYNCMAINTORDER'
                     AND   xts_keyfld1  = :new.evt_code);
  END IF; --:new.evt_jobtype IN ('STO','SCH')
  --if WO status changed associate damage case WO status needs to be updated
  IF :OLD.evt_status  <> :NEW.evt_status THEN
     --save record for statement level processing
     cnt2               := cnt2 + 1;
     newevtcode2(cnt2)  := :new.evt_code;
     newevtstatus(cnt2) := :new.evt_status;
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

/*PREUPD_CSM_QBZ trigger moved to compound trigger*/
DROP TRIGGER PREUPD_CSM_QBZ;

PROMPT ...Creating trigger COMP_UPD_CSM_QBZ
PROMPT
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
   AND ((o7sess.cur_user <> 'DATABRIDGEINTERNALUSER'
         AND (:old.csm_status <> :new.csm_status AND :new.csm_status IN ('C','CANC')))
        OR o7sess.cur_user = 'DATABRIDGEINTERNALUSER')
  THEN
    INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
    SELECT 'CSMGMT','R5CASEMANAGEMENT',:new.csm_code,NULL,:new.csm_org,NULL
    FROM dual
    WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                     WHERE xts_trantype = 'CSMGMT'
                     AND   xts_keyfld1  = :new.csm_code);
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
      SELECT (o7cost.tools2(evt_code)+o7cost.material2(evt_code)+o7cost.labour2(evt_code)) INTO Ccost
      FROM r5events
      WHERE evt_code = newcsmwo(j)
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
        INSERT INTO u5dmcost (cos_case, cos_line, cos_costdesc, cos_costcode, cos_costcodedesc, cos_cost, cos_totalcost, createdby, created, cos_date,cos_wo)
                       VALUES(newcsmcode2(j), cnt1, newcsmdesc(j), '4405', 'betaalde schade reparatie algemeen', Ccost, NULL, cuser, SYSDATE, TRUNC(SYSDATE),'+');
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

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 2;
sstmt :=
'DECLARE
  Sdesc r5casemanagement.csm_udfchar03%type;

 CURSOR C1(p_code r5casemanagement.csm_workorder%TYPE) IS
  SELECT r5o7.o7get_desc(''EN'',''UCOD'', evt_status,''EVST'', '''')
  FROM r5events
  WHERE evt_code = p_code;
BEGIN
  FOR c IN (SELECT csm_code,csm_workorder,csm_udfchar03
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_workorder IS NOT NULL)
  LOOP
    OPEN C1(c.csm_workorder);
    FETCH C1 INTO Sdesc;
    CLOSE C1;
    IF NVL(c.csm_udfchar03,''@#$%'') <> Sdesc THEN
      UPDATE r5casemanagement
      SET csm_udfchar03 = Sdesc
      WHERE csm_code    = c.csm_code;
    END IF;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',2,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 2','Update WO status','-',0,'-',sysdate,sstmt);
END;
/


DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 2;
sstmt :=
'DECLARE
  Sdesc r5casemanagement.csm_udfchar03%type;

 CURSOR C1(p_code r5casemanagement.csm_workorder%TYPE) IS
  SELECT r5o7.o7get_desc(''EN'',''UCOD'', evt_status,''EVST'', '''')
  FROM r5events
  WHERE evt_code = p_code;
BEGIN
  FOR c IN (SELECT csm_code,csm_workorder,csm_udfchar03
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_workorder IS NOT NULL)
  LOOP
    OPEN C1(c.csm_workorder);
    FETCH C1 INTO Sdesc;
    CLOSE C1;
    IF NVL(c.csm_udfchar03,''@#$%'') <> Sdesc THEN
      UPDATE r5casemanagement
      SET csm_udfchar03 = Sdesc
      WHERE csm_code    = c.csm_code;
    END IF;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-UPDATE',2,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Update, 2','Update WO status','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 3;
sstmt :=
'DECLARE
  cdesc     r5casemanagement.csm_udfchar07%type;
  cdept     r5casemanagement.csm_udfchar08%type;
  csup      r5casemanagement.csm_udfchar09%type;
  csupdesc  r5casemanagement.csm_udfchar10%type;

 CURSOR C1(p_code r5casemanagement.csm_udfchar06%TYPE) IS
  SELECT per_desc,per_mrc,per_supervisor,r5o7.o7get_desc(''EN'',''SGRP'', per_supervisor,'''', '''')
  FROM r5personnel
  WHERE per_code = p_code;
BEGIN
  FOR c IN (SELECT csm_code,csm_udfchar06,csm_udfchar07
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_udfchar06 IS NOT NULL)
  LOOP
    OPEN C1(c.csm_udfchar06);
    FETCH C1 INTO cdesc,cdept,csup,csupdesc;
    CLOSE C1;
    IF NVL(c.csm_udfchar07,''@#$%'') <> cdesc THEN
      UPDATE r5casemanagement
      SET csm_udfchar07  = cdesc
          ,csm_udfchar08 = cdept
          ,csm_udfchar09 = csup
          ,csm_udfchar10 = csupdesc
      WHERE csm_code     = c.csm_code;
    END IF;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',3,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 3','Update Employe desc/etc..','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 3;
sstmt :=
'DECLARE
  cdesc     r5casemanagement.csm_udfchar07%type;
  cdept     r5casemanagement.csm_udfchar08%type;
  csup      r5casemanagement.csm_udfchar09%type;
  csupdesc  r5casemanagement.csm_udfchar10%type;

 CURSOR C1(p_code r5casemanagement.csm_udfchar06%TYPE) IS
  SELECT per_desc,per_mrc,per_supervisor,r5o7.o7get_desc(''EN'',''SGRP'', per_supervisor,'''', '''')
  FROM r5personnel
  WHERE per_code = p_code;
BEGIN
  FOR c IN (SELECT csm_code,csm_udfchar06,csm_udfchar07
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_udfchar06 IS NOT NULL)
  LOOP
    OPEN C1(c.csm_udfchar06);
    FETCH C1 INTO cdesc,cdept,csup,csupdesc;
    CLOSE C1;
    IF NVL(c.csm_udfchar07,''@#$%'') <> cdesc THEN
      UPDATE r5casemanagement
      SET csm_udfchar07  = cdesc
          ,csm_udfchar08 = cdept
          ,csm_udfchar09 = csup
          ,csm_udfchar10 = csupdesc
      WHERE csm_code     = c.csm_code;
    END IF;  
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-UPDATE',3,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Update, 3','Update Employe desc/etc..','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 6;
sstmt :=
'BEGIN
  FOR c IN (SELECT csm_code,csm_workorder
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_workorder IS NOT NULL)
  LOOP
    UPDATE r5events
    SET  evt_casemanagement =  c.csm_code
    WHERE evt_code          =  c.csm_workorder
    AND  NVL(evt_casemanagement,''@#$%'') <> c.csm_code;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',6,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 6','case code updated on wo screen','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-INSERT' AND flx_seq = 47;
sstmt :=
'BEGIN
  FOR c IN (SELECT evt_code,evt_created
            FROM r5events
            WHERE ROWID = :ROWID
            AND evt_created IS NOT NULL
            AND evt_jobtype IN(''SCH'',''STO''))
  LOOP
    UPDATE r5events
    SET evt_target  = TRUNC(c.evt_created)
    ,evt_schedend   = TRUNC(c.evt_created)
    WHERE evt_code = c.evt_code
    AND TRUNC(evt_target) <> TRUNC(c.evt_created);
END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-INSERT',47,'+','-'
    ,'+','R5EVENTS Post Insert 47','WO created updated with evt_target','-',0,'-',sysdate,sstmt);
END;
/

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-325.sql', '05-04-2023', 'QBZ-EAM 11.7', 'Changes Qbuzz');

COMMIT;

PROMPT ...END of SPC-325.log

SPOOL OFF