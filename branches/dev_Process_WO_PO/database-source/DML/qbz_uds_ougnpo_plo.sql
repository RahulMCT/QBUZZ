-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_ougnpo_plo.sql
--
-- Description : Configure pagelayout for OUGNPO
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 11-11-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_ougnpo_plo.sql

SET DEFINE OFF;

PROMPT ...Delete all OUGNPO pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'OUGNPO%';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_1','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_2','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_3','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_4','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_7','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','block_10_CF','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_date','F','Y','P','cont_12',2,1,1,50,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_genby','F','Y','P','cont_12',3,1,2,60,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_org','F','Y','R','cont_2',2,1,1,20,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_po','F','Y','P','cont_12',1,1,1,40,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_seq','F','Y','P','cont_2',1,1,1,10,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','OUGNPO','wspf_10_por_ven','F','Y','R','cont_3',1,1,1,30,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'OUGNPO%'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...End of qbz_uds_ougnpo_plo.sql