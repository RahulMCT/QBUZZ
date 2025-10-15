-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_ousutr.sql
--
-- Description : Create Supplier Trade Rates User Defined Screen
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_ousutr.sql

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

set heading off
set pages 0
set feedback off
set termout off

SPOOL OFF
SPOOL qbz_pause.sql REPLACE

PROMPT ...END of qbz_uds_ousutr.sql

