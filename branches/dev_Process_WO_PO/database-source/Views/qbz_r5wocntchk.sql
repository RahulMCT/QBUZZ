-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_r5wocntchk.sql
--
-- Description : View for Work order check tab grid on work order control screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 28-09-2022 - MCT - SPC266 - New View for Work order check tab grid on work order control screen
-- -------------------------------------------------------------------------------
PROMPT ...Begin of qbz_r5wocntchk.sql
PROMPT

PROMPT ...Creating View R5WOCNTCHK
CREATE OR REPLACE FORCE VIEW R5WOCNTCHK
(
   EVT_CODE
  ,EVT_ORG
  ,EVT_DESC
  ,EVT_OBJECT
  ,EVT_OBJECT_ORG
  ,EVT_UDFCHAR19
  ,EVT_UDFCHAR23
  ,OBJ_ALIAS
  ,EVT_UDFDATE09
  ,MAT_COST
  ,COST_HOURS
  ,FIXED_COST
  ,TOTAL_COST
  ,EVT_UDFCHKBOX02
  ,EVT_STATUS
  ,EVT_JOBTYPE
  ,EVT_WARRANTY
  ,EVT_UDFCHAR40
)
AS

SELECT EVT_CODE
,EVT_ORG
,EVT_DESC
,EVT_OBJECT
,EVT_OBJECT_ORG
,EVT_UDFCHAR19
,EVT_UDFCHAR23
,OBJ_ALIAS
,EVT_UDFDATE09
,SUM((NVL (ou_qty,0) * NVL (ou_catprice,0)) + (NVL (ou_partqty,0) * NVL (ou_partprice,0)))                                                  MAT_COST
,SUM((NVL (ou_hrs,0) * NVL (ou_pricep,0)))                                                                                                  COST_HOURS
,SUM(NVL(OU_AMT,0))                                                                                                                         FIXED_COST
,SUM((NVL(ou_qty,0) * NVL (ou_catprice,0))+(NVL(ou_hrs,0) * NVL (ou_pricep,0))+ NVL(OU_AMT,0)+ (NVL (ou_partqty,0) * NVL (ou_partprice,0))) TOTAL_COST
,EVT_UDFCHKBOX02
,EVT_STATUS
,EVT_JOBTYPE
,EVT_WARRANTY
,evt_udfchar40
FROM r5events
JOIN r5objects ON (obj_code = evt_object AND obj_org = evt_object_org)
JOIN u5wosupp  ON (evt_code = ou_wo)
--WHERE evt_jobtype <> 'SCH'
GROUP BY evt_code,evt_org,evt_desc,evt_object,evt_object_org,evt_udfchar19,evt_udfchar23,obj_alias,evt_udfdate09,evt_udfchkbox02,evt_status,evt_jobtype,evt_warranty,evt_udfchar40

/

PROMPT ...Created View qbz_r5wocntchk.sql
PROMPT

PROMPT ...End of qbz_r5wocntchk.sql
PROMPT