-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_kuprcs.sql
--
-- Description : Create Screen to process records using User Defined Screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 24-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_kuprcs.sql

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

set heading off
set pages 0
set feedback off
set termout off

SPOOL OFF

PROMPT ...End of qbz_uds_kuprcs.sql
