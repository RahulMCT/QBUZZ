-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_ouwocf.sql
--
-- Description : Create Work Order Control User Defined Screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_ouwocf.sql

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

set heading off
set pages 0
set feedback off
set termout off

SPOOL OFF
SPOOL qbz_pause.sql REPLACE

PROMPT ...END of qbz_uds_ouwocf.sql

