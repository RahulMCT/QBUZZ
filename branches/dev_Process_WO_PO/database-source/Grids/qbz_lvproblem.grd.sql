-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_lvproblem.grd.sql
--
-- Description : lookup for Activity
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-07-2023  - MCT - SPC369  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_lvproblem.grd.sql
PROMPT

PROMPT ...Creating Lookup LVPROBLEM
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
  cfunction := 'LVPROBLEM';
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
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('LVPROBLEMCODE','LVPROBLEMDESC');
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;
  --set ddfields
  SELECT MIN(ddf_fieldid) INTO nfieldid1  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'D.DES_CODE';
  IF nfieldid1 IS NULL THEN
    r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
    --create ddfield
    INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid1 ,'D.DES_CODE','VARCHAR','R5DESCRIPTIONS');
  END IF;
  SELECT MIN(ddf_fieldid) INTO nfieldid2  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'D.DES_TEXT';
  IF nfieldid2 IS NULL THEN
    r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
    --create ddfield
    INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid2 ,'D.DES_TEXT','MIXVARCHAR','R5DESCRIPTIONS');
  END IF;
  --set query
  cQuery :=
'FROM r5descriptions d
WHERE d.des_rentity = ''RECO''
AND d.des_lang = :parameter.language
AND d.des_code IN
(SELECT rqm_code
 FROM r5requircodes r
 WHERE COALESCE(rqm_notused, ''-'') = ''-''
 AND COALESCE(rqm_enableworkorders, ''-'') = ''+''
 AND (COALESCE(r.rqm_gen,''-'') = ''+'' OR EXISTS (SELECT NULL
                                               FROM r5reqclasses r
                                               WHERE r.rcl_reqm = d.des_code
                                               AND r.rcl_class = :param.objclass
                                               AND r.rcl_class_org= :param.objclassorg))
 AND (COALESCE(:param.clgroup, ''OFF'') <> ''HIERARCHY'' OR rqm_code IN (SELECT cch_parentclosingcode
                                                                     FROM r5closingcodehierarchy
                                                                     WHERE cch_parentclosingcodetype = ''RECO''
                                                                     AND ((cch_object IS NULL AND cch_object_org IS NULL) 
OR (cch_object = COALESCE(:parameter.equipment, :parameter.rcmtemplate||''#''||:parameter.revision) AND cch_object_org = :parameter.equipmentorg))))
)';

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
  VALUES('Problem code lov for Damage',cgridid,cQuery,cfunction
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,NULL,NULl,NULL,NULL,NULL,NULL
         ,'BSLOVS',0,'-',NULL,NULL,'-',4,NULL,'+','-',NULL,NULL,'-','+','-','-',SYSDATE,'-');
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvproblemcode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid2, cgridid,  'BSLOVS', nmaxbotnum+2, 'TEXT', NULL, 'lvproblemdesc', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
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
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid1, '100'  , 1, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid2, '100'  , 2, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+1, 50, 0, 0, lin_code, 'Problem Code', 'F', '1', 'LVPROBLEMCODE', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+2, 50, 0, 0, lin_code, 'Description', 'F', '1', 'LVPROBLEMDESC', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+2 AND bot_lang = lin_code);

END;
/
COMMIT;

PROMPT ...Created Lookup LVPROBLEM
PROMPT

PROMPT ...End of qbz_lvproblem.grd.sql
PROMPT