-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : uds_installer.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC  - Creation
-- -------------------------------------------------------------------------------

SPOOL uds_installer.log

SET SERVEROUT ON
SET TIMING ON
SET VERIFY OFF
SET SQLBLANKLINES ON
SET HEADING OFF
SET DEFINE OFF;

BEGIN
  DBMS_OUTPUT.ENABLE (buffer_size => NULL);
END;
/

PROMPT ...Start of uds_installer.sql
PROMPT  ...Creating Procedure qbz_o7custom

CREATE OR REPLACE PROCEDURE qbz_o7custom
                          ( pv_objects IN VARCHAR2,
                            pv_date    IN VARCHAR2,
                            pv_title   IN VARCHAR2,
                            pv_desc    IN VARCHAR2) IS
lv_count  NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO lv_count
  FROM   r5custom
  WHERE  cus_objects   = UPPER(SUBSTR(pv_objects,1,30))
  AND    cus_title     = pv_title
  AND    cus_date      = TO_DATE(pv_date,'dd-mm-yyyy');

  IF lv_count = 0 THEN
    INSERT INTO r5custom( cus_date, cus_applied, cus_title, cus_objects, cus_desc)
    VALUES              ( TO_DATE(pv_date,'dd-mm-yyyy'), SYSDATE, pv_title, UPPER(SUBSTR(pv_objects,1,30)), SUBSTR(pv_desc,1,100));
  END IF;

END qbz_o7custom;
/
SHOW ERRORS PROCEDURE qbz_o7custom
PROMPT

PROMPT ...Created Procedure qbz_o7custom
PROMPT ...Creating User defined screen: KUPRCS

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'KUPRCS';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'KUPRCS';

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('KUPRCS','Screen 1 to Process Records - Transactions','R5PROCESS','-',NULL,'-','-',sysdate,'R5',NULL,'-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT... Creating Fields for User defined screen: KUPRCS
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_ID','Record ID',1,30,NULL,NULL,'Record ID','TEXTFIELD','+','-','-',NULL,NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_SCREEN','Screen Code',2,20,NULL,NULL,'Screen Code','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_STATUS','Status',3,30,NULL,NULL,'Status','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_OBJECT','DB Object',4,100,NULL,NULL,'DB Object','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM1','Parameter 1',5,80,NULL,NULL,'Parameter 1','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM2','Parameter 2',6,80,NULL,NULL,'Parameter 2','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM3','Parameter 3',7,80,NULL,NULL,'Parameter 3','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM4','Parameter 4',8,80,NULL,NULL,'Parameter 4','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM5','Parameter 5',9,80,NULL,NULL,'Parameter 5','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM6','Parameter 6',10,80,NULL,NULL,'Parameter 6','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM7','Parameter 7',11,80,NULL,NULL,'Parameter 7','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM8','Parameter 8',12,80,NULL,NULL,'Parameter 8','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM9','Parameter 9',13,80,NULL,NULL,'Parameter 9','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_PARAM10','Parameter 10',14,80,NULL,NULL,'Parameter 10','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_OUT1','Output Parameter 1',15,80,NULL,NULL,'Output Parameter 1','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_OUT2','Output Parameter 2',16,80,NULL,NULL,'Output Parameter 2','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_OUT3','Output Parameter 3',17,80,NULL,NULL,'Output Parameter 3','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_USERMESSAGE','Message for User',18,80,NULL,NULL,'User Message','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('KUPRCS','PRS_MESSAGE','Message after processing',19,255,NULL,NULL,'Message after processing','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:KUPRCS

COMMIT;


PROMPT ...Creating User defined screen: WUJOBO

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'WUJOBO';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'WUJOBO';

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
SELECT 'SUPWUOM','Part UOM','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPWUOM');

UPDATE r5queries
SET que_text = 'select d.des_code,d.des_text from   r5descriptions d, r5uoms u
where  d.des_code = u.uom_code
and u.uom_notused = ''-''
and d.des_rentity = ''UOM'''
WHERE que_code = 'SUPWUOM';

PROMPT ...End of Queries

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('WUJOBO','Supplier Book Hours and Materials','WOSUPP','+','WSJOBO','-','-',sysdate,'R5',NULL,'-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: WUJOBO
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_LINE','Line No',1,NULL,8,0,'Lijn nummer','NUMERICFIELD','+','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_WO','WO Num',2,30,NULL,NULL,'WO nummer','TEXTFIELD','+','-','-','workordernum',NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_ACT','Activity',3,NULL,8,0,'Activiteit','NUMERICFIELD','+','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTS','Parts',4,50,NULL,NULL,'Artikelen','TEXTFIELD','-','-','+',NULL,NULL,'SUPPART',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_UOI','Unit of Issue',5,30,NULL,NULL,'Eenheid','TEXTFIELD','-','-','+',NULL,'OU_PARTS',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPUOM','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_QTY','Qunatity',6,NULL,24,6,'Hoeveelheid','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_CATPRICE','Catalogue Price',7,NULL,24,6,'Catalogus waarde','NUMERICFIELD','-','-','+',NULL,'OU_PARTS',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPGPRC','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_DATE','Date',8,NULL,NULL,NULL,'Datum','DATETIMEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_TRADE','Trade',9,15,NULL,NULL,'Vakgroep','TEXTFIELD','-','-','+',NULL,'OU_ACT',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPTRAD','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_HRS','No. of Hrs',10,NULL,24,0,'Aantal uren','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_DATE1','Date1',11,NULL,NULL,NULL,'Datum','DATETIMEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_AMT','Amount',12,NULL,24,6,'Hoeveelheid','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_DATE2','Date2',13,NULL,NULL,NULL,'Datum','DATETIMEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_TOH','Type of Hours',14,4,NULL,NULL,'Type uren','TEXTFIELD','-','-','+',NULL,NULL,'SUPTHR',NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PRICEP','Price per Hour',15,NULL,8,2,'Prijs per uur','NUMERICFIELD','-','-','+',NULL,'OU_TOH',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPRATE','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTNO','Part NO',16,30,NULL,NULL,'Artikel nummer','TEXTFIELD','-','-','+',NULL,'OU_PARTS',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPPARC','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_COMMENT','Comments',17,NULL,NULL,NULL,'Comments','TEXTAREAFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTDESC','Description',18,80,NULL,NULL,'Description','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTUOM','UOM',19,30,NULL,NULL,'Unit of Issue','TEXTFIELD','-','-','+',NULL,NULL,'SUPWUOM',NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTPRICE','Part Price',20,NULL,24,6,'Price','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_CATALOGUE','Catalogue Reference No',21,50,NULL,NULL,'Catalogue Reference No','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_OTHERS','Part Not Exist',22,1,NULL,NULL,'Part Not Exist','CHECKBOX','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_PARTQTY','Qunatity',23,NULL,24,6,'Qunatity','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_WARRANTY','Warranty',24,1,NULL,NULL,'Warranty','CHECKBOX','-','-','+',NULL,'OU_ACT',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPWARP','-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('WUJOBO','OU_WARRANTYPARTS','Warranty Parts',25,1,NULL,NULL,'Warranty Parts','CHECKBOX','-','-','+',NULL,'OU_ACT',NULL,NULL,'-',SYSDATE,'R5',0,'-','SUPWARP','-',sysdate);

PROMPT ...End of User defined screen:WUJOBO

COMMIT;


PROMPT ...Creating User defined screen: OUWOCF

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'OUWOCF';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'OUWOCF';

PROMPT ...Queries for User defined screen: OUWOCF

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCORG','Organization','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCORG');

UPDATE r5queries
SET que_text = 'select org_code Code, org_desc Description from r5organization where org_common = ''-'''
WHERE que_code = 'WOCORG';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCSUP','Supplier','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCSUP');

UPDATE r5queries
SET que_text = 'SELECT com_code,com_desc,com_org FROM r5companies
WHERE com_udfchkbox02 = ''+'''
WHERE que_code = 'WOCSUP';

PROMPT ...End of Queries

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('OUWOCF','Work Order Control','WOCONT','-',NULL,'-','-',sysdate,'R5','CNT','-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: OUWOCF
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','DESCRIPTION','Description',1,80,NULL,NULL,'Description','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'+',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_SEQ','Sequence No',2,30,NULL,NULL,'Reeks nummer','TEXTFIELD','+','-','-',NULL,NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_ORG','Organization',3,30,NULL,NULL,'Organisatie','TEXTFIELD','-','-','-',NULL,NULL,'WOCORG',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_VEN','Vendor',4,30,NULL,NULL,'Onderhoudspartij','TEXTFIELD','-','-','-',NULL,NULL,'WOCSUP',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_STATUS','Status',5,30,NULL,NULL,'Status','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_STADESC','Status Desc',6,80,NULL,NULL,'Status Omschrijving','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_DATEGEN','PO Date Generated',7,NULL,NULL,NULL,'IO datum gegenereerd','DATETIMEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_WCCREATEDBY','Created By',9,255,NULL,NULL,'Aangemaakt door','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_WCCREATED','Date Created',10,NULL,NULL,NULL,'Datum aangemaakt','DATETIMEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_POCREATEDBY','PO Generated By',11,255,NULL,NULL,'IO gegenereerd door','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUWOCF','CTL_PO','Purchase Order',12,30,NULL,NULL,'Inkoop order','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:OUWOCF

COMMIT;

PROMPT ...Creating User defined screen: OUSUTR

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'OUSUTR';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'OUSUTR';

PROMPT ...Queries for User defined screen: OUSUTR

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'MOBMRCS','MOBMRCS','1=1','-','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'MOBMRCS');

UPDATE r5queries
SET que_text = 'select mrc_code, mrc_desc, mrc_org from r5mrcs
'
WHERE que_code = 'MOBMRCS';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SGD00083','SGD00083','1=1',NULL,'-','-','-',NULL,'-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SGD00083');

UPDATE r5queries
SET que_text = 'select uco_code,  nvl(des_text, uco_desc) uco_desc    
from   r5descriptions,
       r5ucodes
where  uco_rentity  = ''OCTP''
and    des_lang (+) = ''planguage''
and    des_code (+) = uco_code
and    des_rentity (+) = ''UCOD''
and    des_rtype (+) = ''OCTP''
order by uco_desc'
WHERE que_code = 'SGD00083';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'TRASUPP','Trade Supplier','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'TRASUPP');

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

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCORG','Organization','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCORG');

UPDATE r5queries
SET que_text = 'select org_code Code, org_desc Description from r5organization where org_common = ''-'''
WHERE que_code = 'WOCORG';

PROMPT ...End of Queries

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('OUSUTR','Supplier Trade Rates','SUPPRATE','+','WSTRAD','-','-',sysdate,'R5',NULL,'-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: OUSUTR
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_TRADE','Trade',1,30,NULL,NULL,'Trade','TEXTFIELD','+','-','-','tradecode',NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_ORG','Organization',2,15,NULL,NULL,'Organization','TEXTFIELD','+','-','-',NULL,NULL,'WOCORG',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_VEN','Supplier',3,30,NULL,NULL,'Supplier','TEXTFIELD','+','-','-',NULL,NULL,'TRASUPP',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_MRC','Department',4,15,NULL,NULL,'Department','TEXTFIELD','+','-','-',NULL,NULL,'MOBMRCS',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_TOH','Type of hours',5,4,NULL,NULL,'Type of hours','TEXTFIELD','+','-','-',NULL,NULL,'SGD00083',NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_RATE','Hourly Rate',6,NULL,8,2,'Hourly Rate','NUMERICFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_START','Start Date',7,NULL,NULL,NULL,'Start Date','DATEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_END','End Date',8,NULL,NULL,NULL,'End Date','DATEFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSUTR','SUP_CURR','Currency',9,3,NULL,NULL,'Currency','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:OUSUTR

COMMIT;

PROMPT ...Begin of qbz_uds_oucost.sql

PROMPT ...Creating User defined screen: OUCOST

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'OUCOST';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'OUCOST';

PROMPT ...Queries for User defined screen: OUCOST

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'COSCOST','Cost Code','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'COSCOST');

UPDATE r5queries
SET que_text = 'select d.des_code,d.des_text
from   r5descriptions d, r5costcodes c
where  c.cst_code = d.des_code
and NVL( c.cst_notused, ''-'' ) = ''-''
and d.des_rentity = ''CSTC''
and    d.des_lang = ''EN'''
WHERE que_code = 'COSCOST';

PROMPT ...End of Queries

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('OUCOST','Additional Costs','DMCOST','+','SCHADE','-','-',sysdate,'R5',NULL,'-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: OUCOST
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_CASE','Case',1,30,NULL,NULL,'Case','TEXTFIELD','+','-','-','casecode',NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_LINE','Line No',2,NULL,8,0,'Line No','NUMERICFIELD','+','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_AFAS','AFAS No.',3,80,NULL,NULL,'AFAS No.','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_DATE','Date',4,NULL,NULL,NULL,'Date','DATEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_COSTDESC','Description',5,80,NULL,NULL,'Description','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_COSTCODE','Cost Code',6,30,NULL,NULL,'Cost Code','TEXTFIELD','-','-','-',NULL,NULL,'COSCOST',NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_COST','Cost',7,NULL,24,6,'Cost','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_TOTALCOST','Total Cost',8,NULL,24,6,'Total Cost','NUMERICFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_WO','Work Order Exists?',9,1,NULL,NULL,'Work Order Exists?','CHECKBOX','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUCOST','COS_COSTCODEDESC','Cost Code Description',10,80,NULL,NULL,'Cost Code Description','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:OUCOST

COMMIT;

PROMPT ...Creating User defined screen: OUGNPO

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'OUGNPO';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'OUGNPO';

PROMPT ...Queries for User defined screen: OUGNPO

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCORG','Organization','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCORG');

UPDATE r5queries
SET que_text = 'select org_code Code, org_desc Description from r5organization where org_common = ''-'''
WHERE que_code = 'WOCORG';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'WOCSUP','Supplier','1=1','+','+','-','-','+','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'WOCSUP');

UPDATE r5queries
SET que_text = 'SELECT com_code,com_desc,com_org FROM r5companies
WHERE com_udfchkbox02 = ''+'''
WHERE que_code = 'WOCSUP';

PROMPT ...End of Queries

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('OUGNPO','Generate Purchase Order','OUPORD','-',NULL,'-','-',sysdate,'R5',NULL,'-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: OUGNPO
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_SEQ','Sequence No',1,30,NULL,NULL,'Sequence No','TEXTFIELD','+','-','-',NULL,NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_ORG','Organization',2,30,NULL,NULL,'Organization','TEXTFIELD','-','-','-',NULL,NULL,'WOCORG',NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_VEN','Supplier',3,30,NULL,NULL,'Supplier','TEXTFIELD','-','-','-',NULL,NULL,'WOCSUP',NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_PO','PO Num',4,30,NULL,NULL,'PO Num','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_GENBY','PO Generated By',5,255,NULL,NULL,'PO Generated By','TEXTFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUGNPO','POR_DATE','PO Generated Date',6,NULL,NULL,NULL,'PO Generated Date','DATEFIELD','-','-','+',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:OUGNPO

COMMIT;

PROMPT ...Begin of qbz_uds_oustat.sql

PROMPT ...Creating User defined screen: OUSTAT

--DELETE FROM r5udfscreenfields WHERE usf_screenname = 'OUSTAT';
--DELETE FROM r5udfscreens WHERE usc_screenname = 'OUSTAT';

INSERT INTO r5udfscreens(usc_screenname,usc_desc,usc_tablename,usc_istab,usc_parentscreen,usc_generated,usc_notused,usc_created,usc_createdby,usc_entity,usc_allowcomments,usc_allowdocuments,usc_typeentity,usc_statusentity,usc_class,usc_orgsecurity,usc_updatecount,usc_autogeneratekey,usc_lastsaved)
VALUES ('OUSTAT','Work Order Control Status Authorization','OUSTATUS','-',NULL,'-','-',sysdate,'R5','STA','-','-',NULL,NULL,'-','-',0,'-',sysdate);

PROMPT ... Creating Fields for User defined screen: OUSTAT
INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','DESCRIPTION','Description',1,80,NULL,NULL,'Description','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'+',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_CODE','Code',2,30,NULL,NULL,'Code','TEXTFIELD','+','-','-',NULL,NULL,NULL,NULL,'+',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_UG','User Group',3,30,NULL,NULL,'Gebruikersgroep','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_ENTITY','Entity',4,30,NULL,NULL,'Entiteit','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_FROMSTATUS','From Status',5,30,NULL,NULL,'Van Status','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_TOSTATUS','To Status',6,30,NULL,NULL,'Naar Status','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_FROMSTATUSDESC','Description',7,80,NULL,NULL,'Omschrijving','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_TOSTATUSDESC','Description',8,80,NULL,NULL,'Omschrijving','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

INSERT INTO r5udfscreenfields(usf_screenname,usf_fieldname,usf_desc,usf_sequence,usf_maxlength,usf_precision,usf_scale,usf_fieldlabel,usf_fieldtype,usf_primary,usf_notused,usf_nullable,usf_parentfield,usf_lookupsource,usf_lookupquery,usf_computeddata,usf_uppercase,usf_created,usf_createdby,usf_updatecount,usf_generated,usf_retrievedvaluelookup,usf_droppdown,usf_lastsaved)
VALUES('OUSTAT','STA_USER','User',9,30,NULL,NULL,'Gebruiker','TEXTFIELD','-','-','-',NULL,NULL,NULL,NULL,'-',SYSDATE,'R5',0,'-',NULL,'-',sysdate);

PROMPT ...End of User defined screen:OUSTAT

COMMIT;

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'uds_installer.sql', '12-04-2023', 'QBZ-EAM 11.7', 'uds installer');

COMMIT;

PROMPT ...END of uds_installer.log

SPOOL OFF