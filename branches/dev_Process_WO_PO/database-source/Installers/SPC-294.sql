-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-294.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 18-11-2022  - MCT - SPC294  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-294.log

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

PROMPT ...Start of SPC-294.sql

PROMPT ...Delete all WUJOBO (WSJOBO_U1) pagelayout
DELETE FROM r5pagelayout WHERE plo_pagename LIKE 'WSJOBO_U1';

PROMPT ...INSERTING into R5PAGELAYOUT
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','WSJOBO_U1','G','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_1','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_2','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_3','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_4','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_5','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_6','B','Y','H',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','block_10_7','B','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','clear','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','delete','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','new','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','submit','LB','Y','O',NULL,NULL,NULL,NULL,NULL,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_act','F','Y','H','cont_1',3,1,1,30,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_amt','F','Y','O','cont_6',1,1,1,190,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_catalogue','F','Y','O','cont_12',2,1,1,220,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_catprice','F','Y','P','cont_3',3,1,1,110,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_comment','F','Y','O','cont_1',4,1,2,40,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_date','F','Y','O','cont_3',1,1,1,90,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_date1','F','Y','O','cont_5',1,1,1,170,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_date2','F','Y','O','cont_7',1,1,1,200,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_hrs','F','Y','O','cont_4',3,1,1,160,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_line','F','Y','P','cont_1',1,1,1,10,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_others','F','Y','O','cont_2',3,1,1,70,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_partdesc','F','Y','O','cont_12',1,1,2,210,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_partno','F','Y','H','cont_2',4,1,1,80,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_partprice','F','Y','O','cont_12',4,1,1,240,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_partqty','F','Y','O','cont_12',5,1,1,250,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_parts','F','Y','O','cont_2',1,1,1,50,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_partuom','F','Y','O','cont_12',3,1,1,230,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_pricep','F','Y','O','cont_5',2,1,1,180,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_qty','F','Y','O','cont_3',2,1,1,100,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_toh','F','Y','O','cont_4',2,1,1,150,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_trade','F','Y','P','cont_4',1,1,1,140,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_uoi','F','Y','P','cont_2',2,1,1,60,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_warranty','F','Y','P','cont_3',4,1,1,120,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_warrantyparts','F','Y','P','cont_3',5,1,1,130,'O','-',0,'YY','E',NULL,NULL,SYSDATE);
INSERT INTO r5pagelayout(plo_usergroup, plo_pagename, plo_elementid, plo_elementtype, plo_presentinjsp, plo_attribute, plo_fieldcontainer, plo_fieldgroup, plo_positioningroup, plo_fieldconttype, plo_tabindex, plo_systemattribute, plo_changed, plo_updatecount, plo_mekey, plo_meflag, plo_defaultvalue, plo_parentpage, plo_lastsaved) VALUES('R5','WSJOBO_U1','wspf_10_ou_wo','F','Y','H','cont_1',2,1,1,20,'R','-',0,'YY','E',NULL,NULL,SYSDATE);
COMMIT;

PROMPT Copy pagelayout from R5 to all other groups
INSERT INTO r5pagelayout
(plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved)
SELECT ugr_code plo_usergroup,plo_pagename,plo_elementid,plo_elementtype,plo_presentinjsp,plo_attribute,plo_fieldcontainer,plo_fieldgroup,plo_positioningroup,plo_fieldconttype,plo_tabindex,plo_systemattribute,plo_changed,plo_updatecount,plo_mekey,plo_meflag,plo_defaultvalue,plo_parentpage,plo_lastsaved
FROM r5groups, r5pagelayout
WHERE plo_pagename LIKE 'WSJOBO_U1'
AND plo_usergroup = 'R5'
AND ugr_code <> 'R5';

COMMIT;

PROMPT ...Updating Pagelayout for: WSJOBO_ACT

UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'block_2';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'block_3';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'block_4';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'block_5';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 730,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar21';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 740,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar23';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 750,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar25';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 760,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar27';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 770,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar29';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 780,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfdate01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 790,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfdate03';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 800,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfdate05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 810,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnum02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 820,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnum04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 830,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchkbox05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 660,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar07';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 670,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar09';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 680,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar11';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 690,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar13';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 700,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar15';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 710,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar17';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 720,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar19';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 940,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar20';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 950,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar22';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 960,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar24';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 970,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar26';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 980,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar28';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 990,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar30';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1000,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfdate02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1010,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfdate04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1020,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnum01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1030,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnum03';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1040,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnum05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1050,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchkbox02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 22,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1060,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchkbox04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 870,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar06';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 880,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar08';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 890,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar10';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 900,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar12';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 910,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar14';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 920,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar16';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 930,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar18';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 1170,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnote01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 1180,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfnote02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 460,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'equipmentorg';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 470,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'relatedworkorder';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 450,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'equipment';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 1070,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'bsccomment';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 20,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'planninglevel';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 110,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'workaccomplished';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 120,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'techpartfailure';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 130,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'manufacturer';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 140,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'suppliercode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 150,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'defmaintenance';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 160,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'totalpersonsreq';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 170,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'totalesthrs';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 180,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'totalhrsremain';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 50,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'multipletrades';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 80,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'suggenddate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 90,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'datelastsched';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 100,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'reasonforrepair';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 290,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'asslevel';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 300,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'complevel';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 310,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'componentlocation';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 320,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'supplierorganization';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 330,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'originaldefworkorder';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 14,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 340,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'origdefworkorderdash';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 14,plo_positioningroup = 3,plo_fieldconttype = 1,plo_tabindex = 350,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'originaldefwoactivity';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 360,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'directmatondefactivity';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 210,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'taskqty';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 3,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 220,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'taskuom';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 230,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'schedhrs';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 240,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'hrsremain';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 270,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'pertype';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 280,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'syslevel';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 480,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'ordercode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 12,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 490,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'orderline';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 500,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'requisitioncode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 13,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 510,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'requisitionline';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 520,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'schedulingsessionid';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 530,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'schedsessiontypedesc';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 540,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'createdfromcuestimate';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 550,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'dispatcherrors';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 380,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'taskrev';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 400,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'matlrev';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 430,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'percentcomplete';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 440,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'completed';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.6',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 560,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actfrompoint';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.6',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 2,plo_tabindex = 570,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'frompointuom';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.6',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 580,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actfrompointrefdesc';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.6',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 590,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actfrompointgeoref';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.61',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 600,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'acttopoint';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.61',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 2,plo_tabindex = 610,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'topointuom';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.61',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 620,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'acttopointrefdesc';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.61',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 630,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'acttopointgeoref';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 840,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchkbox01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1080,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estlaborcost';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 1090,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estlaborcostcurr';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1100,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estmatlcost';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 2,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 1110,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estmatlcostcurr';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4.5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1120,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estmisccost';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4.5',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 1130,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'estmisccostcurr';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4.5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1140,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'totalestcost';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4.5',plo_fieldgroup = 2,plo_positioningroup = 2,plo_fieldconttype = 1,plo_tabindex = 1150,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'totalestcostcurr';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4.5',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 1160,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actassignmentstatus';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'block_1';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_0.5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 10,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'activitynote';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 370,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'task';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 390,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'matlcode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 410,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'warranty';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.5',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 420,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchkbox03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 640,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.7',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 650,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar05';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 850,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2.9',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 860,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar04';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 30,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'activity';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 190,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actstartdate';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 200,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'actenddate';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 40,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'trade';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 250,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'hire';
UPDATE r5pagelayout SET plo_attribute = 'P',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 260,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'udfchar01';
UPDATE r5pagelayout SET plo_attribute = 'R',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 60,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'personsreq';
UPDATE r5pagelayout SET plo_attribute = 'R',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 70,plo_defaultvalue = NULL WHERE plo_pagename = 'WSJOBO_ACT' AND plo_elementid = 'esthrs';
COMMIT;
PROMPT ...End of Pagelayout: WSJOBO_ACT

PROMPT ...Start of Boierlexts : WSJOBO
UPDATE r5boilertexts SET bot_text = 'Warranty Parts' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'ACT_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Warranty Parts';
UPDATE r5boilertexts SET bot_text = 'Add New Part' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_BLOCK_10_7' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Add New Part';
UPDATE r5boilertexts SET bot_text = 'Unit of Issue' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_PARTUOM' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Unit of Issue';
UPDATE r5boilertexts SET bot_text = 'Catalogue Reference No' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_CATALOGUE' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Catalogue Reference No';
UPDATE r5boilertexts SET bot_text = 'Part Not Exist' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_OTHERS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Part Not Exist';
UPDATE r5boilertexts SET bot_text = 'Quantity' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_PARTQTY' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Quantity';
UPDATE r5boilertexts SET bot_text = 'Warranty Parts' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_WARRANTYPARTS' AND bot_fld2 IS NULL AND bot_lang = 'EN' and  bot_text <> 'Warranty Parts';

UPDATE r5boilertexts SET bot_text = 'Garantie artikelen' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'ACT_UDFCHKBOX03' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Garantie artikelen';
UPDATE r5boilertexts SET bot_text = 'Nieuw artikel toevoegen' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_BLOCK_10_7' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Nieuw artikel toevoegen';
UPDATE r5boilertexts SET bot_text = 'Eenheid van uitgifte' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_PARTUOM' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Eenheid van uitgifte';
UPDATE r5boilertexts SET bot_text = 'Catalogus referentie nr' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_CATALOGUE' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Catalogus referentie nr';
UPDATE r5boilertexts SET bot_text = 'Artikel bestaat niet' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_OTHERS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Artikel bestaat niet';
UPDATE r5boilertexts SET bot_text = 'Hoeveelheid' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_PARTQTY' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Hoeveelheid';
UPDATE r5boilertexts SET bot_text = 'Garantie artikelen' WHERE bot_function = 'WSJOBO' AND bot_fld1 = 'U1_WSPF_10_OU_WARRANTYPARTS' AND bot_fld2 IS NULL AND bot_lang = 'NL' and  bot_text <> 'Garantie artikelen';

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
  ,EVT_WARRANTY
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
,SUM((NVL (ou_qty,0) * NVL (ou_catprice,0)) + (NVL (ou_partqty,0) * NVL (ou_partprice,0)))                                                  MAT_COST
,SUM((NVL (ou_hrs,0) * NVL (ou_pricep,0)))                                                                                                  COST_HOURS
,SUM(NVL(OU_AMT,0))                                                                                                                         FIXED_COST
,SUM((NVL(ou_qty,0) * NVL (ou_catprice,0))+(NVL(ou_hrs,0) * NVL (ou_pricep,0))+ NVL(OU_AMT,0)+ (NVL (ou_partqty,0) * NVL (ou_partprice,0))) TOTAL_COST
,EVT_UDFCHKBOX02
,EVT_STATUS
,EVT_JOBTYPE
,EVT_WARRANTY
FROM r5events
JOIN r5objects ON (obj_code = evt_object AND obj_org = evt_object_org)
JOIN u5wosupp  ON (evt_code = ou_wo)
GROUP BY evt_code,evt_org,evt_desc,evt_object,evt_object_org,evt_udfchar19,evt_udfchar23,obj_alias,evt_udfdate09,evt_udfchkbox02,evt_status,evt_jobtype,evt_warranty

/

PROMPT ...Created View qbz_r5wocntchk
PROMPT

PROMPT ...Creating grid OUWOCF_XWO
PROMPT

DECLARE
  sScreen       VARCHAR(6)   := 'OUWOCF';
  sTab          VARCHAR(3)   := 'XWO';
  sDesc         VARCHAR2(80) := 'Work Order Check';
  nftb_seq      NUMBER(2);
  sFunction     VARCHAR(20);
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
  chk           VARCHAR(30);
  nChksSreen    INT;

BEGIN
  --set Grid name
  sFunction := sScreen||'_'||sTab;
  --set ddfields
  SELECT MIN(ddf_fieldid) INTO nfieldid7  FROM r5ddfield WHERE UPPER(ddf_sourcename) LIKE 'R5O7.O7GET_DESC(:PARAMETER.LANGUAGE,''UCOD'', EVT_STATUS,''EVST'', '''')';
  SELECT MIN(ddf_fieldid) INTO nfieldid8  FROM r5ddfield WHERE UPPER(ddf_sourcename) LIKE 'R5O7.O7GET_DESC(:PARAMETER.LANGUAGE,''OBJ'', EVT_OBJECT||''#''||EVT_OBJECT_ORG,'''', '''')';

  --delete If Existing Lookup
  DELETE FROM  r5queryfield
  WHERE dqf_ddspyid IN (SELECT dds_ddspyid
                        FROM   r5dddataspy
                        WHERE  dds_gridid IN (SELECT grd_gridid
                                              FROM   r5grid
                                              WHERE  grd_gridname = sFunction));
  DELETE FROM  r5usegridsysdefault    WHERE usd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5dddataspy            WHERE dds_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridfield            WHERE gfd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridparam            WHERE gdp_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5grid                 WHERE grd_gridname = sFunction;
  DELETE FROM  r5boilertexts          WHERE bot_function = sScreen AND bot_fld1 LIKE sTab||'%';
  DELETE FROM  r5pagelayout           WHERE plo_pagename = sFunction;
  DELETE FROM  r5defaultpagelayout    WHERE pld_pagename = sFunction;
  DELETE FROM  r5extmenus             WHERE emn_function = sFunction;
  DELETE FROM  r5tabpermissions       WHERE trp_function = sScreen AND trp_tab = sTab;
  DELETE FROM  r5permissions          WHERE prm_function = sFunction;
  DELETE FROM  r5functiontabs         WHERE ftb_function = sScreen AND ftb_tab = sTab;

  --find sequence for Grid
  r5o7.o7maxseq (sGridid ,'GRD',1,sCheckresult);
  --find sequence for Dataspy
  r5o7.o7maxseq (sDataspyid ,'DDS',1,sCheckresult);
  --get max tab sequence
  SELECT NVL(MAX(ftb_seq),2)+1 INTO nftb_seq FROM r5functiontabs WHERE ftb_function = sScreen;
  --create function
  INSERT INTO r5functiontabs (ftb_function,ftb_tab,ftb_visible,ftb_select,ftb_update,ftb_insert,ftb_delete,ftb_seq,ftb_updatecount,ftb_mekey,ftb_product)
  VALUES(sScreen,sTab,'+','?',NULL,NULL,NULL,nftb_seq,0,'YY','W');
  --provide tab permissions
  FOR c IN (SELECT prm_group FROM r5permissions WHERE prm_function = sScreen)
  LOOP
    INSERT INTO r5tabpermissions(trp_function,trp_tab,trp_group,trp_visible,trp_select,trp_update,trp_insert,trp_delete,trp_sysrequired,trp_sequence,trp_altersave)
    VALUES(sScreen,sTab,c.prm_group,'+','?',NULL,NULL,NULL,'+',nftb_seq,NULL);
  END LOOP;
  --create ddfield
  --evt_code
   SELECT MIN(ddf_fieldid) INTO nfieldid1 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_CODE';
  IF nfieldid1 IS NULL THEN
    r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid1,'EVT_CODE','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --evt_desc
   SELECT MIN(ddf_fieldid) INTO nfieldid2 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_DESC';
  IF nfieldid2 IS NULL THEN
    r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid2,'EVT_DESC','MIXVARCHAR',0,'R5WOCNTCHK');
  END IF;
  --evt_object
   SELECT MIN(ddf_fieldid) INTO nfieldid3 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_OBJECT';
  IF nfieldid3 IS NULL THEN
    r5o7.o7maxseq(nfieldid3,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid3,'EVT_OBJECT','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --obj_alias
   SELECT MIN(ddf_fieldid) INTO nfieldid4 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'OBJ_ALIAS';
  IF nfieldid4 IS NULL THEN
    r5o7.o7maxseq(nfieldid4,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid4,'OBJ_ALIAS','MIXVARCHAR',0,'R5WOCNTCHK');
  END IF;
  --evt_udfdate09
   SELECT MIN(ddf_fieldid) INTO nfieldid5 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_UDFDATE09';
  IF nfieldid5 IS NULL THEN
    r5o7.o7maxseq(nfieldid5,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid5,'EVT_UDFDATE09','DATE',0,'R5WOCNTCHK');
  END IF;
  --evt_udfchkbox02
   SELECT MIN(ddf_fieldid) INTO nfieldid6 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_UDFCHKBOX02';
  IF nfieldid6 IS NULL THEN
    r5o7.o7maxseq(nfieldid6,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid6,'EVT_UDFCHKBOX02','CHKBOOLEAN',0,'R5WOCNTCHK');
  END IF;
  --Mat_cost
   SELECT MIN(ddf_fieldid) INTO nfieldid9 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'MAT_COST';
  IF nfieldid9 IS NULL THEN
    r5o7.o7maxseq(nfieldid9,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid9,'MAT_COST','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --Fixed_cost
   SELECT MIN(ddf_fieldid) INTO nfieldid10 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'FIXED_COST';
  IF nfieldid10 IS NULL THEN
    r5o7.o7maxseq(nfieldid10,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid10,'FIXED_COST','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --Cost_hours
   SELECT MIN(ddf_fieldid) INTO nfieldid11 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'COST_HOURS';
  IF nfieldid11 IS NULL THEN
    r5o7.o7maxseq(nfieldid11,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid11,'COST_HOURS','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --Total_cost
   SELECT MIN(ddf_fieldid) INTO nfieldid12 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'TOTAL_COST';
  IF nfieldid12 IS NULL THEN
    r5o7.o7maxseq(nfieldid12,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid12,'TOTAL_COST','VARCHAR',0,'R5WOCNTCHK');
  END IF;
  --Warranty
   SELECT MIN(ddf_fieldid) INTO nfieldid13 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_WARRANTY';
  IF nfieldid13 IS NULL THEN
    r5o7.o7maxseq(nfieldid13,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid13,'EVT_WARRANTY','CHKBOOLEAN',0,'R5WOCNTCHK');
  END IF;
  --set query
  sQuery :=
 'FROM r5wocntchk
      WHERE evt_udfchar23 = :parameter.ctl_seq';
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
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13
        ,NULL,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL,sScreen
        ,0          ,'-'     ,NULL    ,NULL    ,'+'
        ,2          ,NULL    ,'+'     ,'-'     ,NULL
        ,NULL       ,'-'     ,'+'     ,'+'     ,'-'
        ,SYSDATE    ,'-');
  --creating Grid parameters
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (sGridid,'parameter.ctl_seq','wspf_10_ctl_seq','String',0);
  --get max bot number
  SELECT MAX(bot_number) INTO maxbotnum FROM r5boilertexts WHERE bot_function = sScreen;
  --creating Gridfields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid1    ,sGridid,sScreen, maxbotnum+4  ,'TEXT'     ,'xwo_evtcode'        ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid2    ,sGridid,sScreen, maxbotnum+5  ,'TEXT'     ,'xwo_evtdesc'        ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid3    ,sGridid,sScreen, maxbotnum+6  ,'TEXT'     ,'xwo_evtobject'      ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid4    ,sGridid,sScreen, maxbotnum+7  ,'TEXT'     ,'xwo_objalias'       ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid5    ,sGridid,sScreen, maxbotnum+8  ,'TEXT'     ,'xwo_evtudfdate09'   ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid6    ,sGridid,sScreen, maxbotnum+9  ,'TEXT'     ,'xwo_evtudfchkbox02' ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid7    ,sGridid,sScreen, maxbotnum+10 ,'TEXT'     ,'xwo_evtstatus'      ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid8    ,sGridid,sScreen, maxbotnum+11 ,'TEXT'     ,'xwo_objdesc'        ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid9    ,sGridid,sScreen, maxbotnum+12 ,'TEXT'     ,'xwo_matcost'        ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid10   ,sGridid,sScreen, maxbotnum+13 ,'TEXT'     ,'xwo_fixedcost'      ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid11   ,sGridid,sScreen, maxbotnum+14 ,'TEXT'     ,'xwo_costhours'      ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid12   ,sGridid,sScreen, maxbotnum+15 ,'TEXT'     ,'xwo_totalcost'      ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid13   ,sGridid,sScreen, maxbotnum+16 ,'TEXT'     ,'xwo_evtwarranty'    ,0,'n',1,'n');

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
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid2   ,'330'  ,2  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid3   ,'120'  ,3  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid8   ,'360'  ,4  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid4   ,'150'  ,5  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid5   ,'90'   ,6  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid6   ,'100'  ,7  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid7   ,'195'  ,9  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid9   ,'115'  ,10 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid10  ,'100'  ,11 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid11  ,'100'  ,12 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid12  ,'100'  ,13 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid13  ,'100'  ,8  ,0,'LIST',SYSDATE);
  --creating Boilertexts
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+1 ,255,0,0,lin_code, 'Work Order Check'  ,'TB',1 ,'XWO',NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+1  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+2 ,100,0,0,lin_code,  sDesc              ,'F' ,1 ,'XWO_HDRLABEL'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+2  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+3 ,100,0,0,lin_code, 'All Records'       ,'F' ,1 ,'XWO_DSNAME'             ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+3  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+4 ,100,0,0,lin_code, 'Work Order'        ,'F' ,1 ,'xwo_evtcode'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+4  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+5 ,100,0,0,lin_code, 'Work Order Desc'   ,'F' ,1 ,'xwo_evtdesc'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+5  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+6 ,100,0,0,lin_code, 'Asset'             ,'F' ,1 ,'xwo_evtobject'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+6  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+7 ,100,0,0,lin_code, 'Licence Plate'     ,'F' ,1 ,'xwo_objalias'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+7  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+8 ,100,0,0,lin_code, 'Date Ready'        ,'F' ,1 ,'xwo_evtudfdate09'   ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+8  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+9 ,100,0,0,lin_code, 'Agree'             ,'F' ,1 ,'xwo_evtudfchkbox02' ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+9  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+10,100,0,0,lin_code, 'Work Order Status' ,'F' ,1 ,'xwo_evtstatus'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+10 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+11,100,0,0,lin_code, 'Asset Desc'        ,'F' ,1 ,'xwo_objdesc'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+11 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+12,100,0,0,lin_code, 'Material Cost'     ,'F' ,1 ,'xwo_matcost'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+12 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+13,100,0,0,lin_code, 'Fixed Cost'        ,'F' ,1 ,'xwo_fixedcost'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+13 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+14,100,0,0,lin_code, 'Cost Hours'        ,'F' ,1 ,'xwo_costhours'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+14 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+15,100,0,0,lin_code, 'Total Cost'        ,'F' ,1 ,'xwo_totalcost'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+15 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+16,100,0,0,lin_code, 'Warranty'          ,'F' ,1 ,'xwo_evtwarranty'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+16 AND bot_lang = lin_code);  
END;
/
COMMIT;

PROMPT ...Created grid OUWOCF_XWO
PROMPT

PROMPT ...Queries for User defined screen: WUJOBO

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

INSERT INTO r5queries(que_code,que_desc,que_text,que_normal,que_asset,que_inbox,que_kpi,que_lookup,que_chart)
SELECT 'SUPWARR','Warranty','1=1','+','+','-','-','-','-'FROM dual WHERE NOT EXISTS(SELECT 1 FROM r5queries WHERE que_code = 'SUPWARR');

UPDATE r5queries
SET que_text = 'SELECT NVL((SELECT CASE WHEN act_warranty = ''+'' THEN ''-1'' ELSE ''0'' END
            FROM r5activities
            WHERE act_event = :2
            AND   act_act   = :3),0) val
FROM dual'
WHERE que_code = 'SUPWARR';

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
  type catr_tbl    is table of u5wosupp.ou_catalogue%TYPE;
  type parp_tbl    is table of u5wosupp.ou_partprice%TYPE;
  type parqt_tbl   is table of u5wosupp.ou_partqty%TYPE;
  type pdesc_tbl   is table of u5wosupp.ou_partdesc%TYPE;
  type puom_tbl    is table of u5wosupp.ou_partuom%TYPE;
  type pchk_tbl    is table of u5wosupp.ou_others%TYPE;
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
  cpart        r5parts.par_code%TYPE;
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
  cwoccmn      cmnts_tbl;     --Comments
  cwocpcat     catr_tbl;      --Cat ref
  cwocpprc     parp_tbl;      --Part price
  cwocpqty     parqt_tbl;     --Qty
  cwocpdsc     pdesc_tbl;     --Desc
  cwocpuom     puom_tbl;      --UOM
  cwocpchk     pchk_tbl;      --Check

  CURSOR WOSUPP(p_sevt VARCHAR2) IS
    SELECT evt_udfchar19,evt_desc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  --procedure called from WO
  IF p_ssource = 'WO' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
             ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
             ,ou_wo,ou_comment,ou_catalogue,ou_partprice,ou_partqty
             ,ou_partdesc,ou_partuom,ou_others
             FROM r5events
             JOIN u5wosupp ON (ou_wo = evt_code)
             WHERE evt_code = '''||p_scode||'''
             AND NOT EXISTS(SELECT 1
                             FROM r5orderlines
                             WHERE orl_event = '''||p_scode||''')';
  ELSIF p_ssource = 'WOC' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
              ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
              ,ou_wo,ou_comment,ou_catalogue,ou_partprice,ou_partqty
             ,ou_partdesc,ou_partuom,ou_others
              FROM u5oupord,r5events
              JOIN u5wosupp ON(ou_wo = evt_code)
              JOIN u5wocont ON(ctl_seq = evt_udfchar23 AND ctl_ven = evt_udfchar19)
              JOIN r5companies ON (com_code = evt_udfchar19)
              WHERE por_seq = '''||p_scode||'''
              AND evt_status IN (''TF'',''CA'')
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
                      ,cwocwon,cwoccmn,cwocpcat,cwocpprc,cwocpqty
                      ,cwocpdsc,cwocpuom,cwocpchk LIMIT 100;
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
      IF cwocpchk(i) = '+' THEN
        o7inspar(cpart,'*',cwocpdsc(i),'-',cwocpuom(i),cchk);
        INSERT INTO r5catalogue(cat_part,cat_supplier,cat_date
                               ,cat_gross,cat_purprice,cat_puruom
                               ,cat_ref,cat_curr,cat_supplier_org
                               ,cat_part_org,cat_desc)
                         VALUES(cpart,csupplier,TRUNC(SYSDATE)
                               ,cwocpprc(i),cwocpprc(i),cwocpuom(i)
                               ,cwocpcat(i),'EUR','*'
                               ,'*',cwocpdsc(i));
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,cpart,'*',dcurdate,cwocpprc(i),'EUR',nexch,cwocpqty(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocpuom(i),'PD','PD',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        cpart := NULL;
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                                  ,add_code, add_lang, add_line, add_print, add_text
                                  , add_user, add_updatecount)
                           VALUES ('PORL','PORL','*','*'
                                  ,corder||'#'||p_sorg||'#'||nordline,clang,10,'+',cwoccmn(i)
                                  ,cuser,0);
        END IF;--cwoccmn(i) comments not NULL
      END IF;---cwocpchk(i) = '+' new part created
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
    ,evt_rstatus = 'C'
    WHERE evt_code = i.orl_event;
  END LOOP;--i  
END QBZ_AUTOPOREC;
/
SHOW ERRORS PROCEDURE QBZ_AUTOPOREC
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

PROMPT ...Creating trigger COMP_UPD_EVT_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_UPD_EVT_QBZ
FOR UPDATE ON R5EVENTS
COMPOUND TRIGGER
  --local variables
  TYPE            newevtcodetype     IS TABLE OF r5events.evt_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newevtorgtype      IS TABLE OF r5events.evt_org%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newevtsupptype     IS TABLE OF r5events.evt_udfchar19%TYPE INDEX BY BINARY_INTEGER;

  newevtcode      newevtcodetype ;
  newevtorg       newevtorgtype ;
  newevtsupp      newevtsupptype;

  countit         NUMBER;
  cnt             NUMBER := 0;
  createPO        BOOLEAN := FALSE;
  v_error         NUMBER;
  v_errmesg       VARCHAR2(512);

AFTER EACH ROW IS
BEGIN
  IF UPDATING
   AND :NEW.evt_status  =  'AG'
   AND :NEW.evt_status  <> :OLD.evt_status
   AND :NEW.evt_rtype   IN ('JOB','PPM')
   AND :NEW.evt_udfchar19 IS NOT NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newevtcode(cnt)  := :new.evt_code;
     newevtorg(cnt)   := :new.evt_org;
     newevtsupp(cnt)  := :new.evt_udfchar19;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR j in 1..cnt
  LOOP
    --count of supplier monthly check '-'
    SELECT COUNT(1) INTO countit
    FROM r5companies
    WHERE com_code = newevtsupp(j)
    AND com_udfchkbox02 = '-';
    IF countit = 1 THEN
      createPO := TRUE;
    END IF;  --countit = 1
    IF createPO THEN
      QBZ_AUTOPO(newevtorg(j),newevtcode(j),'WO'); --Create Auto PO
    END IF; --createPO
  END LOOP;
END AFTER STATEMENT;

END COMP_UPD_EVT_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_EVT_QBZ
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
    --AND evt_jobtype    <> 'SCH'
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

PROMPT ...Creating trigger PREUPD_U5WOS_QBZ

CREATE OR REPLACE TRIGGER PREUPD_U5WOS_QBZ
BEFORE UPDATE OR INSERT ON U5WOSUPP
FOR EACH ROW
DECLARE
  countit   NUMBER;
BEGIN
  --Quantity must be greater than 0
  IF :new.ou_qty <= 0 
   OR (:new.ou_others = '+' AND :new.ou_partqty <= 0)THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  --Quantity must be greater than 0
  ELSIF :new.ou_amt < 0 THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  --Quantity must be greater than 0
  ELSIF :new.ou_hrs <= 0 THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);  
  --Please enter Part Or Labor Hrs Or Fixed amount fields  
  ELSIF :new.ou_act IS NOT NULL
   AND :new.ou_parts IS NULL
   AND :new.ou_amt IS NULL
   AND :new.ou_toh IS NULL 
   AND :new.ou_others = '-' THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',15);
  --Please enter Quantity
  ELSIF :new.ou_parts IS NOT NULL
   AND :new.ou_qty IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',6);
  --Please enter Part
  ELSIF (:new.ou_parts IS NULL
   AND :new.ou_qty IS NOT NULL)
    OR (:new.ou_others = '+' AND (:new.ou_catalogue IS NULL 
                               OR :new.ou_partdesc IS NULL
                               OR :new.ou_partqty  IS NULL
                               OR :new.ou_partuom  IS NULL
                               OR :new.ou_partprice IS NULL))THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',10);
  --Please enter No of Hrs
  ELSIF :new.ou_hrs IS NULL
   AND :new.ou_toh IS NOT NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',11);
  --Please enter Type of Hours
  ELSIF :new.ou_hrs IS NOT NULL
   AND :new.ou_toh IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',12);
  --Please enter Type and No of Hours
  ELSIF :new.ou_hrs IS NULL
   AND :new.ou_toh IS NULL
   AND :new.ou_pricep IS NOT NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',13);
  --Not allowed to enter Fixed price with Labor hours/Part
  ELSIF :new.ou_amt IS NOT NULL
   AND (:new.ou_hrs IS NOT NULL
        OR :new.ou_parts IS NOT NULL
        OR :new.ou_others = '+') THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',7);
  END IF;  ---new.ou_amt IS NOT NULL
END PREUPD_U5WOS_QBZ;
/
SHOW ERRORS TRIGGER PREUPD_U5WOS_QBZ
PROMPT

PROMPT ...Creating trigger COMP_UPD_WOS_QBZ

CREATE OR REPLACE TRIGGER COMP_UPD_WOS_QBZ
FOR INSERT OR UPDATE ON u5wosupp
COMPOUND TRIGGER
  --local variables
  TYPE            newwoscodetype     IS TABLE OF u5wosupp.ou_wo%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwospartype      IS TABLE OF u5wosupp.ou_parts%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwosacttype      IS TABLE OF u5wosupp.ou_act%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newwoscomtype      IS TABLE OF u5wosupp.ou_comment%TYPE INDEX BY BINARY_INTEGER;

  newevtcode      newwoscodetype ;
  newevtpar       newwospartype ;
  newevtact       newwosacttype;
  newevtcom       newwoscomtype;

  countit         NUMBER;
  ccountit        NUMBER;
  pcountit        NUMBER;
  hcountit        NUMBER;
  cnt             NUMBER := 0;
  cnt1            NUMBER := 0;
  cuser           r5users.usr_code%type;
  clang           r5users.usr_lang%type;
  cadtext         r5addetails.add_text%type;

AFTER EACH ROW IS
BEGIN
  IF :new.ou_parts IS NOT NULL
   OR :new.ou_amt IS NOT NULL
   OR :new.ou_hrs IS NOT NULL 
   OR :new.ou_catalogue IS NOT NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newevtcode(cnt)  := :new.ou_wo;
     newevtact(cnt)   := :new.ou_act;
  END IF;
  IF :NEW.ou_comment IS NOT NULL THEN
    --save record for statement level processing
     cnt1              := cnt1 + 1;
     newevtcode(cnt1)  := :new.ou_wo;
     newevtcom(cnt1)   := :new.ou_comment;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i in 1..cnt
  LOOP
    SELECT MAX(ouhrs),MAX(ouamt),MAX(ouParts),MAX(oucatparts) INTO hcountit,pcountit,countit,ccountit FROM(
    SELECT
    COUNT(ou_hrs)        over (partition by ou_wo,ou_act)              ouhrs
    ,COUNT(ou_amt)       over (partition by ou_wo,ou_act)              ouamt
    ,COUNT(ou_parts)     over (partition by ou_wo,ou_act,ou_parts)     ouparts
    ,COUNT(ou_catalogue) over (partition by ou_wo,ou_act,ou_catalogue) oucatparts
    FROM U5WOSUPP
    WHERE ou_wo = newevtcode(i)
    AND ou_act  = newevtact(i));
    --same Part or Labor or FixAmt cannot be entered twice for same activity
    IF hcountit > 1
     OR pcountit > 1
     OR ccountit > 1
     OR countit > 1 THEN
      o7err.raise_error('COMP_UPD_WOS_QBZ','TRIG',16);
    --either Labor or FixAmt can be entered for same activity
    ELSIF pcountit = 1 AND hcountit = 1 THEN
      o7err.raise_error('COMP_UPD_WOS_QBZ','TRIG',17);
    END IF;--countit >= 1
  END LOOP;
  FOR j in 1..cnt1
  LOOP
    FOR i IN (SELECT ou_comment
             FROM u5wosupp
             WHERE ou_wo = newevtcode(j)
             AND ou_comment IS NOT NULL
             ORDER BY ou_line)
    LOOP
      cadtext := cadtext||CHR(13)||i.ou_comment;
    END LOOP;--i ou_comment loop
    cadtext := SUBSTR(cadtext,INSTR(cadtext,CHR(13))+1,LENGTH(cadtext));
    --update comments
    UPDATE r5addetails
    SET add_text = cadtext
    WHERE add_code = newevtcode(j)
    AND   add_rentity = 'EVNT'
    AND   add_type = '+';
    IF SQL%NOTFOUND THEN
      cuser := NVL( o7sess.cur_user, '*' );
      SELECT usr_lang INTO clang
      FROM r5users
      WHERE usr_code = cuser;
      INSERT INTO r5addetails (add_entity, add_rentity, add_type, add_rtype
                              ,add_code, add_lang, add_line, add_print, add_text
                              , add_user, add_updatecount)
                       VALUES ('EVNT','EVNT','+','*'
                              ,newevtcode(j),clang,10,'+',newevtcom(j)
                              ,cuser,0);
    END IF;--SQL%NOTFOUND
  END LOOP;--j
END AFTER STATEMENT;

END COMP_UPD_WOS_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_WOS_QBZ
PROMPT

PROMPT ...Creating error texts Of U5WOSUPP

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS06');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS06');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 10, 'QBZWOS06', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Please enter Part details','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Voer de gegevens van het onderdeel in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO04');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 4, 'QBZATPO04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'No record found to Generate PO.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'Geen record gevonden om PO te genereren.','NL', '-');

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-294.sql', '18-11-2022', 'QBZ-EAM 11.7', 'Issue changes delivery');

COMMIT;

PROMPT ...END of SPC-294.log

SPOOL OFF