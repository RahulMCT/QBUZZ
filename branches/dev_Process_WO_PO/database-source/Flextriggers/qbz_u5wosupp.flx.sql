-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5wosupp.flx.sql
--
-- Description : flexes on u5wosupp
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_u5wosupp.flx.sql
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('U5WOSUPP',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON
--System date should be populated on Date
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'U5WOSUPP' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 24;
sstmt :=
'BEGIN
  FOR C IN (SELECT ou_line,ou_wo,ou_act
            FROM u5wosupp
            WHERE ROWID = :ROWID
            AND ou_date IS NULL) LOOP
    UPDATE u5wosupp
    SET ou_date = SYSDATE
    WHERE ou_line = c.ou_line
    AND ou_wo     = c.ou_wo
    AND ou_act    = c.ou_act;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('U5WOSUPP','POST-UPDATE',24,'+','-'
    ,'+','U5WOSUPP, Post Update, 24','System date should be populated on Date field','-',0,'-',sysdate,sstmt);
END;
/
 
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_u5wosupp.flx.sql
PROMPT