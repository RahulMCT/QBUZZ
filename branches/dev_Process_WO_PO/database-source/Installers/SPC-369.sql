-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-369.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 12          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 17-07-2023  - MCT - SPC369  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-369.log

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

PROMPT ...Start of SPC-369.sql

PROMPT ...Begin of qbz_dml_schade.sql
PROMPT

UPDATE r5casemanagement SET csm_udfchar28 = csm_problem,csm_problem = NULL WHERE csm_problem IS NOT NULL;

COMMIT;
PROMPT ...added priority lookup to udfchar28

UPDATE r5userdefinedfieldsetup
SET udf_lookuptype     = 'CODEDESC'
WHERE udf_rentity      = 'CASE'
AND udf_field          = 'udfchar28'
AND NVL(udf_lookuptype,'!@#$%') <> 'CODEDESC';
COMMIT;

--ppo_location will be copied to evt_udfchar40.
DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5EVENTS',vaction);
END;
/
COMMIT;

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-UPDATE' AND flx_seq = 48;
sstmt :=
'DECLARE
  plocation r5ppmobjects.ppo_location%TYPE;
  CURSOR c1 (pevtppopk NUMBER) IS
   SELECT ppo_location
   FROM r5ppmobjects
   WHERE ppo_pk = pevtppopk;

BEGIN
  FOR c IN (SELECT evt_code,evt_ppopk
            FROM r5events
            WHERE ROWID = :ROWID
            AND evt_rtype      = ''PPM''
            AND evt_status     = ''W''
            AND evt_udfchar19  = ''50406'')
  LOOP
   BEGIN
   OPEN c1 (c.evt_ppopk);
   FETCH c1 INTO plocation;
   CLOSE c1;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
      NULL;
   END;
    UPDATE r5events
    SET evt_udfchar40 = plocation
    WHERE evt_code   = c.evt_code
    AND NVL(evt_udfchar40,''!#@$'') <> plocation ;
  END LOOP;
END;';

INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-UPDATE',48,'+','-'
    ,'+','R5EVENTS Post Update 48','ppo_location will be copied to evt_udfchar40.','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;

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
  ,EVT_UDFCHAR40
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
,evt_udfchar40
FROM r5events
JOIN r5objects ON (obj_code = evt_object AND obj_org = evt_object_org)
JOIN u5wosupp  ON (evt_code = ou_wo)
--WHERE evt_jobtype <> 'SCH'
GROUP BY evt_code,evt_org,evt_desc,evt_object,evt_object_org,evt_udfchar19,evt_udfchar23,obj_alias,evt_udfdate09,evt_udfchkbox02,evt_status,evt_jobtype,evt_warranty,evt_udfchar40
/
PROMPT ...Created View qbz_r5wocntchk.sql
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

PROMPT ...Creating grid NUCOSO
PROMPT

DECLARE
  sFunction     VARCHAR(6)   := 'NUCOSO';
  sDesc         VARCHAR2(80) := 'Overview of costs';
  nftb_seq      NUMBER(2);
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
  nfieldid15    NUMBER(12);
  nfieldid16    NUMBER(12);
  nfieldid17    NUMBER(12);
  nfieldid18    NUMBER(12);
  nfieldid19    NUMBER(12);
  nfieldid20    NUMBER(12);
  nfieldid21    NUMBER(12);
  nfieldid22    NUMBER(12);
  nfieldid23    NUMBER(12);
  nfieldid24    NUMBER(12);
  nfieldid25    NUMBER(12);
  nfieldid26    NUMBER(12);
  nfieldid27    NUMBER(12);
  nfieldid28    NUMBER(12);
  nfieldid29    NUMBER(12);
  nfieldid30    NUMBER(12);
  nfieldid31    NUMBER(12);
  nfieldid32    NUMBER(12);
  nfieldid33    NUMBER(12);
  nfieldid34    NUMBER(12);
  nfieldid35    NUMBER(12);
  nfieldid36    NUMBER(12);
  nfieldid37    NUMBER(12);
  nfieldid38    NUMBER(12);
  nfieldid39    NUMBER(12);
  nfieldid40    NUMBER(12);
  nfieldid41    NUMBER(12);
  nfieldid42    NUMBER(12);
  nfieldid43    NUMBER(12);
  nfieldid44    NUMBER(12);
  nfieldid45    NUMBER(12);
  chk           VARCHAR(30);
  nChksSreen    INT;

BEGIN
  --delete if existing record
  DELETE FROM r5extensibleframework  WHERE efr_name LIKE sFunction || '%';
  DELETE FROM r5queryfield
  WHERE dqf_ddspyid IN (SELECT dds_ddspyid
                        FROM   r5dddataspy
                        WHERE  dds_gridid IN (SELECT grd_gridid
                                              FROM   r5grid
                                              WHERE  grd_gridname = sFunction));
  DELETE FROM r5usegridsysdefault    WHERE usd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5dddataspy            WHERE dds_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5gridfield            WHERE gfd_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5gridparam            WHERE gdp_gridid   IN (SELECT grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM r5grid                 WHERE grd_gridname = sFunction;
  DELETE FROM r5boilertexts          WHERE bot_function = sFunction;
  DELETE FROM r5pagelayout           WHERE plo_pagename = sFunction;
  DELETE FROM r5defaultpagelayout    WHERE pld_pagename = sFunction;
  DELETE FROM r5extmenus             WHERE emn_function = sFunction;
  DELETE FROM r5permissions          WHERE prm_function = sFunction;
  DELETE FROM r5pagecache            WHERE pgc_function = sFunction;
  DELETE FROM r5functions            WHERE fun_code     = sFunction;
  --create function
  INSERT INTO r5functions (fun_code   ,fun_desc       ,fun_class     ,fun_subtype     ,fun_file
                          ,fun_delete ,fun_insert     ,fun_update    ,fun_select      ,fun_mekey
                          ,fun_auto   ,fun_background ,fun_dirsel    ,fun_system      ,fun_class_org
                          ,fun_lst    ,fun_hdr        ,fun_displayft ,fun_startupview ,fun_splitviewdisplay
                          ,fun_application)
                    VALUES(sFunction ,sDesc ,'WEBD' ,'M'   ,'R5MENU'
                          ,NULL      ,NULL  ,NULL   ,'?'   ,'YY'
                          ,'D'       ,'-'   ,'-'    ,'+'   ,'*'
                          ,'+'       ,'+'   ,'+'    ,'SV'  ,'S'
                          ,'BSUGRD');
  --find sequence for Dataspy
  r5o7.o7maxseq (sDataspyid ,'DDS',1,sCheckresult);
  --create ddfield
  --csm_code
   SELECT MIN(ddf_fieldid) INTO nfieldid1 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_CODE';
  IF nfieldid1 IS NULL THEN
    r5o7.o7maxseq(nfieldid1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid1,'CSM_CODE','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_desc
   SELECT MIN(ddf_fieldid) INTO nfieldid2 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_DESC';
  IF nfieldid2 IS NULL THEN
    r5o7.o7maxseq(nfieldid2,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid2,'CSM_DESC','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_org
   SELECT MIN(ddf_fieldid) INTO nfieldid3 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_ORG';
  IF nfieldid3 IS NULL THEN
    r5o7.o7maxseq(nfieldid3,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid3,'CSM_ORG','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_object
   SELECT MIN(ddf_fieldid) INTO nfieldid4 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_OBJECT';
  IF nfieldid4 IS NULL THEN
    r5o7.o7maxseq(nfieldid4,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid4,'CSM_OBJECT','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar21
   SELECT MIN(ddf_fieldid) INTO nfieldid5 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR21';
  IF nfieldid5 IS NULL THEN
    r5o7.o7maxseq(nfieldid5,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid5,'CSM_UDFCHAR21','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar23
   SELECT MIN(ddf_fieldid) INTO nfieldid6 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR23';
  IF nfieldid6 IS NULL THEN
    r5o7.o7maxseq(nfieldid6,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid6,'CSM_UDFCHAR23','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar03
   SELECT MIN(ddf_fieldid) INTO nfieldid9 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR03';
  IF nfieldid9 IS NULL THEN
    r5o7.o7maxseq(nfieldid9,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid9,'CSM_UDFCHAR03','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_status
   SELECT MIN(ddf_fieldid) INTO nfieldid10 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_STATUS';
  IF nfieldid10 IS NULL THEN
    r5o7.o7maxseq(nfieldid10,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid10,'CSM_STATUS','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_created
   SELECT MIN(ddf_fieldid) INTO nfieldid11 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_CREATED';
  IF nfieldid11 IS NULL THEN
    r5o7.o7maxseq(nfieldid11,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid11,'CSM_CREATED','DATETIME',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar07
   SELECT MIN(ddf_fieldid) INTO nfieldid12 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR07';
  IF nfieldid12 IS NULL THEN
    r5o7.o7maxseq(nfieldid12,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid12,'CSM_UDFCHAR07','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar08
   SELECT MIN(ddf_fieldid) INTO nfieldid13 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR08';
  IF nfieldid13 IS NULL THEN
    r5o7.o7maxseq(nfieldid13,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid13,'CSM_UDFCHAR08','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar09
  SELECT MIN(ddf_fieldid) INTO nfieldid14 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR09';
  IF nfieldid14 IS NULL THEN
    r5o7.o7maxseq(nfieldid14,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid14,'CSM_UDFCHAR09','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar10
  SELECT MIN(ddf_fieldid) INTO nfieldid15 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR10';
  IF nfieldid15 IS NULL THEN
    r5o7.o7maxseq(nfieldid15,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid15,'CSM_UDFCHAR10','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_area
  SELECT MIN(ddf_fieldid) INTO nfieldid16 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_AREA';
  IF nfieldid16 IS NULL THEN
    r5o7.o7maxseq(nfieldid16,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid16,'CSM_AREA','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar05
  SELECT MIN(ddf_fieldid) INTO nfieldid17 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR05';
  IF nfieldid17 IS NULL THEN
    r5o7.o7maxseq(nfieldid17,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid17,'CSM_UDFCHAR05','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar20
  SELECT MIN(ddf_fieldid) INTO nfieldid18 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR20';
  IF nfieldid18 IS NULL THEN
    r5o7.o7maxseq(nfieldid18,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid18,'CSM_UDFCHAR20','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfdate01
  SELECT MIN(ddf_fieldid) INTO nfieldid19 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFDATE01';
  IF nfieldid19 IS NULL THEN
    r5o7.o7maxseq(nfieldid19,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid19,'CSM_UDFDATE01','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar25
  SELECT MIN(ddf_fieldid) INTO nfieldid20 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR25';
  IF nfieldid20 IS NULL THEN
    r5o7.o7maxseq(nfieldid20,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid20,'CSM_UDFCHAR25','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar26
  SELECT MIN(ddf_fieldid) INTO nfieldid21 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR26';
  IF nfieldid21 IS NULL THEN
    r5o7.o7maxseq(nfieldid21,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid21,'CSM_UDFCHAR26','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar24
  SELECT MIN(ddf_fieldid) INTO nfieldid22 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR24';
  IF nfieldid22 IS NULL THEN
    r5o7.o7maxseq(nfieldid22,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid22,'CSM_UDFCHAR24','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchkbox01
  SELECT MIN(ddf_fieldid) INTO nfieldid23 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHKBOX01';
  IF nfieldid23 IS NULL THEN
    r5o7.o7maxseq(nfieldid23,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid23,'CSM_UDFCHKBOX01','CHKBOOLEAN',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfchar04
  SELECT MIN(ddf_fieldid) INTO nfieldid24 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHAR04';
  IF nfieldid24 IS NULL THEN
    r5o7.o7maxseq(nfieldid24,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid24,'CSM_UDFCHAR04','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM01
  SELECT MIN(ddf_fieldid) INTO nfieldid25 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM01,0)';
  IF nfieldid25 IS NULL THEN
    r5o7.o7maxseq(nfieldid25,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid25,'NVL(CSM_UDFNUM01,0)','NUMBER',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM02
  SELECT MIN(ddf_fieldid) INTO nfieldid26 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM02,0)';
  IF nfieldid26 IS NULL THEN
    r5o7.o7maxseq(nfieldid26,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid26,'NVL(CSM_UDFNUM02,0)','NUMBER',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_UDFNUM03
  SELECT MIN(ddf_fieldid) INTO nfieldid27 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM03,0)';
  IF nfieldid27 IS NULL THEN
    r5o7.o7maxseq(nfieldid27,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid27,'NVL(CSM_UDFNUM03,0)','NUMBER',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_sum
  SELECT MIN(ddf_fieldid) INTO nfieldid28 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)';
  IF nfieldid28 IS NULL THEN
    r5o7.o7maxseq(nfieldid28,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid28,'NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)','NUMBER',0,'R5CASEMANAGEMENT');
  END IF;
  --Description char04
  SELECT MIN(ddf_fieldid) INTO nfieldid29 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = '(SELECT UDL_DESC FROM R5USERDEFINEDFIELDLOVVALS WHERE UDL_FIELD = ''UDFCHAR04'' AND UDL_CODE = CSM_UDFCHAR04)';
  IF nfieldid29 IS NULL THEN
    r5o7.o7maxseq(nfieldid29,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid29,'(SELECT udl_desc FROM r5userdefinedfieldlovvals WHERE udl_field = ''udfchar04'' AND udl_code = csm_udfchar04)','MIXVARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfdate03
  SELECT MIN(ddf_fieldid) INTO nfieldid30 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFDATE03';
  IF nfieldid30 IS NULL THEN
    r5o7.o7maxseq(nfieldid30,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid30,'CSM_UDFDATE03','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --csm_udfnum05
  SELECT MIN(ddf_fieldid) INTO nfieldid31 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFNUM05';
  IF nfieldid31 IS NULL THEN
    r5o7.o7maxseq(nfieldid31,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid31,'CSM_UDFNUM05','VARCHAR',0,'R5CASEMANAGEMENT');
  END IF;
  --Direct purchase
  SELECT MIN(ddf_fieldid) INTO nfieldid32 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN O7COST.MATERIAL2(CSM_WORKORDER) ELSE 0 END)');
  IF nfieldid32 IS NULL THEN
    r5o7.o7maxseq(nfieldid32,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid32,'(CASE WHEN evt_status <> ''CC'' THEN O7COST.MATERIAL2(CSM_WORKORDER) ELSE 0 END)','CURRENCY',0,NULL);
  END IF;
  --Labor cost
  SELECT MIN(ddf_fieldid) INTO nfieldid33 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)');
  IF nfieldid33 IS NULL THEN
    r5o7.o7maxseq(nfieldid33,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid33,'(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)','VARCHAR',0,NULL);
  END IF;
  --Hired Labor
  SELECT MIN(ddf_fieldid) INTO nfieldid34 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)');
  IF nfieldid34 IS NULL THEN
    r5o7.o7maxseq(nfieldid34,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid34,'(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)','CURRENCY',0,NULL);
  END IF;
  --Cost from 4406
  SELECT MIN(ddf_fieldid) INTO nfieldid35 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4406''),0)';
  IF nfieldid35 IS NULL THEN
    r5o7.o7maxseq(nfieldid35,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid35,'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4406''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --CSM_COMPLETEDDATE
  SELECT MIN(ddf_fieldid) INTO nfieldid36 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_COMPLETEDDATE';
  IF nfieldid36 IS NULL THEN
    r5o7.o7maxseq(nfieldid36,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid36,'CSM_COMPLETEDDATE','DATE',0,'R5CASEMANAGEMENT');
  END IF;
  --Kostentotaal
  SELECT MIN(ddf_fieldid) INTO nfieldid37 FROM r5ddfield WHERE UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)');
  IF nfieldid37 IS NULL THEN
    r5o7.o7maxseq(nfieldid37,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid37,'(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)','CURRENCY',0,NULL);
  END IF;
  --CSM_UDFNUM04
  SELECT MIN(ddf_fieldid) INTO nfieldid38 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4407''),0)';
  IF nfieldid38 IS NULL THEN
    r5o7.o7maxseq(nfieldid38,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid38,'NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4407''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Schadekosten Qbuzz
  SELECT MIN(ddf_fieldid) INTO nfieldid39 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'QBZ_SUMCSTCOST(CSM_CODE)+(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)';
  IF nfieldid39 IS NULL THEN
    r5o7.o7maxseq(nfieldid39,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid39,'QBZ_SUMCSTCOST(CSM_CODE)+(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --4405 Schadedossier
  SELECT MIN(ddf_fieldid) INTO nfieldid40 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4405'' AND COS_WO = ''-''),0)';
  IF nfieldid40 IS NULL THEN
    r5o7.o7maxseq(nfieldid40,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid40,'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4405'' AND COS_WO = ''-''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Afsleepkosten
  SELECT MIN(ddf_fieldid) INTO nfieldid41 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4413''),0)';
  IF nfieldid41 IS NULL THEN
    r5o7.o7maxseq(nfieldid41,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid41,'NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4413''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Schadekosten gebouwen
  SELECT MIN(ddf_fieldid) INTO nfieldid42 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4580''),0)';
  IF nfieldid42 IS NULL THEN
    r5o7.o7maxseq(nfieldid42,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid42,'NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4580''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Schadekosten gebouwen
  SELECT MIN(ddf_fieldid) INTO nfieldid43 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4505''),0)';
  IF nfieldid43 IS NULL THEN
    r5o7.o7maxseq(nfieldid43,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid43,'NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4505''),0)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Totale Schadedossier kosten
  SELECT MIN(ddf_fieldid) INTO nfieldid44 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'QBZ_SUMCSTCOST(CSM_CODE)';
  IF nfieldid44 IS NULL THEN
    r5o7.o7maxseq(nfieldid44,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid44,'QBZ_SUMCSTCOST(CSM_CODE)','CURRENCY',0,'R5CASEMANAGEMENT');
  END IF;
  --Melding aan verzekeraar
  SELECT MIN(ddf_fieldid) INTO nfieldid45 FROM r5ddfield WHERE ddf_tablename = 'R5CASEMANAGEMENT' AND UPPER(ddf_sourcename) = 'CSM_UDFCHKBOX02';
  IF nfieldid45 IS NULL THEN
    r5o7.o7maxseq(nfieldid45,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_updatecount,ddf_tablename) VALUES (nfieldid45,'CSM_UDFCHKBOX02','CHKBOOLEAN',0,'R5CASEMANAGEMENT');
  END IF;
  --set query
  sQuery :=
'FROM r5casemanagement,r5events
WHERE csm_casetype = ''SCH''
AND evt_code(+) = csm_workorder';
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
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39||','||nfieldid40||','||nfieldid41||','||nfieldid42||','||nfieldid43||','||nfieldid44||','||nfieldid45
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39||','||nfieldid40||','||nfieldid41||','||nfieldid42||','||nfieldid43||','||nfieldid44||','||nfieldid45
        ,nfieldid1||','||nfieldid2 ||','||nfieldid3||','||nfieldid4 ||','||nfieldid5||','||nfieldid6||','||nfieldid9||','||nfieldid10 ||','||nfieldid11||','||nfieldid12||','||nfieldid13||','||nfieldid14||','||nfieldid15||','||nfieldid16||','||nfieldid17||','||nfieldid18||','||nfieldid19||','||nfieldid20||','||nfieldid21||','||nfieldid22||','||nfieldid23||','||nfieldid24||','||nfieldid25||','||nfieldid26||','||nfieldid27||','||nfieldid28||','||nfieldid29||','||nfieldid30||','||nfieldid31||','||nfieldid32||','||nfieldid33||','||nfieldid34||','||nfieldid35||','||nfieldid36||','||nfieldid37||','||nfieldid38||','||nfieldid39||','||nfieldid40||','||nfieldid41||','||nfieldid42||','||nfieldid43||','||nfieldid44||','||nfieldid45
        ,NULL,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL,sFunction
        ,0          ,'-'     ,NULL    ,NULL    ,'+'
        ,2          ,NULL    ,'+'     ,'-'     ,NULL
        ,NULL       ,'-'     ,'+'     ,'+'     ,'-'
        ,SYSDATE    ,'-');
  --creating Gridfields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid1    ,sGridid,sFunction, 4  ,'TEXT'     ,'csmcode'                   ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid2    ,sGridid,sFunction, 5  ,'TEXT'     ,'csmdesc'                   ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid3    ,sGridid,sFunction, 6  ,'TEXT'     ,'csmorg'                    ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid4    ,sGridid,sFunction, 7  ,'TEXT'     ,'csmobject'                 ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid5    ,sGridid,sFunction, 8  ,'TEXT'     ,'csmudfchar21'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid6    ,sGridid,sFunction, 9  ,'TEXT'     ,'csmudfchar23'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid9    ,sGridid,sFunction, 10 ,'TEXT'     ,'csmudfchar03'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid10   ,sGridid,sFunction, 11 ,'TEXT'     ,'csmstatus'                 ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid11   ,sGridid,sFunction, 12 ,'TEXT'     ,'csmcreated'                ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid12   ,sGridid,sFunction, 13 ,'TEXT'     ,'csmudfchar07'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid13   ,sGridid,sFunction, 14 ,'TEXT'     ,'csmudfchar08'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid14   ,sGridid,sFunction, 15 ,'TEXT'     ,'csmudfchar09'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid15   ,sGridid,sFunction, 16 ,'TEXT'     ,'csmudfchar10'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid16   ,sGridid,sFunction, 17 ,'TEXT'     ,'csmarea'                   ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid17   ,sGridid,sFunction, 18 ,'TEXT'     ,'csmudfchar05'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid18   ,sGridid,sFunction, 19 ,'TEXT'     ,'csmudfchar20'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid19   ,sGridid,sFunction, 20 ,'TEXT'     ,'csmudfdate01'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid20   ,sGridid,sFunction, 21 ,'TEXT'     ,'csmudfchar25'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid21   ,sGridid,sFunction, 22 ,'TEXT'     ,'csmudfchar26'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid22   ,sGridid,sFunction, 23 ,'TEXT'     ,'csmudfchar24'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid23   ,sGridid,sFunction, 24 ,'CHECKBOX' ,'csmudfchkbox01'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid24   ,sGridid,sFunction, 25 ,'TEXT'     ,'csmudfchar04'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid25   ,sGridid,sFunction, 26 ,'TEXT'     ,'csmudfnum01'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid26   ,sGridid,sFunction, 27 ,'TEXT'     ,'csmudfnum02'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid27   ,sGridid,sFunction, 28 ,'TEXT'     ,'csmudfnum03'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid28   ,sGridid,sFunction, 29 ,'TEXT'     ,'csmsum'                    ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid29   ,sGridid,sFunction, 30 ,'TEXT'     ,'csmudfchar04desc'          ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid30   ,sGridid,sFunction, 31 ,'TEXT'     ,'csmudfdate03'              ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid31   ,sGridid,sFunction, 32 ,'TEXT'     ,'csmudfnum05'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid32   ,sGridid,sFunction, 33 ,'TEXT'     ,'csmevomaterial'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid33   ,sGridid,sFunction, 34 ,'TEXT'     ,'csmevoownlabor'            ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid34   ,sGridid,sFunction, 35 ,'TEXT'     ,'csmevolabor'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid35   ,sGridid,sFunction, 36 ,'TEXT'     ,'csmextcost'                ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid36   ,sGridid,sFunction, 37 ,'TEXT'     ,'csmcompleteddate'          ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid37   ,sGridid,sFunction, 38 ,'TEXT'     ,'csmkostentotaal'           ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid38   ,sGridid,sFunction, 39 ,'TEXT'     ,'csmudfnum04'               ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid39   ,sGridid,sFunction, 40 ,'TEXT'     ,'csmdamagecost'             ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid40   ,sGridid,sFunction, 41 ,'TEXT'     ,'csmschadedossier'          ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid41   ,sGridid,sFunction, 42 ,'TEXT'     ,'csmafsleepkosten'          ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid42   ,sGridid,sFunction, 43 ,'TEXT'     ,'csmschadekostengebouwen'   ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid43   ,sGridid,sFunction, 44 ,'TEXT'     ,'csmschadekostenlaadinfra'  ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid44   ,sGridid,sFunction, 45 ,'TEXT'     ,'csmtotschadedossier'       ,0,'n',1,'n');
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_tagname,gfd_updatecount,gfd_fieldtype,gfd_occurrence,gfd_headerlocation) VALUES(nfieldid45   ,sGridid,sFunction, 46 ,'TEXT'     ,'csmudfchkbox02'            ,0,'n',1,'n');

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
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid2   ,'100'  ,2  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid3   ,'100'  ,3  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid4   ,'100'  ,4  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid5   ,'100'  ,5  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid6   ,'100'  ,6  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid9   ,'100'  ,7  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid10  ,'100'  ,8  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid11  ,'100'  ,9  ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid12  ,'100'  ,10 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid13  ,'100'  ,11 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid14  ,'100'  ,12 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid15  ,'100'  ,13 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid16  ,'100'  ,14 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid17  ,'100'  ,15 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid18  ,'100'  ,16 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid19  ,'100'  ,17 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid20  ,'100'  ,18 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid21  ,'100'  ,19 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid22  ,'100'  ,20 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid23  ,'100'  ,21 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid24  ,'100'  ,23 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid25  ,'100'  ,25 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid26  ,'100'  ,26 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid27  ,'100'  ,27 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid28  ,'100'  ,28 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid29  ,'100'  ,24 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid30  ,'100'  ,36 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid31  ,'100'  ,37 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid32  ,'100'  ,29 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid33  ,'100'  ,30 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid34  ,'100'  ,31 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid35  ,'100'  ,33 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid36  ,'100'  ,22 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid37  ,'100'  ,32 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid38  ,'100'  ,34 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid39  ,'100'  ,35 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid40  ,'100'  ,38 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid41  ,'100'  ,39 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid42  ,'100'  ,40 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid43  ,'100'  ,41 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid44  ,'100'  ,42 ,0,'LIST',SYSDATE);
  INSERT INTO r5queryfield(dqf_ddspyid,dqf_fieldid,dqf_columnwidth,dqf_columnorder,dqf_updatecount,dqf_viewtype,dqf_updated) VALUES(sDataspyid,nfieldid45  ,'100'  ,43 ,0,'LIST',SYSDATE);
  --creating Boilertexts
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,1 ,100,0,0,lin_code, 'List View'                 ,'TB',1 ,'LST',NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 1  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,2 ,100,0,0,lin_code,  sDesc                      ,'F' ,1 ,'UDG_HDRLABEL'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 2  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,3 ,100,0,0,lin_code, 'All Records'               ,'F' ,1 ,'DSNAME'             ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 3  AND bot_lang = lin_code);

  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,4 ,100,0,0,lin_code, 'Schadenummer Qbuzz'        ,'F' ,1 ,'CSMCODE'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 4  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,5 ,100,0,0,lin_code, 'Omschrijving Case'         ,'F' ,1 ,'CSMDESC'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 5  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,6 ,100,0,0,lin_code, 'Consessie'                 ,'F' ,1 ,'CSMORG'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 6  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,7 ,100,0,0,lin_code, 'Bus'     ,'F' ,1           ,'CSMOBJECT'       ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 7  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,8 ,100,0,0,lin_code, 'Schuldvraag'               ,'F' ,1 ,'CSMUDFCHAR21'   ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 8  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,9 ,100,0,0,lin_code, 'Schadenummer'              ,'F' ,1 ,'CSMUDFCHAR23' ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 9  AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,10,100,0,0,lin_code, 'Status werkplaats (WO?)'   ,'F' ,1 ,'CSMUDFCHAR03'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 10 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,11,100,0,0,lin_code, 'Status schadeafhandeling'  ,'F' ,1 ,'CSMSTATUS'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 11 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,12,100,0,0,lin_code, 'Schade datum'              ,'F' ,1 ,'CSMCREATED'        ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 12 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,13,100,0,0,lin_code, 'Chauffeur'                 ,'F' ,1 ,'CSMUDFCHAR07'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 13 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,14,100,0,0,lin_code, 'Standplaats chauffeur'     ,'F' ,1 ,'CSMUDFCHAR08'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 14 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,15,100,0,0,lin_code, 'Teammanager'               ,'F' ,1 ,'CSMUDFCHAR09'      ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 15 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,16,100,0,0,lin_code, 'Naam Teammanager'          ,'F' ,1 ,'CSMUDFCHAR10'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 16 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,17,100,0,0,lin_code, 'Straat'                    ,'F' ,1 ,'CSMAREA'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 17 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,18,100,0,0,lin_code, 'Plaats'                    ,'F' ,1 ,'CSMUDFCHAR05'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 18 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,19,100,0,0,lin_code, 'Verzekeraar'               ,'F' ,1 ,'CSMUDFCHAR20'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 19 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,20,100,0,0,lin_code, 'Inleverdatum schadeformulier'          ,'F' ,1 ,'CSMUDFDATE01'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 20 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,21,100,0,0,lin_code, 'Naam Tegenpartij'          ,'F' ,1 ,'CSMUDFCHAR25'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 21 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,22,100,0,0,lin_code, 'Busnummer/ Kenteken TP'    ,'F' ,1 ,'CSMUDFCHAR26'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 22 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,23,100,0,0,lin_code, 'Extra informatie TP'       ,'F' ,1 ,'CSMUDFCHAR24'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 23 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,24,100,0,0,lin_code, 'Letselschade'              ,'F' ,1 ,'CSMUDFCHKBOX01'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 24 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,25,100,0,0,lin_code, 'Oorzaakcode'               ,'F' ,1 ,'CSMUDFCHAR04'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 25 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,26,100,0,0,lin_code, 'Geschatte schadekosten BUS'  ,'F' ,1 ,'CSMUDFCHAR11'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 26 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,27,100,0,0,lin_code, 'Geschatte schadekosten Extern'          ,'F' ,1 ,'CSMUDFCHAR12'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 27 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,28,100,0,0,lin_code, 'Geschatte schadekosten ER'          ,'F' ,1 ,'CSMUDFCHAR13'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 28 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,29,100,0,0,lin_code, 'Geschat totaal'            ,'F' ,1 ,'CSMSUM'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 29 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,30,100,0,0,lin_code, 'Omschrijving oorzaak'       ,'F' ,1 ,'CSMUDFCHAR04DESC'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 30 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,31,100,0,0,lin_code, 'Calculatie opgevraagd'     ,'F' ,1 ,'CSMUDFDATE03'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 31 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,32,100,0,0,lin_code, 'Bedrag geclaimed'          ,'F' ,1 ,'CSMUDFNUM05'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 32 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,33,100,0,0,lin_code, 'Materiaalkosten'          ,'F' ,1 ,'CSMEVOMATERIAL'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 33 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,34,100,0,0,lin_code, 'Loonkosten'               ,'F' ,1 ,'CSMEVOOWNLABOR'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 34 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,35,100,0,0,lin_code, 'Uitbesteed'               ,'F' ,1 ,'CSMEVOLABOR'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 35 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,36,100,0,0,lin_code, 'SD Betaald ER'              ,'F' ,1 ,'CSMEXTCOST'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 36 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,37,100,0,0,lin_code, 'Datum voltooid'              ,'F' ,1 ,'CSMCOMPLETEDDATE'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 37 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,38,100,0,0,lin_code, 'Kostentotaal WO '               ,'F' ,1 ,'CSMKOSTENTOTAAL'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 38 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,39,100,0,0,lin_code, 'SD Verhaald'         ,'F' ,1 ,'CSMUDFNUM04'    ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 39 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,40,100,0,0,lin_code, 'Schadekosten Qbuzz'          ,'F' ,1 ,'CSMDAMAGECOST'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 40 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,41,100,0,0,lin_code, 'SD Schadeherstelkosten'          ,'F' ,1 ,'CSMSCHADEDOSSIER'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 41 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,42,100,0,0,lin_code, 'SD Afsleepkosten'          ,'F' ,1 ,'CSMAFSLEEPKOSTEN'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 42 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,43,100,0,0,lin_code, 'SD Schadekosten Gebouwen'          ,'F' ,1 ,'CSMSCHADEKOSTENGEBOUWEN'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 43 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,44,100,0,0,lin_code, 'SD Schadekosten Laadinfra'          ,'F' ,1 ,'CSMSCHADEKOSTENLAADINFRA'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 44 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,45,100,0,0,lin_code, 'Totale Schadedossier kosten'          ,'F' ,1 ,'CSMTOTSCHADEDOSSIER'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 45 AND bot_lang = lin_code);
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1, bot_fld2, bot_prtp, bot_lvcr, bot_adlen, bot_pool,bot_changed, bot_display, bot_updatecount,bot_cloned)
  SELECT sFunction,46,100,0,0,lin_code, 'Melding aan verzekeraar'             ,'F' ,1 ,'CSMUDFCHKBOX02'  ,NULL ,NULL ,NULL ,NULL ,'10000' ,'+' ,'-' ,0 ,NULL
  FROM r5langinst WHERE NOT EXISTS(SELECT 1 FROM r5boilertexts WHERE bot_function = sFunction AND bot_number = 46 AND bot_lang = lin_code);
END;
/
COMMIT;

PROMPT ...Created grid NUCOSO
PROMPT

PROMPT ...Updating grid layout - NUCOSO
PROMPT


UPDATE r5queryfield
SET dqf_columnorder = -dqf_columnorder
WHERE dqf_ddspyid IN (SELECT dds_ddspyid
                      FROM   r5dddataspy
                      WHERE  dds_gridid IN (SELECT grd_gridid
                                            FROM   r5grid
                                            WHERE  grd_gridname IN  ('NUCOSO'))
                      and dds_owner= 'R5')
AND dqf_columnorder > 0
AND dqf_viewtype = 'LIST';
COMMIT;

UPDATE r5queryfield SET dqf_columnorder = 1,dqf_columnwidth = 170 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_code')));
UPDATE r5queryfield SET dqf_columnorder = 2,dqf_columnwidth = 147 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_desc')));
UPDATE r5queryfield SET dqf_columnorder = 3,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_org')));
UPDATE r5queryfield SET dqf_columnorder = 4,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_object')));
UPDATE r5queryfield SET dqf_columnorder = 5,dqf_columnwidth = 110 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar21')));
UPDATE r5queryfield SET dqf_columnorder = 6,dqf_columnwidth = 129 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar23')));
UPDATE r5queryfield SET dqf_columnorder = 7,dqf_columnwidth = 182 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar03')));
UPDATE r5queryfield SET dqf_columnorder = 8,dqf_columnwidth = 187 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_status')));
UPDATE r5queryfield SET dqf_columnorder = 9,dqf_columnwidth = 121 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_created')));
UPDATE r5queryfield SET dqf_columnorder = 10,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar07')));
UPDATE r5queryfield SET dqf_columnorder = 11,dqf_columnwidth = 164 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar08')));
UPDATE r5queryfield SET dqf_columnorder = 12,dqf_columnwidth = 121 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar09')));
UPDATE r5queryfield SET dqf_columnorder = 13,dqf_columnwidth = 159 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar10')));
UPDATE r5queryfield SET dqf_columnorder = 14,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_area')));
UPDATE r5queryfield SET dqf_columnorder = 15,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar05')));
UPDATE r5queryfield SET dqf_columnorder = 16,dqf_columnwidth = 181 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchkbox02')));
UPDATE r5queryfield SET dqf_columnorder = 17,dqf_columnwidth = 108 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar20')));
UPDATE r5queryfield SET dqf_columnorder = 18,dqf_columnwidth = 209 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfdate01')));
UPDATE r5queryfield SET dqf_columnorder = 19,dqf_columnwidth = 139 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar25')));
UPDATE r5queryfield SET dqf_columnorder = 20,dqf_columnwidth = 190 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar26')));
UPDATE r5queryfield SET dqf_columnorder = 21,dqf_columnwidth = 149 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar24')));
UPDATE r5queryfield SET dqf_columnorder = 22,dqf_columnwidth = 114 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchkbox01')));
UPDATE r5queryfield SET dqf_columnorder = 23,dqf_columnwidth = 124 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_completeddate')));
UPDATE r5queryfield SET dqf_columnorder = 24,dqf_columnwidth = 115 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfchar04')));
UPDATE r5queryfield SET dqf_columnorder = 25,dqf_columnwidth = 162 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('(SELECT udl_desc FROM r5userdefinedfieldlovvals WHERE udl_field = ''udfchar04'' AND udl_code = csm_udfchar04)')));
UPDATE r5queryfield SET dqf_columnorder = 26,dqf_columnwidth = 167 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfdate03')));
UPDATE r5queryfield SET dqf_columnorder = 27,dqf_columnwidth = 142 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('csm_udfnum05')));
UPDATE r5queryfield SET dqf_columnorder = 28,dqf_columnwidth = 211 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL(CSM_UDFNUM01,0)')));
UPDATE r5queryfield SET dqf_columnorder = 29,dqf_columnwidth = 222 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL(CSM_UDFNUM02,0)')));
UPDATE r5queryfield SET dqf_columnorder = 30,dqf_columnwidth = 202 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL(CSM_UDFNUM03,0)')));
UPDATE r5queryfield SET dqf_columnorder = 31,dqf_columnwidth = 121 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL(CSM_UDFNUM01,0)+ NVL(CSM_UDFNUM02,0)+ NVL(CSM_UDFNUM03,0)')));
UPDATE r5queryfield SET dqf_columnorder = 32,dqf_columnwidth = 129 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN O7COST.MATERIAL2(CSM_WORKORDER) ELSE 0 END)')));
UPDATE r5queryfield SET dqf_columnorder = 33,dqf_columnwidth = 105 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)')));
UPDATE r5queryfield SET dqf_columnorder = 34,dqf_columnwidth = 100 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0) ELSE 0 END)')));
UPDATE r5queryfield SET dqf_columnorder = 35,dqf_columnwidth = 136 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)')));
UPDATE r5queryfield SET dqf_columnorder = 36,dqf_columnwidth = 125 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4406''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 37,dqf_columnwidth = 160 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4407''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 38,dqf_columnwidth = 181 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(COS_COST) FROM U5DMCOST WHERE COS_CASE = CSM_CODE AND COS_COSTCODE= ''4405'' AND COS_WO = ''-''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 39,dqf_columnwidth = 140 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4413''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 40,dqf_columnwidth = 208 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4580''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 41,dqf_columnwidth = 199 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('NVL((SELECT SUM(cos_cost) FROM u5dmcost WHERE cos_case = csm_code AND cos_costcode= ''4505''),0)')));
UPDATE r5queryfield SET dqf_columnorder = 42,dqf_columnwidth = 204 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('QBZ_SUMCSTCOST(CSM_CODE)')));
UPDATE r5queryfield SET dqf_columnorder = 43,dqf_columnwidth = 161 WHERE dqf_viewtype = 'LIST' AND dqf_ddspyid IN (SELECT dds_ddspyid FROM r5dddataspy WHERE  dds_owner = 'R5' AND dds_gridid IN (SELECT grd_gridid FROM r5grid WHERE  grd_gridname = 'NUCOSO') AND EXISTS(SELECT 1 FROM r5ddfield WHERE ddf_fieldid = dqf_fieldid AND UPPER(ddf_sourcename) = UPPER('QBZ_SUMCSTCOST(CSM_CODE)+(CASE WHEN evt_status <> ''CC'' THEN (O7COST.MATERIAL2(CSM_WORKORDER)+NVL((SELECT EVO_HIREDLABOR+EVO_SERVICESLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)+NVL((SELECT EVO_OWNLABOR FROM R5EVENTCOST WHERE EVO_EVENT = CSM_WORKORDER),0)) ELSE 0 END)')));
COMMIT;


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

EXEC QBZ_O7CUSTOM( 'SPC-369.sql', '17-07-2023', 'QBZ-EAM 12.0', 'Changes');

COMMIT;

PROMPT ...END of SPC-369.log

SPOOL OFF
