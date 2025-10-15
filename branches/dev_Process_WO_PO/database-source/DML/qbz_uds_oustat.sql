-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_oustat.sql
--
-- Description : Create Work Order Control Status Authorization User Defined Screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

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

set heading off
set pages 0
set feedback off
set termout off

SPOOL OFF
SPOOL qbz_pause.sql REPLACE

PROMPT ...END of qbz_uds_oustat.sql

