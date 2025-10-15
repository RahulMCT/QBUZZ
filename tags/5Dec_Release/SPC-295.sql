-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-295.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 02-12-2022  - MCT - SPC295  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-295.log

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

PROMPT ...Start of SPC-295.sql

PROMPT ...Begin of qbz_uds_wstrad_plo

SET DEFINE OFF;

PROMPT ...Delete all WSTRAD_U1 pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'WSTRAD_U1';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','WSTRAD_U1','G','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_1','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_2','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_3','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_4','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','block_10_7','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_curr','F','Y','P','cont_3',4,1,1,90,'O','-',0,'YY','E','EUR',NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_end','F','Y','R','cont_3',3,1,1,80,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_mrc','F','Y','R','cont_2',4,1,1,40,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_org','F','Y','R','cont_2',2,1,1,20,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_rate','F','Y','R','cont_3',1,1,1,60,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_start','F','Y','O','cont_3',2,1,1,70,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_toh','F','Y','R','cont_2',5,1,1,50,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_trade','F','Y','R','cont_2',1,1,1,10,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSTRAD_U1','wspf_10_sup_ven','F','Y','R','cont_2',3,1,1,30,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'WSTRAD_U1'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...End of Pagelayout: WSTRAD_U1

PROMPT ...Begin of qbz_uds_schade_plo

SET DEFINE OFF;

PROMPT ...Delete all SCHADE_U1 pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'SCHADE_U1';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','SCHADE_U1','G','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_1','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_2','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_3','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_4','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','block_10_7','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_afas','F','Y','O','cont_1',2,1,2,20,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_case','F','Y','P','cont_2',1,1,1,30,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_cost','F','Y','O','cont_3',2,1,1,70,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_costcode','F','Y','R','cont_3',1,1,1,60,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_costdesc','F','Y','R','cont_1',1,1,2,10,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_date','F','Y','O','cont_2',3,1,1,50,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_line','F','Y','P','cont_2',2,1,1,40,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','SCHADE_U1','wspf_10_cos_totalcost','F','Y','P','cont_3',3,1,1,80,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'SCHADE_U1'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...End of Pagelayout: SCHADE_U1

PROMPT ...Updating Pagelayout for: SCHADE

UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_10';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_11';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_3';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_4';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_5';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_9';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1580,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar29';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 23,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1650,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchkbox03';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 24,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1660,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchkbox05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1490,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar11';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1800,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar28';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1860,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnum05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1870,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchkbox02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 22,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1880,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchkbox04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16.5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1900,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnote02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 530,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'inspectiondirection';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 540,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'flow';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 590,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'woclassorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 770,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'assignedtoname';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 780,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'assignedtoemail';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 810,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reqstartdate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 820,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reqenddate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 830,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'startdate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 840,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'completed';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 850,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'incidentrequest';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 860,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'incidentrequestorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 870,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'incidentrequeststatus';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 880,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'sourcetype';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 730,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'preparedby';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 740,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'preparedbyname';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 750,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'preparedbyemail';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 760,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'assignedto';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_17',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1910,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'createfollowupwo';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_17',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1920,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'refreshcostdata';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_17',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1930,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'translatewodescription';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 60,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'equipmentorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 140,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'esignature';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 150,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'esignaturedate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 160,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'esignaturetype';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 170,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'class';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 180,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'classorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 190,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'location';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 210,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'servicecode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 230,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'workaddress';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 240,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'servicecodeorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 250,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'locationorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 260,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'costcode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 420,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'followuprequired';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 430,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'hazardousmaterial';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 440,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'refreshcalculatedcosts';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 360,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'permittowork';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 370,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'shift';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 380,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'project';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 390,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'campaign';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 400,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'parent';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 410,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'regulatory';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_1';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_2';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_6';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_7';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'block_8';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.1',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 890,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'problemdesc';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.1',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 900,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'whathappened';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.2',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 910,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'downtimecost';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.2',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 930,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalcost';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.3',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 950,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'downtimehours';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.3',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 960,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'lostproductivityhours';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 970,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'why1';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 980,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'why2';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 990,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'why3';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1000,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'why4';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1010,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'why5';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.4',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1020,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'solution';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.7',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1070,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'symptom';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.7',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1080,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'failurecode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.7',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1090,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'actioncode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.7',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1100,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'causecode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.7',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1110,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'failuremodedesc';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.8',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1120,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'tacticalcause';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.8',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1130,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'humanfactor';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.8',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1140,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'workmanship';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.8',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1150,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'humanoversight';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.8',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1160,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'methodofdetection';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1570,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar27';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1500,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar13';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1720,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar12';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 30,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'equipment';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 450,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'frompoint';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 470,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'frompointrefdesc';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 480,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'frompointgeoref';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 490,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'topoint';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 510,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'topointrefdesc';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 520,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'topointgeoref';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_11',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 550,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'wodescription';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 560,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'standardwo';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 570,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'wotype';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 580,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'woclass';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 600,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'wostatus';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_12',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 610,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'wopriority';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 620,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'taskplan';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 630,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'jobplan';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 640,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'trade';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 650,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'esthours';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 660,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'pplreq';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 680,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'requestedby';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 790,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'schedstartdate';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 800,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'schedenddate';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 690,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'daterequested';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 700,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'responsible';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 710,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'responsiblename';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_14',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 720,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'responsibleemail';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1430,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1520,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar17';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1530,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar19';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1540,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar21';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1550,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar23';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1560,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar25';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1590,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfdate01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1600,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfdate03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1610,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfdate05';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1440,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'problemcode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1620,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnum02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1630,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnum04';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 22,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1640,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchkbox01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1460,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar05';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1510,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar15';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1670,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1760,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar20';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1770,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar22';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1780,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar24';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1790,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar26';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1810,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar30';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1820,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfdate02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1830,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfdate04';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1840,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnum01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1850,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnum03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1680,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar04';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1690,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar06';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1730,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar14';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1740,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar16';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1750,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar18';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16.5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1890,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfnote01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 270,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'eventstartdate';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 280,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'eventenddate';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 290,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalestimatedcosts';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 330,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'workorder';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 340,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'area';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 350,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'priority';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.2',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 2,plo_tabindex = 920,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'downtimecostcurr';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.2',plo_fieldgroup = 2,plo_positioningroup = 2,plo_fieldconttype = 2,plo_tabindex = 940,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalcostcurr';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1030,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reliabilityproblemcode';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1040,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reliabilityfailurecode';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.6',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1050,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reliabilityactioncode';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.6',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1060,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'reliabilitycausecode';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1170,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'eventdate';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1260,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'lastlinearslope';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1270,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'laplace';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1280,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullshape';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1290,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullscale';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1300,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullcorrelation';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1310,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaslope';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1320,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaintercept';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1330,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'avglinslopecumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1340,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'lastlinslopecumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1350,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullshapecumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1180,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'eventnumber';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1360,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullscalecumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1370,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'weibullcorrcumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 22,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1380,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaslopecumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 23,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1390,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaintcumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 24,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1400,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaslopeiec';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 25,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1410,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'crowamsaaintiec';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 26,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1420,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'basedonwo';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1190,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'dayssinceprevious';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1200,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'cumulativedays';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1210,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'meantimebetweenfailure';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1220,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'minimumdaysbetween';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1230,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'maximumdaysbetween';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1240,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'standarddeviation';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_14.9',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1250,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'averagelinearslope';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 10,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'casecode';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 2,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 40,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'equipmentdesc';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 460,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'frompointuom';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_10',plo_fieldgroup = 4,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 500,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'topointuom';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_13',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 670,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'followupwo';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1450,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar03';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1470,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar07';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_15',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1480,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar09';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1700,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar08';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_16',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1710,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'udfchar10';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 70,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'createdby';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 80,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'datecreated';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 90,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'updatedby';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 100,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'dateupdated';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 200,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'locationdesc';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 2,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 220,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'servicecodedesc';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 6,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 300,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalestimatedcosts_curr';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 310,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalcalculatedcosts';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 7,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 320,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'totalcalculatedcosts_curr';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 20,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'casedescription';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 50,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'organization';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 110,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'casetype';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 120,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'department';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 130,plo_defaultvalue = NULL WHERE plo_pagename = 'SCHADE' AND plo_elementid = 'status';
COMMIT;
PROMPT ...End of Pagelayout: SCHADE
PROMPT ...End of qbz_uds_schade_plo

PROMPT ...Queries for User defined screen: OUCOST

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'COSCOST','Cost Code','1=1','+','+','-','-','+','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'COSCOST');

UPDATE r5queries
SET que_text = 'select d.des_code,d.des_text
from   r5descriptions d, r5costcodes c
where  c.cst_code = d.des_code
and NVL( c.cst_notused, ''-'' ) = ''-''
and d.des_rentity = ''CSTC''
and    d.des_lang = ''EN'''
WHERE que_code = 'COSCOST';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'CASEACOS','Total Cost','1=1','+','+','-','-','-','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'CASEACOS');

UPDATE r5queries
SET que_text = 'SELECT (o7cost.tools2(csm_workorder)+o7cost.material2(csm_workorder)+o7cost.labour2(csm_workorder))
FROM r5casemanagement
WHERE csm_code = :1'
WHERE que_code = 'CASEACOS';

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'CASEADCC','Additional Cost - Cost Code based on Problem Code','1=1','+','+','-','-','-','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'CASEADCC');

UPDATE r5queries
SET que_text = 'SELECT CASE WHEN csm_problem like ''%BS%'' THEN ''4408''
            WHEN csm_problem like ''%RA%'' THEN ''4409''
            ELSE ''4405''
       END cc
FROM r5casemanagement
WHERE csm_code = :1'
WHERE que_code = 'CASEADCC';

PROMPT ...Queries for User defined screen: OUSUTR

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'TRASUPP','Trade Supplier','1=1','+','+','-','-','+','-' FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'TRASUPP');

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

PROMPT  ...Creating Procedure QBZ_AUTOPOREC

CREATE OR REPLACE PROCEDURE QBZ_AUTOPOREC (p_cordcode       IN VARCHAR2
                                          ,p_cordorg        IN VARCHAR2
                                          ,p_nerrno         OUT NUMBER
                                          ,p_cerrmsg        OUT VARCHAR2)
AS
  --local variables
  ccuruser      r5users.usr_Code%type := NVL(o7sess.cur_user,'R5');
  dcurdatetime  DATE := o7gttime(p_cordorg);
  ctrans        r5transactions.tra_code%type;
  cnewtrans     r5transactions.tra_code%type;
  cbin          r5bins.bin_code%type;
  cdock         r5dockreceipts.dck_code%type;
  cdckcode      r5dockreceipts.dck_code%type;
  cevtmrc       r5events.evt_mrc%type;
  countit       NUMBER;
  cchk          VARCHAR2(3);
  nerrno        NUMBER := 0;
  cerrmsg       VARCHAR2(240);
  db_error      EXCEPTION;
  --check PO existence
  CURSOR PODCK IS
    SELECT dck_code
    FROM r5dockreceipts
    WHERE dck_order = p_cordcode;
  CURSOR WOMRC(p_sevt VARCHAR2) IS
    SELECT evt_mrc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  p_nerrno  := 0;
  p_cerrmsg := NULL;
  --return if PO-receiving already created
  OPEN  PODCK;
  FETCH PODCK INTO cdckcode;
  CLOSE PODCK;
  IF cdckcode IS NOT NULL
  THEN
    --raise_application_error(-20003,'PO-receiving already created');
    o7err.raise_error('QBZ_AUTOPOREC','PROC',1); --PO-receiving completed
  END IF;
  --PO receiving, loop through all PO lines
  FOR p IN (SELECT ord_code,ord_org,ord_desc,ord_supplier,ord_supplier_org,ord_class,ord_class_org
                  ,orl_type,orl_event,orl_store,orl_ordline,orl_act,orl_trade,orl_part,orl_part_org,orl_ordqty
                  ,(CASE WHEN orl_rtype = 'PD' THEN 0 ELSE 1 END) nio,orl_price,orl_multiply,orl_exch,orl_inspect
            FROM r5orders
            JOIN r5orderlines ON (orl_order = ord_code AND orl_order_org = ord_org)
            WHERE ord_code = p_cordcode
            AND   ord_org  = p_cordorg
            ORDER BY DECODE(orl_type,'PD',1,2),orl_event,orl_ordline)
  LOOP
    BEGIN
    SELECT bin_code INTO cbin FROM r5bins WHERE bin_store = p.orl_store AND bin_notused = '-';
    EXCEPTION
      WHEN OTHERS THEN
      --raise_application_error(-20003,'FLEXBEGIN:Bin not available:FLEXEND');
      o7err.raise_error('QBZ_AUTOPOREC','PROC',2); --Bin not available
    END;
    --Transaction will be created only for Parts line
    IF p.orl_type = 'PD' THEN
      --create Dock header if not exist
      IF cdock IS NULL THEN
        --get dock code
        r5o7.o7maxseq(cdock, 'DOCK',1,cchk);
        INSERT INTO r5dockreceipts
          (dck_code,dck_org,dck_desc,dck_status,dck_rstatus,dck_supplier,dck_supplier_org
          ,dck_order,dck_order_org,dck_recvdate,dck_dockid,dck_created,dck_user,dck_retrieveall)
        VALUES
          (cdock,p.ord_org,p.ord_desc,'A','A',p.ord_supplier,p.ord_supplier_org
          ,p.ord_code,p.ord_org,SYSDATE,p.orl_store,dcurdatetime,ccuruser,'+');
      END IF; --cdock IS NULL
      --create Docklines
      INSERT INTO r5docklines
        (dkl_dckcode,dkl_line,dkl_order,dkl_ordline,dkl_order_org,dkl_part,dkl_part_org
        ,dkl_inspstatus,dkl_insprstatus,dkl_linestatus,dkl_linerstatus,dkl_counted,dkl_recvqty
        ,dkl_countqty,dkl_bin,dkl_lot,dkl_direct,dkl_inspect)
      VALUES
        (cdock,p.orl_ordline,p.ord_code,p.orl_ordline,p.ord_org,p.orl_part,p.orl_part_org
        ,'A','A','A','A','+',p.orl_ordqty
        ,p.orl_ordqty,cbin,'*','E',p.orl_inspect);
      --create Transaction header if not exist
      SELECT count(1) into countit FROM r5transactions WHERE tra_tocode = p.orl_event;
      IF ctrans IS NULL AND countit = 0 THEN
        --get trans code
        r5o7.o7maxseq(ctrans, 'TRAN',1,cchk);
        INSERT INTO r5transactions
          (tra_code,tra_org,tra_desc,tra_class,tra_class_org,tra_type,tra_rtype,tra_auth,tra_date,tra_order
          ,tra_order_org,tra_status,tra_rstatus,tra_fromentity,tra_fromrentity,tra_fromtype,tra_fromrtype,tra_fromcode,tra_fromcode_org,tra_toentity
          ,tra_torentity,tra_totype,tra_tortype,tra_tocode,tra_tocode_org,tra_interface,tra_printed,tra_dckcode)
        VALUES
          (ctrans,p.ord_org,p.ord_desc,p.ord_class,p.ord_class_org,'RECV','RECV',ccuruser,dcurdatetime,p.ord_code
          ,p.ord_org,'A','A','COMP','COMP','*','*',p.ord_supplier,p.ord_supplier_org,'EVNT'
          ,'EVNT','*','*',p.orl_event,NULL,NULL,'-',cdock);
        cnewtrans := ctrans;
        ctrans := NULL;
      END IF; --ctrans IS NULL
      --create Transaction lines
      INSERT INTO r5translines
        (trl_trans,trl_type,trl_rtype,trl_line,trl_date,trl_store,trl_order,trl_order_org,trl_ordline,trl_costcode
        ,trl_project,trl_projbud,trl_event,trl_act,trl_part,trl_part_org,trl_req,trl_reqline,trl_multiply,trl_io
        ,trl_stockprice,trl_price,trl_qty,trl_scrapqty,trl_bin,trl_lot,trl_sourcesystem,trl_sourcecode,trl_interface,trl_object
        ,trl_object_org,trl_obtype,trl_obrtype,trl_rejectreason,trl_transorgid,trl_transcode,trl_transgroup)
      VALUES
        (cnewtrans,'RECV','RECV',p.orl_ordline,dcurdatetime,p.orl_store,p.ord_code,p.ord_org,p.orl_ordline,NULL
        ,NULL,NULL,p.orl_event,p.orl_act,p.orl_part,p.orl_part_org,NULL,NULL,p.orl_multiply,p.nio
        ,NULL,((p.orl_price/p.orl_multiply)/p.orl_exch),p.orl_ordqty,0,cbin,'*',NULL,NULL,NULL,NULL
        ,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
      --update transcode to dockreceive code
      UPDATE r5docklines
      SET dkl_recvcode  = cnewtrans
      WHERE dkl_dckcode = cdock
      AND   dkl_line    = p.orl_ordline;        
    ELSE
      OPEN  WOMRC(p.orl_event);
      FETCH WOMRC INTO cevtmrc;
      CLOSE WOMRC;
      --create BookVendor hours
      INSERT INTO r5bookedhours
        (boo_event,boo_act,boo_date,boo_trade,boo_mrc,boo_person,boo_octype,boo_ocrtype,boo_on,boo_off,boo_hours,boo_rate,boo_cost,boo_entered)
      VALUES
        (p.orl_event,p.orl_act,dcurdatetime,p.orl_trade,cevtmrc,NULL,'N','N',NULL,NULL,p.orl_ordqty,p.orl_price,(p.orl_ordqty*p.orl_price),dcurdatetime);
    END IF; --p.orl_type = 'PD'
  END LOOP;--p
  --update status and rstatus to 'A'
  UPDATE r5dockreceipts
  SET dck_status = 'A'
  ,dck_rstatus = 'A'
  WHERE dck_code = cdock;
  --update all PO Lines and mark them to received
  UPDATE r5orderlines
  SET orl_active  = '-'
  ,orl_recvqty    = orl_ordqty
  ,orl_recvvalue  = orl_ordqty*orl_price
  WHERE orl_order     = p_cordcode
  AND   orl_order_org = p_cordorg;
  FOR i IN (SELECT DISTINCT orl_event 
           FROM r5orderlines 
           WHERE orl_order = p_cordcode 
           AND orl_order_org = p_cordorg) 
  LOOP
    --When PO status is Approved (A2, GA) then associated work order status will be updated to Completed     
    UPDATE R5EVENTS
    SET evt_status = 'C'
    ,evt_rstatus   = 'C'
    ,evt_completed = o7gttime(p_cordorg)
    WHERE evt_code = i.orl_event;
  END LOOP;--i  
END QBZ_AUTOPOREC;
/
SHOW ERRORS PROCEDURE QBZ_AUTOPOREC
PROMPT

PROMPT ...Created Procedure QBZ_AUTOPOREC

PROMPT ...Begin Of qbz_r5casemanagement.flx
PROMPT

DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5CASEMANAGEMENT',vaction);
END;
/
COMMIT;


SET VERIFY OFF
SET SERVEROUTPUT ON

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 1;
sstmt :=
'DECLARE
  cuser      r5users.usr_code%type;
  countit    NUMBER;
  crev       NUMBER;
  cdesc      r5casemanagementtasks.tcm_desc%type;
BEGIN
  FOR i IN (SELECT csm_code
            FROM r5casemanagement
            WHERE rowid      = :rowid
            AND   csm_casetype = ''SCH''
            AND   csm_status   = ''O'')
  LOOP
    cuser:= NVL( o7sess.cur_user, ''*'');
    SELECT NVL(MAX(tcm_code),10000) INTO countit FROM r5casemanagementtasks;
    countit := countit + 1;
    SELECT tsk_desc,tsk_revision INTO cdesc,crev
    FROM r5tasks
    WHERE tsk_code = ''SCHADE'';
    INSERT INTO r5casemanagementtasks (tcm_code, tcm_desc, tcm_casemanagement, tcm_sequence,
                                       tcm_chklst_task, tcm_chklst_taskrev, tcm_notify_complete, tcm_notify_readytostart,
                                       tcm_createdby, tcm_created)
                                SELECT countit, cdesc, i.csm_code, ''10'',
                                       ''SCHADE'', crev, ''-'', ''-'',
                                       cuser,sysdate FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM r5casemanagementtasks WHERE tcm_casemanagement = i.csm_code);
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',1,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 1','Create SCHADE Task','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 2;
sstmt :=
'DECLARE
  Sdesc r5casemanagement.csm_udfchar03%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_workorder
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_workorder IS NOT NULL)
  LOOP
    SELECT r5o7.o7get_desc(''EN'',''UCOD'', evt_status,''EVST'', '''') INTO Sdesc
    FROM r5events
    WHERE evt_code = c.csm_workorder;
    UPDATE r5casemanagement
    SET  csm_udfchar03             =  Sdesc
    WHERE csm_code                 =  c.csm_code
    AND  NVL(csm_udfchar03,''@#$%'') <> Sdesc;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',2,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 2','Update WO status','-',0,'-',sysdate,sstmt);
END;
/


DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 2;
sstmt :=
'DECLARE
  Sdesc r5casemanagement.csm_udfchar03%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_workorder
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_workorder IS NOT NULL)
  LOOP
    SELECT r5o7.o7get_desc(''EN'',''UCOD'', evt_status,''EVST'', '''') INTO Sdesc
    FROM r5events
    WHERE evt_code = c.csm_workorder;
    UPDATE r5casemanagement
    SET  csm_udfchar03             =  Sdesc
    WHERE csm_code                 =  c.csm_code
    AND  NVL(csm_udfchar03,''@#$%'') <> Sdesc;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-UPDATE',2,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Update, 2','Update WO status','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 3;
sstmt :=
'DECLARE
  cdesc     r5casemanagement.csm_udfchar07%type;
  cdept     r5casemanagement.csm_udfchar08%type;
  csup      r5casemanagement.csm_udfchar09%type;
  csupdesc  r5casemanagement.csm_udfchar10%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_udfchar06
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_udfchar06 IS NOT NULL)
  LOOP
    SELECT per_desc,per_mrc,per_supervisor,CASE WHEN per_supervisor IS NULL THEN NULL ELSE r5o7.o7get_desc(''EN'',''SGRP'', per_supervisor,'''', '''') END
     INTO cdesc,cdept,csup,csupdesc
    FROM r5personnel
    WHERE per_code = c.csm_udfchar06;
    UPDATE r5casemanagement
    SET  csm_udfchar07     = cdesc
         ,csm_udfchar08    = cdept
         ,csm_udfchar09    = csup
         ,csm_udfchar10    = csupdesc
    WHERE csm_code         =  c.csm_code
    AND  NVL(csm_udfchar07,''@#$%'') <> cdesc;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-UPDATE',3,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Update, 3','Update Employe desc/etc..','-',0,'-',sysdate,sstmt);
END;
/
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 3;
sstmt :=
'DECLARE
  cdesc     r5casemanagement.csm_udfchar07%type;
  cdept     r5casemanagement.csm_udfchar08%type;
  csup      r5casemanagement.csm_udfchar09%type;
  csupdesc  r5casemanagement.csm_udfchar10%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_udfchar06
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_udfchar06 IS NOT NULL)
  LOOP
    SELECT per_desc,per_mrc,per_supervisor,r5o7.o7get_desc(''EN'',''SGRP'', per_supervisor,'''', '''')
     INTO cdesc,cdept,csup,csupdesc
    FROM r5personnel
    WHERE per_code = c.csm_udfchar06;
    UPDATE r5casemanagement
    SET  csm_udfchar07     = cdesc
         ,csm_udfchar08    = cdept
         ,csm_udfchar09    = csup
         ,csm_udfchar10    = csupdesc
    WHERE csm_code         =  c.csm_code
    AND  NVL(csm_udfchar07,''@#$%'') <> cdesc;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',3,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 3','Update Employe desc/etc..','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 4;
sstmt :=
'DECLARE
  cAlias r5casemanagement.csm_udfchar01%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_object,csm_object_org
            FROM r5casemanagement
            WHERE ROWID = :ROWID)
  LOOP
    SELECT obj_alias INTO cAlias
    FROM r5objects
    WHERE obj_code = c.csm_object
    AND obj_org = c.csm_object_org;
    UPDATE r5casemanagement
    SET  csm_udfchar01            = cAlias
    WHERE csm_code                =  c.csm_code
    AND NVL(csm_udfchar01,''!@#$'') <> cAlias;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',4,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 4','Update Equipment alias','-',0,'-',sysdate,sstmt);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 4;
sstmt :=
'DECLARE
  cAlias r5casemanagement.csm_udfchar01%type;
BEGIN
  FOR c IN (SELECT csm_code,csm_object,csm_object_org
            FROM r5casemanagement
            WHERE ROWID = :ROWID)
  LOOP
    SELECT obj_alias INTO cAlias
    FROM r5objects
    WHERE obj_code = c.csm_object
    AND obj_org = c.csm_object_org;
    UPDATE r5casemanagement
    SET  csm_udfchar01            = cAlias
    WHERE csm_code                =  c.csm_code
    AND NVL(csm_udfchar01,''!@#$'') <> cAlias;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-UPDATE',4,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Update, 4','Update Equipment alias','-',0,'-',sysdate,sstmt);
END;
/

--System date should be populated on Date
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 5;
sstmt :=
'BEGIN
  FOR C IN (SELECT csm_code
            FROM r5casemanagement
            WHERE ROWID = :ROWID
            AND csm_created IS NULL) LOOP
    UPDATE r5casemanagement
    SET csm_created = SYSDATE
    WHERE csm_code = c.csm_code;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5CASEMANAGEMENT','POST-INSERT',5,'+','-'
    ,'+','R5CASEMANAGEMENT, Post Insert, 5','System date should be populated on Date field','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

PROMPT ...End of qbz_r5casemanagement.flx
PROMPT

PROMPT ...Creating Trigger COMP_INSUPD_U5ACS_QBZ
PROMPT
CREATE OR REPLACE TRIGGER COMP_INSUPD_U5ACS_QBZ
FOR INSERT OR UPDATE ON u5dmcost
COMPOUND TRIGGER
  --local variables
  TYPE            newcoscase     IS TABLE OF u5dmcost.cos_case%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newcosline     IS TABLE OF u5dmcost.cos_line%TYPE INDEX BY BINARY_INTEGER;

  newcoscode       newcoscase ;
  newcodeline      newcosline ;

  cnt             NUMBER := 0;

AFTER EACH ROW IS
BEGIN
  IF (INSERTING AND :NEW.cos_cost IS NOT NULL )
      OR ( UPDATING AND :NEW.cos_cost <> :OLD.cos_cost) THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcoscode(cnt)  := :new.cos_case;
     newcodeline(cnt) := :new.cos_line;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i in 1..cnt
  LOOP
    FOR j IN (SELECT SUM(cos_cost) tot
              FROM u5dmcost
              WHERE cos_case = newcoscode(i))
    LOOP
      UPDATE u5dmcost
      SET cos_totalcost = j.tot
      WHERE cos_case = newcoscode(i)
      AND cos_line = newcodeline(i);
    END LOOP;
  END LOOP;
END AFTER STATEMENT;

END COMP_INSUPD_U5ACS_QBZ;
/

SHOW ERRORS TRIGGER COMP_INSUPD_U5ACS_QBZ
PROMPT
PROMPT ...Trigger COMP_INSUPD_U5ACS_QBZ created
PROMPT

PROMPT ...Creating Lookup LVSUPHRS
PROMPT
DECLARE
  cfunction        VARCHAR2(30);
  cgridid          VARCHAR2(30);
  cdataspyid       VARCHAR2(30);
  cQuery           VARCHAR2(4000);
  cQuery_multiorg  VARCHAR2(4000);
  nmaxbotnum       NUMBER(8);
  nfieldid1        NUMBER(12);
  nfieldid2        NUMBER(12);
  cchk             VARCHAR(30);
  chk              VARCHAR(30);
BEGIN
  --Set Function name
  cfunction := 'LVSUPHRS';
  --Clean Existing Records
  DELETE FROM r5queryfield  WHERE  dqf_ddspyid IN (SELECT dds_ddspyid
                                                   FROM   r5dddataspy
                                                   WHERE  dds_gridid IN (SELECT grd_gridid
                                                                         FROM r5grid
                                                                         WHERE grd_gridname = cfunction));
  DELETE FROM r5dddataspy   WHERE dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5gridfield   WHERE gfd_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5gridparam   WHERE gdp_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5grid        WHERE grd_gridname = cfunction;
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('lvsupdescode','lvsupdestext');
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;
  --set ddfields
  SELECT MIN(ddf_fieldid) INTO nfieldid1  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'DES_CODE';
  IF nfieldid1 IS NULL THEN
  r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid1 ,'DES_CODE','VARCHAR','R5DESCRIPTIONS');
  END IF;

  SELECT MIN(ddf_fieldid) INTO nfieldid2  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'DES_TEXT';
  IF nfieldid2 IS NULL THEN
  r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid2 ,'DES_TEXT','MIXVARCHAR','R5DESCRIPTIONS');
  END IF;
  --set query
  cQuery :=
'FROM r5descriptions d, r5ucodes u
WHERE d.des_code  = u.uco_code
AND d.des_rtype   = uco_rentity
AND d.des_rentity = ''UCOD''
AND d.des_rtype   = ''OCTP''
AND d.des_lang    = :parameter.language
AND COALESCE(uco_notused,''-'') = ''-''
AND des_code IN (SELECT sup_toh
                 FROM u5supprate,r5events
                 WHERE evt_code    = :parameter.wonum
                 AND sup_trade     = :parameter.trde
                 AND sup_org       = evt_org
                 AND sup_ven       = evt_udfchar19
                 AND sup_mrc       = evt_mrc)';
  --Get grid sequence
  r5o7.o7maxseq( cgridid, 'GRD', '1', cchk );
  --Creating GRID
  INSERT INTO r5grid
    (grd_desc               ,grd_gridid                 ,grd_basequery         ,grd_gridname             ,grd_keyfields
    ,grd_filterablelist     ,grd_sortablelist           ,grd_displayablelist   ,grd_orgcolname           ,grd_basequery_multiorg
    ,grd_keyfields_multiorg ,grd_filterable_multiorg    ,grd_sortable_multiorg ,grd_displayable_multiorg ,grd_botfunction
    ,grd_updatecount        ,grd_portletflag            ,grd_secentity         ,grd_hints                ,grd_tab
    ,grd_gridtype           ,grd_units                  ,grd_optimizeron       ,grd_distinct             ,grd_commitflag
    ,grd_customfieldcode    ,grd_complex                ,grd_active            ,grd_noscreendesigner     ,grd_mobile
    ,grd_updated            ,grd_gisdatafilter)
  VALUES('Hours lov for suppliers',cgridid,cQuery,cfunction
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,NULL,NULl,NULL,NULL,NULL,NULL
         ,'BSLOVS',0,'-',NULL,NULL,'-',4,NULL,'+','-',NULL,NULL,'-','+','-','-',SYSDATE,'-');
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvsupdescode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid2, cgridid,  'BSLOVS', nmaxbotnum+2, 'TEXT', NULL, 'lvsupdestext', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  --Get dataspy sequence
  r5o7.o7maxseq( cdataspyid, 'DDS', '1', cchk );
  -- create r5dddataspy
  INSERT INTO r5dddataspy(dds_ddspyname, dds_ddspyid, dds_autorun, dds_scope, dds_organization, dds_updatestamp, dds_updatebyuser, dds_createdstamp, dds_updateable, dds_filterstrxml
                         ,dds_sortstrxml, dds_fieldlist, dds_updatecount, dds_displayrow, dds_owner, dds_gridid, dds_type, dds_defaultflag, dds_fieldlist_portlet, dds_clientrows
                         ,dds_portletrows, dds_hints, dds_botname,  dds_userfilter, dds_securitydataspy, dds_mekey, dds_updated, dds_ddspyfilter, dds_globaldataspy)
  VALUES('All Records', cdataspyid, '+', '+', '*', NULL, NULL, NULL,'-',  '<FILTERABLE/>','<SORTABLE/>'
        ,NULL, 0, 10, 'R5', cgridid, 'SD', '+', NULL, 50
        ,5, NULL, NULL,  NULL, '-', 'YY',  SYSDATE, NULL, '+');
  --create query fields
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid1, '80'   , 1, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid2, '150'  , 2, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+1, 50, 0, 0, lin_code, 'Activity', 'F', '1', 'lvsupdescode', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+2, 50, 0, 0, lin_code, 'Description', 'F', '1', 'lvsupdestext', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+2 AND bot_lang = lin_code);

END;
/
COMMIT;

PROMPT ...Created Lookup LVSUPHRS
PROMPT


PROMPT ...Creating grid NUCOSO
PROMPT

DECLARE
  sFunction     VARCHAR(6)   := 'NUCOSO';
  sDesc         VARCHAR2(80) := 'Overview of costs';
  nftb_seq      NUMBER(2);
  sGridid       VARCHAR(30);
  sDataspyid    VARCHAR(30);
  sCheckresult  VARCHAR(4);
  sQuery        VARCHAR2(4000);
  sBaseQuery    VARCHAR2(4000);
  sLang         VARCHAR(2);
  maxbotnum     VARCHAR(30);
  ddfield       NUMBER(14);
  nfieldid1     NUMBER(12);
  nfieldid2     NUMBER(12);
  nfieldid3     NUMBER(12);
  nfieldid4     NUMBER(12);
  nfieldid5     NUMBER(12);
  nfieldid6     NUMBER(12);
  nfieldid7     NUMBER(12);
  nfieldid8     NUMBER(12);
  nfieldid9     NUMBER(12);
  nfieldid10    NUMBER(12);
  nfieldid11    NUMBER(12);
  nfieldid12    NUMBER(12);
  nfieldid13    NUMBER(12);
  nfieldid14    NUMBER(12);
  nfieldid15    NUMBER(12);
  nfieldid16    NUMBER(12);
  nfieldid17    NUMBER(12);
  nfieldid18    NUMBER(12);
  nfieldid19    NUMBER(12);
  nfieldid20    NUMBER(12);
  nfieldid21    NUMBER(12);
  nfieldid22    NUMBER(12);
  nfieldid23    NUMBER(12);
  nfieldid24    NUMBER(12);
  nfieldid25    NUMBER(12);
  nfieldid26    NUMBER(12);
  nfieldid27    NUMBER(12);
  nfieldid28    NUMBER(12);
  nfieldid29    NUMBER(12);
  nfieldid30    NUMBER(12);
  nfieldid31    NUMBER(12);
  nfieldid32    NUMBER(12);
  nfieldid33    NUMBER(12);
  nfieldid34    NUMBER(12);
  nfieldid35    NUMBER(12);
  nfieldid36    NUMBER(12);
  nfieldid37    NUMBER(12);
  nfieldid38    NUMBER(12);
  nfieldid39    NUMBER(12);
  chk           VARCHAR(30);
  nChksSreen    INT;

BEGIN
  --delete if existing record
  DELETE FROM r5extensibleframework  WHERE efr_name LIKE sFunction || '%';
  DELETE FROM r5queryfield
  WHERE dqf_ddspyid IN (SELECT dds_ddspyid
                        FROM   r5dddataspy
                        WHERE  dds_gridid IN (SELECT grd_gridid
                                              FROM   r5grid
                                              WHERE  grd_gridname = sFunction));
  DELETE FROM r5usegridsysdefault    WHERE usd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5dddataspy            WHERE dds_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5gridfield            WHERE gfd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5gridparam            WHERE gdp_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5grid                 WHERE grd_gridname = sFunction;
  DELETE FROM r5boilertexts          WHERE bot_function = sFunction;
  DELETE FROM r5pagelayout           WHERE plo_pagename = sFunction;
  DELETE FROM r5defaultpagelayout    WHERE pld_pagename = sFunction;
  DELETE FROM r5extmenus             WHERE emn_function = sFunction;   
  DELETE FROM r5permissions          WHERE prm_function = sFunction;
  DELETE FROM r5pagecache            WHERE pgc_function = sFunction;
  DELETE FROM r5functions            WHERE fun_code     = sFunction;
  --create function
  INSERT INTO r5functions (fun_code   ,fun_desc       ,fun_class     ,fun_subtype     ,fun_file
                          ,fun_delete ,fun_insert     ,fun_update    ,fun_select      ,fun_mekey
                          ,fun_auto   ,fun_background ,fun_dirsel    ,fun_system      ,fun_class_org
                          ,fun_lst    ,fun_hdr        ,fun_displayft ,fun_startupview ,fun_splitviewdisplay
                          ,fun_application)
                    VALUES(sFunction ,sDesc ,'WEBD' ,'M'   ,'R5MENU'
                          ,NULL      ,NULL  ,NULL   ,'?'   ,'YY'
                          ,'D'       ,'-'   ,'-'    ,'+'   ,'*'
                          ,'+'       ,'+'   ,'+'    ,'SV'  ,'S'
                          ,'BSUGRD');
  --find sequence for Dataspy
  r5o7.o7maxseq (sDataspyid ,'DDS',1,sCheckresult);
  --create ddfield
  --csm_code
   SELECT MIN(ddf_fieldid) INTO nfieldid1 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_CODE';
  IF nfieldid1 IS NULL THEN
    r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid1,'CSM_CODE','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_desc
   SELECT MIN(ddf_fieldid) INTO nfieldid2 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_DESC';
  IF nfieldid2 IS NULL THEN
    r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid2,'CSM_DESC','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_org
   SELECT MIN(ddf_fieldid) INTO nfieldid3 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_ORG';
  IF nfieldid3 IS NULL THEN
    r5o7.o7maxseq(nfieldid3,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid3,'CSM_ORG','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_object
   SELECT MIN(ddf_fieldid) INTO nfieldid4 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_OBJECT';
  IF nfieldid4 IS NULL THEN
    r5o7.o7maxseq(nfieldid4,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid4,'CSM_OBJECT','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar21
   SELECT MIN(ddf_fieldid) INTO nfieldid5 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR21';
  IF nfieldid5 IS NULL THEN
    r5o7.o7maxseq(nfieldid5,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid5,'CSM_UDFCHAR21','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar23
   SELECT MIN(ddf_fieldid) INTO nfieldid6 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR23';
  IF nfieldid6 IS NULL THEN
    r5o7.o7maxseq(nfieldid6,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid6,'CSM_UDFCHAR23','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar03
   SELECT MIN(ddf_fieldid) INTO nfieldid9 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR03';
  IF nfieldid9 IS NULL THEN
    r5o7.o7maxseq(nfieldid9,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid9,'CSM_UDFCHAR03','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_status
   SELECT MIN(ddf_fieldid) INTO nfieldid10 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_STATUS';
  IF nfieldid10 IS NULL THEN
    r5o7.o7maxseq(nfieldid10,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid10,'CSM_STATUS','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_created
   SELECT MIN(ddf_fieldid) INTO nfieldid11 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_CREATED';
  IF nfieldid11 IS NULL THEN
    r5o7.o7maxseq(nfieldid11,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid11,'CSM_CREATED','DATETIME',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar07
   SELECT MIN(ddf_fieldid) INTO nfieldid12 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR07';
  IF nfieldid12 IS NULL THEN
    r5o7.o7maxseq(nfieldid12,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid12,'CSM_UDFCHAR07','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar08
   SELECT MIN(ddf_fieldid) INTO nfieldid13 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR08';
  IF nfieldid13 IS NULL THEN
    r5o7.o7maxseq(nfieldid13,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid13,'CSM_UDFCHAR08','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar09
  SELECT MIN(ddf_fieldid) INTO nfieldid14 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR09';
  IF nfieldid14 IS NULL THEN
    r5o7.o7maxseq(nfieldid14,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid14,'CSM_UDFCHAR09','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar10
  SELECT MIN(ddf_fieldid) INTO nfieldid15 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR10';
  IF nfieldid15 IS NULL THEN
    r5o7.o7maxseq(nfieldid15,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid15,'CSM_UDFCHAR10','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_area
  SELECT MIN(ddf_fieldid) INTO nfieldid16 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_AREA';
  IF nfieldid16 IS NULL THEN
    r5o7.o7maxseq(nfieldid16,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid16,'CSM_AREA','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar05
  SELECT MIN(ddf_fieldid) INTO nfieldid17 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR05';
  IF nfieldid17 IS NULL THEN
    r5o7.o7maxseq(nfieldid17,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid17,'CSM_UDFCHAR05','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar20
  SELECT MIN(ddf_fieldid) INTO nfieldid18 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR20';
  IF nfieldid18 IS NULL THEN
    r5o7.o7maxseq(nfieldid18,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid18,'CSM_UDFCHAR20','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfdate01
  SELECT MIN(ddf_fieldid) INTO nfieldid19 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFDATE01';
  IF nfieldid19 IS NULL THEN
    r5o7.o7maxseq(nfieldid19,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid19,'CSM_UDFDATE01','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar25
  SELECT MIN(ddf_fieldid) INTO nfieldid20 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR25';
  IF nfieldid20 IS NULL THEN
    r5o7.o7maxseq(nfieldid20,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid20,'CSM_UDFCHAR25','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar26
  SELECT MIN(ddf_fieldid) INTO nfieldid21 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR26';
  IF nfieldid21 IS NULL THEN
    r5o7.o7maxseq(nfieldid21,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid21,'CSM_UDFCHAR26','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar24
  SELECT MIN(ddf_fieldid) INTO nfieldid22 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR24';
  IF nfieldid22 IS NULL THEN
    r5o7.o7maxseq(nfieldid22,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid22,'CSM_UDFCHAR24','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchkbox01
  SELECT MIN(ddf_fieldid) INTO nfieldid23 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHKBOX01';
  IF nfieldid23 IS NULL THEN
    r5o7.o7maxseq(nfieldid23,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid23,'CSM_UDFCHKBOX01','CHKBOOLEAN',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar04
  SELECT MIN(ddf_fieldid) INTO nfieldid24 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR04';
  IF nfieldid24 IS NULL THEN
    r5o7.o7maxseq(nfieldid24,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid24,'CSM_UDFCHAR04','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM01
  SELECT MIN(ddf_fieldid) INTO nfieldid25 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM01,0)';
  IF nfieldid25 IS NULL THEN
    r5o7.o7maxseq(nfieldid25,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid25,'NVL(CSM_UDFNUM01,0)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM02
  SELECT MIN(ddf_fieldid) INTO nfieldid26 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM02,0)';
  IF nfieldid26 IS NULL THEN
    r5o7.o7maxseq(nfieldid26,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid26,'NVL(CSM_UDFNUM02,0)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM03
  SELECT MIN(ddf_fieldid) INTO nfieldid27 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM03,0)';
  IF nfieldid27 IS NULL THEN
    r5o7.o7maxseq(nfieldid27,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid27,'NVL(CSM_UDFNUM03,0)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_sum
  SELECT MIN(ddf_fieldid) INTO nfieldid28 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)';
  IF nfieldid28 IS NULL THEN
    r5o7.o7maxseq(nfieldid28,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid28,'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Description char04
  SELECT MIN(ddf_fieldid) INTO nfieldid29 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = '(SELECT UDL_DESC FROM R5USERDEFINEDFIELDLOVVALS WHERE UDL_FIELD = ''UDFCHAR04'' AND UDL_CODE = CSM_UDFCHAR04)';
  IF nfieldid29 IS NULL THEN
    r5o7.o7maxseq(nfieldid29,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid29,'(SELECT udl_desc FROM r5userdefinedfieldlovvals WHERE udl_field = ''udfchar04'' AND udl_code = csm_udfchar04)','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfdate03
  SELECT MIN(ddf_fieldid) INTO nfieldid30 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFDATE03';
  IF nfieldid30 IS NULL THEN
    r5o7.o7maxseq(nfieldid30,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid30,'CSM_UDFDATE03','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar19
  SELECT MIN(ddf_fieldid) INTO nfieldid31 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR19';
  IF nfieldid31 IS NULL THEN
    r5o7.o7maxseq(nfieldid31,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid31,'CSM_UDFCHAR19','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Direct purchase
  SELECT MIN(ddf_fieldid) INTO nfieldid32 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'O7COST.MATERIAL2(CSM_WORKORDER)';
  IF nfieldid32 IS NULL THEN
    r5o7.o7maxseq(nfieldid32,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid32,'O7COST.MATERIAL2(CSM_WORKORDER)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;  
  --Labor cost
  SELECT MIN(ddf_fieldid) INTO nfieldid33 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = '(SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER)';
  IF nfieldid33 IS NULL THEN
    r5o7.o7maxseq(nfieldid33,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid33,'(SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Hired Labor
  SELECT MIN(ddf_fieldid) INTO nfieldid34 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'O7COST.LABOUR2(CSM_WORKORDER)';
  IF nfieldid34 IS NULL THEN
    r5o7.o7maxseq(nfieldid34,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid34,'o7cost.labour2(csm_workorder)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Cost from 4407
  SELECT MIN(ddf_fieldid) INTO nfieldid35 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = '(SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= 4407)';
  IF nfieldid35 IS NULL THEN
    r5o7.o7maxseq(nfieldid35,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid35,'(SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= 4407)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_COMPLETEDDATE
  SELECT MIN(ddf_fieldid) INTO nfieldid36 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_COMPLETEDDATE';
  IF nfieldid36 IS NULL THEN
    r5o7.o7maxseq(nfieldid36,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid36,'CSM_COMPLETEDDATE','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --Kostentotaal 
  SELECT MIN(ddf_fieldid) INTO nfieldid37 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = '(O7COST.MATERIAL2(CSM_WORKORDER)+O7COST.LABOUR2(CSM_WORKORDER)+(SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER))';
  IF nfieldid37 IS NULL THEN
    r5o7.o7maxseq(nfieldid37,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid37,'(o7cost.material2(csm_workorder)+o7cost.labour2(csm_workorder)+(select evo_ownlabor from r5eventcost where evo_event = csm_workorder))','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM04 
  SELECT MIN(ddf_fieldid) INTO nfieldid38 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFNUM04';
  IF nfieldid38 IS NULL THEN
    r5o7.o7maxseq(nfieldid38,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid38,'CSM_UDFNUM04','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Schadekosten Qbuzz  
  SELECT MIN(ddf_fieldid) INTO nfieldid39 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)+NVL(CSM_UDFNUM04,0)+NVL((O7COST.MATERIAL2(CSM_WORKORDER)+O7COST.LABOUR2(CSM_WORKORDER)+(SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER)),0)+NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= 4407),0)';
  IF nfieldid39 IS NULL THEN
    r5o7.o7maxseq(nfieldid39,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid39,'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)+NVL(CSM_UDFNUM04,0)+NVL((O7COST.MATERIAL2(CSM_WORKORDER)+O7COST.LABOUR2(CSM_WORKORDER)+(SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER)),0)+NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= 4407),0)','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --set query
  sQuery :=
 'FROM r5casemanagement
  WHERE csm_casetype = ''SCH''';
  --find sequence for Grid
  r5o7.o7maxseq (sGridid ,'GRD',1,sCheckresult);  
  --Creating Grid
  INSERT INTO r5grid(grd_desc               ,grd_gridid                 ,grd_basequery         ,grd_gridname             ,grd_keyfields
                    ,grd_filterablelist     ,grd_sortablelist           ,grd_displayablelist   ,grd_orgcolname           ,grd_basequery_multiorg
                    ,grd_keyfields_multiorg ,grd_filterable_multiorg    ,grd_sortable_multiorg ,grd_displayable_multiorg ,grd_botfunction
                    ,grd_updatecount        ,grd_portletflag            ,grd_secentity         ,grd_hints                ,grd_tab
                    ,grd_gridtype           ,grd_units                  ,grd_optimizeron       ,grd_distinct             ,grd_commitflag
                    ,grd_customfieldcode    ,grd_complex                ,grd_active            ,grd_noscreendesigner     ,grd_mobile
                    ,grd_updated            ,grd_gisdatafilter)
  VALUES(sDesc,sGridid,sQuery,sFunction
        ,nfieldid1||','||nfieldid3
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39
        ,NULL,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL,sFunction
        ,0          ,'-'     ,NULL    ,NULL    ,'+'
        ,2          ,NULL    ,'+'     ,'-'     ,NULL
        ,NULL       ,'-'     ,'+'     ,'+'     ,'-'
        ,SYSDATE    ,'-');
  --creating Gridfields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid1    ,sGridid,sFunction, 4  ,'TEXT'     ,'csmcode'                ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid2    ,sGridid,sFunction, 5  ,'TEXT'     ,'csmdesc'                ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid3    ,sGridid,sFunction, 6  ,'TEXT'     ,'csmorg'                 ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid4    ,sGridid,sFunction, 7  ,'TEXT'     ,'csmobject'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid5    ,sGridid,sFunction, 8  ,'TEXT'     ,'csmudfchar21'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid6    ,sGridid,sFunction, 9  ,'TEXT'     ,'csmudfchar23'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid9    ,sGridid,sFunction, 10 ,'TEXT'     ,'csmudfchar03'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid10   ,sGridid,sFunction, 11 ,'TEXT'     ,'csmstatus'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid11   ,sGridid,sFunction, 12 ,'TEXT'     ,'csmcreated'             ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid12   ,sGridid,sFunction, 13 ,'TEXT'     ,'csmudfchar07'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid13   ,sGridid,sFunction, 14 ,'TEXT'     ,'csmudfchar08'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid14   ,sGridid,sFunction, 15 ,'TEXT'     ,'csmudfchar09'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid15   ,sGridid,sFunction, 16 ,'TEXT'     ,'csmudfchar10'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid16   ,sGridid,sFunction, 17 ,'TEXT'     ,'csmarea'                ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid17   ,sGridid,sFunction, 18 ,'TEXT'     ,'csmudfchar05'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid18   ,sGridid,sFunction, 19 ,'TEXT'     ,'csmudfchar20'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid19   ,sGridid,sFunction, 20 ,'TEXT'     ,'csmudfdate01'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid20   ,sGridid,sFunction, 21 ,'TEXT'     ,'csmudfchar25'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid21   ,sGridid,sFunction, 22 ,'TEXT'     ,'csmudfchar26'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid22   ,sGridid,sFunction, 23 ,'TEXT'     ,'csmudfchar24'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid23   ,sGridid,sFunction, 24 ,'CHECKBOX' ,'csmudfchkbox01'         ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid24   ,sGridid,sFunction, 25 ,'TEXT'     ,'csmudfchar04'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid25   ,sGridid,sFunction, 26 ,'TEXT'     ,'csmudfnum01'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid26   ,sGridid,sFunction, 27 ,'TEXT'     ,'csmudfnum02'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid27   ,sGridid,sFunction, 28 ,'TEXT'     ,'csmudfnum03'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid28   ,sGridid,sFunction, 29 ,'TEXT'     ,'csmsum'                 ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid29   ,sGridid,sFunction, 30 ,'TEXT'     ,'csmudfchar04desc'       ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid30   ,sGridid,sFunction, 31 ,'TEXT'     ,'csmudfdate03'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid31   ,sGridid,sFunction, 32 ,'TEXT'     ,'csmudfchar19'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid32   ,sGridid,sFunction, 33 ,'TEXT'     ,'csmevomaterial'         ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid33   ,sGridid,sFunction, 34 ,'TEXT'     ,'csmevoownlabor'         ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid34   ,sGridid,sFunction, 35 ,'TEXT'     ,'csmevolabor'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid35   ,sGridid,sFunction, 36 ,'TEXT'     ,'csmextcost'             ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid36   ,sGridid,sFunction, 37 ,'TEXT'     ,'csmcompleteddate'       ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid37   ,sGridid,sFunction, 38 ,'TEXT'     ,'csmkostentotaal'        ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid38   ,sGridid,sFunction, 39 ,'TEXT'     ,'csmudfnum04'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid39   ,sGridid,sFunction, 40 ,'TEXT'     ,'csmdamagecost'          ,0,'n',1,'n');

  --find sequence for Dataspy
  r5o7.o7maxseq (sDataspyid ,'DDS',1,sCheckresult);
  --creating Dataspy - Scripts Log
  INSERT INTO r5dddataspy (dds_ddspyname,dds_ddspyid,dds_scope,dds_organization,dds_filterstrxml,dds_sortstrxml,dds_updatecount,dds_owner,dds_gridid,dds_type,dds_defaultflag,dds_securitydataspy,dds_mekey,dds_globaldataspy)
  VALUES('All Records',sDataspyid,'+','*','<FILTERABLE/>','<SORTABLE/>',0,'R5',sGridid,'SD','+','-','YN','+');
  UPDATE r5dddataspy
  SET   dds_autorun    = '+'
       ,dds_displayrow = 10
       ,dds_clientrows = 30
  WHERE dds_ddspyid    = sDataspyid;
  --creating Query Fields
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid1   ,'100'  ,1  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid2   ,'100'  ,2  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid3   ,'100'  ,3  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid4   ,'100'  ,4  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid5   ,'100'  ,5  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid6   ,'100'  ,6  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid9   ,'100'  ,7  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid10  ,'100'  ,8  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid11  ,'100'  ,9  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid12  ,'100'  ,10 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid13  ,'100'  ,11 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid14  ,'100'  ,12 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid15  ,'100'  ,13 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid16  ,'100'  ,14 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid17  ,'100'  ,15 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid18  ,'100'  ,16 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid19  ,'100'  ,17 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid20  ,'100'  ,18 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid21  ,'100'  ,19 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid22  ,'100'  ,20 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid23  ,'100'  ,21 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid24  ,'100'  ,23 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid25  ,'100'  ,25 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid26  ,'100'  ,26 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid27  ,'100'  ,27 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid28  ,'100'  ,28 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid29  ,'100'  ,24 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid30  ,'100'  ,36 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid31  ,'100'  ,37 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid32  ,'100'  ,29 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid33  ,'100'  ,30 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid34  ,'100'  ,31 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid35  ,'100'  ,33 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid36  ,'100'  ,22 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid37  ,'100'  ,32 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid38  ,'100'  ,34 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid39  ,'100'  ,35 ,0,'LIST',SYSDATE);
  --creating Boilertexts
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,1 ,100,0,0,lin_code, 'List View'                 ,'TB',1 ,'LST',NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 1  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,2 ,100,0,0,lin_code,  sDesc                      ,'F' ,1 ,'UDG_HDRLABEL'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 2  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,3 ,100,0,0,lin_code, 'All Records'               ,'F' ,1 ,'DSNAME'             ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 3  AND bot_lang = lin_code);
  
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,4 ,100,0,0,lin_code, 'Schadenummer Qbuzz'        ,'F' ,1 ,'CSMCODE'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 4  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,5 ,100,0,0,lin_code, 'Omschrijving Case'         ,'F' ,1 ,'CSMDESC'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 5  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,6 ,100,0,0,lin_code, 'Consessie'                 ,'F' ,1 ,'CSMORG'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 6  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,7 ,100,0,0,lin_code, 'Bus'     ,'F' ,1           ,'CSMOBJECT'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 7  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,8 ,100,0,0,lin_code, 'Schuldvraag'               ,'F' ,1 ,'CSMUDFCHAR21'   ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 8  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,9 ,100,0,0,lin_code, 'Schadenummer'              ,'F' ,1 ,'CSMUDFCHAR23' ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 9  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,10,100,0,0,lin_code, 'Status werkplaats (WO?)'   ,'F' ,1 ,'CSMUDFCHAR03'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 10 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,11,100,0,0,lin_code, 'Status schadeafhandeling'  ,'F' ,1 ,'CSMSTATUS'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 11 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,12,100,0,0,lin_code, 'Schade datum'              ,'F' ,1 ,'CSMCREATED'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 12 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,13,100,0,0,lin_code, 'Chauffeur'                 ,'F' ,1 ,'CSMUDFCHAR07'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 13 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,14,100,0,0,lin_code, 'Standplaats chauffeur'     ,'F' ,1 ,'CSMUDFCHAR08'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 14 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,15,100,0,0,lin_code, 'Teammanager'               ,'F' ,1 ,'CSMUDFCHAR09'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 15 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,16,100,0,0,lin_code, 'Naam Teammanager'          ,'F' ,1 ,'CSMUDFCHAR10'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 16 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,17,100,0,0,lin_code, 'Straat'                    ,'F' ,1 ,'CSMAREA'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 17 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,18,100,0,0,lin_code, 'Plaats'                    ,'F' ,1 ,'CSMUDFCHAR05'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 18 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,19,100,0,0,lin_code, 'Verzekeraar'               ,'F' ,1 ,'CSMUDFCHAR20'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 19 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,20,100,0,0,lin_code, 'Inleverdatum schadeformulier'          ,'F' ,1 ,'CSMUDFDATE01'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 20 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,21,100,0,0,lin_code, 'Naam Tegenpartij'          ,'F' ,1 ,'CSMUDFCHAR25'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 21 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,22,100,0,0,lin_code, 'Busnummer/ Kenteken TP'    ,'F' ,1 ,'CSMUDFCHAR26'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 22 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,23,100,0,0,lin_code, 'Extra informatie TP'       ,'F' ,1 ,'CSMUDFCHAR24'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 23 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,24,100,0,0,lin_code, 'Letselschade'              ,'F' ,1 ,'CSMUDFCHKBOX01'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 24 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,25,100,0,0,lin_code, 'Oorzaakcode'               ,'F' ,1 ,'CSMUDFCHAR04'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 25 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,26,100,0,0,lin_code, 'Geschatte schadekosten BUS'  ,'F' ,1 ,'CSMUDFCHAR11'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 26 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,27,100,0,0,lin_code, 'Geschatte schadekosten Extern'          ,'F' ,1 ,'CSMUDFCHAR12'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 27 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,28,100,0,0,lin_code, 'Geschatte schadekosten TP'          ,'F' ,1 ,'CSMUDFCHAR13'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 28 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,29,100,0,0,lin_code, 'Geschat totaal'            ,'F' ,1 ,'CSMSUM'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 29 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,30,100,0,0,lin_code, 'Omschrijving oorzaak'       ,'F' ,1 ,'CSMUDFCHAR04DESC'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 30 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,31,100,0,0,lin_code, 'Calculatie opgevraagd'     ,'F' ,1 ,'CSMUDFDATE03'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 31 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,32,100,0,0,lin_code, 'Bedrag geclaimed'          ,'F' ,1 ,'CSMUDFCHAR19'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 32 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,33,100,0,0,lin_code, 'Materiaalkosten'          ,'F' ,1 ,'CSMEVOMATERIAL'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 33 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,34,100,0,0,lin_code, 'Loonkosten'               ,'F' ,1 ,'CSMEVOOWNLABOR'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 34 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,35,100,0,0,lin_code, 'Uitbesteed'               ,'F' ,1 ,'CSMEVOLABOR'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 35 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,36,100,0,0,lin_code, 'Betaald TP'              ,'F' ,1 ,'CSMEXTCOST'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 36 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,37,100,0,0,lin_code, 'Datum voltooid'              ,'F' ,1 ,'CSMCOMPLETEDDATE'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 37 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,38,100,0,0,lin_code, 'Kostentotaal '               ,'F' ,1 ,'CSMKOSTENTOTAAL'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 38 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,39,100,0,0,lin_code, 'Verhaald/ Ontvangen'         ,'F' ,1 ,'CSMUDFNUM04'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 39 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,40,100,0,0,lin_code, 'Schadekosten Qbuzz'          ,'F' ,1 ,'CSMDAMAGECOST'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 40 AND bot_lang = lin_code);
END;
/
COMMIT;

PROMPT ...Created grid NUCOSO
PROMPT

PROMPT ...Start of Boierlexts (EN): SCHADE

UPDATE r5boilertexts SET bot_text = 'Damage' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PAGETITLE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Damage';
UPDATE r5boilertexts SET bot_text = 'List View' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'List View';
UPDATE r5boilertexts SET bot_text = 'Record View' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HDR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Record View';
UPDATE r5boilertexts SET bot_text = 'Comments' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Comments';
UPDATE r5boilertexts SET bot_text = 'Documents' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Documents';
UPDATE r5boilertexts SET bot_text = 'Translations' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translations';
UPDATE r5boilertexts SET bot_text = 'Concessie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ORGANIZATION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Concessie';
UPDATE r5boilertexts SET bot_text = 'schadenummer qbuzz' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'schadenummer qbuzz';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'object/ busnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'object/ busnummer';
UPDATE r5boilertexts SET bot_text = 'Equipment Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment Description';
UPDATE r5boilertexts SET bot_text = 'Equipment Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment Org.';
UPDATE r5boilertexts SET bot_text = 'Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASETYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Type';
UPDATE r5boilertexts SET bot_text = 'Department' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DEPARTMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Department';
UPDATE r5boilertexts SET bot_text = 'status schadeafhandeling' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STATUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'status schadeafhandeling';
UPDATE r5boilertexts SET bot_text = 'eSignature' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATURE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'eSignature';
UPDATE r5boilertexts SET bot_text = 'eSignature Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATUREDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'eSignature Date';
UPDATE r5boilertexts SET bot_text = 'eSignature Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATURETYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'eSignature Type';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'datum schade melding' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'datum schade melding';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Case Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case Details';
UPDATE r5boilertexts SET bot_text = 'Class' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CLASS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Class';
UPDATE r5boilertexts SET bot_text = 'Class Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Class Org.';
UPDATE r5boilertexts SET bot_text = 'Location' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Location';
UPDATE r5boilertexts SET bot_text = 'Location Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Location Description';
UPDATE r5boilertexts SET bot_text = 'Location Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATIONORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Location Org.';
UPDATE r5boilertexts SET bot_text = 'Service Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Code';
UPDATE r5boilertexts SET bot_text = 'Service Code Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Code Description';
UPDATE r5boilertexts SET bot_text = 'Service Code Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODEORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Code Org.';
UPDATE r5boilertexts SET bot_text = 'Straatnaam:' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AREA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Straatnaam:';
UPDATE r5boilertexts SET bot_text = 'Work Address' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKADDRESS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Work Address';
UPDATE r5boilertexts SET bot_text = 'Priority' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Priority';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Event Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Start Date';
UPDATE r5boilertexts SET bot_text = 'Event End Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event End Date';
UPDATE r5boilertexts SET bot_text = 'Regulatory' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REGULATORY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Regulatory';
UPDATE r5boilertexts SET bot_text = 'Follow-up Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPREQUIRED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Follow-up Required';
UPDATE r5boilertexts SET bot_text = 'Hazardous Material' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HAZARDOUSMATERIAL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Hazardous Material';
UPDATE r5boilertexts SET bot_text = 'Total Estimated Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALESTIMATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Estimated Costs';
UPDATE r5boilertexts SET bot_text = 'Total Estimated Costs Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALESTIMATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Estimated Costs Currency';
UPDATE r5boilertexts SET bot_text = 'Total Calculated Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Calculated Costs';
UPDATE r5boilertexts SET bot_text = 'Total Calculated Costs Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCALCULATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Calculated Costs Currency';
UPDATE r5boilertexts SET bot_text = 'Calculated Costs Refresh Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REFRESHCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Calculated Costs Refresh Required';
UPDATE r5boilertexts SET bot_text = 'Parent' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PARENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Parent';
UPDATE r5boilertexts SET bot_text = 'Werkordernummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKORDER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Werkordernummer';
UPDATE r5boilertexts SET bot_text = 'Permit to Work' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PERMITTOWORK' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Permit to Work';
UPDATE r5boilertexts SET bot_text = 'Shift' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SHIFT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Shift';
UPDATE r5boilertexts SET bot_text = 'Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROJECT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Project';
UPDATE r5boilertexts SET bot_text = 'Campaign' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CAMPAIGN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Campaign';
UPDATE r5boilertexts SET bot_text = 'Linear Reference Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LINEARREFERENCEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Linear Reference Details';
UPDATE r5boilertexts SET bot_text = 'From Point' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'From Point';
UPDATE r5boilertexts SET bot_text = 'From Point UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTUOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'From Point UOM';
UPDATE r5boilertexts SET bot_text = 'Ref. Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Ref. Description';
UPDATE r5boilertexts SET bot_text = 'Geographical Ref.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Geographical Ref.';
UPDATE r5boilertexts SET bot_text = 'To Point' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point';
UPDATE r5boilertexts SET bot_text = 'To Point UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTUOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point UOM';
UPDATE r5boilertexts SET bot_text = 'To Point Reference Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point Reference Description';
UPDATE r5boilertexts SET bot_text = 'To Point Geographical Reference' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point Geographical Reference';
UPDATE r5boilertexts SET bot_text = 'Inspection Direction' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INSPECTIONDIRECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Inspection Direction';
UPDATE r5boilertexts SET bot_text = 'Flow' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FLOW' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Flow';
UPDATE r5boilertexts SET bot_text = 'Tracking Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRACKINGDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tracking Details';
UPDATE r5boilertexts SET bot_text = 'Requested By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQUESTEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Requested By';
UPDATE r5boilertexts SET bot_text = 'Date Requested' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATEREQUESTED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Requested';
UPDATE r5boilertexts SET bot_text = 'Responsible' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible';
UPDATE r5boilertexts SET bot_text = 'Responsible Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLENAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible Name';
UPDATE r5boilertexts SET bot_text = 'Responsible E-mail' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLEEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible E-mail';
UPDATE r5boilertexts SET bot_text = 'Prepared By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Prepared By';
UPDATE r5boilertexts SET bot_text = 'Prepared By Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Prepared By Name';
UPDATE r5boilertexts SET bot_text = 'Prepared By E-mail' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBYEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Prepared By E-mail';
UPDATE r5boilertexts SET bot_text = 'Assigned To' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To';
UPDATE r5boilertexts SET bot_text = 'Assigned To Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTONAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To Name';
UPDATE r5boilertexts SET bot_text = 'Assigned To E-mail' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTOEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To E-mail';
UPDATE r5boilertexts SET bot_text = 'Sched. Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SCHEDSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sched. Start Date';
UPDATE r5boilertexts SET bot_text = 'Sched. End Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SCHEDENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sched. End Date';
UPDATE r5boilertexts SET bot_text = 'Req. Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Req. Start Date';
UPDATE r5boilertexts SET bot_text = 'Req. End Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Req. End Date';
UPDATE r5boilertexts SET bot_text = 'Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Start Date';
UPDATE r5boilertexts SET bot_text = 'Date Completed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Completed';
UPDATE r5boilertexts SET bot_text = 'Service Request' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUEST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Request';
UPDATE r5boilertexts SET bot_text = 'Service Request Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUESTORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Request Org.';
UPDATE r5boilertexts SET bot_text = 'Service Request Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUESTSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Service Request Status';
UPDATE r5boilertexts SET bot_text = 'Source Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SOURCETYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Source Type';
UPDATE r5boilertexts SET bot_text = 'Follow-up WO Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPWODETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Follow-up WO Details';
UPDATE r5boilertexts SET bot_text = 'WO Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Description';
UPDATE r5boilertexts SET bot_text = 'Standard WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Standard WO';
UPDATE r5boilertexts SET bot_text = 'WO Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Type';
UPDATE r5boilertexts SET bot_text = 'WO Class' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOCLASS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Class';
UPDATE r5boilertexts SET bot_text = 'WO Class Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOCLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Class Org.';
UPDATE r5boilertexts SET bot_text = 'WO Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Status';
UPDATE r5boilertexts SET bot_text = 'WO Priority' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOPRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Priority';
UPDATE r5boilertexts SET bot_text = 'Task Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TASKPLAN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Plan';
UPDATE r5boilertexts SET bot_text = 'Job Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'JOBPLAN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Job Plan';
UPDATE r5boilertexts SET bot_text = 'Trade' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRADE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Trade';
UPDATE r5boilertexts SET bot_text = 'Estimated Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESTHOURS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Estimated Hours';
UPDATE r5boilertexts SET bot_text = 'People Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PPLREQ' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'People Required';
UPDATE r5boilertexts SET bot_text = 'Follow-up WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Follow-up WO';
UPDATE r5boilertexts SET bot_text = 'Create Follow-up WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CREATEFOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Create Follow-up WO';
UPDATE r5boilertexts SET bot_text = 'Refresh Cost Data' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REFRESHCOSTDATA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Refresh Cost Data';
UPDATE r5boilertexts SET bot_text = 'Translate WO Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRANSLATEWODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate WO Description';
UPDATE r5boilertexts SET bot_text = 'Add Document' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_ADDNEW' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Document';
UPDATE r5boilertexts SET bot_text = 'Create/Upload Document' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_CREATEORUPLOADDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Create/Upload Document';
UPDATE r5boilertexts SET bot_text = 'Documents' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_DOCDETAILS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Documents';
UPDATE r5boilertexts SET bot_text = 'System Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SYSTEMSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'System Status';
UPDATE r5boilertexts SET bot_text = 'Kenteken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Kenteken';
UPDATE r5boilertexts SET bot_text = 'incident nummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'incident nummer';
UPDATE r5boilertexts SET bot_text = 'status werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'status werkorder';
UPDATE r5boilertexts SET bot_text = 'oorzaak omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'oorzaak omschrijving';
UPDATE r5boilertexts SET bot_text = 'Plaats:' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Plaats:';
UPDATE r5boilertexts SET bot_text = 'Chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Chauffeur';
UPDATE r5boilertexts SET bot_text = 'naam chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'naam chauffeur';
UPDATE r5boilertexts SET bot_text = 'standplaats/vestiging chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'standplaats/vestiging chauffeur';
UPDATE r5boilertexts SET bot_text = 'Teammanager' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Teammanager';
UPDATE r5boilertexts SET bot_text = 'Naam teammanager' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Naam teammanager';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'Afsleepkosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Afsleepkosten';
UPDATE r5boilertexts SET bot_text = 'Schade laadinfra' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Schade laadinfra';
UPDATE r5boilertexts SET bot_text = 'Schade gebouwen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Schade gebouwen';
UPDATE r5boilertexts SET bot_text = 'Beelden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Beelden';
UPDATE r5boilertexts SET bot_text = 'Calculatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Calculatie';
UPDATE r5boilertexts SET bot_text = 'bedrag geclaimed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'bedrag geclaimed';
UPDATE r5boilertexts SET bot_text = 'Verzekeraar' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Verzekeraar';
UPDATE r5boilertexts SET bot_text = 'Schuld/aansprakelijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Schuld/aansprakelijkheid';
UPDATE r5boilertexts SET bot_text = 'Verhaalbaar' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Verhaalbaar';
UPDATE r5boilertexts SET bot_text = 'Schadenummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Schadenummer';
UPDATE r5boilertexts SET bot_text = 'exta informatie veld' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'exta informatie veld';
UPDATE r5boilertexts SET bot_text = 'Naam tegenpartij' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Naam tegenpartij';
UPDATE r5boilertexts SET bot_text = 'Kenteken TP' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Kenteken TP';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'Lijnnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Lijnnummer';
UPDATE r5boilertexts SET bot_text = 'Letselschade' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Letselschade';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'inleverdatum schadeformulier' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'inleverdatum schadeformulier';
UPDATE r5boilertexts SET bot_text = 'brief naar chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'brief naar chauffeur';
UPDATE r5boilertexts SET bot_text = 'calculatie opgevraagd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'calculatie opgevraagd';
UPDATE r5boilertexts SET bot_text = 'Beelden opgevraagd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Beelden opgevraagd';
UPDATE r5boilertexts SET bot_text = 'schade datum en tijd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'schade datum en tijd';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten reparatie intern' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'geschatte kosten reparatie intern';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten reparatie extern' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'geschatte kosten reparatie extern';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten tegenpartij' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'geschatte kosten tegenpartij';
UPDATE r5boilertexts SET bot_text = 'Verhaald/ Ontvangen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Verhaald/ Ontvangen';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Details';
UPDATE r5boilertexts SET bot_text = 'Event Log' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Log';
UPDATE r5boilertexts SET bot_text = 'Event Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Details';
UPDATE r5boilertexts SET bot_text = 'Event Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Type';
UPDATE r5boilertexts SET bot_text = 'Date/Time (Local)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTLOGDATETIME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date/Time (Local)';
UPDATE r5boilertexts SET bot_text = 'Task No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_TASKNO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task No.';
UPDATE r5boilertexts SET bot_text = 'Field' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_FIELD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Field';
UPDATE r5boilertexts SET bot_text = 'From Value' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_FROMVALUEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'From Value';
UPDATE r5boilertexts SET bot_text = 'To Value' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_TOVALUEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Value';
UPDATE r5boilertexts SET bot_text = 'User' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User';
UPDATE r5boilertexts SET bot_text = 'User Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Name';
UPDATE r5boilertexts SET bot_text = 'eSignature Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_ESIGNATURETYPEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'eSignature Type';
UPDATE r5boilertexts SET bot_text = 'Notes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_NOTES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Notes';
UPDATE r5boilertexts SET bot_text = 'Audit Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_AUDITRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Audit Record';
UPDATE r5boilertexts SET bot_text = 'Insert' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_INSERTRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Insert';
UPDATE r5boilertexts SET bot_text = 'Update' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UPDATERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Update';
UPDATE r5boilertexts SET bot_text = 'Delete' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'User Defined Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Fields';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'Add Event' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_ADDEVENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Event';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Priority Icon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PRIORITYICON' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Priority Icon';
UPDATE r5boilertexts SET bot_text = 'Custom Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CUSTOMFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Custom Fields';
UPDATE r5boilertexts SET bot_text = 'Tasks' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tasks';
UPDATE r5boilertexts SET bot_text = 'Task Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Details';
UPDATE r5boilertexts SET bot_text = 'Task code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKNO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task code';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Task sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task sequence';
UPDATE r5boilertexts SET bot_text = 'Step' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STEP' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Step';
UPDATE r5boilertexts SET bot_text = 'Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Note';
UPDATE r5boilertexts SET bot_text = 'Priority' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Priority';
UPDATE r5boilertexts SET bot_text = 'Task Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLANFORCHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Plan';
UPDATE r5boilertexts SET bot_text = 'Task Plan for Checklist Revision' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLANREVISIONFORCHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Plan for Checklist Revision';
UPDATE r5boilertexts SET bot_text = 'Estimated Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTIMATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Estimated Costs';
UPDATE r5boilertexts SET bot_text = 'Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTIMATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Currency';
UPDATE r5boilertexts SET bot_text = 'Calculated Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Calculated Costs';
UPDATE r5boilertexts SET bot_text = 'Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CALCULATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Currency';
UPDATE r5boilertexts SET bot_text = 'Calculated Costs Refresh Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REFRESHCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Calculated Costs Refresh Required';
UPDATE r5boilertexts SET bot_text = 'From Service Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FROMSERVICECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'From Service Code';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Tracking Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRACKINGDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tracking Details';
UPDATE r5boilertexts SET bot_text = 'Responsible Role' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLEROLE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible Role';
UPDATE r5boilertexts SET bot_text = 'Responsible' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible';
UPDATE r5boilertexts SET bot_text = 'Responsible Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLENAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible Name';
UPDATE r5boilertexts SET bot_text = 'Responsible E-mail' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLEEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Responsible E-mail';
UPDATE r5boilertexts SET bot_text = 'Assigned To Role' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTOROLE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To Role';
UPDATE r5boilertexts SET bot_text = 'Assigned To' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To';
UPDATE r5boilertexts SET bot_text = 'Assigned To Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTONAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To Name';
UPDATE r5boilertexts SET bot_text = 'Assigned To E-mail' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTOEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Assigned To E-mail';
UPDATE r5boilertexts SET bot_text = 'Planned Duration' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PLANNEDDURATION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Planned Duration';
UPDATE r5boilertexts SET bot_text = 'Duration Unit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DURATIONUNIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Duration Unit';
UPDATE r5boilertexts SET bot_text = 'Sched. Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SCHEDSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sched. Start Date';
UPDATE r5boilertexts SET bot_text = 'Sched. End Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SCHEDENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sched. End Date';
UPDATE r5boilertexts SET bot_text = 'Req. Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REQSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Req. Start Date';
UPDATE r5boilertexts SET bot_text = 'Req. End Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REQENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Req. End Date';
UPDATE r5boilertexts SET bot_text = 'Firm Dates' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FIRMDATES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Firm Dates';
UPDATE r5boilertexts SET bot_text = 'Ready to Start' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_READYTOSTART' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Ready to Start';
UPDATE r5boilertexts SET bot_text = 'Started' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STARTED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Started';
UPDATE r5boilertexts SET bot_text = 'Start Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Start Date';
UPDATE r5boilertexts SET bot_text = 'Completed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Completed';
UPDATE r5boilertexts SET bot_text = 'Percent Complete' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PERCENTCOMPLETE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Percent Complete';
UPDATE r5boilertexts SET bot_text = 'Date Completed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATECOMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Completed';
UPDATE r5boilertexts SET bot_text = 'Notify Complete' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTIFYCOMPLETE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Notify Complete';
UPDATE r5boilertexts SET bot_text = 'Notify Ready to Start' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTIFYREADYTOSTART' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Notify Ready to Start';
UPDATE r5boilertexts SET bot_text = 'Follow-up WO Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FOLLOWUPWODETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Follow-up WO Details';
UPDATE r5boilertexts SET bot_text = 'WO Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Description';
UPDATE r5boilertexts SET bot_text = 'Standard WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Standard WO';
UPDATE r5boilertexts SET bot_text = 'WO Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Type';
UPDATE r5boilertexts SET bot_text = 'WO Class' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOCLASS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Class';
UPDATE r5boilertexts SET bot_text = 'WO Class Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOCLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Class Org.';
UPDATE r5boilertexts SET bot_text = 'WO Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Status';
UPDATE r5boilertexts SET bot_text = 'WO Priority' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOPRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'WO Priority';
UPDATE r5boilertexts SET bot_text = 'Task Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLAN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Plan';
UPDATE r5boilertexts SET bot_text = 'Job Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_JOBPLAN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Job Plan';
UPDATE r5boilertexts SET bot_text = 'Trade' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRADE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Trade';
UPDATE r5boilertexts SET bot_text = 'Estimated Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTHOURS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Estimated Hours';
UPDATE r5boilertexts SET bot_text = 'People Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PPLREQ' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'People Required';
UPDATE r5boilertexts SET bot_text = 'Follow-up WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Follow-up WO';
UPDATE r5boilertexts SET bot_text = 'User Defined Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Fields';
UPDATE r5boilertexts SET bot_text = 'Add Task' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDTASK' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Task';
UPDATE r5boilertexts SET bot_text = 'Delete Task' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DELETETASK' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete Task';
UPDATE r5boilertexts SET bot_text = 'Add/Edit Comments' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDEDITCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add/Edit Comments';
UPDATE r5boilertexts SET bot_text = 'Add/Edit Documents' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDEDITDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add/Edit Documents';
UPDATE r5boilertexts SET bot_text = 'Create Follow-up WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CREATEFOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Create Follow-up WO';
UPDATE r5boilertexts SET bot_text = 'Refresh Cost Data' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REFRESHCOSTDATA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Refresh Cost Data';
UPDATE r5boilertexts SET bot_text = 'Translate Task' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRANSLATETASK' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate Task';
UPDATE r5boilertexts SET bot_text = 'Translate WO Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRANSLATEWODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate WO Description';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Checklist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Checklist';
UPDATE r5boilertexts SET bot_text = 'Checklist Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Checklist Details';
UPDATE r5boilertexts SET bot_text = 'Task Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CASEMANAGEMENTTASKSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Task Sequence';
UPDATE r5boilertexts SET bot_text = 'Performed By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Performed By';
UPDATE r5boilertexts SET bot_text = 'Date Performed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEPERFORMED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Performed';
UPDATE r5boilertexts SET bot_text = 'Performed Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Performed Type';
UPDATE r5boilertexts SET bot_text = 'Reviewed By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reviewed By';
UPDATE r5boilertexts SET bot_text = 'Date Reviewed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEREVIEWED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Reviewed';
UPDATE r5boilertexts SET bot_text = 'Reviewed Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reviewed Type';
UPDATE r5boilertexts SET bot_text = 'Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sequence';
UPDATE r5boilertexts SET bot_text = 'Occurrence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_OCCURRENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Occurrence';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Completed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Completed';
UPDATE r5boilertexts SET bot_text = 'Yes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_YES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Yes';
UPDATE r5boilertexts SET bot_text = 'No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_NO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'No';
UPDATE r5boilertexts SET bot_text = 'Finding' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_FINDING' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Finding';
UPDATE r5boilertexts SET bot_text = 'Value' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VALUE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Value';
UPDATE r5boilertexts SET bot_text = 'UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'UOM';
UPDATE r5boilertexts SET bot_text = 'Notes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_NOTES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Notes';
UPDATE r5boilertexts SET bot_text = 'Final Occ.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_FINALOCCURRENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Final Occ.';
UPDATE r5boilertexts SET bot_text = 'Condition' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CONDITIONDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Condition';
UPDATE r5boilertexts SET bot_text = 'Required' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REQUIREDTOCLOSEDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Required';
UPDATE r5boilertexts SET bot_text = 'Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Type';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Error Message' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_MESSAGECOLUMN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Error Message';
UPDATE r5boilertexts SET bot_text = 'View Comments' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'View Comments';
UPDATE r5boilertexts SET bot_text = 'View Documents' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'View Documents';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Result' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_RESULT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Result';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_RECORDID' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Year(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'YEARS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Year(s)';
UPDATE r5boilertexts SET bot_text = 'Month(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MONTHS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Month(s)';
UPDATE r5boilertexts SET bot_text = 'Week(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEEKS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Week(s)';
UPDATE r5boilertexts SET bot_text = 'Day(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DAYS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Day(s)';
UPDATE r5boilertexts SET bot_text = 'Hour(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HOURS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Hour(s)';
UPDATE r5boilertexts SET bot_text = 'Minute(s)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MINUTES' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'EN' and  bot_text <> 'Minute(s)';
UPDATE r5boilertexts SET bot_text = 'eRecords' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ERC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'eRecords';
UPDATE r5boilertexts SET bot_text = 'Enter your electronic signature credentials to sign the case.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'POPUP_CAPTION_SIGNOFF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Enter your electronic signature credentials to sign the case.';
UPDATE r5boilertexts SET bot_text = 'View Checklist Item Comments' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWCHECKLISTITEMCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'View Checklist Item Comments';
UPDATE r5boilertexts SET bot_text = 'Regulated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REGULATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Regulated';
UPDATE r5boilertexts SET bot_text = 'Reference' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REFERENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reference';
UPDATE r5boilertexts SET bot_text = 'Color' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COLOR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Color';
UPDATE r5boilertexts SET bot_text = 'Comments' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Comments';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Add/Edit Checklist Item Documents' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_ADDEDITCHECKLISTDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add/Edit Checklist Item Documents';
UPDATE r5boilertexts SET bot_text = 'Date/Time (Server)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATETIMESERVER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date/Time (Server)';
UPDATE r5boilertexts SET bot_text = 'Vrije tekst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNOTE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Vrije tekst';
UPDATE r5boilertexts SET bot_text = 'User Defined Note 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNOTE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Note 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Note 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNOTE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Note 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Note 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNOTE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Note 02';
UPDATE r5boilertexts SET bot_text = 'To Point Geographical Reference' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point Geographical Reference';
UPDATE r5boilertexts SET bot_text = 'Geographical Ref.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Geographical Ref.';
UPDATE r5boilertexts SET bot_text = 'Ref. Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Ref. Description';
UPDATE r5boilertexts SET bot_text = 'To Point Reference Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'To Point Reference Description';
UPDATE r5boilertexts SET bot_text = 'Performed By Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Performed By Name';
UPDATE r5boilertexts SET bot_text = 'Reviewed By Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reviewed By Name';
UPDATE r5boilertexts SET bot_text = 'Updated By Name' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UPDATEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By Name';
UPDATE r5boilertexts SET bot_text = 'Upload Document' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_UPLOADDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Upload Document';
UPDATE r5boilertexts SET bot_text = 'Create Document' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_CREATEDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Create Document';
UPDATE r5boilertexts SET bot_text = 'Checklist Approval' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTAPPROVAL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Checklist Approval';
UPDATE r5boilertexts SET bot_text = 'Checklist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Checklist';
UPDATE r5boilertexts SET bot_text = 'Checklist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Checklist';
UPDATE r5boilertexts SET bot_text = 'Root Cause Analysis Details ' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ROOTCAUSEANALYSISSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Analysis Details ';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMECOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost Currency';
UPDATE r5boilertexts SET bot_text = 'Downtime Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMEHOURS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Hours';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = 'Total Cost Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Cost Currency';
UPDATE r5boilertexts SET bot_text = 'Lost Productivity Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOSTPRODUCTIVITYHOURS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Lost Productivity Hours';
UPDATE r5boilertexts SET bot_text = 'Problem Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROBLEMDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Problem Description';
UPDATE r5boilertexts SET bot_text = 'What Happened' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHATHAPPENED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'What Happened';
UPDATE r5boilertexts SET bot_text = 'Why 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 1';
UPDATE r5boilertexts SET bot_text = 'Why 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY2' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 2';
UPDATE r5boilertexts SET bot_text = 'Why 3' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY3' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 3';
UPDATE r5boilertexts SET bot_text = 'Why 4' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY4' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 4';
UPDATE r5boilertexts SET bot_text = 'Why 5' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY5' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 5';
UPDATE r5boilertexts SET bot_text = 'Solution' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SOLUTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Solution';
UPDATE r5boilertexts SET bot_text = 'Root Cause Work Order Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ROOTCAUSEWORKORDERSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Work Order Details';
UPDATE r5boilertexts SET bot_text = 'Problem Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Problem Code';
UPDATE r5boilertexts SET bot_text = 'Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Code';
UPDATE r5boilertexts SET bot_text = 'Action Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Action Code';
UPDATE r5boilertexts SET bot_text = 'Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cause Code';
UPDATE r5boilertexts SET bot_text = 'Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Symptom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Symptom';
UPDATE r5boilertexts SET bot_text = 'Tactical Cause' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tactical Cause';
UPDATE r5boilertexts SET bot_text = 'Human Factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Factor';
UPDATE r5boilertexts SET bot_text = 'Workmanship' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Workmanship';
UPDATE r5boilertexts SET bot_text = 'Human Oversight' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Oversight';
UPDATE r5boilertexts SET bot_text = 'Method of Detection' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Method of Detection';
UPDATE r5boilertexts SET bot_text = 'Equipment Reliability' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTRELIABILITYSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment Reliability';
UPDATE r5boilertexts SET bot_text = 'Event Date ' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTDATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Date ';
UPDATE r5boilertexts SET bot_text = 'Event Number' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Event Number';
UPDATE r5boilertexts SET bot_text = 'Reliability Problem Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYPROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reliability Problem Code';
UPDATE r5boilertexts SET bot_text = 'Reliability Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYFAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reliability Failure Code';
UPDATE r5boilertexts SET bot_text = 'Reliability Action Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reliability Action Code';
UPDATE r5boilertexts SET bot_text = 'Reliability Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Reliability Cause Code';
UPDATE r5boilertexts SET bot_text = 'Days Since Previous Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DAYSSINCEPREVIOUS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Days Since Previous Failure';
UPDATE r5boilertexts SET bot_text = 'Cumulative Days Between Failures' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cumulative Days Between Failures';
UPDATE r5boilertexts SET bot_text = 'Mean Time Between Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MEANTIMEBETWEENFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Mean Time Between Failure';
UPDATE r5boilertexts SET bot_text = 'Minimum Days Between Failures' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MINIMUMDAYSBETWEEN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Minimum Days Between Failures';
UPDATE r5boilertexts SET bot_text = 'Maximum Days Between Failures' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MAXIMUMDAYSBETWEEN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Maximum Days Between Failures';
UPDATE r5boilertexts SET bot_text = 'Standard Deviation' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STANDARDDEVIATION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Standard Deviation';
UPDATE r5boilertexts SET bot_text = 'Average Linear Slope ' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AVERAGELINEARSLOPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Average Linear Slope ';
UPDATE r5boilertexts SET bot_text = 'Last Linear Slope' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LASTLINEARSLOPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Last Linear Slope';
UPDATE r5boilertexts SET bot_text = 'Laplace Test' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LAPLACE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Laplace Test';
UPDATE r5boilertexts SET bot_text = 'Weibull Shape' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSHAPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Shape';
UPDATE r5boilertexts SET bot_text = 'Weibull Scale' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSCALE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Scale';
UPDATE r5boilertexts SET bot_text = 'Weibull Correlation' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLCORRELATION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Correlation';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Slope' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Slope';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Intercept' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTERCEPT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Intercept';
UPDATE r5boilertexts SET bot_text = 'Average Linear Slope Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AVGLINSLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Average Linear Slope Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Last Linear Slope Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LASTLINSLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Last Linear Slope Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Weibull Shape Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSHAPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Shape Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Weibull Scale Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSCALECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Scale Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Weibull Correlation Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLCORRCUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Weibull Correlation Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Slope Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Slope Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Intercept Cumulative Days' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTCUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Intercept Cumulative Days';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Slope IEC' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPEIEC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Slope IEC';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA Intercept IEC' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTIEC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Crow AMSAA Intercept IEC';
UPDATE r5boilertexts SET bot_text = 'Based on Work Order' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'BASEDONWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Based on Work Order';
UPDATE r5boilertexts SET bot_text = 'Root Causes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Causes';
UPDATE r5boilertexts SET bot_text = 'Root Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Code';
UPDATE r5boilertexts SET bot_text = 'Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Note';
UPDATE r5boilertexts SET bot_text = 'Problem Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Problem Code';
UPDATE r5boilertexts SET bot_text = 'Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Code';
UPDATE r5boilertexts SET bot_text = 'Action Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Action Code';
UPDATE r5boilertexts SET bot_text = 'Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cause Code';
UPDATE r5boilertexts SET bot_text = 'Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Symptom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Symptom';
UPDATE r5boilertexts SET bot_text = 'Tactical Cause' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tactical Cause';
UPDATE r5boilertexts SET bot_text = 'Human Factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Factor';
UPDATE r5boilertexts SET bot_text = 'Workmanship' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Workmanship';
UPDATE r5boilertexts SET bot_text = 'Human Oversight' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Oversight';
UPDATE r5boilertexts SET bot_text = 'Method of Detection' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Method of Detection';
UPDATE r5boilertexts SET bot_text = 'Contribution %' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CONTRIBUTIONPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Contribution %';
UPDATE r5boilertexts SET bot_text = 'Copied from Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_COPIEDFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Copied from Case';
UPDATE r5boilertexts SET bot_text = 'Keep Synchronized with Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_KEEPSYNCHRONIZEDWITHCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Keep Synchronized with Case';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Why 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WHY1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 1';
UPDATE r5boilertexts SET bot_text = 'Why 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WHY2' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 2';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'Add Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Record';
UPDATE r5boilertexts SET bot_text = 'Delete Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete Record';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Root Cause Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Details';
UPDATE r5boilertexts SET bot_text = 'Root Cause Analysis Details ' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSEANALYSISSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Analysis Details ';
UPDATE r5boilertexts SET bot_text = 'Copy From Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_COPYFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Copy From Case';
UPDATE r5boilertexts SET bot_text = 'Failure Modes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Modes';
UPDATE r5boilertexts SET bot_text = 'Failure Mode Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode Details';
UPDATE r5boilertexts SET bot_text = 'RCM Level' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RCMLEVEL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Level';
UPDATE r5boilertexts SET bot_text = 'Function Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Function Code';
UPDATE r5boilertexts SET bot_text = 'Existing Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EXISTINGFUNCTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Existing Function';
UPDATE r5boilertexts SET bot_text = 'Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Function';
UPDATE r5boilertexts SET bot_text = 'Function Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Function Sequence';
UPDATE r5boilertexts SET bot_text = 'Function Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONNOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Function Note';
UPDATE r5boilertexts SET bot_text = 'Functional Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Functional Failure Code';
UPDATE r5boilertexts SET bot_text = 'Existing Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EXISTINGFUNCTIONALFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Existing Functional Failure';
UPDATE r5boilertexts SET bot_text = 'Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILUREDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Functional Failure';
UPDATE r5boilertexts SET bot_text = 'Functional Failure Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURESEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Functional Failure Sequence';
UPDATE r5boilertexts SET bot_text = 'Functional Failure Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURENOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Functional Failure Note';
UPDATE r5boilertexts SET bot_text = 'Failure Mode Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode Code';
UPDATE r5boilertexts SET bot_text = 'Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Noun' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_NOUNDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Noun';
UPDATE r5boilertexts SET bot_text = 'Verb' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_VERBDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Verb';
UPDATE r5boilertexts SET bot_text = 'Complement' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_COMPLEMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Complement';
UPDATE r5boilertexts SET bot_text = 'Probability' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBABILITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Probability';
UPDATE r5boilertexts SET bot_text = 'Probability %' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBABILITYPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Probability %';
UPDATE r5boilertexts SET bot_text = 'Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Sequence';
UPDATE r5boilertexts SET bot_text = 'Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Note';
UPDATE r5boilertexts SET bot_text = 'Effect Indicator' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EFFECTINDICATOR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Effect Indicator';
UPDATE r5boilertexts SET bot_text = 'Effect Consequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EFFECTCONSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Effect Consequence';
UPDATE r5boilertexts SET bot_text = 'Standard WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Standard WO';
UPDATE r5boilertexts SET bot_text = 'Downtime Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMEHOURS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Hours';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost';
UPDATE r5boilertexts SET bot_text = 'Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMECOSTCURRENCY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Currency';
UPDATE r5boilertexts SET bot_text = 'Root Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Code';
UPDATE r5boilertexts SET bot_text = 'Risk Priority Number' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RISKPRIORITYNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Risk Priority Number';
UPDATE r5boilertexts SET bot_text = 'Risk Level' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Risk Level';
UPDATE r5boilertexts SET bot_text = 'RCM Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_STREAMPLUSPROJECT_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Project';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Root Cause Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSENOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Note';
UPDATE r5boilertexts SET bot_text = 'Contribution %' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CONTRIBUTIONPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Contribution %';
UPDATE r5boilertexts SET bot_text = 'Problem Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Problem Code';
UPDATE r5boilertexts SET bot_text = 'Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Code';
UPDATE r5boilertexts SET bot_text = 'Action Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Action Code';
UPDATE r5boilertexts SET bot_text = 'Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cause Code';
UPDATE r5boilertexts SET bot_text = 'Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSEFAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Symptom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Symptom';
UPDATE r5boilertexts SET bot_text = 'Tactical Cause' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tactical Cause';
UPDATE r5boilertexts SET bot_text = 'Human Factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Factor';
UPDATE r5boilertexts SET bot_text = 'Workmanship' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Workmanship';
UPDATE r5boilertexts SET bot_text = 'Human Oversight' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Oversight';
UPDATE r5boilertexts SET bot_text = 'Method of Detection' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Method of Detection';
UPDATE r5boilertexts SET bot_text = 'Copied from Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_COPIEDFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Copied from Case';
UPDATE r5boilertexts SET bot_text = 'Keep Synchronized with Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_KEEPSYNCHRONIZEDWITHCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Keep Synchronized with Case';
UPDATE r5boilertexts SET bot_text = 'Why 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WHY1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 1';
UPDATE r5boilertexts SET bot_text = 'Why 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WHY2' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Why 2';
UPDATE r5boilertexts SET bot_text = 'Root Cause Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Root Cause Details';
UPDATE r5boilertexts SET bot_text = 'User Defined Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Fields';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Delete Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete Record';
UPDATE r5boilertexts SET bot_text = 'Add Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Record';
UPDATE r5boilertexts SET bot_text = 'Translate Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFUNCTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate Function';
UPDATE r5boilertexts SET bot_text = 'Translate Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFUNCTIONALFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate Functional Failure';
UPDATE r5boilertexts SET bot_text = 'Translate Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFAILUREMODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Translate Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CURRENCY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost Currency';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'Case Header' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CASEHEADER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case Header';
UPDATE r5boilertexts SET bot_text = 'Mitigation Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Mitigation Details';
UPDATE r5boilertexts SET bot_text = 'Organization' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CMMORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Organization';
UPDATE r5boilertexts SET bot_text = 'Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Mitigation Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONTYPE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Mitigation Type';
UPDATE r5boilertexts SET bot_text = 'Mitigated Probability' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONPROBABILITY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Mitigated Probability';
UPDATE r5boilertexts SET bot_text = 'Mitigated Probability %' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONPROBPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Mitigated Probability %';
UPDATE r5boilertexts SET bot_text = 'Failure Mitigation' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mitigation';
UPDATE r5boilertexts SET bot_text = 'Risk Priority Number' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RISKPRIORITYNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Risk Priority Number';
UPDATE r5boilertexts SET bot_text = 'Risk Level' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Risk Level';
UPDATE r5boilertexts SET bot_text = 'Unmitigated Risk Priority Number' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UNMITIGATEDRPN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Unmitigated Risk Priority Number';
UPDATE r5boilertexts SET bot_text = 'Unmitigated Risk Level' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UNMITIGATEDRISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Unmitigated Risk Level';
UPDATE r5boilertexts SET bot_text = 'Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Note';
UPDATE r5boilertexts SET bot_text = 'PM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMSCHEDULE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PM';
UPDATE r5boilertexts SET bot_text = 'PM Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PM Description';
UPDATE r5boilertexts SET bot_text = 'PM Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PM Org.';
UPDATE r5boilertexts SET bot_text = 'Perform Every' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PERFORMEVERY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Perform Every';
UPDATE r5boilertexts SET bot_text = 'Period UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PERIODUOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Period UOM';
UPDATE r5boilertexts SET bot_text = 'Meter Interval' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER1INTERVAL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Meter Interval';
UPDATE r5boilertexts SET bot_text = 'Meter UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER1UOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Meter UOM';
UPDATE r5boilertexts SET bot_text = 'Meter #2 Interval' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER2INTERVAL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Meter #2 Interval';
UPDATE r5boilertexts SET bot_text = 'Meter #2 UOM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER2UOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Meter #2 UOM';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Maintenance Pattern' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Maintenance Pattern';
UPDATE r5boilertexts SET bot_text = 'Maintenance Pattern Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERNDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Maintenance Pattern Description';
UPDATE r5boilertexts SET bot_text = 'Maintenance Pattern Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERNORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Maintenance Pattern Org.';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'PM Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMPLAN' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PM Plan';
UPDATE r5boilertexts SET bot_text = 'PM Plan Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMPLANDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PM Plan Description';
UPDATE r5boilertexts SET bot_text = 'Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FUNCTIONALFAILUREDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Functional Failure';
UPDATE r5boilertexts SET bot_text = 'Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Project';
UPDATE r5boilertexts SET bot_text = 'Project Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Project Description';
UPDATE r5boilertexts SET bot_text = 'Project Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECTSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Project Status';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONCASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Case Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CASEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case Description';
UPDATE r5boilertexts SET bot_text = 'Case Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CASESTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case Status';
UPDATE r5boilertexts SET bot_text = 'Aspect' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ASPECT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Aspect';
UPDATE r5boilertexts SET bot_text = 'Aspect Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ASPECTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Aspect Description';
UPDATE r5boilertexts SET bot_text = 'One-time Mitigation Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ONETIMEMITIGATIONCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'One-time Mitigation Cost';
UPDATE r5boilertexts SET bot_text = 'Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ONETIMEMITIGATIONCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Currency';
UPDATE r5boilertexts SET bot_text = 'Recurring Mitigation Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RECURRINGMITIGATIONCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Recurring Mitigation Cost';
UPDATE r5boilertexts SET bot_text = 'Recurring Mitigation Cost Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RECURRINGMITIGATIONCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Recurring Mitigation Cost Currency';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FUNCTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Function';
UPDATE r5boilertexts SET bot_text = 'Probability' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBABILITY_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Probability';
UPDATE r5boilertexts SET bot_text = 'Probability %' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Probability %';
UPDATE r5boilertexts SET bot_text = 'RCM Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_STREAMPLUSPROJECTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Project';
UPDATE r5boilertexts SET bot_text = 'Problem Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBLEMCODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Problem Code';
UPDATE r5boilertexts SET bot_text = 'Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILURECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Code';
UPDATE r5boilertexts SET bot_text = 'Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CAUSECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cause Code';
UPDATE r5boilertexts SET bot_text = 'Action Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ACTIONCODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Action Code';
UPDATE r5boilertexts SET bot_text = 'Standard WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_STANDARDWODESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Standard WO';
UPDATE r5boilertexts SET bot_text = 'Downtime Hours' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMEHRS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Hours';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost';
UPDATE r5boilertexts SET bot_text = 'Downtime Cost Currency' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMECOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Downtime Cost Currency';
UPDATE r5boilertexts SET bot_text = 'Symptom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_SYMPTOMDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Symptom';
UPDATE r5boilertexts SET bot_text = 'Tactical Cause' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_TACTICALCAUSEDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Tactical Cause';
UPDATE r5boilertexts SET bot_text = 'Human Factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_HUMANFACTORDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Factor';
UPDATE r5boilertexts SET bot_text = 'Workmanship' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_WORKMANSHIPDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Workmanship';
UPDATE r5boilertexts SET bot_text = 'Human Oversight' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_HUMANOVERSIGHTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Human Oversight';
UPDATE r5boilertexts SET bot_text = 'Method of Detection' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METHODOFDETECTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Method of Detection';
UPDATE r5boilertexts SET bot_text = 'Failure Mode Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODENOTE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode Note';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'Failure Mode Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Failure Mode Details';
UPDATE r5boilertexts SET bot_text = 'User Defined Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Fields';
UPDATE r5boilertexts SET bot_text = 'Add Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Record';
UPDATE r5boilertexts SET bot_text = 'Delete Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_REMOVERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete Record';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CMMCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Corrective Action';
UPDATE r5boilertexts SET bot_text = 'Equipment' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment';
UPDATE r5boilertexts SET bot_text = 'Equipment Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment Description';
UPDATE r5boilertexts SET bot_text = 'Equipment Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENTORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Equipment Org.';
UPDATE r5boilertexts SET bot_text = 'RCM Template' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Template';
UPDATE r5boilertexts SET bot_text = 'RCM Template Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Template Description';
UPDATE r5boilertexts SET bot_text = 'RCM Template Org.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEORG' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Template Org.';
UPDATE r5boilertexts SET bot_text = 'RCM Template Revision' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEREVISION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Template Revision';
UPDATE r5boilertexts SET bot_text = 'New Template Revision' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_NEWTEMPLATEREVISION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'New Template Revision';
UPDATE r5boilertexts SET bot_text = 'Apply RCM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYRCM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Apply RCM';
UPDATE r5boilertexts SET bot_text = 'RCM Mapping Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMMAPPINGSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Mapping Status';
UPDATE r5boilertexts SET bot_text = 'Last Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_LASTCORRECTIVEACTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Last Corrective Action';
UPDATE r5boilertexts SET bot_text = 'RCM Applied' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMAPPLIED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Applied';
UPDATE r5boilertexts SET bot_text = 'RCM Mitigation Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMMITIGATIONSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'RCM Mitigation Status';
UPDATE r5boilertexts SET bot_text = 'Created By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Created By';
UPDATE r5boilertexts SET bot_text = 'Date Created' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Created';
UPDATE r5boilertexts SET bot_text = 'Updated By' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Updated By';
UPDATE r5boilertexts SET bot_text = 'Date Updated' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date Updated';
UPDATE r5boilertexts SET bot_text = 'Add Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add Record';
UPDATE r5boilertexts SET bot_text = 'Delete Record' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Delete Record';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 06';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 07';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 08';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 09';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 10';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 11';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 12';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 13';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 14';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 15';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 16';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 17';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 18';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 19';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 20';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 21';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 22';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 23';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 24';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 25';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 26';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 27';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 28';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 29';
UPDATE r5boilertexts SET bot_text = 'User Defined Field 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Field 30';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Number 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Number 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Date 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Date 05';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 01';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 02';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 03';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 04';
UPDATE r5boilertexts SET bot_text = 'User Defined Checkbox 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Checkbox 05';
UPDATE r5boilertexts SET bot_text = 'Corrective Action Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CORRECTIVEACTIONDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Corrective Action Details';
UPDATE r5boilertexts SET bot_text = 'User Defined Fields' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'User Defined Fields';
UPDATE r5boilertexts SET bot_text = 'PK' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CORRECTIVEACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'PK';
UPDATE r5boilertexts SET bot_text = 'Map RCM Data' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_MAPRCMDATA' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Map RCM Data';
UPDATE r5boilertexts SET bot_text = 'Apply Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYCORRECTIVEACTION' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Apply Corrective Action';
UPDATE r5boilertexts SET bot_text = 'Apply Corrective Action to All' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYCORRECTIVEACTIONTOALL' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Apply Corrective Action to All';
UPDATE r5boilertexts SET bot_text = 'Remove Applied RCM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_REMOVEAPPLIEDRCM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Remove Applied RCM';
UPDATE r5boilertexts SET bot_text = 'Edit Failure Consequences' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EDITFAILURECONSEQUENCES' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Edit Failure Consequences';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Additional Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Additional Costs';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Line No';
UPDATE r5boilertexts SET bot_text = 'AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost';
UPDATE r5boilertexts SET bot_text = 'Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = 'd.des_code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_COSCOST_D.DES_CODE' AND bot_fld2 = 'COSCOST' AND bot_lang = 'EN' and  bot_text <> 'd.des_code';
UPDATE r5boilertexts SET bot_text = 'd.des_text' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_COSCOST_D.DES_TEXT' AND bot_fld2 = 'COSCOST' AND bot_lang = 'EN' and  bot_text <> 'd.des_text';
UPDATE r5boilertexts SET bot_text = 'cc' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_CASEADCC_CASE' AND bot_fld2 = 'CASEADCC' AND bot_lang = 'EN' and  bot_text <> 'cc';
UPDATE r5boilertexts SET bot_text = 'Additional Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Additional Costs';
UPDATE r5boilertexts SET bot_text = 'All Records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'All Records';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Line No';
UPDATE r5boilertexts SET bot_text = 'AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = 'Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_1' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Details';
UPDATE r5boilertexts SET bot_text = 'Cost Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_2' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost Details';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_3' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_CF' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_4' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_5' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_6' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_7' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Line No';
UPDATE r5boilertexts SET bot_text = 'AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Date';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Cost';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = 'evo_total' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_CASEACOS_EVO_TOTAL' AND bot_fld2 = 'CASEACOS' AND bot_lang = 'EN' and  bot_text <> 'evo_total';
PROMPT ...End of Boierlexts (EN):SCHADE

PROMPT ...Start of Boierlexts (NL): SCHADE
UPDATE r5boilertexts SET bot_text = 'Damage' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PAGETITLE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Damage';
UPDATE r5boilertexts SET bot_text = 'Lijstweergave' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Lijstweergave';
UPDATE r5boilertexts SET bot_text = 'Recordweergave' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HDR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Recordweergave';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen';
UPDATE r5boilertexts SET bot_text = 'Documenten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Documenten';
UPDATE r5boilertexts SET bot_text = 'Vertalingen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vertalingen';
UPDATE r5boilertexts SET bot_text = 'Concessie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ORGANIZATION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Concessie';
UPDATE r5boilertexts SET bot_text = 'schadenummer qbuzz' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'schadenummer qbuzz';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Object' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Object';
UPDATE r5boilertexts SET bot_text = 'Objectomschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Objectomschrijving';
UPDATE r5boilertexts SET bot_text = 'Org. object' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Org. object';
UPDATE r5boilertexts SET bot_text = 'Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASETYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type';
UPDATE r5boilertexts SET bot_text = 'Afdeling' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DEPARTMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Afdeling';
UPDATE r5boilertexts SET bot_text = 'status schadeafhandeling' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STATUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'status schadeafhandeling';
UPDATE r5boilertexts SET bot_text = 'Elektronische handtekening' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATURE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Elektronische handtekening';
UPDATE r5boilertexts SET bot_text = 'Datum elektronische handtekening' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATUREDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum elektronische handtekening';
UPDATE r5boilertexts SET bot_text = 'Type elektronische handtekening' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESIGNATURETYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type elektronische handtekening';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'datum schade melding' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'datum schade melding';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Casedetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Casedetails';
UPDATE r5boilertexts SET bot_text = 'Klasse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CLASS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Klasse';
UPDATE r5boilertexts SET bot_text = 'Organisatie klasse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie klasse';
UPDATE r5boilertexts SET bot_text = 'Locatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Locatie';
UPDATE r5boilertexts SET bot_text = 'Omschrijving locatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving locatie';
UPDATE r5boilertexts SET bot_text = 'Organisatie locatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOCATIONORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie locatie';
UPDATE r5boilertexts SET bot_text = 'Servicecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Servicecode';
UPDATE r5boilertexts SET bot_text = 'Omschrijving servicecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving servicecode';
UPDATE r5boilertexts SET bot_text = 'Org. servicecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SERVICECODEORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Org. servicecode';
UPDATE r5boilertexts SET bot_text = 'Straatnaam:' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AREA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Straatnaam:';
UPDATE r5boilertexts SET bot_text = 'Werkadres' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKADDRESS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkadres';
UPDATE r5boilertexts SET bot_text = 'Prioriteit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteit';
UPDATE r5boilertexts SET bot_text = 'Kostencode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kostencode';
UPDATE r5boilertexts SET bot_text = 'Begindatum gebeurtenis' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Begindatum gebeurtenis';
UPDATE r5boilertexts SET bot_text = 'Einddatum gebeurtenis' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Einddatum gebeurtenis';
UPDATE r5boilertexts SET bot_text = 'Voorgeschreven' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REGULATORY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voorgeschreven';
UPDATE r5boilertexts SET bot_text = 'Vervolg vereist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPREQUIRED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vervolg vereist';
UPDATE r5boilertexts SET bot_text = 'Gevaarlijk materiaal' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HAZARDOUSMATERIAL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gevaarlijk materiaal';
UPDATE r5boilertexts SET bot_text = 'Totaal geschatte kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALESTIMATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Totaal geschatte kosten';
UPDATE r5boilertexts SET bot_text = 'Valuta totaal geschatte kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALESTIMATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta totaal geschatte kosten';
UPDATE r5boilertexts SET bot_text = 'Totale berekende kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Totale berekende kosten';
UPDATE r5boilertexts SET bot_text = 'Valuta totale berekende kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCALCULATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta totale berekende kosten';
UPDATE r5boilertexts SET bot_text = 'Vernieuwen berekende kosten vereist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REFRESHCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vernieuwen berekende kosten vereist';
UPDATE r5boilertexts SET bot_text = 'Bovenliggend' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PARENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bovenliggend';
UPDATE r5boilertexts SET bot_text = 'Werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKORDER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkorder';
UPDATE r5boilertexts SET bot_text = 'Werkvergunning' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PERMITTOWORK' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkvergunning';
UPDATE r5boilertexts SET bot_text = 'Dienst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SHIFT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Dienst';
UPDATE r5boilertexts SET bot_text = 'Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROJECT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Project';
UPDATE r5boilertexts SET bot_text = 'Campagne' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CAMPAIGN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Campagne';
UPDATE r5boilertexts SET bot_text = 'Details lineaire referentie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LINEARREFERENCEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details lineaire referentie';
UPDATE r5boilertexts SET bot_text = 'Beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Beginpunt';
UPDATE r5boilertexts SET bot_text = 'Eenheid beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTUOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid beginpunt';
UPDATE r5boilertexts SET bot_text = 'Omschrijving referentie beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving referentie beginpunt';
UPDATE r5boilertexts SET bot_text = 'Geografische referentie beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geografische referentie beginpunt';
UPDATE r5boilertexts SET bot_text = 'Eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eindpunt';
UPDATE r5boilertexts SET bot_text = 'Eenheid eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTUOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid eindpunt';
UPDATE r5boilertexts SET bot_text = 'Omschrijving referentie eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving referentie eindpunt';
UPDATE r5boilertexts SET bot_text = 'Geografische referentie eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geografische referentie eindpunt';
UPDATE r5boilertexts SET bot_text = 'Inspectierichting' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INSPECTIONDIRECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Inspectierichting';
UPDATE r5boilertexts SET bot_text = 'Stroom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FLOW' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Stroom';
UPDATE r5boilertexts SET bot_text = 'Traceringsdetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRACKINGDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Traceringsdetails';
UPDATE r5boilertexts SET bot_text = 'Aanvrager' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQUESTEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aanvrager';
UPDATE r5boilertexts SET bot_text = 'Aangevraagd op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DATEREQUESTED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangevraagd op';
UPDATE r5boilertexts SET bot_text = 'Verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'Naam verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLENAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'E-mail verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RESPONSIBLEEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-mail verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'Voorbereid door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voorbereid door';
UPDATE r5boilertexts SET bot_text = 'Naam voorbereid door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam voorbereid door';
UPDATE r5boilertexts SET bot_text = 'E-mailadres voorbereid door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PREPAREDBYEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-mailadres voorbereid door';
UPDATE r5boilertexts SET bot_text = 'Toegewezen aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Toegewezen aan';
UPDATE r5boilertexts SET bot_text = 'Naam toegewezen-aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTONAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam toegewezen-aan';
UPDATE r5boilertexts SET bot_text = 'E-mailadres toegewezen-aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ASSIGNEDTOEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-mailadres toegewezen-aan';
UPDATE r5boilertexts SET bot_text = 'Geplande begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SCHEDSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geplande begindatum';
UPDATE r5boilertexts SET bot_text = 'Geplande einddatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SCHEDENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geplande einddatum';
UPDATE r5boilertexts SET bot_text = 'Aangevraagde begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangevraagde begindatum';
UPDATE r5boilertexts SET bot_text = 'Aangevraagde einddatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REQENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangevraagde einddatum';
UPDATE r5boilertexts SET bot_text = 'Begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Begindatum';
UPDATE r5boilertexts SET bot_text = 'Datum voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum voltooid';
UPDATE r5boilertexts SET bot_text = 'Serviceaanvraag' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUEST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Serviceaanvraag';
UPDATE r5boilertexts SET bot_text = 'Organisatie serviceaanvraag' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUESTORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie serviceaanvraag';
UPDATE r5boilertexts SET bot_text = 'Status van dienstaanvragen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'INCIDENTREQUESTSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Status van dienstaanvragen';
UPDATE r5boilertexts SET bot_text = 'Brontype' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SOURCETYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Brontype';
UPDATE r5boilertexts SET bot_text = 'Details vervolgwerkorders' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPWODETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details vervolgwerkorders';
UPDATE r5boilertexts SET bot_text = 'Werkorderomschr.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkorderomschr.';
UPDATE r5boilertexts SET bot_text = 'Standaard werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Standaard werkorder';
UPDATE r5boilertexts SET bot_text = 'WO-type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-type';
UPDATE r5boilertexts SET bot_text = 'Werkorderklasse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOCLASS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkorderklasse';
UPDATE r5boilertexts SET bot_text = 'Org. klasse WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOCLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Org. klasse WO';
UPDATE r5boilertexts SET bot_text = 'WO-status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-status';
UPDATE r5boilertexts SET bot_text = 'WO-prioriteit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WOPRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-prioriteit';
UPDATE r5boilertexts SET bot_text = 'Taakplan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TASKPLAN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taakplan';
UPDATE r5boilertexts SET bot_text = 'Jobplan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'JOBPLAN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Jobplan';
UPDATE r5boilertexts SET bot_text = 'Vakgroep' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRADE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakgroep';
UPDATE r5boilertexts SET bot_text = 'Uren geschat' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ESTHOURS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uren geschat';
UPDATE r5boilertexts SET bot_text = 'Benodigde medew.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PPLREQ' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Benodigde medew.';
UPDATE r5boilertexts SET bot_text = 'Vervolgwerkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vervolgwerkorder';
UPDATE r5boilertexts SET bot_text = 'Vervolgwerkorder aanmaken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CREATEFOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vervolgwerkorder aanmaken';
UPDATE r5boilertexts SET bot_text = 'Kostengegevens vernieuwen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'REFRESHCOSTDATA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kostengegevens vernieuwen';
UPDATE r5boilertexts SET bot_text = 'WO-omschrijving vertalen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TRANSLATEWODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-omschrijving vertalen';
UPDATE r5boilertexts SET bot_text = 'Document toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_ADDNEW' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Document toevoegen';
UPDATE r5boilertexts SET bot_text = 'Document aanmaken/uploaden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_CREATEORUPLOADDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Document aanmaken/uploaden';
UPDATE r5boilertexts SET bot_text = 'Documenten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_DOCDETAILS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Documenten';
UPDATE r5boilertexts SET bot_text = 'Systeemstatus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SYSTEMSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Systeemstatus';
UPDATE r5boilertexts SET bot_text = 'Kenteken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kenteken';
UPDATE r5boilertexts SET bot_text = 'incident nummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'incident nummer';
UPDATE r5boilertexts SET bot_text = 'status werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'status werkorder';
UPDATE r5boilertexts SET bot_text = 'oorzaak omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'oorzaak omschrijving';
UPDATE r5boilertexts SET bot_text = 'Plaats:' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Plaats:';
UPDATE r5boilertexts SET bot_text = 'Chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Chauffeur';
UPDATE r5boilertexts SET bot_text = 'naam chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'naam chauffeur';
UPDATE r5boilertexts SET bot_text = 'standplaats/vestiging chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'standplaats/vestiging chauffeur';
UPDATE r5boilertexts SET bot_text = 'Teammanager' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Teammanager';
UPDATE r5boilertexts SET bot_text = 'Naam teammanager' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam teammanager';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Afsleepkosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Afsleepkosten';
UPDATE r5boilertexts SET bot_text = 'Schade laadinfra' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Schade laadinfra';
UPDATE r5boilertexts SET bot_text = 'Schade gebouwen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Schade gebouwen';
UPDATE r5boilertexts SET bot_text = 'Beelden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Beelden';
UPDATE r5boilertexts SET bot_text = 'Calculatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Calculatie';
UPDATE r5boilertexts SET bot_text = 'bedrag geclaimed' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'bedrag geclaimed';
UPDATE r5boilertexts SET bot_text = 'Verzekeraar' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verzekeraar';
UPDATE r5boilertexts SET bot_text = 'Schuld/aansprakelijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Schuld/aansprakelijkheid';
UPDATE r5boilertexts SET bot_text = 'Verhaalbaar' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verhaalbaar';
UPDATE r5boilertexts SET bot_text = 'Schadenummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Schadenummer';
UPDATE r5boilertexts SET bot_text = 'exta informatie veld' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'exta informatie veld';
UPDATE r5boilertexts SET bot_text = 'Naam tegenpartij' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam tegenpartij';
UPDATE r5boilertexts SET bot_text = 'Kenteken TP' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kenteken TP';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Lijnnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Lijnnummer';
UPDATE r5boilertexts SET bot_text = 'Letselschade' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Letselschade';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'inleverdatum schadeformulier' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'inleverdatum schadeformulier';
UPDATE r5boilertexts SET bot_text = 'brief naar chauffeur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'brief naar chauffeur';
UPDATE r5boilertexts SET bot_text = 'calculatie opgevraagd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'calculatie opgevraagd';
UPDATE r5boilertexts SET bot_text = 'Beelden opgevraagd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Beelden opgevraagd';
UPDATE r5boilertexts SET bot_text = 'schade datum en tijd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'schade datum en tijd';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten reparatie intern' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'geschatte kosten reparatie intern';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten reparatie extern' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'geschatte kosten reparatie extern';
UPDATE r5boilertexts SET bot_text = 'geschatte kosten tegenpartij' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'geschatte kosten tegenpartij';
UPDATE r5boilertexts SET bot_text = 'Verhaald/ Ontvangen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verhaald/ Ontvangen';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenissenlogboek' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenissenlogboek';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenisdetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenisdetails';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenistype' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenistype';
UPDATE r5boilertexts SET bot_text = 'Datum/tijd (lokaal)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_EVENTLOGDATETIME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum/tijd (lokaal)';
UPDATE r5boilertexts SET bot_text = 'Taaknummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_TASKNO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taaknummer';
UPDATE r5boilertexts SET bot_text = 'Veld' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_FIELD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Veld';
UPDATE r5boilertexts SET bot_text = 'Van waarde' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_FROMVALUEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Van waarde';
UPDATE r5boilertexts SET bot_text = 'Naar waarde' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_TOVALUEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naar waarde';
UPDATE r5boilertexts SET bot_text = 'Gebruiker' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruiker';
UPDATE r5boilertexts SET bot_text = 'Gebruikersnaam' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikersnaam';
UPDATE r5boilertexts SET bot_text = 'Type elektronische handtekening' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_ESIGNATURETYPEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type elektronische handtekening';
UPDATE r5boilertexts SET bot_text = 'Notities' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_NOTES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Notities';
UPDATE r5boilertexts SET bot_text = 'Controlerecord' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_AUDITRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Controlerecord';
UPDATE r5boilertexts SET bot_text = 'Invoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_INSERTRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Invoegen';
UPDATE r5boilertexts SET bot_text = 'Bijwerken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UPDATERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijwerken';
UPDATE r5boilertexts SET bot_text = 'Verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verwijderen';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenis toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_ADDEVENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenis toevoegen';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Prioriteitspictogram' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PRIORITYICON' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteitspictogram';
UPDATE r5boilertexts SET bot_text = 'Extra kenmerken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CUSTOMFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Extra kenmerken';
UPDATE r5boilertexts SET bot_text = 'Taken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taken';
UPDATE r5boilertexts SET bot_text = 'Taakdetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taakdetails';
UPDATE r5boilertexts SET bot_text = 'Task code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKNO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Task code';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Task sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Task sequence';
UPDATE r5boilertexts SET bot_text = 'Stap' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STEP' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Stap';
UPDATE r5boilertexts SET bot_text = 'Opmerking' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerking';
UPDATE r5boilertexts SET bot_text = 'Prioriteit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteit';
UPDATE r5boilertexts SET bot_text = 'Task Plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLANFORCHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Task Plan';
UPDATE r5boilertexts SET bot_text = 'Taakplan voor revisie controlelijst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLANREVISIONFORCHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taakplan voor revisie controlelijst';
UPDATE r5boilertexts SET bot_text = 'Geschatte kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTIMATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geschatte kosten';
UPDATE r5boilertexts SET bot_text = 'Valuta' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTIMATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta';
UPDATE r5boilertexts SET bot_text = 'Berekende kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Berekende kosten';
UPDATE r5boilertexts SET bot_text = 'Valuta' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CALCULATEDCOSTS_CURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta';
UPDATE r5boilertexts SET bot_text = 'Vernieuwen berekende kosten vereist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REFRESHCALCULATEDCOSTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vernieuwen berekende kosten vereist';
UPDATE r5boilertexts SET bot_text = 'Van servicecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FROMSERVICECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Van servicecode';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Traceringsdetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRACKINGDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Traceringsdetails';
UPDATE r5boilertexts SET bot_text = 'Rol verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLEROLE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Rol verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'Verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'Naam verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLENAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'E-mail verantwoordelijke' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_RESPONSIBLEEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-mail verantwoordelijke';
UPDATE r5boilertexts SET bot_text = 'Rol toegewezen-aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTOROLE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Rol toegewezen-aan';
UPDATE r5boilertexts SET bot_text = 'Toegewezen aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Toegewezen aan';
UPDATE r5boilertexts SET bot_text = 'Naam toegewezen-aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTONAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam toegewezen-aan';
UPDATE r5boilertexts SET bot_text = 'E-mailadres toegewezen-aan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ASSIGNEDTOEMAIL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-mailadres toegewezen-aan';
UPDATE r5boilertexts SET bot_text = 'Geplande duur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PLANNEDDURATION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geplande duur';
UPDATE r5boilertexts SET bot_text = 'Duureenheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DURATIONUNIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Duureenheid';
UPDATE r5boilertexts SET bot_text = 'Geplande begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SCHEDSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geplande begindatum';
UPDATE r5boilertexts SET bot_text = 'Geplande einddatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SCHEDENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geplande einddatum';
UPDATE r5boilertexts SET bot_text = 'Aangevraagde begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REQSTARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangevraagde begindatum';
UPDATE r5boilertexts SET bot_text = 'Aangevraagde einddatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REQENDDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangevraagde einddatum';
UPDATE r5boilertexts SET bot_text = 'Vaste datums' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FIRMDATES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vaste datums';
UPDATE r5boilertexts SET bot_text = 'Gereed om te starten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_READYTOSTART' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gereed om te starten';
UPDATE r5boilertexts SET bot_text = 'Gestart' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STARTED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gestart';
UPDATE r5boilertexts SET bot_text = 'Begindatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STARTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Begindatum';
UPDATE r5boilertexts SET bot_text = 'Voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voltooid';
UPDATE r5boilertexts SET bot_text = 'Percentage voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PERCENTCOMPLETE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Percentage voltooid';
UPDATE r5boilertexts SET bot_text = 'Datum voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DATECOMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum voltooid';
UPDATE r5boilertexts SET bot_text = 'Notificatie voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTIFYCOMPLETE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Notificatie voltooid';
UPDATE r5boilertexts SET bot_text = 'Gereed voor notificatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_NOTIFYREADYTOSTART' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gereed voor notificatie';
UPDATE r5boilertexts SET bot_text = 'Details vervolgwerkorders' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FOLLOWUPWODETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details vervolgwerkorders';
UPDATE r5boilertexts SET bot_text = 'Werkorderomschr.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkorderomschr.';
UPDATE r5boilertexts SET bot_text = 'Standaard werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Standaard werkorder';
UPDATE r5boilertexts SET bot_text = 'WO-type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-type';
UPDATE r5boilertexts SET bot_text = 'Werkorderklasse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOCLASS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Werkorderklasse';
UPDATE r5boilertexts SET bot_text = 'Org. klasse WO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOCLASSORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Org. klasse WO';
UPDATE r5boilertexts SET bot_text = 'WO-status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOSTATUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-status';
UPDATE r5boilertexts SET bot_text = 'WO-prioriteit' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_WOPRIORITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-prioriteit';
UPDATE r5boilertexts SET bot_text = 'Taakplan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TASKPLAN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taakplan';
UPDATE r5boilertexts SET bot_text = 'Jobplan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_JOBPLAN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Jobplan';
UPDATE r5boilertexts SET bot_text = 'Vakgroep' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRADE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakgroep';
UPDATE r5boilertexts SET bot_text = 'Uren geschat' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ESTHOURS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uren geschat';
UPDATE r5boilertexts SET bot_text = 'Benodigde medew.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_PPLREQ' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Benodigde medew.';
UPDATE r5boilertexts SET bot_text = 'Vervolgwerkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_FOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vervolgwerkorder';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'Taak toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDTASK' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taak toevoegen';
UPDATE r5boilertexts SET bot_text = 'Taak verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DELETETASK' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taak verwijderen';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen toevoegen/wijzigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDEDITCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen toevoegen/wijzigen';
UPDATE r5boilertexts SET bot_text = 'Documenten toevoegen/bewerken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_ADDEDITDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Documenten toevoegen/bewerken';
UPDATE r5boilertexts SET bot_text = 'Vervolgwerkorder aanmaken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CREATEFOLLOWUPWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vervolgwerkorder aanmaken';
UPDATE r5boilertexts SET bot_text = 'Kostengegevens vernieuwen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_REFRESHCOSTDATA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kostengegevens vernieuwen';
UPDATE r5boilertexts SET bot_text = 'Taak vertalen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRANSLATETASK' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taak vertalen';
UPDATE r5boilertexts SET bot_text = 'WO-omschrijving vertalen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_TRANSLATEWODESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'WO-omschrijving vertalen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Controlelijst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Controlelijst';
UPDATE r5boilertexts SET bot_text = 'Controlelijstgegevens' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Controlelijstgegevens';
UPDATE r5boilertexts SET bot_text = 'Taakvolgnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CASEMANAGEMENTTASKSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Taakvolgnummer';
UPDATE r5boilertexts SET bot_text = 'Uitgevoerd door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uitgevoerd door';
UPDATE r5boilertexts SET bot_text = 'Datum uitgevoerd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEPERFORMED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum uitgevoerd';
UPDATE r5boilertexts SET bot_text = 'Type uitgevoerd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type uitgevoerd';
UPDATE r5boilertexts SET bot_text = 'Gecontroleerd door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gecontroleerd door';
UPDATE r5boilertexts SET bot_text = 'Datum gecontroleerd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEREVIEWED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum gecontroleerd';
UPDATE r5boilertexts SET bot_text = 'Type gecontroleerd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type gecontroleerd';
UPDATE r5boilertexts SET bot_text = 'Volgnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Volgnummer';
UPDATE r5boilertexts SET bot_text = 'Occurrence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_OCCURRENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Occurrence';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Voltooid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COMPLETED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voltooid';
UPDATE r5boilertexts SET bot_text = 'Ja' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_YES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Ja';
UPDATE r5boilertexts SET bot_text = 'Nee' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_NO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Nee';
UPDATE r5boilertexts SET bot_text = 'Resultaten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_FINDING' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Resultaten';
UPDATE r5boilertexts SET bot_text = 'Waarde' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VALUE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarde';
UPDATE r5boilertexts SET bot_text = 'Eenheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid';
UPDATE r5boilertexts SET bot_text = 'Notities' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_NOTES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Notities';
UPDATE r5boilertexts SET bot_text = 'Laatste occurrence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_FINALOCCURRENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Laatste occurrence';
UPDATE r5boilertexts SET bot_text = 'Conditie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CONDITIONDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Conditie';
UPDATE r5boilertexts SET bot_text = 'Vereist' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REQUIREDTOCLOSEDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vereist';
UPDATE r5boilertexts SET bot_text = 'Type' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Foutmelding' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_MESSAGECOLUMN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Foutmelding';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen weergeven' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen weergeven';
UPDATE r5boilertexts SET bot_text = 'Documenten weergeven' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Documenten weergeven';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Resultaat' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_RESULT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Resultaat';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_RECORDID' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Ja(a)r(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'YEARS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'Ja(a)r(en)';
UPDATE r5boilertexts SET bot_text = 'Maand(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MONTHS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'Maand(en)';
UPDATE r5boilertexts SET bot_text = 'We(e)k(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEEKS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'We(e)k(en)';
UPDATE r5boilertexts SET bot_text = 'Dag(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DAYS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'Dag(en)';
UPDATE r5boilertexts SET bot_text = 'U(u)r(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HOURS' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'U(u)r(en)';
UPDATE r5boilertexts SET bot_text = 'Minu(u)t(en)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MINUTES' AND bot_fld2 = 'TCM_DURATIONUNIT' AND bot_lang = 'NL' and  bot_text <> 'Minu(u)t(en)';
UPDATE r5boilertexts SET bot_text = 'E-records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ERC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'E-records';
UPDATE r5boilertexts SET bot_text = 'Voer de gegevens van uw elektronische handtekening in om u voor de case aan te melden.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'POPUP_CAPTION_SIGNOFF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voer de gegevens van uw elektronische handtekening in om u voor de case aan te melden.';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen van controlelijst-onderdelen weergeven' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_VIEWCHECKLISTITEMCOMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen van controlelijst-onderdelen weergeven';
UPDATE r5boilertexts SET bot_text = 'Voorgeschreven' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REGULATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Voorgeschreven';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REFERENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Kleur' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COLOR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kleur';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_COMMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Docum. onderdelen controlelijst toevoegen/bewerken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_ADDEDITCHECKLISTDOCUMENTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Docum. onderdelen controlelijst toevoegen/bewerken';
UPDATE r5boilertexts SET bot_text = 'Datum/tijd (server)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CML_DATETIMESERVER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum/tijd (server)';
UPDATE r5boilertexts SET bot_text = 'Vrije tekst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNOTE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vrije tekst';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerde notitie 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'UDFNOTE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerde notitie 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerde notitie 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNOTE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerde notitie 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerde notitie 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_UDFNOTE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerde notitie 02';
UPDATE r5boilertexts SET bot_text = 'Geografische referentie eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geografische referentie eindpunt';
UPDATE r5boilertexts SET bot_text = 'Geografische referentie beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTGEOREF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Geografische referentie beginpunt';
UPDATE r5boilertexts SET bot_text = 'Omschrijving referentie beginpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FROMPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving referentie beginpunt';
UPDATE r5boilertexts SET bot_text = 'Omschrijving referentie eindpunt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOPOINTREFDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving referentie eindpunt';
UPDATE r5boilertexts SET bot_text = 'Naam uitgevoerd door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_PERFORMEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam uitgevoerd door';
UPDATE r5boilertexts SET bot_text = 'Naam van gecontroleerd door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_REVIEWEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam van gecontroleerd door';
UPDATE r5boilertexts SET bot_text = 'Naam bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_UPDATEDBYNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Naam bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Document uploaden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_UPLOADDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Document uploaden';
UPDATE r5boilertexts SET bot_text = 'Document aanmaken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOC_CREATEDOCUMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Document aanmaken';
UPDATE r5boilertexts SET bot_text = 'Goedkeuring controlelijst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLISTAPPROVAL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Goedkeuring controlelijst';
UPDATE r5boilertexts SET bot_text = 'Controlelijst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACK_CHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Controlelijst';
UPDATE r5boilertexts SET bot_text = 'Controlelijst' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TCM_CHECKLIST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Controlelijst';
UPDATE r5boilertexts SET bot_text = 'Details hoofdoorzaakanalyse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ROOTCAUSEANALYSISSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details hoofdoorzaakanalyse';
UPDATE r5boilertexts SET bot_text = 'Stilstandskosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Stilstandskosten';
UPDATE r5boilertexts SET bot_text = 'Valuta kosten stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMECOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta kosten stilstand';
UPDATE r5boilertexts SET bot_text = 'Uren stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DOWNTIMEHOURS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uren stilstand';
UPDATE r5boilertexts SET bot_text = 'Totale kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Totale kosten';
UPDATE r5boilertexts SET bot_text = 'Valuta totaal' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TOTALCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta totaal';
UPDATE r5boilertexts SET bot_text = 'Verloren productiviteitsuren' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LOSTPRODUCTIVITYHOURS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Verloren productiviteitsuren';
UPDATE r5boilertexts SET bot_text = 'Probleembeschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROBLEMDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Probleembeschrijving';
UPDATE r5boilertexts SET bot_text = 'Wat er is gebeurd' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHATHAPPENED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wat er is gebeurd';
UPDATE r5boilertexts SET bot_text = 'Waarom 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 1';
UPDATE r5boilertexts SET bot_text = 'Waarom 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY2' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 2';
UPDATE r5boilertexts SET bot_text = 'Waarom 3' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY3' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 3';
UPDATE r5boilertexts SET bot_text = 'Waarom 4' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY4' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 4';
UPDATE r5boilertexts SET bot_text = 'Waarom 5' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WHY5' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 5';
UPDATE r5boilertexts SET bot_text = 'Oplossing' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SOLUTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oplossing';
UPDATE r5boilertexts SET bot_text = 'Details werkorder hoofdoorzaakanalyse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ROOTCAUSEWORKORDERSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details werkorder hoofdoorzaakanalyse';
UPDATE r5boilertexts SET bot_text = 'Probleemcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Probleemcode';
UPDATE r5boilertexts SET bot_text = 'Storingscode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingscode';
UPDATE r5boilertexts SET bot_text = 'Actiecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Actiecode';
UPDATE r5boilertexts SET bot_text = 'Oorzaakcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oorzaakcode';
UPDATE r5boilertexts SET bot_text = 'Storingsmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodus';
UPDATE r5boilertexts SET bot_text = 'Symptoom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Symptoom';
UPDATE r5boilertexts SET bot_text = 'Tactische oorzaak' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Tactische oorzaak';
UPDATE r5boilertexts SET bot_text = 'Menselijke factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Menselijke factor';
UPDATE r5boilertexts SET bot_text = 'Vakkundigheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakkundigheid';
UPDATE r5boilertexts SET bot_text = 'Onoplettendheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Onoplettendheid';
UPDATE r5boilertexts SET bot_text = 'Signaleringswijze' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Signaleringswijze';
UPDATE r5boilertexts SET bot_text = 'Betrouwbaarheid object' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EQUIPMENTRELIABILITYSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Betrouwbaarheid object';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenisdatum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTDATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenisdatum';
UPDATE r5boilertexts SET bot_text = 'Gebeurtenisnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'EVENTNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebeurtenisnummer';
UPDATE r5boilertexts SET bot_text = 'Betrouwbaarheidsprobleemcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYPROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Betrouwbaarheidsprobleemcode';
UPDATE r5boilertexts SET bot_text = 'Storingscode betrouwbaarheidsprobleem' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYFAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingscode betrouwbaarheidsprobleem';
UPDATE r5boilertexts SET bot_text = 'Actiecode betrouwbaarheidsprobleem' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Actiecode betrouwbaarheidsprobleem';
UPDATE r5boilertexts SET bot_text = 'Oorzaakcode betrouwbaarheidsprobleem' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'RELIABILITYCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oorzaakcode betrouwbaarheidsprobleem';
UPDATE r5boilertexts SET bot_text = 'Aantal dagen sinds vorige' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'DAYSSINCEPREVIOUS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aantal dagen sinds vorige';
UPDATE r5boilertexts SET bot_text = '?Cumulative Days Between Failures' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Cumulative Days Between Failures';
UPDATE r5boilertexts SET bot_text = 'Gemiddelde tijd tussen storingen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MEANTIMEBETWEENFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gemiddelde tijd tussen storingen';
UPDATE r5boilertexts SET bot_text = 'Minimum aantal dagen tussen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MINIMUMDAYSBETWEEN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Minimum aantal dagen tussen';
UPDATE r5boilertexts SET bot_text = 'Maximum aantal dagen tussen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'MAXIMUMDAYSBETWEEN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Maximum aantal dagen tussen';
UPDATE r5boilertexts SET bot_text = 'Standaardafwijking' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'STANDARDDEVIATION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Standaardafwijking';
UPDATE r5boilertexts SET bot_text = 'Gemiddelde lineaire trend' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AVERAGELINEARSLOPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gemiddelde lineaire trend';
UPDATE r5boilertexts SET bot_text = 'Laatste lineaire trend' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LASTLINEARSLOPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Laatste lineaire trend';
UPDATE r5boilertexts SET bot_text = 'La Place' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LAPLACE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'La Place';
UPDATE r5boilertexts SET bot_text = 'Weibull-vorm' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSHAPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-vorm';
UPDATE r5boilertexts SET bot_text = 'Weibull-schaal' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSCALE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-schaal';
UPDATE r5boilertexts SET bot_text = 'Weibull-correlatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLCORRELATION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-correlatie';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-trend' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-trend';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-intercept' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTERCEPT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-intercept';
UPDATE r5boilertexts SET bot_text = 'Gemiddelde lineaire trend - cum. aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'AVGLINSLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gemiddelde lineaire trend - cum. aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Laatste lineaire trend - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'LASTLINSLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Laatste lineaire trend - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Weibull-vorm - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSHAPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-vorm - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Weibull-schaal - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLSCALECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-schaal - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Weibull-correlatie - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WEIBULLCORRCUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Weibull-correlatie - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-trend - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPECUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-trend - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-intercept - cumulatief aantal dagen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTCUMULATIVEDAYS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-intercept - cumulatief aantal dagen';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-trend (IEC)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAASLOPEIEC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-trend (IEC)';
UPDATE r5boilertexts SET bot_text = 'Crow AMSAA-intercept (IEC)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CROWAMSAAINTIEC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Crow AMSAA-intercept (IEC)';
UPDATE r5boilertexts SET bot_text = 'Op basis van werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'BASEDONWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Op basis van werkorder';
UPDATE r5boilertexts SET bot_text = '?Root Causes' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Causes';
UPDATE r5boilertexts SET bot_text = '?Root Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Cause Code';
UPDATE r5boilertexts SET bot_text = 'Opmerking' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerking';
UPDATE r5boilertexts SET bot_text = 'Probleemcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Probleemcode';
UPDATE r5boilertexts SET bot_text = 'Storingscode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingscode';
UPDATE r5boilertexts SET bot_text = 'Actiecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Actiecode';
UPDATE r5boilertexts SET bot_text = 'Oorzaakcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oorzaakcode';
UPDATE r5boilertexts SET bot_text = 'Storingsmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodus';
UPDATE r5boilertexts SET bot_text = 'Symptoom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Symptoom';
UPDATE r5boilertexts SET bot_text = 'Tactische oorzaak' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Tactische oorzaak';
UPDATE r5boilertexts SET bot_text = 'Menselijke factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Menselijke factor';
UPDATE r5boilertexts SET bot_text = 'Vakkundigheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakkundigheid';
UPDATE r5boilertexts SET bot_text = 'Onoplettendheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Onoplettendheid';
UPDATE r5boilertexts SET bot_text = 'Signaleringswijze' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Signaleringswijze';
UPDATE r5boilertexts SET bot_text = 'Perc. bijdrage' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CONTRIBUTIONPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Perc. bijdrage';
UPDATE r5boilertexts SET bot_text = '?Copied from Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_COPIEDFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Copied from Case';
UPDATE r5boilertexts SET bot_text = '?Keep Synchronized with Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_KEEPSYNCHRONIZEDWITHCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Keep Synchronized with Case';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Waarom 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WHY1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 1';
UPDATE r5boilertexts SET bot_text = 'Waarom 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_WHY2' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 2';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Record toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record toevoegen';
UPDATE r5boilertexts SET bot_text = 'Record verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record verwijderen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = '?Root Cause Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Cause Details';
UPDATE r5boilertexts SET bot_text = 'Details hoofdoorzaakanalyse' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_ROOTCAUSEANALYSISSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Details hoofdoorzaakanalyse';
UPDATE r5boilertexts SET bot_text = '?Copy From Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CRA_COPYFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Copy From Case';
UPDATE r5boilertexts SET bot_text = 'Storingsmodi' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodi';
UPDATE r5boilertexts SET bot_text = 'Storingsmodusgegevens' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodusgegevens';
UPDATE r5boilertexts SET bot_text = 'RCM-niveau' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RCMLEVEL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'RCM-niveau';
UPDATE r5boilertexts SET bot_text = '?Function Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Function Code';
UPDATE r5boilertexts SET bot_text = '?Existing Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EXISTINGFUNCTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Existing Function';
UPDATE r5boilertexts SET bot_text = 'Functie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Functie';
UPDATE r5boilertexts SET bot_text = '?Function Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Function Sequence';
UPDATE r5boilertexts SET bot_text = '?Function Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONNOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Function Note';
UPDATE r5boilertexts SET bot_text = '?Functional Failure Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Functional Failure Code';
UPDATE r5boilertexts SET bot_text = '?Existing Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EXISTINGFUNCTIONALFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Existing Functional Failure';
UPDATE r5boilertexts SET bot_text = 'Functiestoring' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILUREDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Functiestoring';
UPDATE r5boilertexts SET bot_text = '?Functional Failure Sequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURESEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Functional Failure Sequence';
UPDATE r5boilertexts SET bot_text = '?Functional Failure Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FUNCTIONALFAILURENOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Functional Failure Note';
UPDATE r5boilertexts SET bot_text = '?Failure Mode Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Failure Mode Code';
UPDATE r5boilertexts SET bot_text = 'Storingsmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodus';
UPDATE r5boilertexts SET bot_text = '?Noun' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_NOUNDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Noun';
UPDATE r5boilertexts SET bot_text = '?Verb' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_VERBDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Verb';
UPDATE r5boilertexts SET bot_text = '?Complement' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_COMPLEMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Complement';
UPDATE r5boilertexts SET bot_text = 'Waarschijnlijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBABILITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarschijnlijkheid';
UPDATE r5boilertexts SET bot_text = 'Waarschijnlijkheid (%)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBABILITYPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarschijnlijkheid (%)';
UPDATE r5boilertexts SET bot_text = 'Volgnummer' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Volgnummer';
UPDATE r5boilertexts SET bot_text = 'Opmerking' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerking';
UPDATE r5boilertexts SET bot_text = '?Effect Indicator' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EFFECTINDICATOR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Effect Indicator';
UPDATE r5boilertexts SET bot_text = '?Effect Consequence' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EFFECTCONSEQUENCE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Effect Consequence';
UPDATE r5boilertexts SET bot_text = 'Standaard werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_STANDARDWO' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Standaard werkorder';
UPDATE r5boilertexts SET bot_text = 'Uren stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMEHOURS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uren stilstand';
UPDATE r5boilertexts SET bot_text = 'Stilstandskosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Stilstandskosten';
UPDATE r5boilertexts SET bot_text = 'Valuta' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DOWNTIMECOSTCURRENCY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta';
UPDATE r5boilertexts SET bot_text = '?Root Cause Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Cause Code';
UPDATE r5boilertexts SET bot_text = 'Prioriteitsnummer risico' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RISKPRIORITYNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteitsnummer risico';
UPDATE r5boilertexts SET bot_text = 'Risiconiveau' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_RISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Risiconiveau';
UPDATE r5boilertexts SET bot_text = 'RCM-project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_STREAMPLUSPROJECT_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'RCM-project';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = '?Root Cause Note' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSENOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Cause Note';
UPDATE r5boilertexts SET bot_text = 'Perc. bijdrage' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CONTRIBUTIONPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Perc. bijdrage';
UPDATE r5boilertexts SET bot_text = 'Probleemcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_PROBLEMCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Probleemcode';
UPDATE r5boilertexts SET bot_text = 'Storingscode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_FAILURECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingscode';
UPDATE r5boilertexts SET bot_text = 'Actiecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Actiecode';
UPDATE r5boilertexts SET bot_text = 'Oorzaakcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CAUSECODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oorzaakcode';
UPDATE r5boilertexts SET bot_text = 'Storingsmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSEFAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodus';
UPDATE r5boilertexts SET bot_text = 'Symptoom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SYMPTOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Symptoom';
UPDATE r5boilertexts SET bot_text = 'Tactische oorzaak' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TACTICALCAUSE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Tactische oorzaak';
UPDATE r5boilertexts SET bot_text = 'Menselijke factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_HUMANFACTOR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Menselijke factor';
UPDATE r5boilertexts SET bot_text = 'Vakkundigheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WORKMANSHIP' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakkundigheid';
UPDATE r5boilertexts SET bot_text = 'Onoplettendheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_HUMANOVERSIGHT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Onoplettendheid';
UPDATE r5boilertexts SET bot_text = 'Signaleringswijze' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_METHODOFDETECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Signaleringswijze';
UPDATE r5boilertexts SET bot_text = '?Copied from Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_COPIEDFROMCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Copied from Case';
UPDATE r5boilertexts SET bot_text = '?Keep Synchronized with Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_KEEPSYNCHRONIZEDWITHCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Keep Synchronized with Case';
UPDATE r5boilertexts SET bot_text = 'Waarom 1' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WHY1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 1';
UPDATE r5boilertexts SET bot_text = 'Waarom 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_WHY2' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarom 2';
UPDATE r5boilertexts SET bot_text = '?Root Cause Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ROOTCAUSEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Root Cause Details';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Record verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record verwijderen';
UPDATE r5boilertexts SET bot_text = 'Record toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record toevoegen';
UPDATE r5boilertexts SET bot_text = '?Translate Function' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFUNCTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Translate Function';
UPDATE r5boilertexts SET bot_text = '?Translate Functional Failure' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFUNCTIONALFAILURE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Translate Functional Failure';
UPDATE r5boilertexts SET bot_text = '?Translate Failure Mode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_TRANSLATEFAILUREMODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Translate Failure Mode';
UPDATE r5boilertexts SET bot_text = 'Valuta kosten stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CURRENCY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta kosten stilstand';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = '?Case Header' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_CASEHEADER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Case Header';
UPDATE r5boilertexts SET bot_text = 'Mitigatiedetails' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Mitigatiedetails';
UPDATE r5boilertexts SET bot_text = 'Organisatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CMMORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie';
UPDATE r5boilertexts SET bot_text = 'Storingsmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodus';
UPDATE r5boilertexts SET bot_text = 'Type mitigatie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONTYPE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Type mitigatie';
UPDATE r5boilertexts SET bot_text = 'Gemitigeerde waarschijnlijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONPROBABILITY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gemitigeerde waarschijnlijkheid';
UPDATE r5boilertexts SET bot_text = '% gemitigeerde waarschijnlijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONPROBPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '% gemitigeerde waarschijnlijkheid';
UPDATE r5boilertexts SET bot_text = '?Failure Mitigation' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Failure Mitigation';
UPDATE r5boilertexts SET bot_text = 'Prioriteitsnummer risico' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RISKPRIORITYNUMBER' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteitsnummer risico';
UPDATE r5boilertexts SET bot_text = 'Risiconiveau' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Risiconiveau';
UPDATE r5boilertexts SET bot_text = 'Prioriteitsnummer niet-gemitigeerd risico' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UNMITIGATEDRPN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Prioriteitsnummer niet-gemitigeerd risico';
UPDATE r5boilertexts SET bot_text = 'Niet-gemitigeerd risiconiveau' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UNMITIGATEDRISKLEVELDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Niet-gemitigeerd risiconiveau';
UPDATE r5boilertexts SET bot_text = 'Opmerking' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_NOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Opmerking';
UPDATE r5boilertexts SET bot_text = 'PO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMSCHEDULE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'PO';
UPDATE r5boilertexts SET bot_text = 'Omschrijving PO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving PO';
UPDATE r5boilertexts SET bot_text = 'Organisatie PO' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie PO';
UPDATE r5boilertexts SET bot_text = 'Uitvoeren om de' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PERFORMEVERY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uitvoeren om de';
UPDATE r5boilertexts SET bot_text = 'Eenheid periode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PERIODUOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid periode';
UPDATE r5boilertexts SET bot_text = 'Meterinterval' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER1INTERVAL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Meterinterval';
UPDATE r5boilertexts SET bot_text = 'Metereenheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER1UOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Metereenheid';
UPDATE r5boilertexts SET bot_text = 'Interval meter 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER2INTERVAL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Interval meter 2';
UPDATE r5boilertexts SET bot_text = 'Eenheid meter 2' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METER2UOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid meter 2';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Onderhoudspatroon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Onderhoudspatroon';
UPDATE r5boilertexts SET bot_text = 'Omschrijving onderhoudspatroon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERNDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving onderhoudspatroon';
UPDATE r5boilertexts SET bot_text = 'Organisatie onderhoudspatroon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MAINTENANCEPATTERNORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie onderhoudspatroon';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'PO-plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMPLAN' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'PO-plan';
UPDATE r5boilertexts SET bot_text = 'Omschrijving PO-plan' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PMPLANDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving PO-plan';
UPDATE r5boilertexts SET bot_text = 'Functiestoring' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FUNCTIONALFAILUREDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Functiestoring';
UPDATE r5boilertexts SET bot_text = 'Project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Project';
UPDATE r5boilertexts SET bot_text = 'Omschrijving van project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving van project';
UPDATE r5boilertexts SET bot_text = 'Projectstatus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROJECTSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Projectstatus';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_MITIGATIONCASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Omschrijving case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CASEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving case';
UPDATE r5boilertexts SET bot_text = 'Status case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CASESTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Status case';
UPDATE r5boilertexts SET bot_text = 'Aspect' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ASPECT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aspect';
UPDATE r5boilertexts SET bot_text = 'Aspectomschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ASPECTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aspectomschrijving';
UPDATE r5boilertexts SET bot_text = 'Eenmalige mitigatiekosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ONETIMEMITIGATIONCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenmalige mitigatiekosten';
UPDATE r5boilertexts SET bot_text = 'Valuta' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ONETIMEMITIGATIONCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta';
UPDATE r5boilertexts SET bot_text = 'Periodieke mitigatiekosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RECURRINGMITIGATIONCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Periodieke mitigatiekosten';
UPDATE r5boilertexts SET bot_text = 'Valuta periodieke mitigatiekosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_RECURRINGMITIGATIONCOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta periodieke mitigatiekosten';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Functie' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FUNCTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Functie';
UPDATE r5boilertexts SET bot_text = 'Waarschijnlijkheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBABILITY_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarschijnlijkheid';
UPDATE r5boilertexts SET bot_text = 'Waarschijnlijkheid (%)' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBPERCENTAGE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Waarschijnlijkheid (%)';
UPDATE r5boilertexts SET bot_text = 'RCM-project' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_STREAMPLUSPROJECTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'RCM-project';
UPDATE r5boilertexts SET bot_text = 'Probleemcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_PROBLEMCODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Probleemcode';
UPDATE r5boilertexts SET bot_text = 'Storingscode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILURECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingscode';
UPDATE r5boilertexts SET bot_text = 'Oorzaakcode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CAUSECODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Oorzaakcode';
UPDATE r5boilertexts SET bot_text = 'Actiecode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ACTIONCODEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Actiecode';
UPDATE r5boilertexts SET bot_text = 'Standaard werkorder' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_STANDARDWODESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Standaard werkorder';
UPDATE r5boilertexts SET bot_text = 'Uren stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMEHRS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Uren stilstand';
UPDATE r5boilertexts SET bot_text = 'Stilstandskosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMECOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Stilstandskosten';
UPDATE r5boilertexts SET bot_text = 'Valuta kosten stilstand' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DOWNTIMECOSTCURR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Valuta kosten stilstand';
UPDATE r5boilertexts SET bot_text = 'Symptoom' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_SYMPTOMDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Symptoom';
UPDATE r5boilertexts SET bot_text = 'Tactische oorzaak' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_TACTICALCAUSEDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Tactische oorzaak';
UPDATE r5boilertexts SET bot_text = 'Menselijke factor' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_HUMANFACTORDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Menselijke factor';
UPDATE r5boilertexts SET bot_text = 'Vakkundigheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_WORKMANSHIPDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Vakkundigheid';
UPDATE r5boilertexts SET bot_text = 'Onoplettendheid' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_HUMANOVERSIGHTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Onoplettendheid';
UPDATE r5boilertexts SET bot_text = 'Signaleringswijze' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_METHODOFDETECTIONDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Signaleringswijze';
UPDATE r5boilertexts SET bot_text = 'Notitie foutmodus' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODENOTE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Notitie foutmodus';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = 'Storingsmodusgegevens' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_FAILUREMODEDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Storingsmodusgegevens';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'Record toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record toevoegen';
UPDATE r5boilertexts SET bot_text = 'Record verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_REMOVERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record verwijderen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CMM_CMMCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = '?Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Corrective Action';
UPDATE r5boilertexts SET bot_text = 'Object' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Object';
UPDATE r5boilertexts SET bot_text = 'Objectomschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENTDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Objectomschrijving';
UPDATE r5boilertexts SET bot_text = 'Org. object' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_EQUIPMENTORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Org. object';
UPDATE r5boilertexts SET bot_text = 'RCM-sjabloon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'RCM-sjabloon';
UPDATE r5boilertexts SET bot_text = 'Omschrijving RCM-sjabloon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEDESCRIPTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving RCM-sjabloon';
UPDATE r5boilertexts SET bot_text = 'Organisatie RCM-sjabloon' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEORG' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Organisatie RCM-sjabloon';
UPDATE r5boilertexts SET bot_text = '?RCM Template Revision' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMTEMPLATEREVISION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?RCM Template Revision';
UPDATE r5boilertexts SET bot_text = '?New Template Revision' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_NEWTEMPLATEREVISION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?New Template Revision';
UPDATE r5boilertexts SET bot_text = '?Apply RCM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYRCM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Apply RCM';
UPDATE r5boilertexts SET bot_text = '?RCM Mapping Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMMAPPINGSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?RCM Mapping Status';
UPDATE r5boilertexts SET bot_text = '?Last Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_LASTCORRECTIVEACTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Last Corrective Action';
UPDATE r5boilertexts SET bot_text = '?RCM Applied' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMAPPLIED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?RCM Applied';
UPDATE r5boilertexts SET bot_text = '?RCM Mitigation Status' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_RCMMITIGATIONSTATUS_DISPLAY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?RCM Mitigation Status';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CREATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt door';
UPDATE r5boilertexts SET bot_text = 'Aangemaakt op' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DATECREATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Aangemaakt op';
UPDATE r5boilertexts SET bot_text = 'Bijgewerkt door' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UPDATEDBY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bijgewerkt door';
UPDATE r5boilertexts SET bot_text = 'Datum bijgewerkt' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DATEUPDATED' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum bijgewerkt';
UPDATE r5boilertexts SET bot_text = 'Record toevoegen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_ADDRECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record toevoegen';
UPDATE r5boilertexts SET bot_text = 'Record verwijderen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DELETERECORD' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Record verwijderen';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 06' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR06' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 06';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 07' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR07' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 07';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 08' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR08' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 08';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 09' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR09' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 09';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 10' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR10' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 10';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 11' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR11' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 11';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 12' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR12' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 12';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 13' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR13' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 13';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 14' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR14' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 14';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 15' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR15' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 15';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 16' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR16' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 16';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 17' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR17' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 17';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 18' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR18' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 18';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 19' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR19' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 19';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 20' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR20' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 20';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 21' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR21' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 21';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 22' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR22' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 22';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 23' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR23' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 23';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 24' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR24' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 24';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 25' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR25' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 25';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 26' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR26' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 26';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 27' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR27' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 27';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 28' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR28' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 28';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 29' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR29' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 29';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedefinieerd veld 30' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHAR30' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedefinieerd veld 30';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. nummer 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFNUM05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. nummer 05';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 01';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 02';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 03';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 04';
UPDATE r5boilertexts SET bot_text = 'Gebruikergedef. datum 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFDATE05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebruikergedef. datum 05';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 01' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX01' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 01';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 02' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX02' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 02';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 03' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 03';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 04' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX04' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 04';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. selectievakje 05' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_UDFCHKBOX05' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. selectievakje 05';
UPDATE r5boilertexts SET bot_text = '?Corrective Action Details' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CORRECTIVEACTIONDETAILSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Corrective Action Details';
UPDATE r5boilertexts SET bot_text = 'Gebr.gedef. velden' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_USERDEFINEDFIELDSSECTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gebr.gedef. velden';
UPDATE r5boilertexts SET bot_text = 'PK' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CORRECTIVEACTIONCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'PK';
UPDATE r5boilertexts SET bot_text = '?Map RCM Data' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_MAPRCMDATA' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Map RCM Data';
UPDATE r5boilertexts SET bot_text = '?Apply Corrective Action' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYCORRECTIVEACTION' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Apply Corrective Action';
UPDATE r5boilertexts SET bot_text = '?Apply Corrective Action to All' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_APPLYCORRECTIVEACTIONTOALL' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Apply Corrective Action to All';
UPDATE r5boilertexts SET bot_text = '?Remove Applied RCM' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_REMOVEAPPLIEDRCM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Remove Applied RCM';
UPDATE r5boilertexts SET bot_text = 'Gevolgen van functiestoringen bewerken' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CFM_EDITFAILURECONSEQUENCES' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Gevolgen van functiestoringen bewerken';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_SUBMIT' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'CCA_CLEAR' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Additional Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Additional Costs';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Line No';
UPDATE r5boilertexts SET bot_text = 'AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Cost';
UPDATE r5boilertexts SET bot_text = 'Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Date';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = '?d.des_code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_COSCOST_D.DES_CODE' AND bot_fld2 = 'COSCOST' AND bot_lang = 'NL' and  bot_text <> '?d.des_code';
UPDATE r5boilertexts SET bot_text = '?d.des_text' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_COSCOST_D.DES_TEXT' AND bot_fld2 = 'COSCOST' AND bot_lang = 'NL' and  bot_text <> '?d.des_text';
UPDATE r5boilertexts SET bot_text = '?cc' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_CASEADCC_CASE' AND bot_fld2 = 'CASEADCC' AND bot_lang = 'NL' and  bot_text <> '?cc';
UPDATE r5boilertexts SET bot_text = 'Additional Costs' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Additional Costs';
UPDATE r5boilertexts SET bot_text = 'Alle records' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_DSNAME' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Alle records';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = 'Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Line No';
UPDATE r5boilertexts SET bot_text = 'AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Date' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Date';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Cost Code' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Cost Code';
UPDATE r5boilertexts SET bot_text = 'Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Cost';
UPDATE r5boilertexts SET bot_text = 'Total Cost' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Total Cost';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_1' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?ProcessUserDefinedScreenService' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_2' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?ProcessUserDefinedScreenService';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_3' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_CF' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_4' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_5' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_6' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_BLOCK_10_7' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Case' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_CASE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Case';
UPDATE r5boilertexts SET bot_text = '?Line No' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_LINE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?Line No';
UPDATE r5boilertexts SET bot_text = '?AFAS No.' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_AFAS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> '?AFAS No.';
UPDATE r5boilertexts SET bot_text = 'Datum' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_DATE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Datum';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COSTDESC' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Kostencode' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COSTCODE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kostencode';
UPDATE r5boilertexts SET bot_text = 'Kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_COST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Kosten';
UPDATE r5boilertexts SET bot_text = 'Totale kosten' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'U1_WSPF_10_COS_TOTALCOST' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Totale kosten';
UPDATE r5boilertexts SET bot_text = '?evo_total' WHERE bot_function = 'SCHADE' AND bot_fld1 = 'WSPF_QUERY_CASEACOS_EVO_TOTAL' AND bot_fld2 = 'CASEACOS' AND bot_lang = 'NL' and  bot_text <> '?evo_total';

COMMIT;
PROMPT ...End of Boierlexts (NL):SCHADE

PROMPT ...Begin of qbz_dml_r5auth
PROMPT

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','-','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','O','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','O','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'CANC');
PROMPT ...END of qbz_dml_r5auth
PROMPT

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-295.sql', '02-12-2022', 'QBZ-EAM 11.7', 'Issue changes delivery');

COMMIT;

PROMPT ...END of SPC-295.log

SPOOL OFF