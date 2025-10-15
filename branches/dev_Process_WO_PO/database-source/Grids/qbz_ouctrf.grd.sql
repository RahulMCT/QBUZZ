-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_ouctrf.grd.sql
--
-- Description : Alert Grid to check if Catalogue Reference exists or not
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 11-03-2024  - MCT - SPC-485 - Security for N-Parts in new tab on WSJOBS screen
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_ouctrf.grd.sql
PROMPT

PROMPT ...Creating grid OUCTRF
PROMPT

DECLARE
  sFunction      VARCHAR(6)   := 'OUCTRF';
  sDesc          VARCHAR2(80) := 'Catalogue Reference validation';
  sGridid        VARCHAR(30);
  sDataspyid1    VARCHAR(30);
  sCheckresult   VARCHAR(4);
  sLang          VARCHAR(2);
  maxbotnum      VARCHAR(30);
  sQuery         VARCHAR2(4000);
  ssourcename    VARCHAR2(4000);
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
  DELETE FROM  r5usegridsysdefault    WHERE usd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5dddataspy            WHERE dds_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridfield            WHERE gfd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridparam            WHERE gdp_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5grid                 WHERE grd_gridname = sFunction;
  DELETE FROM  r5boilertexts          WHERE bot_function = sFunction;
  DELETE FROM  r5pagelayout           WHERE plo_pagename = sFunction;
  DELETE FROM  r5defaultpagelayout    WHERE pld_pagename = sFunction;
  DELETE FROM  r5extmenus             WHERE emn_function = sFunction;
  DELETE FROM  r5permissions          WHERE prm_function = sFunction;
  DELETE FROM  r5functions            WHERE fun_code     = sFunction;
  --create function
  INSERT INTO r5functions (fun_code   ,fun_desc       ,fun_class     ,fun_subtype     ,fun_file
                          ,fun_delete ,fun_insert     ,fun_update    ,fun_select      ,fun_mekey
                          ,fun_auto   ,fun_background ,fun_dirsel    ,fun_system      ,fun_class_org
                          ,fun_lst    ,fun_hdr        ,fun_displayft ,fun_startupview ,fun_splitviewdisplay)
  VALUES(sFunction  ,sDesc  ,'WEBD'  ,'X'   ,'R5MENU'
        ,NULL       ,NULL   ,NULL    ,'?'   ,'YY'
        ,'D'        ,'-'    ,'-'     ,'+'   ,'*'
        ,'+'        ,'-'    ,'+'     ,NULL  ,'S');
  --create ddfield
  --Duplicate Catalogue Ref
  ssourcename :=
'(CASE WHEN EXISTS(SELECT 1 FROM r5catalogue WHERE cat_ref = :parameter.catref
                  UNION
                  SELECT 1 FROM u5wosupp WHERE ou_catalogue = :parameter.catref)
THEN ''Y'' ELSE ''N'' END)';
  SELECT MIN(ddf_fieldid) INTO ddfield1 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER(ssourcename);
  IF ddfield1 IS NULL THEN
    r5o7.o7maxseq(ddfield1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES (ddfield1,ssourcename,'MIXVARCHAR',NULL);
  END IF;
  -- Finds sequence for Grid
  r5o7.o7maxseq (sGridid,'GRD',1,sCheckresult);
  --set grid query
  sQuery := 'FROM dual WHERE 1=1';
  --Creating Grid
  INSERT INTO r5grid(grd_desc               ,grd_gridid                 ,grd_basequery         ,grd_gridname             ,grd_keyfields
                    ,grd_filterablelist     ,grd_sortablelist           ,grd_displayablelist   ,grd_orgcolname           ,grd_basequery_multiorg
                    ,grd_keyfields_multiorg ,grd_filterable_multiorg    ,grd_sortable_multiorg ,grd_displayable_multiorg ,grd_botfunction
                    ,grd_updatecount        ,grd_portletflag            ,grd_secentity         ,grd_hints                ,grd_tab
                    ,grd_gridtype           ,grd_units                  ,grd_optimizeron       ,grd_distinct             ,grd_commitflag
                    ,grd_customfieldcode    ,grd_complex                ,grd_active            ,grd_noscreendesigner     ,grd_mobile
                    ,grd_updated            ,grd_gisdatafilter)
  VALUES(sDesc,sGridid,sQuery,sFunction,ddfield1
        ,ddfield1
        ,ddfield1
        ,ddfield1
        ,NULL,NULL
        ,NULL     ,NULL  ,NULL  ,NULL  ,sFunction
        ,0        ,'-'   ,NULL  ,NULL  ,'-'
        ,8        ,NULL  ,'+'   ,'-'   ,NULL
        ,NULL     ,'-'   ,'+'   ,'-'   ,'-'
        ,SYSDATE  ,'-');
  --creating grid parameters
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES(sGridid,'parameter.catref',NULL,'String',0);
  --creating Grid fields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_scriptevent,gfd_tagname,gfd_updatecount,gfd_tagparams,gfd_aggfunc,gfd_fieldtype,gfd_occurrence,gfd_dependent,gfd_secentity,gfd_headerlocation,gfd_updated) VALUES(ddfield1,sGridid,sFunction,5,'TEXT',NULL,'catref',0,NULL,NULL,'n',1,NULL,NULL,'n',SYSDATE);
  -- Finds sequence for Dataspy
  r5o7.o7maxseq (sDataspyid1 ,'DDS',1,sCheckresult);
  --creating Dataspy
  INSERT INTO r5dddataspy(dds_ddspyname,dds_ddspyid,dds_autorun,dds_scope,dds_organization,dds_updatestamp,dds_updatebyuser,dds_createdstamp,dds_updateable,dds_filterstrxml
  ,dds_sortstrxml,dds_fieldlist,dds_updatecount,dds_displayrow,dds_owner,dds_gridid,dds_type,dds_defaultflag,dds_fieldlist_portlet,dds_clientrows,dds_portletrows,dds_hints,dds_botname,dds_userfilter,dds_securitydataspy,dds_mekey,dds_updated,dds_ddspyfilter,dds_globaldataspy)
  VALUES('All Records', sDataspyid1,NULL,'-','*',NULL,NULL,NULL,NULL,'<FILTERABLE/>'
  ,'<SORTABLE/>',NULL,0,NULL,'R5',sGridid,'SD','+',NULL,50,NULL,NULL,NULL, NULL,'-','YY',SYSDATE,NULL,'+');
  --creating Query fields
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid1, ddfield1, '100', 1, 0, 'LIST',SYSDATE);
  --creating Boiler texts
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_fld2,bot_prtp,bot_lvcr,bot_adlen,bot_pool,bot_changed,bot_display,bot_updatecount,bot_cloned)
  SELECT sFunction,1,100,0,0,lin_code,'List View','TB','1','LST',NULL,NULL,NULL,NULL,'10000','+','-',0,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 1 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_fld2,bot_prtp,bot_lvcr,bot_adlen,bot_pool,bot_changed,bot_display,bot_updatecount,bot_cloned)
  SELECT sFunction,2,100,0,0,lin_code,sDesc,'F','1','UDG_HDRLABEL',NULL,NULL,NULL,NULL,'10000','+','-',0,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 2 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_fld2,bot_prtp,bot_lvcr,bot_adlen,bot_pool,bot_changed,bot_display,bot_updatecount,bot_cloned)
  SELECT sFunction,3,100,0,0,lin_code,'All Records','F','1','DSNAME',NULL,NULL,NULL,NULL,'10000','+','-',0,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 3 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_fld2,bot_prtp,bot_lvcr,bot_adlen,bot_pool,bot_changed,bot_display,bot_updatecount,bot_cloned)
  SELECT sFunction,5,100,0,0,lin_code,'Duplicate Catalogue Ref','F','1','CATREF',NULL,NULL,NULL,NULL,'10000','+','-',0,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 5 AND bot_lang = lin_code);

END;
/
COMMIT;

PROMPT ...Created grid OUCTRF

PROMPT End of qbz_ouctrf.grd.sql
PROMPT
