-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_wsjobo.sql
--
-- Description : DML entries related to environment setup
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Start of qbz_dml_wsjobo.sql
PROMPT

PROMPT ...Updating Dataspy user filter
PROMPT

UPDATE r5dddataspy SET dds_userfilter = '(EXISTS   (SELECT 1 from r5users where usr_code =:MP5USER and usr_supplier IS NULL)
OR EXISTS (SELECT 1 from r5users where usr_code = :MP5USER and usr_supplier = evt_udfchar19)
)' WHERE dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid where grd_gridname = 'WSJOBO');

UPDATE r5dddataspy SET dds_userfilter = '(EXISTS   (SELECT 1 FROM r5users WHERE usr_code =:MP5USER AND usr_group = ''SUPPLIER'' AND evt_udfchar19 IS NOT NULL AND act_trade = ''MO'')
OR EXISTS (SELECT 1 FROM r5users WHERE usr_code =:MP5USER AND usr_group <> ''SUPPLIER''))'
WHERE dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid where grd_gridname = 'WSJOBO_ACT');

---Case management screen hyperlink
INSERT INTO r5hyperlink(hyp_sourcepagename,hyp_sourceelementid,hyp_destpagename,hyp_destelementid,hyp_screenmode,hyp_updatecount,hyp_srclinenumber,hyp_linkname,hyp_dataspy)
SELECT 'WSJOBO_HDR','casecode','SCHADE','casecode','Q',0,1,'Case Management',
(SELECT dds_ddspyid FROM r5dddataspy WHERE dds_gridid = (SELECT grd_gridid FROM r5grid WHERE grd_gridname = 'SCHADE') AND dds_ddspyname = 'All Records' AND dds_globaldataspy = '+')
FROM dual
WHERE NOT EXISTS(SELECT 1 FROM r5hyperlink
                 WHERE hyp_sourcepagename = 'WSJOBO_HDR'
                 AND hyp_sourceelementid  = 'casecode'
                 AND hyp_destpagename     = 'SCHADE');

COMMIT;

PROMPT ...End of qbz_dml_wsjobo.sql
PROMPT