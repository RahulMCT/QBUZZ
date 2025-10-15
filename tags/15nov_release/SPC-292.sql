-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-292.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 10-11-2022  - MCT - SPC292  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-292.log

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

PROMPT ...Start of SPC-292.sql

PROMPT ...Delete all OUWOCF pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'OUWOCF';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_1','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_2','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_3','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_4','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_7','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','block_10_CF','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_dategen','F','Y','P','cont_12',2,1,1,70,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_month','F','Y','O','cont_3',1,1,1,50,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_org','F','Y','R','cont_13',1,1,1,90,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_po','F','Y','P','cont_12',1,1,1,60,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_pocreatedby','F','Y','O','cont_12',3,1,2,80,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_seq','F','Y','P','cont_1',1,1,1,10,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_stadesc','F','Y','P','cont_1',4,1,2,40,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_status','F','Y','P','cont_13',4,1,1,120,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_ven','F','Y','R','cont_1',3,1,1,30,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_wccreated','F','Y','P','cont_13',2,1,1,100,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_ctl_wccreatedby','F','Y','P','cont_13',3,1,1,110,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUWOCF','wspf_10_description','F','Y','R','cont_1',2,1,2,20,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'OUWOCF'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...Delete all OUGNPO pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'OUGNPO';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_1','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_2','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_3','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_4','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_7','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_CF','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_date','F','Y','P','cont_12',2,1,1,50,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_genby','F','Y','P','cont_12',3,1,2,60,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_org','F','Y','R','cont_2',2,1,1,20,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_po','F','Y','P','cont_12',1,1,1,40,'O','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_seq','F','Y','P','cont_2',1,1,1,10,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_ven','F','Y','R','cont_3',1,1,1,30,'R','-',0,'YY',NULL,NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'OUGNPO'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...Deleting flex
PROMPT
DELETE FROM r5flexsql 
WHERE flx_table = 'R5EVENTS' 
AND flx_trigger = 'POST-UPDATE' 
AND flx_seq IN (46,47);
COMMIT;

PROMPT ...Creating grid QUSEQP
PROMPT

DECLARE
  sFunction      VARCHAR(6) := 'QUSEQP';
  sGridid        VARCHAR(30);
  sDataspyid1    VARCHAR(30);
  sCheckresult   VARCHAR(4);
  sLang          VARCHAR(2);
  maxbotnum      VARCHAR(30);
  ddfield1       NUMBER(14);
  ddfield2       NUMBER(14);
  ddfield3       NUMBER(14);
  chk            VARCHAR(30);

BEGIN
  --delete if existing lookup
  DELETE FROM  r5queryfield
  WHERE dqf_ddspyid IN (SELECT dds_ddspyid
                        FROM   r5dddataspy
                        WHERE  dds_gridid IN (SELECT grd_gridid
                                              FROM   r5grid
                                              WHERE  grd_gridname = sFunction));
  DELETE FROM  r5usegridsysdefault    WHERE usd_gridid    IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5dddataspy            WHERE  dds_gridid   IN (SELECT  grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridfield            WHERE  gfd_gridid   IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridparam            WHERE gdp_gridid    IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5grid                 WHERE  grd_gridname = sFunction;
  DELETE FROM  r5boilertexts          WHERE  bot_function = sFunction;
  DELETE FROM  r5pagelayout           WHERE  plo_pagename = sFunction;
  DELETE FROM  r5defaultpagelayout    WHERE  pld_pagename = sFunction;
  DELETE FROM  r5extmenus             WHERE  emn_function = sFunction;
  DELETE FROM  r5permissions          WHERE  prm_function = sFunction;
  DELETE FROM  r5functions            WHERE  fun_code     = sFunction;
  --create function
  INSERT INTO r5functions (fun_code   ,fun_desc       ,fun_class     ,fun_subtype     ,fun_file
                          ,fun_delete ,fun_insert     ,fun_update    ,fun_select      ,fun_mekey
                          ,fun_auto   ,fun_background ,fun_dirsel    ,fun_system      ,fun_class_org
                          ,fun_lst    ,fun_hdr        ,fun_displayft ,fun_startupview ,fun_splitviewdisplay)
  VALUES(sFunction ,'Sequence for U5OUPORD'  ,'WEBD' ,'X'  ,'R5MENU'
        ,NULL      ,NULL            ,NULL   ,'?'    ,'YY'
        ,'D'       ,'-'             ,'-'    ,'+'    ,'*'
        ,'+'       ,'-'             ,'+'    ,NULL   ,'S');
  --create ddfield
  SELECT MIN(ddf_fieldid) INTO ddfield1 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER('nvl((SELECT max(to_number(por_seq)) + 1 FROM U5OUPORD), 1000)');
  IF ddfield1 IS NULL THEN
    r5o7.o7maxseq(ddfield1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES (ddfield1,'nvl((SELECT max(to_number(por_seq)) + 1 FROM U5OUPORD), 1000)','MIXVARCHAR',NULL);
  END IF;
  -- Finds sequence for Grid
  r5o7.o7maxseq (sGridid,'GRD',1,sCheckresult);
  --Creating Grid
  INSERT INTO r5grid(grd_desc               ,grd_gridid                 ,grd_basequery         ,grd_gridname             ,grd_keyfields
                    ,grd_filterablelist     ,grd_sortablelist           ,grd_displayablelist   ,grd_orgcolname           ,grd_basequery_multiorg
                    ,grd_keyfields_multiorg ,grd_filterable_multiorg    ,grd_sortable_multiorg ,grd_displayable_multiorg ,grd_botfunction
                    ,grd_updatecount        ,grd_portletflag            ,grd_secentity         ,grd_hints                ,grd_tab
                    ,grd_gridtype           ,grd_units                  ,grd_optimizeron       ,grd_distinct             ,grd_commitflag
                    ,grd_customfieldcode    ,grd_complex                ,grd_active            ,grd_noscreendesigner     ,grd_mobile
                    ,grd_updated            ,grd_gisdatafilter)
  VALUES('Sequence for U5OUPORD'
         ,sGridid
         ,'FROM DUAL WHERE 1=1'
         ,sFunction
         ,ddfield1
         ,ddfield1
         ,ddfield1
         ,ddfield1
         ,NULL,NULL,NULL,NULL,NULL,NULL
         ,sFunction,0,'-',NULL,NULL,'-',8,NULL,'+','-',NULL,NULL,'-','+','-','-',SYSDATE,'-');
  --creating Grid fields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_scriptevent,gfd_tagname,gfd_updatecount,gfd_tagparams,gfd_aggfunc,gfd_fieldtype,gfd_occurrence,gfd_dependent,gfd_secentity,gfd_headerlocation,gfd_updated) VALUES(ddfield1,sGridid,sFunction,4,'TEXT',NULL,'nextseq',0,NULL,NULL,'n',1,NULL,NULL,'n',SYSDATE);
  -- Finds sequence for Dataspy
  r5o7.o7maxseq (sDataspyid1 ,'DDS',1,sCheckresult);
  --creating Dataspy
  INSERT INTO r5dddataspy(dds_ddspyname,dds_ddspyid,dds_autorun,dds_scope,dds_organization,dds_updatestamp,dds_updatebyuser,dds_createdstamp,dds_updateable,dds_filterstrxml
  ,dds_sortstrxml,dds_fieldlist,dds_updatecount,dds_displayrow,dds_owner,dds_gridid,dds_type,dds_defaultflag,dds_fieldlist_portlet,dds_clientrows,dds_portletrows,dds_hints,dds_botname,dds_userfilter,dds_securitydataspy,dds_mekey,dds_updated,dds_ddspyfilter,dds_globaldataspy)
  VALUES('All Records', sDataspyid1,NULL,'-','*',NULL,NULL,NULL,NULL,'<FILTERABLE/>','<SORTABLE/>',NULL,0,NULL,'R5',sGridid,'SD','+',NULL,50,NULL,NULL,NULL, NULL,'-','YY',SYSDATE,NULL,'+');
  --creating Query fields
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid1, ddfield1, '100', 1, 0, 'LIST',SYSDATE);
  --creating Boiler texts
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,1,100,0,0,'EN','List View'            ,'TB',1,'LST'        ,'10000','+',NULL,'-');
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,2,100,0,0,'EN','Sequence for U5OUPORD','F',1,'UDG_HDRLABEL','10000','+',NULL,'-');
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,3,100,0,0,'EN','All Records'          ,'F',1,'DSNAME'      ,'10000','+',NULL,'-');

  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,4,100,0,0,'EN','NEXTSEQ'              ,'F',1,'NEXTSEQ'     ,'10000','+',NULL,'-');
END;
/
COMMIT;

PROMPT ...Created grid QUSEQP

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
,SUM((NVL (ou_qty,0) * NVL (ou_catprice,0)))                                                   MAT_COST
,SUM((NVL (ou_hrs,0) * NVL (ou_pricep,0)))                                                     COST_HOURS
,SUM(NVL(OU_AMT,0))                                                                            FIXED_COST
,SUM((NVL(ou_qty,0) * NVL (ou_catprice,0))+(NVL(ou_hrs,0) * NVL (ou_pricep,0))+ NVL(OU_AMT,0)) TOTAL_COST
,EVT_UDFCHKBOX02
,EVT_STATUS
,EVT_JOBTYPE
FROM r5events
JOIN r5objects ON (obj_code = evt_object AND obj_org = evt_object_org)
JOIN u5wosupp  ON (evt_code = ou_wo)
WHERE evt_jobtype <> 'SCH'
GROUP BY evt_code,evt_org,evt_desc,evt_object,evt_object_org,evt_udfchar19,evt_udfchar23,obj_alias,evt_udfdate09,evt_udfchkbox02,evt_status,evt_jobtype

/

PROMPT ...Created View qbz_r5wocntchk.sql
PROMPT

PROMPT  ...Creating Procedure QBZ_AUTOPO

CREATE OR REPLACE PROCEDURE QBZ_AUTOPO (p_sorg        IN VARCHAR2
                                       ,p_scode       IN VARCHAR2
                                       ,p_ssource     IN VARCHAR2)
AS
  --local Type
  type act_tbl     is table of u5wosupp.ou_act%TYPE;
  type catpar_tbl  is table of u5wosupp.ou_parts%TYPE;
  type uoi_tbl     is table of u5wosupp.ou_uoi%TYPE;
  type qty_tbl     is table of u5wosupp.ou_qty%TYPE;
  type cprice_tbl  is table of u5wosupp.ou_catprice%TYPE;
  type hrs_tbl     is table of u5wosupp.ou_hrs%TYPE;
  type amt_tbl     is table of u5wosupp.ou_amt%TYPE;
  type pphr_tbl    is table of u5wosupp.ou_pricep%TYPE;
  type part_tbl    is table of u5wosupp.ou_partno%TYPE;
  type trad_tbl    is table of u5wosupp.ou_trade%TYPE;
  type work_tbl    is table of u5wosupp.ou_wo%TYPE;
  type cmnts_tbl   is table of u5wosupp.ou_comment%TYPE;
  --local variables
  corlevent    r5orderlines.orl_event%type;
  cstore       r5orders.ord_store%type;
  corder       r5orders.ord_Code%type;
  nordline     r5orderlines.orl_ordline%type;
  ccuruser     r5users.usr_Code%type := NVL(o7sess.cur_user,'R5');
  dcurdate     DATE := TRUNC(o7gttime(p_sorg),'DD');
  nexch        r5orderlines.orl_exch%type;
  csupplier    r5events.evt_udfchar19%type;
  cevtdesc     r5events.evt_desc%type;
  cemp         r5personnel.per_code%type;
  cuser        r5users.usr_code%type;
  clang        r5users.usr_lang%type;
  cchk         VARCHAR2(3);
  nerrno       NUMBER := 0;
  cerrmsg      VARCHAR2(240);
  db_error     EXCEPTION;
  rcursor      SYS_REFCURSOR;
  c_rec        VARCHAR2(4000);
  cwocact      act_tbl;       --activity
  cwocpar      catpar_tbl;    --Cat_partno
  cwocuoi      uoi_tbl;       --UOI
  cwocqty      qty_tbl;       --QTY
  cwoccatprc   cprice_tbl;    --Cat price
  cwochrs      hrs_tbl;       --Hours
  cwocamt      amt_tbl;       --fixed price
  cwocprch     pphr_tbl;      --Price per hour
  cwocparn     part_tbl;      --PartNo
  cwoctrd      trad_tbl;      --Trade
  cwocwon      work_tbl;      --WO Number
  cwoccmn      cmnts_tbl;     --WO Number

  CURSOR WOSUPP(p_sevt VARCHAR2) IS
    SELECT evt_udfchar19,evt_desc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  --procedure called from WO
  IF p_ssource = 'WO' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
             ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
             ,ou_wo,ou_comment
             FROM r5events
             JOIN u5wosupp ON (ou_wo = evt_code)
             WHERE evt_code = '''||p_scode||'''
             AND NOT EXISTS(SELECT 1
                             FROM r5orderlines
                             WHERE orl_event = '''||p_scode||''')';
  ELSIF p_ssource = 'WOC' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
              ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
              ,ou_wo,ou_comment
              FROM u5oupord,r5events
              JOIN u5wosupp ON(ou_wo = evt_code)
              JOIN u5wocont ON(ctl_seq = evt_udfchar23 AND ctl_ven = evt_udfchar19)
              JOIN r5companies ON (com_code = evt_udfchar19)
              WHERE por_seq = '''||p_scode||'''
              AND evt_status IN (''TF'',''CA'')
              AND evt_jobtype  = ''STO''
              AND ctl_status = ''WCC''
              AND com_udfchkbox02 = ''+''
              AND ctl_ven = por_ven
              AND ctl_org = por_org
              AND NOT EXISTS(SELECT 1
                             FROM r5orderlines
                             WHERE orl_event = evt_code)';

  END IF;
  --PO creation
  --loop through all supplier/parts
  OPEN rcursor FOR c_rec;
  LOOP
    FETCH rcursor BULK COLLECT INTO cwocact,cwocpar,cwocuoi,cwocqty,cwoccatprc
                      ,cwochrs,cwocamt,cwocprch,cwocparn,cwoctrd
                      ,cwocwon,cwoccmn LIMIT 100;
  FOR i IN 1..cwocwon.count
  LOOP
    OPEN  WOSUPP(cwocwon(i));
    FETCH WOSUPP INTO csupplier,cevtdesc;
    CLOSE WOSUPP;
    IF csupplier IS NULL
    THEN
      --raise_application_error(-20003,'Supplier not exists in Work order');
      o7err.raise_error('QBZ_AUTOPO','PROC',1); --Supplier not exits
    END IF;
      --get exchange rate
      IF nexch IS NULL THEN
        nexch := o7gtexch('EUR',p_sorg,dcurdate);
      END IF;
      --raise error if exchange rate not found
      --set store for service lines
      BEGIN
      SELECT per_code INTO cemp FROM R5PERSONNEL WHERE per_code LIKE 'APO%' and per_org = p_sorg;
        --EXCEPTION (ORA-01427)
      EXCEPTION
        WHEN OTHERS THEN
        --RAISE_APPLICATION_ERROR(-20003,'FLEXBEGIN:Originator not available:FLEXEND');
        o7err.raise_error('QBZ_AUTOPO','PROC',2); --Originator not available
      END;
      BEGIN
        SELECT str_code INTO cstore FROM r5stores WHERE str_code LIKE 'APO%' AND str_org = p_sorg;
        --EXCEPTION (ORA-01427)
      EXCEPTION
        WHEN OTHERS THEN
        --RAISE_APPLICATION_ERROR(-20003,'FLEXBEGIN:Store not available:FLEXEND');
        o7err.raise_error('QBZ_AUTOPO','PROC',3); --Store not available
      END;
      --get sess use and lang
      cuser := NVL( o7sess.cur_user, '*' );
      SELECT usr_lang INTO clang
      FROM r5users
      WHERE usr_code = cuser;
      --call procedure to create PO and PO lines, if PO exists append PO lines
      IF cwocpar(i) is NOT NULL THEN
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,cwocparn(i),'*',dcurdate,cwoccatprc(i),'EUR',nexch,cwocqty(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'PD','PD',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                                  ,add_code, add_lang, add_line, add_print, add_text
                                  , add_user, add_updatecount)
                           VALUES ('PORL','PORL','*','*'
                                  ,corder||'#'||p_sorg||'#'||nordline,clang,10,'+',cwoccmn(i)
                                  ,cuser,0);
        END IF;--cwoccmn(i) comments not NULL
      END IF;--ou_parts is NOT NULL
      IF cwocamt(i) is NOT NULL THEN
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,NULL,NULL,dcurdate,cwocamt(i),'EUR',nexch,1,NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'SF','SF',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                                  ,add_code, add_lang, add_line, add_print, add_text
                                  , add_user, add_updatecount)
                           VALUES ('EVNT','EVNT','*','*'
                                  ,cwocwon(i)||'#'||cwocact(i),clang,10,'+',cwoccmn(i)
                                  ,cuser,0);
        END IF;--cwoccmn(i) comments not NULL
      END IF;--ou_amt is NOT NULL
      IF cwochrs(i) IS NOT NULL THEN
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,NULL,NULL,dcurdate,cwocprch(i),'EUR',nexch,cwochrs(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'ST','ST',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                                  ,add_code, add_lang, add_line, add_print, add_text
                                  , add_user, add_updatecount)
                           VALUES ('EVNT','EVNT','*','*'
                                  ,cwocwon(i)||'#'||cwocact(i),clang,10,'+',cwoccmn(i)
                                  ,cuser,0);
        END IF;--cwoccmn(i) comments not NULL
      END IF;--ou_hrs IS NOT NULL
      --update udfchar24 to PO Number
      UPDATE r5events
      SET evt_udfchar24 = corder
      WHERE    evt_code = cwocwon(i);
  END LOOP;
    EXIT WHEN rcursor%NOTFOUND;    
  END LOOP;
  CLOSE rcursor;
  --error
  IF corder IS NULL THEN
    o7err.raise_error('QBZ_AUTOPO','PROC',4); --PO not created
  END IF;
  IF p_ssource = 'WO' THEN
    --update udfchar05 to automatic and copied eventdesc to PO desc
    UPDATE r5orders
    SET ord_desc = cevtdesc
    ,ord_udfchar05 = 'AUT'
    WHERE ord_Code = corder
    AND ord_org = p_sorg;
  ELSE
    --update udfchar05 to automatic
    UPDATE r5orders
    SET ord_udfchar05 = 'AUT'
    WHERE ord_Code = corder
    AND ord_org = p_sorg;
    --UPDATE PO and createdby
    UPDATE u5oupord
    SET por_po = corder
    ,por_date  = dcurdate
    ,por_genby = ccuruser
    WHERE por_seq = p_scode
    AND NVL(por_po,'!@#$')   <> corder;
  END IF;
END QBZ_AUTOPO;
/
SHOW ERRORS PROCEDURE QBZ_AUTOPO
PROMPT

PROMPT ...Created Procedure QBZ_AUTOPO

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO04');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 4, 'QBZATPO04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'No record found to Generate PO.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'Geen record gevonden om PO te genereren.','NL', '-');

PROMPT ...END of error texts
PROMPT

PROMPT ...Creating trigger POSINSUPD_WOC_QBZ
PROMPT

CREATE OR REPLACE TRIGGER POSINSUPD_WOC_QBZ
AFTER INSERT OR UPDATE ON u5wocont
FOR EACH ROW
BEGIN
  --insert and update case
  IF :NEW.ctl_status = 'G' THEN
    UPDATE r5events
    SET evt_udfchar23   = :NEW.ctl_seq,
        evt_udfchkbox02 = '+',
        evt_status      = 'IC'
    WHERE evt_status    = 'AG'
    AND evt_jobtype    <> 'SCH'
    AND evt_org         = :NEW.ctl_org
    AND  evt_udfchar19  = :NEW.ctl_ven;   -----In Control
  END IF; --- ctl_status = G
  --update case
  IF UPDATING
   AND :NEW.ctl_status = 'WCC' THEN
    UPDATE r5events
    SET   evt_status      = 'TF'
    WHERE evt_status      IN ('IC','CA')
    AND   evt_udfchar23   = :NEW.ctl_seq
    AND   evt_udfchar19   = :NEW.ctl_ven
    AND   evt_udfchkbox02 = '+';   ----To be invoiced
    UPDATE r5events
    SET   evt_status      = 'DI'
    WHERE evt_status      = 'IC'
    AND   evt_udfchar23   = :NEW.ctl_seq
    AND   evt_udfchar19   = :NEW.ctl_ven
    AND   evt_udfchkbox02 = '-';   ----To be invoiced
  END IF; ----ctl_status = WCC
END POSINSUPD_WOC_QBZ;
/
SHOW ERRORS TRIGGER POSINSUPD_WOC_QBZ
PROMPT

PROMPT ...Creating trigger PREINS_WOC_QBZ
PROMPT
CREATE OR REPLACE TRIGGER PREINS_WOC_QBZ
BEFORE INSERT ON U5WOCONT
FOR EACH ROW
DECLARE
   countit    NUMBER;
BEGIN 
 :NEW.ctl_stadesc := CASE WHEN :NEW.ctl_status = 'G'   THEN 'Gegenereerd'
                          WHEN :NEW.ctl_status = 'SC'  THEN 'Leverancier gecontroleerd'
                          WHEN :NEW.ctl_status = 'WCC' THEN 'Controle afgerond'
                     ELSE '-'
                     END; ---- Assign status description
END PREINS_WOC_QBZ;
/
SHOW ERRORS TRIGGER PREINS_WOC_QBZ
PROMPT

PROMPT ...Creating trigger PREUPD_EVT_QBZ
PROMPT

CREATE OR REPLACE TRIGGER PREUPD_EVT_QBZ
BEFORE UPDATE ON r5events
FOR EACH ROW
DECLARE
   countit    NUMBER;
   countit1   NUMBER;
   ngroup     r5users.usr_group%type;
   cuser      r5users.usr_code%type;
BEGIN
  IF nvl(:new.evt_priority,'@#$%') <> 'C'
   AND :new.evt_status = 'EVO'
   AND :old.evt_status IN ('W','IBL') THEN
    o7err.raise_error('PREUPD_EVT_QBZ','TRIG',1);
  END IF;   --Status 'EVO' priority not equal to 'C' Raise Err
  IF :new.evt_status = 'IBL' AND :new.evt_udfchar19 is NULL THEN
    o7err.raise_error('PREUPD_EVT_QBZ','TRIG',4);
  END IF;  ----- Supplier is null
  --No records in new tab Raise Err
  IF (:new.evt_status = 'AG' AND :old.evt_status = 'TCS') THEN
    cuser:= NVL( o7sess.cur_user, '*' );
    SELECT usr_group INTO ngroup FROM r5users WHERE usr_code = cuser;
    --count of new tab supplier
    SELECT COUNT(1) INTO countit FROM U5WOSUPP WHERE ou_wo = :new.evt_code;
    IF countit = 0 AND ngroup IN ('SUPPLIER','VLOOT-MAN') THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',2);
    END IF;  ----countit = 0
  END IF;   ----evt_status = TCS to AG
  IF :NEW.evt_type IN ('JOB','PPM') AND :NEW.evt_status = 'TCS' AND :old.evt_status = 'AG' THEN
    IF :NEW.evt_jobtype = 'SCH' THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'SCH'
    SELECT COUNT(1) INTO countit FROM r5companies WHERE COM_CODE = :NEW.evt_udfchar19 AND COM_UDFCHKBOX02 = '-';
    IF :NEW.evt_jobtype = 'STO' AND countit = 1 THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'STO'
  END IF;   ----evt_type = 'JOB' AND evt_status = 'AG'
  --chckbox checked status updated to chk/agree
  IF :NEW.evt_udfchkbox02 = '+'
   AND :OLD.evt_status = 'DI' THEN
    :NEW.evt_status := 'CA';
  --status updated to agree chckbox checked
  ELSIF :NEW.evt_status = 'CA' THEN
    :NEW.evt_udfchkbox02 := '+';
  --status updated to dispute chckbox unchecked
  ELSIF :NEW.evt_status = 'DI' THEN
    :NEW.evt_udfchkbox02 := '-';
  --chckbox unchecked status updated to dispute
  ELSIF :NEW.evt_udfchkbox02 = '-'
   AND :OLD.evt_status = 'IC' THEN
    :NEW.evt_status := 'DI';
  END IF;---evt_udfchkbox02 = '+'
END PREUPD_EVT_QBZ;
/
SHOW ERRORS TRIGGER PREUPD_EVT_QBZ
PROMPT

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-292.sql', '10-11-2022', 'QBZ-EAM 11.7', 'Issue changes delivery');

COMMIT;

PROMPT ...END of SPC-292.log

SPOOL OFF