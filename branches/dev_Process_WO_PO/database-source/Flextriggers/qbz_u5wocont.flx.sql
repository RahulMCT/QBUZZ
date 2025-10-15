-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5wocont.flx.sql
--
-- Description : flexes on u5wocont
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 30-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_u5wocont.flx.sql
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('U5WOCONT',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON
--System date should be populated on Date
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'U5WOCONT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 10;
sstmt :=
'DECLARE
cuser      r5users.usr_code%type;
BEGIN
cuser:= NVL( o7sess.cur_user, ''*'');
  FOR C IN (SELECT ctl_seq
            FROM u5wocont
            WHERE ROWID  = :ROWID) LOOP
    UPDATE u5wocont
    SET ctl_wccreatedby = cuser,
        ctl_wccreated   = SYSDATE
    WHERE ctl_seq      = c.ctl_seq;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('U5WOCONT','POST-INSERT',10,'+','-'
    ,'+','U5WOCONT, POST INSERT, 10','session user and date created should be populated at the time of creation of work order control','-',0,'-',sysdate,sstmt);
END;
/
 
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_u5wocont.flx.sql
PROMPT