-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-254_1.sql
--
-- Description : Fixes for issues - WO | Supplier Book Hours and Material tab
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 03-10-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-254_1.log

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

PROMPT ...Start of SPC-254_1.sql

PROMPT  ...Creating Procedure qbz_o7custom

CREATE OR REPLACE PROCEDURE qbz_o7custom
                          ( pv_objects IN VARCHAR2,
                            pv_date    IN VARCHAR2,
                            pv_title   IN VARCHAR2,
                            pv_desc    IN VARCHAR2) IS
lv_count  NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO lv_count
  FROM   r5custom
  WHERE  cus_objects   = UPPER(SUBSTR(pv_objects,1,30))
  AND    cus_title     = pv_title
  AND    cus_date      = TO_DATE(pv_date,'dd-mm-yyyy');

  IF lv_count = 0 THEN
    INSERT INTO r5custom( cus_date, cus_applied, cus_title, cus_objects, cus_desc)
    VALUES              ( TO_DATE(pv_date,'dd-mm-yyyy'), SYSDATE, pv_title, UPPER(SUBSTR(pv_objects,1,30)), SUBSTR(pv_desc,1,100));
  END IF;

END qbz_o7custom;
/
SHOW ERRORS PROCEDURE qbz_o7custom
PROMPT
PROMPT ...Created Procedure qbz_o7custom
PROMPT

-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_lvsuphrs.grd.sql
--
-- Description : lookup for Type of hours
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_lvsuphrs.grd.sql
PROMPT

PROMPT ...Creating Lookup LVSUPHRS
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
  cfunction := 'LVSUPHRS';
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
  DELETE FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_fld1 IN ('lvsupdescode','lvsupdestext');
  --get max botnumber for BSLOVS function
  SELECT NVL(MAX(bot_number),4000) INTO nmaxbotnum
  FROM  r5boilertexts
  WHERE bot_function = 'BSLOVS'
  AND   bot_number > 4000;
  --set ddfields
  SELECT MIN(ddf_fieldid) INTO nfieldid1  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'DES_CODE';
  IF nfieldid1 IS NULL THEN
  r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid1 ,'DES_CODE','VARCHAR','R5DESCRIPTIONS');
  END IF;

  SELECT MIN(ddf_fieldid) INTO nfieldid2  FROM r5ddfield WHERE UPPER(ddf_tablename) = 'R5DESCRIPTIONS' AND UPPER(ddf_sourcename) = 'DES_TEXT';
  IF nfieldid2 IS NULL THEN
  r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
  --create ddfield
  INSERT INTO r5ddfield (ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES(nfieldid2 ,'DES_TEXT','MIXVARCHAR','R5DESCRIPTIONS');
  END IF;
  --set query
  cQuery :=
'FROM r5descriptions d, r5ucodes u
WHERE d.des_code  = u.uco_code
AND d.des_rtype   = uco_rentity
AND d.des_rentity = ''UCOD''
AND d.des_rtype   = ''OCTP''
AND d.des_lang    = :parameter.language
AND COALESCE(uco_notused,''-'') = ''-''
AND des_code IN (SELECT trr_octype
                 FROM r5traderates,r5events
                 WHERE evt_code    = :parameter.wonum
                 AND trr_trade     = :parameter.trde
                 AND trr_org       = evt_org
                 AND trr_mrc       = evt_mrc
                 AND trr_udfchar01 = evt_udfchar19)';
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
  VALUES('Hours lov for suppliers',cgridid,cQuery,cfunction
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,nfieldid1||','||nfieldid2
         ,NULL,NULl,NULL,NULL,NULL,NULL
         ,'BSLOVS',0,'-',NULL,NULL,'-',4,NULL,'+','-',NULL,NULL,'-','+','-','-',SYSDATE,'-');
  --Creating grid field
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid1, cgridid,  'BSLOVS', nmaxbotnum+1, 'TEXT', NULL, 'lvsupdescode', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
  INSERT INTO r5gridfield (gfd_fieldid, gfd_gridid, gfd_botfunction, gfd_botnumber, gfd_controltype, gfd_scriptevent, gfd_tagname, gfd_updatecount, gfd_tagparams, gfd_aggfunc, gfd_fieldtype, gfd_occurrence, gfd_dependent,  gfd_secentity, gfd_headerlocation, gfd_updated) VALUES(nfieldid2, cgridid,  'BSLOVS', nmaxbotnum+2, 'TEXT', NULL, 'lvsupdestext', 0, NULL, NULL, 'n', 1, NULL,  NULL, 'n',  SYSDATE);
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
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid1, '80'   , 1, 0, 'LOV',   SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid, dqf_fieldid, dqf_columnwidth, dqf_columnorder, dqf_updatecount, dqf_viewtype,  dqf_updated) VALUES(cdataspyid, nfieldid2, '150'  , 2, 0, 'LOV',   SYSDATE);
  --Inserting Record into boiler text
  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+1, 50, 0, 0, lin_code, 'Activity', 'F', '1', 'lvsupdescode', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+1 AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function, bot_number, bot_length, bot_xpos, bot_ypos, bot_lang, bot_text, bot_dest, bot_page, bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool, bot_changed, bot_display, bot_updatecount, bot_cloned)
  SELECT 'BSLOVS', nmaxbotnum+2, 50, 0, 0, lin_code, 'Description', 'F', '1', 'lvsupdestext', NULL, NULL, NULL, NULL, '25000', '-', '-', 0 , NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = 'BSLOVS' AND bot_number = nmaxbotnum+2 AND bot_lang = lin_code);

END;
/
COMMIT;

PROMPT ...Created Lookup LVSUPHRS
PROMPT

PROMPT ...End of qbz_lvsuphrs.grd.sql
PROMPT

-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5events.trg.sql
--
-- Description : Triggers on r5events
--
-- Product     : EAM             Release : 11.7          Build : 202206
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 06-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Creating trigger PREUPD_EVT_QBZ
PROMPT

CREATE OR REPLACE TRIGGER PREUPD_EVT_QBZ
BEFORE UPDATE ON r5events
FOR EACH ROW
DECLARE
   countit    NUMBER;
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
     select COUNT(1) INTO countit from r5addetails where add_code = :new.evt_code;
     IF countit = 0 THEN
     o7err.raise_error('PREUPD_EVT_QBZ','TRIG',3);
     END IF;  ----countit = 0
  END IF;    --No records in closing tab Raise Err
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
COMMIT;

PROMPT ...END of error texts
PROMPT
COMMIT;

EXEC QBZ_O7CUSTOM( 'SPC-254_1.sql', '03-10-2022', 'QBZ-EAM 11.7', 'Phase 1 delivery - Fixes 1');

COMMIT;

PROMPT ...END of SPC-254_1.log

SPOOL OFF
