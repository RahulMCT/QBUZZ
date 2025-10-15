-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_wujobo.sql
--
-- Description : Create Supplier Book Hours and Materials User Defined Screen Queries
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_wujobo.sql

PROMPT ...Queries for User defined screen: WUJOBO

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPGPRC','Gross Price','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPGPRC');

UPDATE r5queries
SET que_text = 'SELECT cat_gross
FROM r5catalogue c,r5parts p ,r5events e
WHERE c.cat_ref        = :4
AND   e.evt_Code       = :2
AND   p.par_code       = c.cat_part
AND   p.par_org        = c.cat_part_org
AND   c.cat_supplier   = e.evt_udfchar19
UNION
SELECT NULL FROM dual WHERE :4 IS NULL '
WHERE que_code = 'SUPGPRC';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPPARC','Part code','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPPARC');

UPDATE r5queries
SET que_text = 'SELECT par_code
FROM r5catalogue c,r5parts p ,r5events e
WHERE cat_ref          = :4
AND   evt_Code         = :2
AND   p.par_code       = c.cat_part
AND   cat_supplier     = e.evt_udfchar19
AND   p.par_org        = c.cat_part_org
UNION
SELECT NULL FROM dual WHERE :4 IS NULL'
WHERE que_code = 'SUPPARC';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPPART','Part Lookup','1=1','+','-','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPPART');

UPDATE r5queries
SET que_text = 'SELECT cat_ref CatRef,cat_desc Description,par_code Part,cat_gross Price,par_uom UOM
FROM r5catalogue c,r5parts p ,r5events e
WHERE p.par_code       = c.cat_part
AND   p.par_org        = c.cat_part_org
AND   c.cat_supplier   = e.evt_udfchar19
AND   e.evt_Code       = :2
AND   c.cat_ref IS NOT NULL'
WHERE que_code = 'SUPPART';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPRATE','Price Per Hour','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPRATE');

UPDATE r5queries
SET que_text = 'SELECT sup_rate
FROM u5supprate,r5events
WHERE sup_toh(+)       = :14
AND   evt_code         = :2
AND   sup_trade(+)     = :9
AND   sup_org(+)       = evt_org
AND   sup_ven(+)       = evt_udfchar19
AND   sup_mrc(+)       = evt_mrc'
WHERE que_code = 'SUPRATE';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPTHR','Type of hours','1=1','+','-','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPTHR');

UPDATE r5queries
SET que_text = 'SELECT d.des_code Type
FROM r5descriptions d, r5ucodes u WHERE d.des_rentity = ''UCOD''
AND d.des_rtype = ''OCTP''
AND d.des_code =u.uco_code
AND uco_rentity = ''OCTP''
AND COALESCE(uco_notused,''-'') = ''-''
AND d.des_lang = ''EN'''
WHERE que_code = 'SUPTHR';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPTRAD','Trade value','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPTRAD');

UPDATE r5queries
SET que_text = 'SELECT act_trade
FROM r5activities
WHERE act_event = :2
AND   act_act   = :3'
WHERE que_code = 'SUPTRAD';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPUOM','UOM Value','1=1','+','-','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPUOM');

UPDATE r5queries
SET que_text = 'SELECT par_uom
FROM r5catalogue c,r5parts p ,r5events e
WHERE e.evt_Code       = :2
AND   c.cat_ref        = :4
AND   p.par_code       = c.cat_part
AND   p.par_org        = c.cat_part_org
AND   c.cat_supplier   = e.evt_udfchar19
UNION
select NULL from dual where :4 IS NULL '
WHERE que_code = 'SUPUOM';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPWARP','Warranty Parts','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPWARP');

UPDATE r5queries
SET que_text = 'SELECT NVL((SELECT CASE WHEN act_udfchkbox03 = ''+'' THEN ''-1'' ELSE ''0'' END
            FROM r5activities
            WHERE act_event = :2
            AND   act_act   = :3),0) val
FROM dual'
WHERE que_code = 'SUPWARP';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPWARR','Warranty','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPWARR');

UPDATE r5queries
SET que_text = 'SELECT NVL((SELECT CASE WHEN act_warranty = ''+'' THEN ''-1'' ELSE ''0'' END
            FROM r5activities
            WHERE act_event = :2
            AND   act_act   = :3),0) val
FROM dual'
WHERE que_code = 'SUPWARR';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPWUOM','Part UOM','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPWUOM');

UPDATE r5queries
SET que_text = 'select d.des_code,d.des_text from   r5descriptions d, r5uoms u
where  d.des_code = u.uom_code
and u.uom_notused = ''-''
and d.des_rentity = ''UOM'''
WHERE que_code = 'SUPWUOM';

PROMPT ...End of Queries
COMMIT;

PROMPT ...END of qbz_uds_wujobo.sql