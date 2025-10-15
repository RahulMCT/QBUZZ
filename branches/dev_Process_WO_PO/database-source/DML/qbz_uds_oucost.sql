-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_oucost.sql
--
-- Description : Create Additional Costs User Defined Screen Queries
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 28-11-2022  - MCT - SPC295  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_oucost.sql

PROMPT ...Queries for User defined screen: OUCOST

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'COSCOST','Cost Code','1=1','+','+','-','-','+','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'COSCOST');

UPDATE r5queries
SET que_text = 'select d.des_code,d.des_text
from   r5descriptions d, r5costcodes c
where  c.cst_code = d.des_code
and NVL( c.cst_notused, ''-'' ) = ''-''
and d.des_rentity = ''CSTC''
and    d.des_lang = ''EN'''
WHERE que_code = 'COSCOST';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'CASEACOS','Total Cost','1=1','+','+','-','-','-','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'CASEACOS');

UPDATE r5queries
SET que_text = 'SELECT (o7cost.tools2(csm_workorder)+o7cost.material2(csm_workorder)+o7cost.labour2(csm_workorder))
FROM r5casemanagement
WHERE csm_code = :1'
WHERE que_code = 'CASEACOS';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'CASEADCC','Additional Cost - Cost Code based on Problem Code','1=1','+','+','-','-','-','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'CASEADCC');

UPDATE r5queries
SET que_text = 'SELECT CASE WHEN csm_problem like ''%BS%'' THEN ''4408''
            WHEN csm_problem like ''%RA%'' THEN ''4409''
            ELSE ''4405''
       END cc
FROM r5casemanagement
WHERE csm_code = :1'
WHERE que_code = 'CASEADCC';

PROMPT ...End of Queries
COMMIT;

PROMPT ...END of qbz_uds_oucost.sql

