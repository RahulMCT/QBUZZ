-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5casemanagement.flx.sql
--
-- Description : flexes on R5CASEMANAGEMENT
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 28-11-2022  - MCT - SPC295  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_r5casemanagement.flx.sql
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5CASEMANAGEMENT',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 1;
sstmt :=
'DECLARE
  cuser      r5users.usr_code%type;
  stcm_code  r5casemanagementtasks.tcm_code%type;
  crev       NUMBER;
  cdesc      r5casemanagementtasks.tcm_desc%type;
  chk        VARCHAR2(3);
BEGIN
  FOR i IN (SELECT csm_code
            FROM r5casemanagement
            WHERE rowid      = :rowid
            AND   csm_casetype = ''SCH''
            AND   csm_status   = ''O'')
  LOOP
    cuser:= NVL( o7sess.cur_user, ''*'');
    r5o7.o7maxseq(stcm_code,''TCM'',''1'',chk);
    SELECT max(tsk_desc),max(tsk_revision) INTO cdesc,crev
    FROM r5tasks
    WHERE tsk_code = ''SCHADE''
    AND tsk_revstatus = ''A'';    
    INSERT INTO r5casemanagementtasks (tcm_code, tcm_desc, tcm_casemanagement, tcm_sequence,
                                       tcm_chklst_task, tcm_chklst_taskrev, tcm_notify_complete, tcm_notify_readytostart,
                                       tcm_createdby, tcm_created)
                                SELECT stcm_code, cdesc, i.csm_code, ''10'',
                                       ''SCHADE'', crev, ''-'', ''-'',
                                       cuser,sysdate FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM r5casemanagementtasks WHERE tcm_casemanagement = i.csm_code);
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',1,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 1','Create SCHADE Task','-',0,'-',sysdate,sstmt);
END;
/

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
 DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 4;
 sstmt :=
 'BEGIN
   FOR c IN (SELECT csm_code
             FROM r5casemanagement
             WHERE ROWID = :ROWID
             AND csm_object IS NOT NULL)
   LOOP
     UPDATE r5casemanagement
     SET csm_udfchar01 = (SELECT obj_alias
                          FROM r5objects
                          WHERE obj_code = csm_object
                          AND obj_org    = csm_object_org)
     WHERE csm_code    =  c.csm_code;
   END LOOP;
 END;';
 INSERT INTO r5flexsql
     (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
     ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
 VALUES
     ('R5CASEMANAGEMENT','POST-INSERT',4,'+','-'
     ,'+','R5CASEMANAGEMENT, Post Insert, 4','Update Equipment alias','-',0,'-',sysdate,sstmt);
 END;
 /

--System date should be populated on Date
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 5;
sstmt :=
'BEGIN
  FOR C IN (SELECT csm_code
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_created IS NULL) LOOP
    UPDATE r5casemanagement
    SET csm_created = SYSDATE
    WHERE csm_code  = c.csm_code;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',5,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 5','System date should be populated on Date field','-',0,'-',sysdate,sstmt);
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
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_r5casemanagement.flx.sql
PROMPT