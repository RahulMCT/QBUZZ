-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_queries.sql
--
-- Description : DML entries related to environment setup
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_queries.sql
PROMPT

PROMPT ...Querie for Start Center

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'QBZ001','Inbox for WO''s','1=1','+','-','+','-','-','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'QBZ001');

UPDATE r5queries
SET que_text = 'SELECT COUNT(DISTINCT(evt_code))
FROM r5events, r5userorganization
WHERE evt_status = ''W''
AND evt_jobtype in (''SCH'', ''STO'')
AND uog_org=evt_org
AND uog_group=:MP5GROUP
AND (EXISTS   (SELECT 1 FROM r5users WHERE usr_code =:MP5USER AND usr_supplier IS NULL)
OR EXISTS (SELECT 1 FROM r5users WHERE usr_code = :MP5USER AND usr_supplier = evt_udfchar19))'
WHERE que_code = 'QBZ001';

INSERT INTO R5HOME (hom_code, hom_type, hom_desc, hom_sqlcode, hom_gen, 
                    hom_parent, hom_history, hom_whereclause, hom_updatecount, hom_ewsfunction, 
                    hom_notused, hom_udfchkbox01, hom_udfchkbox02, hom_udfchkbox03, hom_udfchkbox04, 
                    hom_udfchkbox05)
SELECT 'WO-STATUSW', '-', ' Work order records', 'QBZ001', '+', 
       '-', '-', '1=1', 0, 'WSJOBO', 
       '-', '-', '-', '-', '-', 
       '-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM R5HOME WHERE hom_code = 'WO-STATUSW');
UPDATE R5HOME SET hom_whereclause = 'evt_status = ''W''
AND evt_jobtype in (''SCH'', ''STO'')'
WHERE hom_code = 'WO-STATUSW';

COMMIT;
PROMPT ...End of Queries
PROMPT