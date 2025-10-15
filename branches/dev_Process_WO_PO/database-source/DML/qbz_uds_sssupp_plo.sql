-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_sssupp_plo.sql
--
-- Description : Configure pagelayout for SSSUPP
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 17-04-2023  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_sssupp_plo.sql

SET DEFINE OFF;

PROMPT ...Updating Pagelayout for: SSSUPP

UPDATE r5pagelayout SET plo_attribute = 'C' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_6';
UPDATE r5pagelayout SET plo_attribute = 'H' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_9';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 380,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar19';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 390,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar21';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 400,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar23';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 410,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar25';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 420,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar27';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 430,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar29';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 440,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfdate01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 450,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfdate03';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 460,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfdate05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 470,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfnum02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 480,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfnum04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 21,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 490,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchkbox01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 22,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 500,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchkbox05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 320,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar07';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 330,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar09';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 340,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar11';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 350,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar13';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 360,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar15';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 370,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar17';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 10,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 600,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar20';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 11,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 610,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar22';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 12,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 620,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar24';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 13,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 630,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar26';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 14,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 640,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar28';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 15,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 650,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar30';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 16,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 660,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfdate02';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 17,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 670,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfdate04';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 18,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 680,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfnum01';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 19,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 690,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfnum03';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 20,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 700,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfnum05';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 530,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar06';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 540,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar08';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 550,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar10';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 560,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar12';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 570,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar14';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 580,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar16';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'N',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 590,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar18';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 70,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'iprocurevendorcode';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 80,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'accountnumber';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 140,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'status';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 160,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'realtimeinfo';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 760,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'edinumber';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_8',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 770,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'customer';
UPDATE r5pagelayout SET plo_attribute = 'H',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_9',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 780,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'copysupplier';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_1';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_2';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_3';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_4';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_5';
UPDATE r5pagelayout SET plo_attribute = 'O' WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'block_7';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 60,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'classcode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 90,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'purchasesite';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 100,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchkbox02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 110,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchkbox03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 9,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 120,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'leadtime';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 130,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'outofservice';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 150,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'parentsuppliercode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 170,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'services';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 6,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 180,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'grouppurchasingorg1';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 7,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 190,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'grouppurchasingorg2';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_4',plo_fieldgroup = 8,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 200,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchkbox04';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 210,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'minimumordervalue';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 220,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'fobpoint';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 230,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'shipvia';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_5',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 240,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'paybymethod';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 250,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'maximumordervalue';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 260,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'paymentterms';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 270,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'freightterms';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 280,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'buyercode';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 290,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar01';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 300,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar03';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6.4',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 310,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar05';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 510,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar02';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_6.7',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 520,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'udfchar04';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 710,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'contactname';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 720,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'telephonenumber';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 3,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 730,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'faxnumber';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 4,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 740,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'emailaddress';
UPDATE r5pagelayout SET plo_attribute = 'O',plo_presentinjsp = 'Y',plo_fieldcontainer = 'cont_7',plo_fieldgroup = 5,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 750,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'ourcontact';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 2,plo_tabindex = 10,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'suppliercode';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_1',plo_fieldgroup = 1,plo_positioningroup = 2,plo_fieldconttype = 2,plo_tabindex = 20,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'supplierdescription';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_2',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 30,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'supplierorganization';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 1,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 40,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'language';
UPDATE r5pagelayout SET plo_attribute = 'S',plo_presentinjsp = 'S',plo_fieldcontainer = 'cont_3',plo_fieldgroup = 2,plo_positioningroup = 1,plo_fieldconttype = 1,plo_tabindex = 50,plo_defaultvalue = NULL WHERE plo_pagename = 'SSSUPP' AND plo_elementid = 'currencycode';
COMMIT;
PROMPT ...End of Pagelayout: SSSUPP


PROMPT ...End of qbz_uds_sssupp_plo.sql
