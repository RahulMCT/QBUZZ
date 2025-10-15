-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_oustatus.sql
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
PROMPT ...Start of qbz_dml_oustatus.sql
PROMPT

--uds WCST records
INSERT INTO u5oustatus(description,sta_code,sta_ug,sta_entity,sta_fromstatus,sta_tostatus,sta_fromstatusdesc,sta_tostatusdesc,sta_user,createdby,created,updatedby,updated,lastsaved,updatecount)
SELECT 'VLOOT-MAN','10','VLOOT-MAN','$CNT','-','G','-','Gegenereerd','*','R5',sysdate,NULL,NULL,sysdate,0 FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5oustatus WHERE sta_code = '10');
INSERT INTO u5oustatus(description,sta_code,sta_ug,sta_entity,sta_fromstatus,sta_tostatus,sta_fromstatusdesc,sta_tostatusdesc,sta_user,createdby,created,updatedby,updated,lastsaved,updatecount)
SELECT 'SUPPLIER','20','SUPPLIER','$CNT','G','SC','Gegenereerd','Leverancier gecontroleerd','*','R5',sysdate,NULL,NULL,sysdate,0 FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5oustatus WHERE sta_code = '20');
INSERT INTO u5oustatus(description,sta_code,sta_ug,sta_entity,sta_fromstatus,sta_tostatus,sta_fromstatusdesc,sta_tostatusdesc,sta_user,createdby,created,updatedby,updated,lastsaved,updatecount)
SELECT 'VLOOT-MAN','30','VLOOT-MAN','$CNT','SC','WCC','Leverancier gecontroleerd','Controle afgerond','*','R5',sysdate,NULL,NULL,sysdate,0 FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5oustatus WHERE sta_code = '30');
INSERT INTO u5oustatus(description,sta_code,sta_ug,sta_entity,sta_fromstatus,sta_tostatus,sta_fromstatusdesc,sta_tostatusdesc,sta_user,createdby,created,updatedby,updated,lastsaved,updatecount)
SELECT 'Vloot Manager','40','VLOOT-MAN','$CNT','G','SC','Gegenereerd','Leverancier gecontroleerd','*','R5',sysdate,NULL,NULL,sysdate,0 FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5oustatus WHERE sta_code = '40');

COMMIT;

PROMPT ...End of qbz_dml_oustatus.sql
PROMPT