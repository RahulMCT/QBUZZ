-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_lvwocstatus.grd.sql
--
-- Description : lookup for Type of hours
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 24-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_lvwocstatus.grd.sql
PROMPT

PROMPT ...Creating Lookup LVWOCSTATUS
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
  nfieldid3        NUMBER(12);
  cchk             VARCHAR(30);
BEGIN
  --Set Function name
  cfunction := 'LVWOCSTATUS';
  --Clean Existing Records
  DELETE FROM r5queryfield  WHERE  dqf_ddspyid IN (SELECT dds_ddspyid
                                                   FROM   r5dddataspy
                                                   WHERE  dds_gridid IN (SELECT grd_gridid
                                                                         FROM r5grid
                                                                         WHERE grd_gridname = cfunction));
  DELETE FROM r5dddataspy   WHERE dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5gridfield   WHERE gfd_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5grid        WHERE grd_gridname = cfunction;
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('LVWOCSTATUSCODE','LVWOCSTATUSTEXT','LVWOCSTATUSTYPE');
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;
  --create ddfield
  --Code
  SELECT MIN(ddf_fieldid) INTO nfieldid1 FROM r5ddfield WHERE UPPER(ddf_sourcename) LIKE 'STA_TOSTATUS';
  IF nfieldid1 IS NULL THEN
    r5o7.o7maxseq(nfieldid1,'DDF','1',cchk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid1,'sta_tostatus','VARCHAR',0,NULL);
  END IF;
  --Description
  SELECT MIN(ddf_fieldid) INTO nfieldid2 FROM r5ddfield WHERE UPPER(ddf_sourcename) LIKE 'STA_TOSTATUSDESC';
  IF nfieldid2 IS NULL THEN
    r5o7.o7maxseq(nfieldid2,'DDF','1',cchk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid2,'sta_tostatusdesc','VARCHAR',0,NULL);
  END IF;
  --Type
  SELECT MIN(ddf_fieldid) INTO nfieldid3 FROM r5ddfield WHERE UPPER(ddf_sourcename) LIKE 'STATUSTYPE';
  IF nfieldid3 IS NULL THEN
    r5o7.o7maxseq(nfieldid3,'DDF','1',cchk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid3,'statustype','VARCHAR',0,NULL);
  END IF;
  --set query
  cQuery :=
'FROM(
  SELECT sta_tostatus,sta_tostatusdesc,''nextstatus'' statustype
  FROM u5oustatus a,r5entities e
  WHERE sta_entity      = e.ent_rentity
  AND :parameter.action = ''U''
  AND sta_entity        = ''$CNT''
  AND sta_fromstatus    = :parameter.status
  AND sta_tostatus <> :parameter.status
  UNION
  SELECT distinct sta_fromstatus,sta_fromstatusdesc,''curstatus'' statustype
  FROM u5oustatus d,r5entities ee
  WHERE sta_entity = ee.ent_rentity
  AND :parameter.action = ''U''
  AND sta_entity = ''$CNT''
  AND sta_fromstatus = :parameter.status
  UNION
  SELECT distinct sta_tostatus,sta_tostatusdesc,''curstatus'' statustype
  FROM u5oustatus d,r5entities ee
  WHERE sta_entity = ee.ent_rentity
  AND :parameter.action = ''U''
  AND sta_entity = ''$CNT''
  AND sta_tostatus = :parameter.status
  UNION
  SELECT distinct sta_tostatus,sta_tostatusdesc,''insstatus'' statustype
  FROM u5oustatus a,r5entities e
  WHERE sta_entity = e.ent_rentity
  AND :parameter.action = ''I''
  AND sta_entity = ''$CNT''
  AND sta_fromstatus = ''-'')d';
  --set base query
  cQuery_multiorg := cQuery;
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
  VALUES('Screen Status',cgridid,cQuery,cfunction
         ,nfieldid1
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,NULL,cQuery_multiorg
         ,nfieldid1
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,nfieldid1||','||nfieldid2||','||nfieldid3
         ,'BSLOVS', 3, '-', NULL, NULL, '-', 4, NULL, '+', '-', NULL,  NULL, N'-', N'+', N'-', N'-',  SYSDATE, N'-');
  --creating Grid parameters
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (cgridid,'parameter.status'        ,'status','String',0);
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (cgridid,'parameter.user'          ,'user','String',0);
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (cgridid,'parameter.organization'  ,'org','String',0);
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (cgridid,'parameter.action'        ,'action','String',0);
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvwocstatuscode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid2, cgridid,  'BSLOVS', nmaxbotnum+2, 'TEXT', NULL, 'lvwocstatustext', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid3, cgridid,  'BSLOVS', nmaxbotnum+3, 'TEXT', NULL, 'lvwocstatustype', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  --Get dataspy sequence
  r5o7.o7maxseq( cdataspyid, 'DDS', '1', cchk );
  -- create r5dddataspy
  INSERT INTO r5dddataspy(dds_ddspyname, dds_ddspyid, dds_autorun, dds_scope, dds_organization, dds_updatestamp, dds_updatebyuser, dds_createdstamp, dds_updateable, dds_filterstrxml
                         ,dds_sortstrxml, dds_fieldlist, dds_updatecount, dds_displayrow, dds_owner, dds_gridid, dds_type, dds_defaultflag, dds_fieldlist_portlet, dds_clientrows
                         ,dds_portletrows, dds_hints, dds_botname,  dds_userfilter, dds_securitydataspy, dds_mekey, dds_updated, dds_ddspyfilter, dds_globaldataspy)
  VALUES(N'All Records', cdataspyid, '+', '+', '*', NULL, NULL, NULL,'-', '<FILTERABLE/>'
        ,'<SORTABLE><SORT_ELEMENT ALIAS_NAME="lvwocstatustype" SEQNUM="1" TYPE="ASC"/><SORT_ELEMENT ALIAS_NAME="lvwocstatustext" SEQNUM="2" TYPE="ASC"/></SORTABLE>'
        ,NULL, 0, 10, 'R5', cgridid, 'SD', '+', NULL, 50
        ,5, NULL, NULL,  NULL, '-', 'YY',  SYSDATE, NULL, '+');
  --create query fields
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid1, '30' , 1, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid2, '80' , 2, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid3, '30' , 2, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT N'BSLOVS', nmaxbotnum+1, 30, 0, 0, lin_code, 'Code', 'F', '1', 'LVWOCSTATUSCODE', NULL, NULL, NULL, NULL, '100001', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT N'BSLOVS', nmaxbotnum+2, 80, 0, 0, lin_code, 'Description', 'F', '1', 'LVWOCSTATUSTEXT', NULL, NULL, NULL, NULL, '100001', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+2 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT N'BSLOVS', nmaxbotnum+3, 30, 0, 0, lin_code, 'Type', 'F', '1', 'LVWOCSTATUSTYPE', NULL, NULL, NULL, NULL, '100001', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+3 AND bot_lang = lin_code);
END;
/
COMMIT;

PROMPT ...Created Lookup LVWOCSTATUS
PROMPT

PROMPT ...End of qbz_lvwocstatus.grd.sql
PROMPT
