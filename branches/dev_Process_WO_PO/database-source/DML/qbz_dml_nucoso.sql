-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_nucoso.sql
--
-- Description : DML entries related to Overview screen
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 05-07-2023  - MCT - SPC364  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_dml_nucoso.sql
PROMPT

UPDATE r5ddfield SET ddf_sourcename = 'QBZ_SUMCSTCOST(CSM_CODE)+(CASE WHEN EVT_STATUS <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+O7COST.LABOUR2(CSM_WORKORDER)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)'
WHERE ddf_tablename = 'R5CASEMANAGEMENT' 
AND UPPER(ddf_sourcename) = 'QBZ_SUMCSTCOST(CSM_CODE)+(O7COST.MATERIAL2(CSM_WORKORDER)+O7COST.LABOUR2(CSM_WORKORDER)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0))';


COMMIT;

PROMPT ...END of qbz_dml_nucoso.sql
PROMPT