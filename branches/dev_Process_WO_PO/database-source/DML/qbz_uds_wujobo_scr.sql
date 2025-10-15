-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_wujobo.sql
--
-- Description : Create Supplier Book Hours and Materials User Defined Screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_wujobo.sql

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

set heading off
set pages 0
set feedback off
set termout off

SPOOL OFF
SPOOL qbz_pause.sql REPLACE

PROMPT ...END of qbz_uds_wujobo.sql

