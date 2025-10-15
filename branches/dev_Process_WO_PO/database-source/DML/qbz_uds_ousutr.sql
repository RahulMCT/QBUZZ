-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_ousutr.sql
--
-- Description : Create Supplier Trade Rates User Defined Screen Queries
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 27-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_ousutr.sql

PROMPT ...Queries for User defined screen: OUSUTR

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'TRASUPP','Trade Supplier','1=1','+','+','-','-','+','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'TRASUPP');

UPDATE r5queries
SET que_text = 'SELECT  d.des_code userdefinedfieldvalue,d.des_text description
FROM r5descriptions d, r5entities, r5userorganization u
WHERE d.des_rentity = ent_rentity
AND   ent_multilang = ''-''
AND   d.des_rentity =  ''COMP''
AND   u.uog_user = :MP5USER
AND   u.uog_role = :MP5ROLE
AND   u.uog_org     = d.des_org
order by d.des_code ASC'
WHERE que_code = 'TRASUPP';

PROMPT ...End of Queries
COMMIT;

PROMPT ...END of qbz_uds_ousutr.sql

