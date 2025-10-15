-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5events.flx.sql
--
-- Description : flexes on r5events
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- 0002 06-09-2024  - MCT - SPC582  - Avoid duplicity of Incident number
-- 0003 04-11-2024  - MCT - SPC579  - Populate evt_udfnote02 with WO,Activity,Object,Problemcode
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_r5events.flx.sql
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5EVENTS',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON
---Vendor copied to evt_udfchar19
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-INSERT' AND flx_seq = 41;
sstmt :=
'DECLARE
sobj_udfchar17   r5objects.obj_udfchar17%type;
scom_udfchkbox01 r5companies.com_udfchkbox01%type;
scom_udfchkbox04 r5companies.com_udfchkbox04%type;

CURSOR c_supp(c_evt_object r5events.evt_object%type,c_evt_object_org r5events.evt_object_org%type) IS
  SELECT obj_udfchar17,com_udfchkbox01,com_udfchkbox04
  FROM r5objects o,r5companies
  WHERE o.obj_code      = c_evt_object
  AND   o.obj_org       = c_evt_object_org
  AND   o.obj_udfchar17 = com_code
  AND   com_org       = ''*''
  AND NOT EXISTS(SELECT 1 FROM r5objects p
                 WHERE p.obj_code = o.obj_primarysystem
                 AND p.obj_udfchkbox01 = ''+''
                 AND com_udfchkbox03   = ''+'');
BEGIN
  FOR cevt IN (SELECT evt_jobtype,evt_code,evt_object,evt_object_org,evt_class
               FROM r5events
               WHERE rowid       = :rowid
               AND evt_status  = ''W''
               AND evt_rtype IN (''JOB'',''PPM'')
               AND evt_jobtype IN (''STO'',''SCH''))
  LOOP
    --get supplier from Asset
    OPEN  c_supp(cevt.evt_object,cevt.evt_object_org);
    FETCH c_supp INTO sobj_udfchar17,scom_udfchkbox01,scom_udfchkbox04;
    CLOSE c_supp;
    --for Qrane interface: WO cannot be created as this is invalid Supplier
    IF o7sess.cur_user = ''DATABRIDGEINTERNALUSER''
    AND scom_udfchkbox04 = ''-'' THEN
      RAISE_APPLICATION_ERROR(-20003,''Work Order cannot be created for this Supplier.'');
    END IF; --scom_udfchkbox04 = ''-'';
    --populate supplier to WO
    IF sobj_udfchar17 IS NOT NULL THEN
      UPDATE r5events
      SET evt_udfchar19 = (CASE WHEN ((cevt.evt_jobtype = ''SCH'' AND scom_udfchkbox01 = ''+'')
                                      OR (cevt.evt_jobtype = ''STO'' AND cevt.evt_class <> ''TM'')) THEN sobj_udfchar17 ELSE evt_udfchar19 END)
      WHERE evt_code    = cevt.evt_code;
    END IF; --sobj_udfchar17 IS NOT NULL
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-INSERT',41,'+','-'
    ,'+','R5EVENTS, Post Insert, 41','Copy Vendor copied to evt_udfchar19','-',0,'-',sysdate,sstmt);
END;
/
--Activity created
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 42;
sstmt :=
'DECLARE
nactchar     VARCHAR2(30);
nacthcheck   VARCHAR2(30);
countit      NUMBER;
acthire      NUMBER;
evtudfnote02 r5events.evt_udfnote02%type;
BEGIN
  FOR i in (SELECT * FROM r5events
            WHERE rowid      = :rowid
            AND evt_rtype IN (''JOB'',''PPM'')
            AND evt_jobtype IN (''STO'',''SCH'',''VOHP'')
            AND evt_status  IN (''IBL'',''IBQ''))
  LOOP
    IF i.evt_status = ''IBL''
     AND i.evt_udfchar19 IS NOT NULL THEN
      UPDATE r5activities
      SET    act_udfchar01 = i.evt_udfchar19
      WHERE  act_event     = i.evt_code
      AND    act_trade     = ''MO''
      AND    nvl(act_udfchar01,''@#$%'') <> i.evt_udfchar19;
      --get max activity
      SELECT NVL(MAX(act_act),0) INTO countit FROM r5activities WHERE act_event = i.evt_code;
      countit := countit+10;
      INSERT INTO r5activities ( act_event,act_act,act_start,act_hire,act_mrc,act_persons,act_duration,act_est,act_rem,act_qty,act_time,
                                 act_trade,act_udfchar01,act_udfchkbox03,act_planninglevel,
                                 act_assignmentstatus)
                        SELECT i.evt_code,countit,sysdate,''+'',i.evt_mrc,''1'',''1'',''1'',''1'',''1'',''1'',
                                ''MO'',i.evt_udfchar19,i.evt_warranty,''TP'',
                                ''U'' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM r5activities WHERE act_event = i.evt_code and act_udfchar01 = i.evt_udfchar19);
      --get max hire activity
      SELECT MAX(CASE WHEN act_hire = ''+'' THEN act_act ELSE NULL END) INTO acthire FROM r5activities WHERE act_event = i.evt_code;
      --populate evt_udfnote02 with WO,Activity,Object,Problemcode
      evtudfnote02 := i.evt_code||'',''||acthire||'',''||i.evt_object||CASE WHEN i.evt_reqm IS NOT NULL THEN '',''||i.evt_reqm ELSE NULL END;
      IF evtudfnote02 <> NVL(i.evt_udfnote02,''!@#$%'') THEN
        UPDATE r5events
        SET evt_udfnote02 = evtudfnote02
        WHERE evt_code    = i.evt_code;
      END IF; --i.evt_udfnote02 IS NULL
    END IF; --i.evt_status = ''IBL''

    IF i.evt_status = ''IBQ'' THEN
      SELECT NVL(MAX(act_act),0) INTO countit FROM r5activities WHERE act_event = i.evt_code;
      countit := countit+10;
      INSERT INTO r5activities ( act_event,act_act,act_start,act_hire,act_mrc,act_persons,act_duration,act_est,act_rem,act_qty,act_time,
                                 act_trade,act_udfchar01,act_udfchkbox03,act_planninglevel,
                                 act_assignmentstatus)
                        SELECT i.evt_code,countit,sysdate,''-'',i.evt_mrc,''1'',''1'',''1'',''1'',''1'',''1'',
                                ''VVO'',NULL,i.evt_warranty,''TP'',
                                ''U'' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM r5activities WHERE act_event = i.evt_code and act_trade = ''VVO'');

    END IF; --i.evt_status = ''IBQ''
  END LOOP; --i
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',42,'+','-'
    ,'+','R5EVENTS, Post Update, 42','status is updated to IBQ/IBL activity created','-',0,'-',sysdate,sstmt);
END;
/

--PM WO's Status is 'A' then evt_udfchar19 copied
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 43;
sstmt :=
'BEGIN
  FOR c IN (SELECT evt_code,evt_object,evt_object_org
            FROM r5events
            WHERE ROWID = :ROWID
            AND evt_rtype      = ''PPM''
            AND evt_status     = ''W''
            AND evt_udfchar19 IS NULL)
  LOOP
    UPDATE r5events
    SET evt_udfchar19 = (SELECT obj_udfchar17
                         FROM r5objects
                         WHERE obj_code = c.evt_object
                         AND   obj_org  = c.evt_object_org)
    WHERE evt_code   = c.evt_code;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',43,'-','-'
    ,'+',NULL,'When Status = ''W'' and type = ''PPM'' then obj_udfchar17 will be copied to evt_udfchar19.','-',0,'-',sysdate,sstmt);
END;
/

--Clear Vendor when status is rejected
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 44;
sstmt :=
'BEGIN
  FOR c IN (SELECT evt_code FROM r5events
            WHERE ROWID = :ROWID
            AND evt_rtype   IN (''JOB'',''PPM'')
            AND evt_status  IN (''AL'',''IBQ'')
            AND evt_udfchar19 IS NOT NULL)
  LOOP
    UPDATE r5events
    SET  evt_udfchar19  = NULL
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',44,'+','-'
    ,'+','R5EVENTS, Post Update, 44','When wo status is (''AL'',''IBQ'') (Rejected by Vendor Or Assign to QBUZZ) field evt_udfchar19 will be cleared','-',0,'-',sysdate,sstmt);
END;
/
--sysda updated when status is AG
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 45;
sstmt :=
'BEGIN
  FOR C IN (SELECT evt_code,evt_org
            FROM r5events
            WHERE ROWID      = :ROWID
            AND   evt_status = ''AG''
            AND evt_udfdate09 IS NULL) LOOP
    UPDATE r5events
    SET   evt_udfdate09 = trunc(o7gttime( c.evt_org))
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',45,'+','-'
    ,'+','R5EVENTS  Post Update 45','When wo status is ''AG'' (Administratively Ready) field evt_udfdate09 will be updated','-',0,'-',sysdate,sstmt);
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

--ppo_location will be copied to evt_udfchar40.
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 48;
sstmt :=
'DECLARE
  plocation r5ppmobjects.ppo_location%TYPE;
  CURSOR c1 (pevtppopk NUMBER) IS
   SELECT ppo_location
   FROM r5ppmobjects
   WHERE ppo_pk = pevtppopk;

BEGIN
  FOR c IN (SELECT evt_code,evt_ppopk
            FROM r5events
            WHERE ROWID = :ROWID
            AND evt_rtype      = ''PPM''
            AND evt_status     = ''W''
            AND evt_udfchar19  = ''50406'')
  LOOP
   BEGIN
   OPEN c1 (c.evt_ppopk);
   FETCH c1 INTO plocation;
   CLOSE c1;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
      NULL;
   END;
    UPDATE r5events
    SET evt_udfchar40 = plocation
    WHERE evt_code   = c.evt_code
    AND NVL(evt_udfchar40,''!#@$'') <> plocation ;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',48,'+','-'
    ,'+','R5EVENTS Post Update 48','ppo_location will be copied to evt_udfchar40.','-',0,'-',sysdate,sstmt);
END;
/

--0002 - Avoid duplicity of Incident number
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-INSERT' AND flx_seq = 80;
sstmt :=
'DECLARE
ncount INT;
BEGIN
  FOR i IN (SELECT evt_code,evt_udfchar06
            FROM r5events
            WHERE r5events.ROWID = :ROWID
            AND evt_type IN (''JOB'',''PPM'')
            AND evt_jobtype IN (''STO'',''SCH'')
            AND evt_enteredby = ''DATABRIDGEINTERNALUSER''
            AND evt_udfchar06 IS NOT NULL)
  LOOP
    -- Check duplicity of evt_udfchar06
    SELECT COUNT(1) INTO ncount FROM dual
    WHERE EXISTS(SELECT 1
                 FROM r5events
                 WHERE evt_code <> i.evt_code
                 AND evt_jobtype IN (''STO'',''SCH'')
                 AND evt_udfchar06 = i.evt_udfchar06);
    IF ncount > 0 THEN
      RAISE_APPLICATION_ERROR(-20001,''Work Order cannot be saved due to duplicate Incident number.'');
    END IF; --ncount > 1
  END LOOP; --i
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-INSERT',80,'+','-'
    ,'+','R5EVENTS,PI,90','Check duplicity for Incident number.','-',0,'-',sysdate,sstmt);
END;
/

--Addional Cost line
/*Flex is moved to compound trigger*/
/*DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 46;
sstmt :=
'DECLARE
  countit    NUMBER;
  cnt        NUMBER;
  Ccode      u5dmcost.cos_case%type;
  Cdesc      u5dmcost.cos_costdesc%type;
  Ccost      u5dmcost.cos_cost%type;
  cSUM       u5dmcost.cos_totalcost%type;
  cuser      r5users.usr_code%type;
BEGIN
  FOR i in (SELECT evt_code FROM r5events
            WHERE rowid      = :rowid
            AND evt_status  = ''C'')
  LOOP
    BEGIN
    SELECT csm_code,csm_desc INTO Ccode,Cdesc
    FROM r5casemanagement
    WHERE csm_workorder = i.evt_code
    AND   csm_status    = ''O'';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        RETURN;
    END;
    --Count for WO''s line exists.
    SELECT COUNT(1) INTO countit
    FROM u5dmcost
    WHERE cos_case = Ccode
    AND NVL(cos_wo,''-'') = ''+'';
    IF countit = 0 THEN
      --Count for WO''s line not exists.
      SELECT NVL(MAX(cos_line),0) INTO cnt
      FROM u5dmcost
      WHERE cos_case = Ccode
      AND NVL(cos_wo,''-'') = ''-'';
      cnt := cnt+10;
      --cost of work order
      Ccost := o7cost.tools2(i.evt_code)+o7cost.material2(i.evt_code)+o7cost.labour2(i.evt_code);
      --New line into additional costs
      INSERT INTO u5dmcost (cos_case, cos_line, cos_costdesc, cos_costcode, cos_costcodedesc, cos_cost, cos_totalcost, createdby, created, cos_date,cos_wo)
                     VALUES(Ccode, cnt, Cdesc, ''4405'', ''betaalde schade reparatie algemeen'', Ccost, NULL, cuser, SYSDATE, TRUNC(SYSDATE),''+'');
    END IF;--countit
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',46,'+','-'
    ,'+','R5EVENTS, Post Update, 46','When Status updated to C then new cost line added','-',0,'-',sysdate,sstmt);
END;
/


--evt_udfchkbox02 updated when status is DI
--moved to trigger
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 46;
sstmt :=
'BEGIN
  FOR C IN (SELECT evt_code
            FROM r5events
            WHERE ROWID           = :ROWID
            AND   evt_status      = ''DI''
            AND   evt_udfchkbox02 <> ''-'') LOOP
    UPDATE r5events
    SET evt_udfchkbox02 = ''-''
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',46,'+','-'
    ,'+','R5EVENTS Post Update 46','When wo status is ''DI'' (Dispute) field evt_udfchkbox02 will be updated','-',0,'-',sysdate,sstmt);
END;
/
--evt_udfchkbox02 updated when status is CA
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 47;
sstmt :=
'BEGIN
  FOR C IN (SELECT evt_code
            FROM r5events
            WHERE ROWID           = :ROWID
            AND   evt_status      = ''CA''
            AND   evt_udfchkbox02 <> ''+'') LOOP
    UPDATE r5events
    SET evt_udfchkbox02 = ''+''
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',47,'+','-'
    ,'+','R5EVENTS Post Update 47','When wo status is ''CA'' (Checked, agreed) field evt_udfchkbox02 will be updated','-',0,'-',sysdate,sstmt);
END;
*/
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_r5events.flx.sql
PROMPT