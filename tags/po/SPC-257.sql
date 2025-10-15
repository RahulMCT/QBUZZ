-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-257.sql
--
-- Description : New version Work Order control Business Rules
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 21-10-2022  - MCT - SPC257  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-257.log

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

PROMPT ...Start of SPC-257.sql

PROMPT ...Updated ddfield
UPDATE r5ddfield
set ddf_tablename = NULL
,ddf_sourcename = 'nvl((SELECT max(to_number(ctl_seq)) + 1 FROM U5WOCONT), 1)'
WHERE UPPER(ddf_sourcename) = UPPER('nvl((SELECT max(ctl_seq) + 1 FROM U5WOCONT), 1)');
COMMIT;
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

PROMPT ...Begin of qbz_dml_r5auth.sql.sql
PROMPT
--R5
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','Q','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'Q');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RMS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RMS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','A','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','A','RPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'RPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','AG','IC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'IC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','C','BRNC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'BRNC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','C','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','CA','TF','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'CA'
                   AND aut_statnew = 'TF');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','CPO','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'CPO'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','DOS','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','DOS','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','GBV','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'GBV'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','HVL','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'HVL'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','IC','TF','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'TF');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','P','T','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'P'
                   AND aut_statnew = 'T');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','Q','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'Q'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','Q','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'Q'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','P','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'P');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RPO','CPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RPO'
                   AND aut_statnew = 'CPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','CSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWS','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','T','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'T'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','T','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'T'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','TCS','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'IBL');

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','CL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'CL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','J','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'J');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','-','KA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'KA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'R');

--VLOOT-MAN

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','RSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','A','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','A','RPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'RPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','AG','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','AL','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AL'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','DI','CA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DI'
                   AND aut_statnew = 'CA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','DOS','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','DOS','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','HVL','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'HVL'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','OP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'OP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','TC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'TC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','WM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'WM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IC','DI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'DI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','OP','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'OP'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','PA','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'PA'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','HVL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'HVL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RAI','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RAI','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RAI','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RGV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RGV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RGV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RGV','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RPO','CPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RPO'
                   AND aut_statnew = 'CPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RSM','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RSM','CSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWI','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWI','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWI','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWP','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWP','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWP','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWP','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWS','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWV','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','TC','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TC'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','TCS','AG','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'AG');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','AL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'AL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','IBQ','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBQ');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','-','KA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'KA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','KA','GA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'KA'
                   AND aut_statnew = 'GA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','J','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'J');

--SUPPLIER

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','A','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','AG','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IC','DI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'DI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','TCS','AG','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'AG');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','AL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'AL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBL');
COMMIT;

PROMPT ...END of qbz_dml_r5auth.sql
PROMPT

PROMPT Begin of qbz_s5process.seq.sql
PROMPT

TRUNCATE TABLE U5R5PROCESS;

PROMPT  ...Creating sequence S5PROCESS
DECLARE
sexist INT;
BEGIN
  --check existence
  SELECT COUNT(1) INTO sexist FROM dual WHERE EXISTS(SELECT 1 FROM user_sequences WHERE sequence_name = 'S5PROCESS');
  --create sequence if not exists
  IF sexist = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE S5PROCESS START WITH 10000 INCREMENT BY 1 NOCACHE NOCYCLE';
  END IF;
END;
/

PROMPT  ...Created sequence S5PROCESS


--create default record to invoke the screen from EF
INSERT INTO u5r5process(prs_id,prs_screen,prs_status,prs_object,createdby,created,lastsaved,updatecount)
SELECT 'KUPRCS','KUPRCS','NEW','DUMMY','R5',SYSDATE,SYSDATE,0
FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5r5process WHERE prs_id = 'KUPRCS');

COMMIT;


PROMPT Begin of qbz_o7maxseq.fnc.sql
PROMPT


PROMPT  ..Creating Function qbz_o7maxseq

CREATE OR REPLACE FUNCTION qbz_o7maxseq(p_entity   IN VARCHAR2)
RETURN VARCHAR2 IS

v_chk            VARCHAR2(4) := '0';
ccalc          VARCHAR2(30);
seqname          VARCHAR2( 30 );
tenant           VARCHAR2( 50 );
cursor1          INTEGER;
ignore           INTEGER;
code             NUMBER;
statement        VARCHAR2( 8000 );
prefix           VARCHAR2( 30 );
CURSOR ins( curtype VARCHAR2 ) IS
  SELECT UPPER( ins_desc )
  FROM   r5install, r5seqinstallmapping
  WHERE  ins_code     = sim_installparameter
  AND    sim_sequence = curtype;

BEGIN
/* Check mandatory parameters */
   IF p_entity IS NULL THEN
     o7err.raise_error( 'O7MAXSEQ', 'PROC', 1 );
   END IF;
   IF    p_entity  = 'KUPRCS'     THEN SEQNAME := 'PROCESS';
   ELSE
       r5o7.o7maxseq(ccalc, p_entity,'1', v_chk);
   END IF;

   /* Retrieve tenant code */
   tenant := o7getten;
   IF tenant IS NOT NULL THEN
      tenant := '_'||tenant;
   END IF;
   /* Retrieve new code */
    statement := 'SELECT "S5'||seqname||tenant||'".NEXTVAL FROM DUAL';
   EXECUTE IMMEDIATE statement INTO ccalc;

   /* Prefix? */
   OPEN  ins( p_entity );
   FETCH ins INTO prefix;
   CLOSE ins;
   IF prefix IS NOT NULL AND ccalc IS NOT NULL THEN
     ccalc := prefix||ccalc;              -- CM 8383
   END IF;
   RETURN ccalc;
--return null if exception occurs
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END qbz_o7maxseq;
/

SHOW ERRORS FUNCTION qbz_o7maxseq
PROMPT

PROMPT ...Created Function qbz_o7maxseq

PROMPT End of qbz_o7maxseq.fnc.sql
PROMPT

PROMPT '...Creating grid LVCUSTMAXSEQ'
PROMPT
DECLARE
  cfunction        VARCHAR2(30);
  cgridid          VARCHAR2(30);
  cdataspyid       VARCHAR2(30);
  cQuery           VARCHAR2(4000);
  cQuery_multiorg  VARCHAR2(4000);
  nmaxbotnum       NUMBER(8);
  nfieldid1        NUMBER(12);
  cchk             VARCHAR(30);
BEGIN
  --Set Function name
  cfunction := 'LVCUSTMAXSEQ';
  --Clean Existing Records
  DELETE FROM r5queryfield  WHERE  dqf_ddspyid IN (SELECT dds_ddspyid
                                                   FROM   r5dddataspy
                                                   WHERE  dds_gridid IN (SELECT grd_gridid
                                                                         FROM r5grid
                                                                         WHERE grd_gridname = cfunction));
  DELETE FROM r5dddataspy   WHERE dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5gridfield   WHERE gfd_gridid IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = cfunction);
  DELETE FROM r5grid        WHERE grd_gridname = cfunction;
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('lvcustmaxseq');
  DELETE FROM r5ddfield     WHERE ddf_fieldid  = 700001;
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;

  --set ddfields
  nfieldid1  := 700001;     --custom max sequence

  --create ddfield
  INSERT INTO r5ddfield (DDF_FIELDID,DDF_SOURCENAME,DDF_DATATYPE,DDF_TABLENAME)
  VALUES(nfieldid1,'qbz_o7maxseq(:parameter.entity )','MIXVARCHAR',NULL);

  --set query
  cQuery := 'FROM dual where 1=1';
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
  VALUES('Max Sequence',cgridid,cQuery,cfunction
         ,nfieldid1
         ,nfieldid1
         ,nfieldid1
         ,nfieldid1
         ,NULL,cQuery_multiorg
         ,nfieldid1
         ,nfieldid1
         ,nfieldid1
         ,nfieldid1
         ,'BSLOVS', 3, '-', NULL, NULL, '-', 4, NULL, '+', '-', NULL,  NULL, '-', '+', '-', '-',  SYSDATE, '-');
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated)
  VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvcustmaxseq', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  --Get dataspy sequence
  r5o7.o7maxseq( cdataspyid, 'DDS', '1', cchk );
  -- create r5dddataspy
  INSERT INTO r5dddataspy(dds_ddspyname, dds_ddspyid, dds_autorun, dds_scope, dds_organization, dds_updatestamp, dds_updatebyuser, dds_createdstamp, dds_updateable, dds_filterstrxml
                         ,dds_sortstrxml, dds_fieldlist, dds_updatecount, dds_displayrow, dds_owner, dds_gridid, dds_type, dds_defaultflag, dds_fieldlist_portlet, dds_clientrows
                         ,dds_portletrows, dds_hints, dds_botname,  dds_userfilter, dds_securitydataspy, dds_mekey, dds_updated, dds_ddspyfilter, dds_globaldataspy)
  VALUES('All Records', cdataspyid, '+', '+', '*', NULL, NULL, NULL,'-', '<FILTERABLE/>','<SORTABLE/>'
        ,NULL, 0, 10, 'R5', cgridid, 'SD', '+', NULL, 50
        ,5, NULL, NULL,  NULL, '-', 'YY',  SYSDATE, NULL, '+');
  --create query fields
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated)
  VALUES(cdataspyid, nfieldid1, '30' , 1, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+1, 30, 0, 0, lin_code, 'Code', 'F', '1', 'lvcustmaxseq', NULL, NULL, NULL, NULL, 'QBZ001', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

END;
/

COMMIT;

PROMPT '...Created grid LVCUSTMAXSEQ'
PROMPT

PROMPT ...Begin of o7qbzexecuteproc.prc.sql
PROMPT

PROMPT  ...Creating Procedure O7QBZEXECUTEPROC

CREATE OR REPLACE PROCEDURE O7QBZEXECUTEPROC (p_sexecstmt       IN VARCHAR2
                                             ,p_soutparam1      OUT VARCHAR2
                                             ,p_soutparam2      OUT VARCHAR2
                                             ,p_soutparam3      OUT VARCHAR2)
IS
sSQLERRM     VARCHAR2(4000);
BEGIN
  --execute passed statement
  EXECUTE IMMEDIATE (p_sexecstmt);
  EXCEPTION WHEN OTHERS THEN

  sSQLERRM     := SUBSTR(SQLERRM, 1 ,4000);
  p_soutparam1 := SQLCODE;
  p_soutparam2 := SUBSTR(sSQLERRM, 1 ,80);
  p_soutparam3 := SUBSTR(sSQLERRM, 81,80);

END O7QBZEXECUTEPROC;
/
SHOW ERRORS PROCEDURE O7QBZEXECUTEPROC
PROMPT

PROMPT ...End of o7qbzexecuteproc.prc.sql
PROMPT


PROMPT ...Begin of qbz_autopo.prc.sql
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
  cchk         VARCHAR2(3);
  nerrno       NUMBER := 0;
  cerrmsg      VARCHAR2(240);
  db_error     EXCEPTION;
  rcursor      SYS_REFCURSOR;
  c_rec        VARCHAR2(4000);
  cwocact      act_tbl;--activity
  cwocpar      catpar_tbl;--Cat_partno
  cwocuoi      uoi_tbl;--UOI
  cwocqty      qty_tbl;--QTY
  cwoccatprc   cprice_tbl;--Cat price
  cwochrs      hrs_tbl;--Hours
  cwocamt      amt_tbl;--fixed price
  cwocprch     pphr_tbl;--Price per hour
  cwocparn     part_tbl;--PartNo
  cwoctrd      trad_tbl;--Trade
  cwocwon      work_tbl;--WO Number

  CURSOR WOSUPP(p_sevt VARCHAR2) IS
    SELECT evt_udfchar19,evt_desc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  --procedure called from WO
  IF p_ssource = 'WO' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
             ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
             ,ou_wo
             FROM r5events
             JOIN u5wosupp ON (ou_wo = evt_code)
             WHERE evt_code = '''||p_scode||'''
             AND NOT EXISTS(SELECT 1
                             FROM r5orderlines
                             WHERE orl_event = '''||p_scode||''')';
  ELSIF p_ssource = 'WOC' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
              ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
              ,ou_wo
              FROM r5events
              JOIN u5wosupp ON(ou_wo = evt_code)
              JOIN u5wocont ON(ctl_seq = evt_udfchar23 AND ctl_ven = evt_udfchar19)
              JOIN r5companies ON (com_code = evt_udfchar19)
              WHERE evt_status IN (''TF'',''CA'')
              AND evt_jobtype  = ''STO''
              AND com_udfchkbox02 = ''+''
              AND ctl_seq = '''||p_scode||'''
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
                      ,cwocwon LIMIT 100;
   FOR i IN 1..cwocwon.count LOOP
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
      --call procedure to create PO and PO lines, if PO exists append PO lines
      IF cwocpar(i) is NOT NULL THEN
      o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
              ,NULL,cwocparn(i),'*',dcurdate,cwoccatprc(i),'EUR',nexch,cwocqty(i),NULL,NULL
              ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'PD','PD',1,NULL,NULL,NULL
              ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
      END IF;--ou_parts is NOT NULL
      IF cwocamt(i) is NOT NULL THEN
      o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
              ,NULL,NULL,NULL,dcurdate,cwocamt(i),'EUR',nexch,1,NULL,NULL
              ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'SF','SF',1,NULL,NULL,NULL
              ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
      END IF;--ou_amt is NOT NULL
      IF cwochrs(i) IS NOT NULL THEN
      o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
              ,NULL,NULL,NULL,dcurdate,cwocprch(i),'EUR',nexch,cwochrs(i),NULL,NULL
              ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'ST','ST',1,NULL,NULL,NULL
              ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
      END IF;--ou_hrs IS NOT NULL
      --update udfchar24 to PO Number
      UPDATE r5events
      SET evt_udfchar24 = corder
      WHERE    evt_code = cwocwon(i);
  END LOOP;
    EXIT WHEN rcursor%NOTFOUND;
  END LOOP;
  CLOSE rcursor;
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
    UPDATE u5wocont
    SET ctl_po       = corder
    ,ctl_dategen     = dcurdate
    ,ctl_pocreatedby = ccuruser
    WHERE ctl_seq     = p_scode
    AND NVL(ctl_po,'!@#$')   <> corder;
  END IF;
END QBZ_AUTOPO;
/
SHOW ERRORS PROCEDURE QBZ_AUTOPO
PROMPT

PROMPT ...Created Procedure QBZ_AUTOPO

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO01');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 1, 'QBZATPO01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO01', 'Supplier not exists in Work order','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO01', 'Leverancier bestaat niet in werkorder','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO02');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 2, 'QBZATPO02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO02', 'FLEXBEGIN:Originator not available:FLEXEND','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO02', 'FLEXBEGIN:Originator niet beschikbaar:FLEXEND','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO03');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO03');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 3, 'QBZATPO03', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO03', 'FLEXBEGIN:Store not available:FLEXEND','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO03', 'FLEXBEGIN:Winkel niet beschikbaar:FLEXEND','NL', '-');

PROMPT ...END of error texts
PROMPT
PROMPT ...End of qbz_autopo.prc.sql
PROMPT


PROMPT ...Begin of qbz_autoporec.prc.sql
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
            ORDER BY DECODE(orl_type,'PD',1,2),orl_ordline)
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

PROMPT ...Created Procedure QBZ_AUTOPOREC

PROMPT ...Creating error texts QBZ_AUTOPOREC

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATRC01');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPOREC') AND ers_code in ('QBZATRC01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPOREC', 'PROC', NULL, 1, 'QBZATRC01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATRC01', 'PO-receiving already created','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATRC01', 'PO-ontvangst al aangemaakt','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATRC02');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPOREC') AND ers_code in ('QBZATRC02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPOREC', 'PROC', NULL, 2, 'QBZATRC02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATRC02', 'Bin not available','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATRC02', 'Bak niet beschikbaar','NL', '-');

PROMPT ...End of qbz_autoporec.prc.sql
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
  IF ((:new.evt_status = 'TCS' AND :old.evt_status = 'IBL')
   OR (:new.evt_status = 'TC' AND :old.evt_status = 'IBQ')) THEN
     --count of closing tab
     SELECT COUNT(1) INTO countit from r5addetails where add_code = :new.evt_code;
     IF countit = 0 THEN
     o7err.raise_error('PREUPD_EVT_QBZ','TRIG',3);
     END IF;  ----countit = 0
  END IF;    --No records in closing tab Raise Err
  IF :new.evt_status = 'C' AND :old.evt_status = 'TC' THEN  --QBUZZ employee
    SELECT COUNT(1) INTO countit from r5translines where trl_event = :new.evt_code;  --count of parts
    SELECT COUNT(1) INTO countit1 from r5bookedhours where boo_event = :new.evt_code;  --count of booklab tab
    IF countit = 0 AND countit1 = 0 THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',6);
    END IF;  ----countit = 0
  END IF;  --new.evt_status = 'C' AND old.evt_status = 'TC'
  IF :NEW.evt_type IN ('JOB','PPM') AND :NEW.evt_status = 'TCS' AND :old.evt_status = 'AG' THEN
    IF :NEW.evt_jobtype = 'SCH' THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'SCH'
    SELECT COUNT(1) INTO countit FROM r5companies WHERE COM_CODE = :NEW.evt_udfchar19 AND COM_UDFCHKBOX02 = '-';
    IF :NEW.evt_jobtype = 'STO' AND countit = 1 THEN
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',5);
    END IF;  ----evt_jobtype = 'STO'
  END IF;   ----evt_type = 'JOB' AND evt_status = 'AG'
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
  TYPE            newevtjobtype      IS TABLE OF r5events.evt_jobtype%TYPE INDEX BY BINARY_INTEGER;

  newevtcode      newevtcodetype ;
  newevtorg       newevtorgtype ;
  newevtsupp      newevtsupptype;
  newevtjtyp      newevtjobtype;

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
   AND :NEW.evt_jobtype IN ('STO','SCH')
   AND :NEW.evt_udfchar19 IS NOT NULL THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newevtcode(cnt)  := :new.evt_code;
     newevtorg(cnt)   := :new.evt_org;
     newevtjtyp(cnt)  := :new.evt_jobtype;
     newevtsupp(cnt)  := :new.evt_udfchar19;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR j in 1..cnt
  LOOP
    IF newevtjtyp(cnt) = 'SCH' THEN
      createPO := TRUE;
    ELSIF newevtjtyp(cnt) = 'STO' THEN
     --count of supplier monthly check '-'
      SELECT COUNT(1) INTO countit
      FROM r5companies
      WHERE com_code = newevtsupp(j)
      AND com_udfchkbox02 = '-';
      IF countit = 1 THEN
        createPO := TRUE;
      END IF;  --countit = 1
    END IF; --evt_jobtype = 'SCH'
    IF createPO THEN
      QBZ_AUTOPO(newevtorg(j),newevtcode(j),'WO'); --Create Auto PO
    END IF; --createPO
  END LOOP;
END AFTER STATEMENT;

END COMP_UPD_EVT_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_EVT_QBZ
PROMPT

PROMPT ...Creating error texts R5EVENTS

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 1, 'QBZEVT01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT01', 'Status "Include in next planned maintenance" is not allowed with this priority.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT01', 'Status "Opnemen in volgend gepland onderhoud" is niet toegestaan ​​met deze prioriteit.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT02');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 2, 'QBZEVT02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT02', 'It is not allowed to change the status. Book materials and/or hours first.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT02', 'Het is niet toegestaan om de status te wijzigen. Boek eerst materialen en/of uren.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT03');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT03');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 3, 'QBZEVT03', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT03', 'Please enter work performed on Closing tab.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT03', 'Voer het uitgevoerde werk in op het tabblad Afsluiten.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT04');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 4, 'QBZEVT04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT04', 'Please enter Supplier.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT04', 'Voer Leverancier in.','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT05');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT05');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 5, 'QBZEVT05', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT05', 'Not allowed for status change','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT05', 'Niet toegestaan ​​voor statuswijziging','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZEVT06');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_EVT_QBZ') AND ers_code in ('QBZEVT06');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_EVT_QBZ', 'TRIG', NULL, 6, 'QBZEVT06', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT06', 'The status cannot be changed when no hours or materials are booked','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZEVT06', 'De status ‘''voltooid''’ kan niet worden gekozen wanneer er geen uren of materialen geboekt zijn','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT

PROMPT ...Creating trigger COMP_UPD_ORD_QBZ
PROMPT

CREATE OR REPLACE TRIGGER COMP_UPD_ORD_QBZ
FOR UPDATE ON R5ORDERS
COMPOUND TRIGGER
  --local variables
  TYPE            newordcodetype     IS TABLE OF r5orders.ord_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE            newordorgtype      IS TABLE OF r5orders.ord_org%TYPE INDEX BY BINARY_INTEGER;

  newordcode      newordcodetype ;
  neworgorg       newordorgtype ;

  countit         NUMBER;
  cnt             NUMBER := 0;
  v_error         NUMBER;
  v_errmesg       VARCHAR2(512);

AFTER EACH ROW IS
BEGIN
  IF UPDATING
   AND :NEW.ord_status IN ('GA','A2')
   AND :NEW.ord_status <> :OLD.ord_status THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newordcode(cnt)  := :new.ord_code;
     neworgorg(cnt)   := :new.ord_org;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR j IN 1..cnt
  LOOP
    qbz_autoporec(newordcode(j),neworgorg(j),v_error,v_errmesg); --Create Auto PO receipts
  END LOOP;
END AFTER STATEMENT;

END COMP_UPD_ORD_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_ORD_QBZ
PROMPT

PROMPT ...Begin of qbz_u5r5process.trg.sql
PROMPT

PROMPT ...Creating Trigger COMP_INS_PRC_QBZ
PROMPT
CREATE OR REPLACE TRIGGER COMP_INS_PRC_QBZ
FOR INSERT ON U5R5PROCESS
COMPOUND TRIGGER
  --local Type
  TYPE            processtabletype IS TABLE OF u5r5process%ROWTYPE INDEX BY BINARY_INTEGER;
  rec             processtabletype;
  --local variables
  cnt             NUMBER := 0;
  chk             VARCHAR2(4);
  sqlstmt         VARCHAR2(8000);
  sqlstmt2        VARCHAR2(8000);
  outparam1       VARCHAR2(80);
  outparam2       VARCHAR2(80);
  outparam3       VARCHAR2(80);

AFTER EACH ROW IS
BEGIN
  --save record for statement level processing
  IF :new.prs_object <> 'DUMMY' THEN
    cnt                  := cnt + 1;
    rec(cnt).prs_id      := :new.prs_id;
    rec(cnt).prs_object  := :new.prs_object;
    rec(cnt).prs_param1  := :new.prs_param1;--evt_org
    rec(cnt).prs_param2  := :new.prs_param2;--evt_code(NULL)
    rec(cnt).prs_param3  := :new.prs_param3;--psource(WOC)
    rec(cnt).prs_param4  := :new.prs_param4;
    rec(cnt).prs_param5  := :new.prs_param5;
    rec(cnt).prs_param6  := :new.prs_param6;
    rec(cnt).prs_param7  := :new.prs_param7;
    rec(cnt).prs_param8  := :new.prs_param8;
    rec(cnt).prs_param9  := :new.prs_param9;
    rec(cnt).prs_param10 := :new.prs_param10;
  END IF; --:new.prs_object <> 'DUMMY'
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through all PL/SQL table records
  FOR i IN 1..cnt
  LOOP
    --set statements to be processed
    IF LOWER(rec(cnt).prs_object) IN ('qbz_autopo') THEN
      --KUPROC --> manualgenerate and manualread processing
      sqlstmt :=
        'BEGIN'||CHR(10)
      ||rec(cnt).prs_object||'('||''''''||rec(cnt).prs_param1||''''','''''||rec(cnt).prs_param2||''''','''''||rec(cnt).prs_param3||''''');'||CHR(10)
      ||'END;';
    END IF;
    --call procedure to execute statement, statement will be executed in different session
    IF sqlstmt IS NOT NULL THEN
      sqlstmt2 := 'BEGIN o7qbzexecuteproc('''||sqlstmt||''',:outparam1,:outparam2,:outparam3); END;';
      EXECUTE IMMEDIATE sqlstmt2
      USING OUT outparam1
           ,OUT outparam2
           ,OUT outparam3;
      --Raise exception
      IF LOWER(rec(cnt).prs_object) IN ('qbz_autopo')
       AND outparam2 IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20003,outparam2||outparam3);
      END IF;
      --save output
      IF outparam1 IS NOT NULL THEN
        UPDATE u5r5process
        SET prs_out1 = outparam1
           ,prs_out2 = outparam2
           ,prs_out3 = outparam3
        WHERE prs_id = rec(cnt).prs_id;
      END IF; --outparam1 IS NOT NULL
    END IF; --sqlstmt IS NOT NULL
  END LOOP;

END AFTER STATEMENT;
END COMP_INS_PRC_QBZ;
/

SHOW ERRORS TRIGGER COMP_INS_PRC_QBZ
PROMPT
PROMPT ...Trigger COMP_INS_PRC_QBZ created
PROMPT

PROMPT ...End of qbz_u5r5process.trg.sql
PROMPT

PROMPT ...Creating trigger PREUPD_U5WOS_QBZ

CREATE OR REPLACE TRIGGER PREUPD_U5WOS_QBZ
BEFORE UPDATE OR INSERT ON U5WOSUPP
FOR EACH ROW
DECLARE
  countit   NUMBER;
BEGIN
  IF :new.ou_qty <= 0 THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',5);
  END IF;  --Quantity greater than 0
  IF :new.ou_act IS NOT NULL
   AND :new.ou_parts IS NULL
   AND :new.ou_amt   IS NULL
   AND :new.ou_toh   IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',15);
  END IF; ---ou_act IS NOT NULL
  --Quantity null
  IF :new.ou_parts IS NOT NULL AND :new.ou_qty IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',6);
  ELSIF :new.ou_parts IS NULL AND :new.ou_qty IS NOT NULL THEN ---Part is NULL
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',10);
  END IF;   --ou_parts IS NOT NULL
  IF :new.ou_hrs IS NULL AND :new.ou_toh IS NOT NULL THEN  ---No of hrs Null
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',11);
  ELSIF :new.ou_hrs IS NOT NULL AND :new.ou_toh IS NULL THEN  --- Type of hrs Null
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',12);
  ELSIF :new.ou_hrs IS NULL AND :new.ou_toh IS NULL AND :new.ou_pricep IS NOT NULL THEN   --Type and No of hrs NULL
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',13);
  END IF;  ---ou_hrs IS NULL
  IF :new.ou_amt IS NULL AND :old.ou_amt IS NOT NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',14);
  END IF; ---Fixed price not updateble
  IF :new.ou_amt IS NOT NULL THEN
    -- Price,hours,part filled Raise Err
    IF :new.ou_hrs IS NOT NULL AND :new.ou_parts IS NOT NULL THEN
      o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',7);     --Price,hours,part filled Raise Err
    ELSIF :new.ou_hrs IS NOT NULL THEN
      o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',8);     --Price,hours filled Raise Err
    ELSIF :new.ou_parts IS NOT NULL THEN
      o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',9);     --Price,part filled Raise Err
    ELSE
      NULL;
    END IF;  ---ou_hrs IS NOT NULL
  END IF;  ---new.ou_amt IS NOT NULL
END PREUPD_U5WOS_QBZ;
/
SHOW ERRORS TRIGGER PREUPD_U5WOS_QBZ
PROMPT



PROMPT ...Creating error texts Of U5WOSUPP

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 5, 'QBZWOS01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'Quantity must be greater than 0','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'Hoeveelheid moet groter zijn dan 0','NL', '-');


DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS02');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS02');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 6, 'QBZWOS02', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS02', 'Please enter Quantity','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS02', 'Vul a.u.b. Hoeveelheid in','NL', '-');


DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS03');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS03');


INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 7, 'QBZWOS03', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS03', 'Not allowed to enter Fixed price with Labor hours/Part','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS03', 'Niet toegestaan ​​om Vaste prijs in te voeren met Arbeidsuren/Onderdeel','NL', '-');


DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS04');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS04');


INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 8, 'QBZWOS04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS04', 'Not allowed to enter Fixed price with Labor hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS04', 'Niet toegestaan ​​om Vaste prijs met Arbeidsuren in te voeren','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS05');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS05');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 9, 'QBZWOS05', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS05', 'Not allowed to enter Fixed price with Part','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS05', 'Niet toegestaan ​​om Vaste prijs in te voeren met Part','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS06');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS06');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 10, 'QBZWOS06', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Please enter Part','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS06', 'Vul a.u.b. Deel in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS07');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS07');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 11, 'QBZWOS07', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS07', 'Please enter No of Hrs','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS07', 'Vul alstublieft het aantal uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS08');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS08');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 12, 'QBZWOS08', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS08', 'Please enter Type of Hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS08', 'Voer het type uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS09');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS09');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 13, 'QBZWOS09', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS09', 'Please enter Type and No of Hours','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS09', 'Voer het type en het aantal uren in','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS10');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS10');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 14, 'QBZWOS10', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS10', 'Not allowed to update Amount','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS10', 'Niet toegestaan ​​om Bedrag bij te werken','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS11');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS11');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 15, 'QBZWOS11', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS11', 'Please enter Part Or Labor Hrs Or Fixed amount fields','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS11', 'Vul a.u.b. de velden Onderdeel of arbeidsuren of vast bedrag in','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT

PROMPT ...creating flex R5EVENTS ,Post UPDATE ,45

--sysda updated when status is AG
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 45;
sstmt :=
'BEGIN
  FOR C IN (SELECT evt_code,evt_org
            FROM r5events
            WHERE ROWID      = :ROWID
            AND   evt_status = ''AG''
            AND evt_udfdate09 IS NULL) LOOP
    UPDATE r5events
    SET   evt_udfdate09 = trunc(o7gttime( c.evt_org))
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',45,'+','-'
    ,'+','R5EVENTS  Post Update 45','When wo status is ''AG'' (Administratively Ready) field evt_udfdate09 will be updated','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;

PROMPT ...creating flex R5EVENTS ,Post UPDATE ,47
--evt_udfchkbox02 updated when status is CA
DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 47;
sstmt :=
'BEGIN
  FOR C IN (SELECT evt_code
            FROM r5events
            WHERE ROWID           = :ROWID
            AND   evt_status      = ''CA''
            AND   evt_udfchkbox02 <> ''+'') LOOP
    UPDATE r5events
    SET evt_udfchkbox02 = ''+''
    WHERE evt_code      = c.evt_code;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',47,'+','-'
    ,'+','R5EVENTS Post Update 47','When wo status is ''CA'' (Checked, agreed) field evt_udfchkbox02 will be updated','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;
PROMPT ...Updated Date admin ready
UPDATE r5events
SET evt_udfdate09 = TRUNC(evt_udfdate09)
WHERE evt_udfdate09 IS NOT NULL
AND evt_udfdate09 != TRUNC(evt_udfdate09)
AND evt_udfchar19 IS NOT NULL;
COMMIT;
SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-257.sql', '21-10-2022', 'QBZ-EAM 11.7', 'Phase 3 delivery');

COMMIT;

PROMPT ...END of SPC-257.log

SPOOL OFF