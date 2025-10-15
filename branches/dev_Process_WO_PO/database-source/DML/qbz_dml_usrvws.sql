-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_usrvws.sql
--
-- Description : DML entries related to environment setup
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 22-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Start of qbz_dml_usrvws.sql
PROMPT

Insert into r5userviews (uvw_code, uvw_desc, uvw_name, uvw_stmt, uvw_active, uvw_updatecount, uvw_lastsaved)
SELECT 'U5SEQWOCONT', 'Sequence for table WOCONT', 'U5SEQWOCONT', '1=1', '-', 0, SYSDATE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM R5USERVIEWS WHERE uvw_code = 'U5SEQWOCONT');

UPDATE r5userviews SET uvw_stmt ='SELECT nvl((SELECT max(ctl_seq) + 1 FROM U5WOCONT), 1) AS nextseq FROM DUAL' WHERE uvw_code = 'U5SEQWOCONT';

COMMIT;

PROMPT ...End of qbz_dml_usrvws.sql
PROMPT