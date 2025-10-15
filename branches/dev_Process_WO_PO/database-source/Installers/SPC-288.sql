-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-288.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 03-11-2022  - MCT - SPC288  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-288.log

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

PROMPT ...Start of SPC-288.sql

PROMPT Begin of qbz_nusupp.grd.sql
PROMPT

PROMPT ...Creating grid NUSUPP
PROMPT

DECLARE
  sFunction      VARCHAR(6)   := 'NUSUPP';
  sDesc          VARCHAR2(80) := 'Monthly check';
  sGridid        VARCHAR(30);
  sDataspyid1    VARCHAR(30);
  sCheckresult   VARCHAR(4);
  sLang          VARCHAR(2);
  maxbotnum      VARCHAR(30);
  sQuery         VARCHAR2(4000);
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
  DELETE FROM  r5usegridsysdefault    WHERE usd_gridid    IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5dddataspy            WHERE  dds_gridid   IN (SELECT  grd_gridid FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridfield            WHERE  gfd_gridid   IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5gridparam            WHERE gdp_gridid    IN (SELECT grd_gridid  FROM r5grid WHERE grd_gridname = sFunction);
  DELETE FROM  r5grid                 WHERE  grd_gridname = sFunction;
  DELETE FROM  r5boilertexts          WHERE  bot_function = sFunction;
  DELETE FROM  r5pagelayout           WHERE  plo_pagename = sFunction;
  DELETE FROM  r5defaultpagelayout    WHERE  pld_pagename = sFunction;
  DELETE FROM  r5extmenus             WHERE  emn_function = sFunction;
  DELETE FROM  r5permissions          WHERE  prm_function = sFunction;
  DELETE FROM  r5functions            WHERE  fun_code     = sFunction;
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
  --Check box
  SELECT MIN(ddf_fieldid) INTO ddfield1 FROM r5ddfield WHERE ddf_tablename = 'R5COMPANIES' AND UPPER(ddf_sourcename) = '(CASE WHEN COM_UDFCHKBOX02 = ''+'' THEN ''Y'' ELSE ''N'' END)';
  IF ddfield1 IS NULL THEN
    r5o7.o7maxseq(ddfield1,'DDF','1',chk );
    INSERT INTO r5ddfield(ddf_fieldid,ddf_sourcename,ddf_datatype,ddf_tablename) VALUES (ddfield1,'(CASE WHEN com_udfchkbox02 = ''+'' THEN ''Y'' ELSE ''N'' END)','MIXVARCHAR','R5COMPANIES');
  END IF;
  -- Finds sequence for Grid
  r5o7.o7maxseq (sGridid,'GRD',1,sCheckresult);
  --set grid query
  sQuery :=
'FROM r5companies
WHERE com_code = :parameter.comcode
AND com_org = :parameter.comorg';
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
  --creating Grid fields
  INSERT INTO r5gridfield (gfd_fieldid,gfd_gridid,gfd_botfunction,gfd_botnumber,gfd_controltype,gfd_scriptevent,gfd_tagname,gfd_updatecount,gfd_tagparams,gfd_aggfunc,gfd_fieldtype,gfd_occurrence,gfd_dependent,gfd_secentity,gfd_headerlocation,gfd_updated) VALUES(ddfield1,sGridid,sFunction,5,'TEXT',NULL,'commonchk',0,NULL,NULL,'n',1,NULL,NULL,'n',SYSDATE);
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
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,1,100,0,0,'EN','List View'        ,'TB',1,'LST'          ,'10000','+',NULL,'-');
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,2,100,0,0,'EN',sDesc              ,'F' ,1,'UDG_HDRLABEL' ,'10000','+',NULL,'-');
  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,3,100,0,0,'EN','All Records'      ,'F' ,1,'DSNAME'       ,'10000','+',NULL,'-');

  INSERT INTO r5boilertexts(bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) VALUES(sFunction,5,100,0,0,'EN','Monthly Invoice'  ,'F' ,1,'COMMONCHK'    ,'10000','+',NULL,'-');
END;
/
COMMIT;

PROMPT ...Created grid NUSUPP

PROMPT End of qbz_nusupp.grd.sql
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
  type cmnts_tbl   is table of u5wosupp.ou_comment%TYPE;
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
  cwoccmn      cmnts_tbl;--WO Number

  CURSOR WOSUPP(p_sevt VARCHAR2) IS
    SELECT evt_udfchar19,evt_desc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  --procedure called from WO
  IF p_ssource = 'WO' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
             ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
             ,ou_wo,ou_comment
             FROM r5events
             JOIN u5wosupp ON (ou_wo = evt_code)
             WHERE evt_code = '''||p_scode||'''
             AND NOT EXISTS(SELECT 1
                             FROM r5orderlines
                             WHERE orl_event = '''||p_scode||''')';
  ELSIF p_ssource = 'WOC' THEN
    c_rec := 'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
              ,ou_hrs,ou_amt,ou_pricep,ou_partno,ou_trade
              ,ou_wo,ou_comment
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
                      ,cwocwon,cwoccmn LIMIT 100;
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
      --get sess use and lang
      cuser := NVL( o7sess.cur_user, '*' );
      SELECT usr_lang INTO clang
      FROM r5users
      WHERE usr_code = cuser;
      --call procedure to create PO and PO lines, if PO exists append PO lines
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

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5EVENTS' AND flx_trigger = 'POST-INSERT' AND flx_seq = 41;
sstmt :=
'BEGIN
  FOR cevt IN (SELECT evt_jobtype,evt_code,evt_object,evt_object_org
               FROM r5events
               WHERE rowid       = :rowid
               AND   evt_status  = ''W''
               AND evt_rtype IN (''JOB'',''PPM'')
               AND   evt_jobtype IN (''STO'',''SCH'')) LOOP
    IF cevt.evt_jobtype = ''SCH'' THEN
      UPDATE r5events
      SET    evt_udfchar19 = (SELECT obj_udfchar17
                              FROM r5objects o,r5companies c
                              WHERE o.obj_code        = cevt.evt_object
                              AND   o.obj_org         = cevt.evt_object_org
                              AND   o.obj_udfchar17   = com_code
                              AND   c.com_org         = ''*''
                              AND   com_udfchkbox01   = ''+''
                              AND NOT EXISTS (SELECT 1 FROM r5objects p
                                             WHERE p.obj_code = o.obj_primarysystem
                                             AND p.obj_udfchkbox01 = ''+''
                                             AND  c.com_udfchkbox03  = ''+'' ))
       WHERE  evt_code     = cevt.evt_code;
    ELSIF cevt.evt_jobtype = ''STO'' THEN
      UPDATE r5events
      SET    evt_udfchar19 = (SELECT obj_udfchar17
                              FROM r5objects o,r5companies c
                              WHERE o.obj_code        = cevt.evt_object
                              AND   o.obj_org         = cevt.evt_object_org
                              AND   o.obj_udfchar17   = com_code
                              AND   c.com_org         = ''*''
                              AND NOT EXISTS (SELECT 1 FROM r5objects p
                                             WHERE p.obj_code = o.obj_primarysystem
                                             AND p.obj_udfchkbox01 = ''+''
                                             AND  c.com_udfchkbox03  = ''+'' ))
      WHERE evt_code       = cevt.evt_code;
   END IF;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5EVENTS','POST-INSERT',41,'+','-'
    ,'+','R5EVENTS, Post Insert, 41','Copy Vendor copied to evt_udfchar19','-',0,'-',sysdate,sstmt);
END;
/

PROMPT ...Creating trigger PREUPD_U5WOS_QBZ

CREATE OR REPLACE TRIGGER PREUPD_U5WOS_QBZ
BEFORE UPDATE OR INSERT ON U5WOSUPP
FOR EACH ROW
DECLARE
  countit   NUMBER;
BEGIN
  --Quantity must be greater than 0
  IF :new.ou_qty <= 0 THEN
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
   AND :new.ou_toh IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',15);
  --Please enter Quantity
  ELSIF :new.ou_parts IS NOT NULL
   AND :new.ou_qty IS NULL THEN
    o7err.raise_error('PREUPD_U5WOS_QBZ','TRIG',6);
  --Please enter Part
  ELSIF :new.ou_parts IS NULL
   AND :new.ou_qty IS NOT NULL THEN
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
        OR :new.ou_parts IS NOT NULL) THEN
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
   OR :new.ou_hrs IS NOT NULL THEN
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
    SELECT MAX(ouhrs),MAX(ouamt),MAX(ouParts) INTO hcountit,pcountit,countit FROM(
    SELECT
    COUNT(ou_hrs)    over (partition by ou_wo,ou_act)          ouhrs
    ,COUNT(ou_amt)   over (partition by ou_wo,ou_act)          ouamt
    ,COUNT(ou_parts) over (partition by ou_wo,ou_act,ou_parts) ouparts
    FROM U5WOSUPP
    WHERE ou_wo = newevtcode(i)
    AND ou_act  = newevtact(i));
    --same Part or Labor or FixAmt cannot be entered twice for same activity
    IF hcountit > 1
     OR pcountit > 1
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

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS01');
DELETE FROM r5errsource WHERE ers_source IN ( 'PREUPD_U5WOS_QBZ') AND ers_code in ('QBZWOS01');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'PREUPD_U5WOS_QBZ', 'TRIG', NULL, 5, 'QBZWOS01', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'must be greater than 0','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS01', 'moet groter zijn dan 0','NL', '-');

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

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS12');
DELETE FROM r5errsource WHERE ers_source IN ( 'COMP_UPD_WOS_QBZ') AND ers_code in ('QBZWOS12');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'COMP_UPD_WOS_QBZ', 'TRIG', NULL, 16, 'QBZWOS12', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS12', 'same Part or Labor or FixAmt cannot be entered twice for same activity','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS12', 'hetzelfde Onderdeel of Arbeid of FixAmt kan niet tweemaal worden ingevoerd voor dezelfde activiteit','NL', '-');

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZWOS13');
DELETE FROM r5errsource WHERE ers_source IN ( 'COMP_UPD_WOS_QBZ') AND ers_code in ('QBZWOS13');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'COMP_UPD_WOS_QBZ', 'TRIG', NULL, 17, 'QBZWOS13', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS13', 'Not allowed to enter book hours or fixed price on same activity','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZWOS13', 'Het is niet toegestaan ​​om boekuren of vaste prijs in te voeren voor dezelfde activiteit','NL', '-');
COMMIT;

PROMPT ...END of error texts
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
  IF /*((:new.evt_status = 'TCS' AND :old.evt_status = 'IBL')
   OR */(:new.evt_status = 'TC' AND :old.evt_status = 'IBQ')/*)*/ THEN
     --count of closing tab
     SELECT COUNT(1) INTO countit from r5addetails where add_code = :new.evt_code;
     IF countit = 0 THEN
     o7err.raise_error('PREUPD_EVT_QBZ','TRIG',3);
     END IF;  ----countit = 0
  END IF;    --No records in closing tab Raise Err
  /*IF :new.evt_status = 'C' AND :old.evt_status = 'TC' THEN  --QBUZZ employee
    SELECT COUNT(1) INTO countit from r5translines where trl_event = :new.evt_code;  --count of parts
    SELECT COUNT(1) INTO countit1 from r5bookedhours where boo_event = :new.evt_code;  --count of booklab tab
    IF countit = 0 AND countit1 = 0 THEN    
      o7err.raise_error('PREUPD_EVT_QBZ','TRIG',6);
    END IF;  ----countit = 0
  END IF;  --new.evt_status = 'C' AND old.evt_status = 'TC'*/
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

SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-288.sql', '03-11-2022', 'QBZ-EAM 11.7', 'Issue changes delivery');

COMMIT;

PROMPT ...END of SPC-288.log

SPOOL OFF