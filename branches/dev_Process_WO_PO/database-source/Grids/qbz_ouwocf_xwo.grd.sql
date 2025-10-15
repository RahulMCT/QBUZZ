-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_ouwocf_xwo.grd.sql
--
-- Description : Work order check tab on work order control screen to show all in control work order
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 28-09-2022 - MCT - SPC254 - New Script for Work order check tab on Work order control screen.
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_ouwocf_xwo.grd.sql
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
  nfieldid14    NUMBER(12);
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
  --Location
   SELECT MIN(ddf_fieldid) INTO nfieldid14 FROM r5ddfield WHERE ddf_tablename = 'R5WOCNTCHK' AND UPPER(ddf_sourcename) = 'EVT_UDFCHAR40';
  IF nfieldid14 IS NULL THEN
    r5o7.o7maxseq(nfieldid14,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid14,'EVT_UDFCHAR40','MIXVARCHAR',0,'R5WOCNTCHK');
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
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6 ||','||nfieldid7||','||nfieldid8 ||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14
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
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid14   ,sGridid,sScreen, maxbotnum+17 ,'TEXT'     ,'xwo_evtudfchar40'   ,0,'n',1,'n');

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
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid14  ,'100'  ,14 ,0,'LIST',SYSDATE);
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
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sScreen,maxbotnum+17,100,0,0,lin_code, 'Location'          ,'F' ,1 ,'xwo_evtudfchar40'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL 
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sScreen AND bot_number = maxbotnum+17 AND bot_lang = lin_code);  
END;
/
COMMIT;

PROMPT ...Created grid OUWOCF_XWO
PROMPT

PROMPT ...End of qbz_ouwocf_xwo.grd.sql
PROMPT