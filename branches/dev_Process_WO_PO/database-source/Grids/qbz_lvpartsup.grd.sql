-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_lvpartsup.grd.sql
--
-- Description : lookup for parts
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 30-08-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_lvpartsup.grd.sql
PROMPT

PROMPT ...Creating Lookup LVPARTSUP
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
  nfieldid4        NUMBER(12);
  nfieldid5        NUMBER(12);
  cchk             VARCHAR(30);
  chk              VARCHAR(30);
BEGIN
  --Set Function name
  cfunction := 'LVPARTSUP';
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
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('lvpartsupcatcode','lvpartsupdesc','lvpartsuprice','lvpartsupparcode','lvpartsupparuom');
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;
  --set ddfields
  SELECT MIN(ddf_fieldid) INTO nfieldid1  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5CATALOGUE' AND UPPER(ddf_sourcename) = 'CAT_REF';
  IF nfieldid1 IS NULL THEN
  r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid1 ,'CAT_REF','VARCHAR','R5CATALOGUE');
  END IF;
  SELECT MIN(ddf_fieldid) INTO nfieldid2  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5CATALOGUE' AND UPPER(ddf_sourcename) = 'CAT_DESC';
  IF nfieldid2 IS NULL THEN
  r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid2 ,'CAT_DESC','MIXVARCHAR','R5CATALOGUE');
  END IF;
  SELECT MIN(ddf_fieldid) INTO nfieldid3  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5CATALOGUE' AND UPPER(ddf_sourcename) = 'CAT_GROSS';
  IF nfieldid3 IS NULL THEN
  r5o7.o7maxseq(nfieldid3,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid3 ,'CAT_GROSS','MIXVARCHAR','R5CATALOGUE');
  END IF;
  SELECT MIN(ddf_fieldid) INTO nfieldid4  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5PARTS' AND UPPER(ddf_sourcename) = 'PAR_CODE';
  IF nfieldid4 IS NULL THEN
  r5o7.o7maxseq(nfieldid4,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid4 ,'PAR_CODE','VARCHAR','R5PARTS');
  END IF;
  SELECT MIN(ddf_fieldid) INTO nfieldid5  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5PARTS' AND UPPER(ddf_sourcename) = 'PAR_UOM';
  IF nfieldid5 IS NULL THEN
  r5o7.o7maxseq(nfieldid5,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid5 ,'PAR_UOM','VARCHAR','R5PARTS');
  END IF;

  --set query
  cQuery :=
'FROM r5catalogue c,r5parts p ,r5events e
WHERE p.par_code       = c.cat_part
AND   p.par_org        = c.cat_part_org
AND   p.par_byasset   != ''+''
AND   cat_supplier     = e.evt_udfchar19
AND   e.evt_Code       = :parameter.workordernum
AND   c.cat_ref IS NOT NULL
AND   c.cat_gross <> 0';

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
  VALUES('parts lov for suppliers',cgridid,cQuery,cfunction
         ,nfieldid1||','||nfieldid3
         ,nfieldid1||','||nfieldid2||','||nfieldid3||','||nfieldid4||','||nfieldid5
         ,nfieldid1||','||nfieldid2||','||nfieldid3||','||nfieldid4||','||nfieldid5
         ,nfieldid1||','||nfieldid2||','||nfieldid3||','||nfieldid4||','||nfieldid5
         ,NULL,NULl,NULL,NULL,NULL,NULL
         ,'BSLOVS',0,'-',NULL,NULL,'-',4,NULL,'+','-',NULL,NULL,'-','+','-','-',SYSDATE,'-');
  --creating Grid parameters
  INSERT INTO r5gridparam(gdp_gridid,gdp_param,gdp_tagname,gdp_datatype,gdp_updatecount) VALUES (cgridid,'parameter.workordernum','wonum','String',0);
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvpartsupcatcode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid2, cgridid,  'BSLOVS', nmaxbotnum+2, 'TEXT', NULL, 'lvpartsupdesc', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid3, cgridid,  'BSLOVS', nmaxbotnum+3, 'TEXT', NULL, 'lvpartsuprice', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid4, cgridid,  'BSLOVS', nmaxbotnum+4, 'TEXT', NULL, 'lvpartsupparcode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid5, cgridid,  'BSLOVS', nmaxbotnum+5, 'TEXT', NULL, 'lvpartsupparuom', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
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
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid1, '130'  , 1, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid2, '360'  , 2, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid3, '120'  , 3, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid4, '170'  , 4, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid5, '110'  , 5, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+1, 50, 0, 0, lin_code, ' CatRef code', 'F', '1', 'lvpartsupcatcode', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+2, 50, 0, 0, lin_code, 'Description', 'F', '1', 'lvpartsupdesc', NULL, NULL, NULL, NULL, '25000', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+2 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+3, 50, 0, 0, lin_code, 'Price', 'F', '1', 'lvpartsuprice', NULL, NULL, NULL, NULL, '25000', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+3 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+4, 50, 0, 0, lin_code, 'Part code', 'F', '1', 'lvpartsupparcode', NULL, NULL, NULL, NULL, '25000', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+4 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+5, 50, 0, 0, lin_code, 'UOM', 'F', '1', 'lvpartsupparuom', NULL, NULL, NULL, NULL, '25000', '-', '-', 0,  NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+5 AND bot_lang = lin_code);
END;
/

COMMIT;

PROMPT ...Created Lookup LVPARTSUP
PROMPT

PROMPT ...End of qbz_lvpartsup.grd.sql
PROMPT
