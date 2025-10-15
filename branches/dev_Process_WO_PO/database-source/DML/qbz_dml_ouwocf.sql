-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_ouwocf.sql
--
-- Description : DML entries related to environment setup
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 30-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Start of qbz_dml_ouwocf.sql
PROMPT

PROMPT ...Updating Dataspy user filter
PROMPT

UPDATE r5dddataspy SET dds_userfilter = '(EXISTS   (SELECT 1 from r5users where usr_code =:MP5USER and usr_supplier IS NULL)
OR EXISTS (SELECT 1 from r5users where usr_code = :MP5USER and usr_supplier = ctl_ven))' 
WHERE dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid where grd_gridname = 'OUWOCF');

--Hyperlink in new tab
INSERT INTO r5hyperlink(hyp_sourcepagename,hyp_sourceelementid,hyp_destpagename,hyp_destelementid,hyp_screenmode,hyp_updatecount,hyp_srclinenumber,hyp_linkname,hyp_dataspy)
SELECT 'OUWOCF_XWO','xwo_evtcode','WSJOBO','','Q',0,10,'Work Order',
(SELECT dds_ddspyid FROM r5dddataspy WHERE dds_gridid = (SELECT grd_gridid FROM r5grid WHERE grd_gridname = 'WSJOBO') AND dds_ddspyname = 'All Work Orders (EE)' AND dds_globaldataspy = '+')
FROM dual
WHERE NOT EXISTS(SELECT 1 FROM r5hyperlink
                 WHERE hyp_sourcepagename = 'OUWOCF_XWO'
                 AND hyp_sourceelementid  = 'xwo_evtcode'
                 AND hyp_destpagename     = 'WSJOBO');
COMMIT;

PROMPT ...End of qbz_dml_ouwocf.sql
PROMPT