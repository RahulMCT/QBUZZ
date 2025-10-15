-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_dml_schade.sql
--
-- Description : DML entries related to column data changed
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 20-06-2023  - MCT - SPC364  - Creation
-- 0001 20-06-2023  - MCT - SPC369  - column data changed
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_dml_schade.sql
PROMPT

UPDATE r5casemanagement SET CSM_UDFNUM05 = TO_NUMBER(CSM_UDFCHAR19),CSM_UDFCHAR19 = NULL 
WHERE CSM_UDFCHAR19 IS NOT NULL;

UPDATE r5casemanagement SET csm_udfchar28 = csm_problem,csm_problem = NULL
WHERE csm_problem IS NOT NULL;
COMMIT;

PROMPT ...END of qbz_dml_schade.sql
PROMPT