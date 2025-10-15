-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_wstrad_plo.sql
--
-- Description : Configure pagelayout for WSTRAD
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 02-12-2022  - MCT - SPC295  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_wstrad_plo.sql

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

PROMPT ...End of qbz_uds_wstrad_plo.sql