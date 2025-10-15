-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_ouwocf.sql
--
-- Description : Create Work Order Control User Defined Screen Queries
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 27-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_ouwocf.sql

PROMPT ...Queries for User defined screen: OUWOCF

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCORG','Organization','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCORG');

UPDATE r5queries
SET que_text = 'select org_code Code, org_desc Description from r5organization where org_common = ''-'''
WHERE que_code = 'WOCORG';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCSUP','Supplier','1=1','+','+','-','-','+','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCSUP');

UPDATE r5queries
SET que_text = 'SELECT com_code,com_desc,com_org 
FROM r5companies 
WHERE com_udfchkbox02 = ''+'''
WHERE que_code = 'WOCSUP';

PROMPT ...End of Queries
COMMIT;

PROMPT ...END of qbz_uds_ouwocf.sql

