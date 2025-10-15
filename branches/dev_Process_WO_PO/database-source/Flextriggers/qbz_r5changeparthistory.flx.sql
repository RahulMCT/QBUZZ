-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5changeparthistory.flx.sql
--
-- Description : flexes on r5changeparthistory
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 29-07-2024  - MCT - SPC561 - Purchase order generation failed due to missing item number
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_r5changeparthistory.flx.sql
PROMPT
DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5CHANGEPARTHISTORY',vaction);
END;
/
COMMIT;
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CHANGEPARTHISTORY' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 10;
sstmt :=
'BEGIN
  FOR i IN (SELECT cph_topart,cph_frompart
            FROM r5changeparthistory
            JOIN r5parts ON(par_code = cph_topart AND par_org = cph_topart_org)
            WHERE r5changeparthistory.ROWID = :ROWID)
  LOOP
    UPDATE u5wosupp
    SET ou_partno   = i.cph_topart
    WHERE ou_partno = i.cph_frompart;
  END LOOP; 
END;'
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CHANGEPARTHISTORY','POST-UPDATE',10,'+','-'
    ,'+','R5CHANGEPARTHISTORY, Post Update, 10','Update Part No on UDS which is equal to part code of Parts screen','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;

PROMPT ...End of qbz_r5changeparthistory.flx.sql
PROMPT
