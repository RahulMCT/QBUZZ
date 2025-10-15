-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5activities.flx.sql
--
-- Description : flexes on r5activities
--
-- Product     : EAM             Release : 11.7          Build : 
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_r5activities.flx.sql
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5ACTIVITIES',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON
--Hire labour checked then vendor copied
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5ACTIVITIES' AND flx_trigger = 'POST-INSERT' AND flx_seq = 40;
sstmt :=
'BEGIN 
  FOR C IN (SELECT act_event,act_act,evt_udfchar19
            FROM r5events
            JOIN r5activities ON (act_event = evt_code)
            WHERE r5activities.ROWID = :ROWID
            AND evt_rtype IN (''JOB'',''PPM'')
            AND evt_jobtype IN (''STO'',''SCH'')
            AND act_hire = ''+'') LOOP
    --copy supplier from WO
    UPDATE r5activities
    SET act_udfchar01 = c.evt_udfchar19
    WHERE act_event   = c.act_event
    AND act_act       = c.act_act;
  END LOOP; 
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5ACTIVITIES','POST-INSERT',40,'+','-'
    ,'+','R5ACTIVITIES, Post Insert, 40','If ACT_HIRE is checked then Evt_udfchar19 will be copied on r5activities - ACT_UDFCHAR01','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5ACTIVITIES' AND flx_trigger = 'POST-INSERT' AND flx_seq = 41;
sstmt :=
'BEGIN
  FOR c IN (SELECT act_event,act_act
            FROM r5events
            JOIN r5activities ON (act_event = evt_code)
            WHERE r5activities.ROWID = :ROWID
            AND evt_rtype = ''PPM''
            AND act_hire = ''-'')
  LOOP
    UPDATE r5activities
    SET act_hire = ''+''
    WHERE act_event = c.act_event
    AND   act_act  = c.act_act;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5ACTIVITIES','POST-INSERT',41,'+','-'
    ,'+','R5ACTIVITIES, Post Insert, 41','If ACT_HIRE is uncchecked then check','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;

SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_r5activities.flx.sql
PROMPT