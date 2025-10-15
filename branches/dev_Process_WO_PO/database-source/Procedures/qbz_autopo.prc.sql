-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_autopo.prc.sql
--
-- Description : Procedure
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 03-Nov-2022 - MCT - SPC254 - Creation
-- 0002 04-Jan-2023 - MCT - SPC460 - Modify procedure to update the  preferred Supplier for new part.
-- 0003 05-Mar-2024 - MCT - SPC473 - Add different type of hours for one activity in new tab (WUJOBO) on WO screen (WSJOBO).
-- 0004 17-Dec-2024 - MCT - SPC615 - Raise error when Employee or Store not found.
-- -------------------------------------------------------------------------------

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
  type catr_tbl    is table of u5wosupp.ou_catalogue%TYPE;
  type parp_tbl    is table of u5wosupp.ou_partprice%TYPE;
  type parqt_tbl   is table of u5wosupp.ou_partqty%TYPE;
  type pdesc_tbl   is table of u5wosupp.ou_partdesc%TYPE;
  type puom_tbl    is table of u5wosupp.ou_partuom%TYPE;
  type pchk_tbl    is table of u5wosupp.ou_others%TYPE;
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
  cuser        r5users.usr_code%type := NVL(o7sess.cur_user,'*');
  clang        r5users.usr_lang%type;
  cpart        r5parts.par_code%TYPE;
  cchk         VARCHAR2(3);
  nerrno       NUMBER := 0;
  cerrmsg      VARCHAR2(240);
  rcursor      SYS_REFCURSOR;
  c_rec        VARCHAR2(4000);
  cwocact      act_tbl;       --activity
  cwocpar      catpar_tbl;    --Cat_partno
  cwocuoi      uoi_tbl;       --UOI
  cwocqty      qty_tbl;       --QTY
  cwoccatprc   cprice_tbl;    --Cat price
  cwochrs      hrs_tbl;       --Hours
  cwocamt      amt_tbl;       --fixed price
  cwocprch     pphr_tbl;      --Price per hour
  cwocparn     part_tbl;      --PartNo
  cwoctrd      trad_tbl;      --Trade
  cwocwon      work_tbl;      --WO Number
  cwoccmn      cmnts_tbl;     --Comments
  cwocpcat     catr_tbl;      --Cat ref
  cwocpprc     parp_tbl;      --Part price
  cwocpqty     parqt_tbl;     --Qty
  cwocpdsc     pdesc_tbl;     --Desc
  cwocpuom     puom_tbl;      --UOM
  cwocpchk     pchk_tbl;      --Check
  ncnt         INT;

  CURSOR WOSUPP(p_sevt VARCHAR2) IS
    SELECT evt_udfchar19,evt_desc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  --procedure called from WO
  IF p_ssource = 'WO' THEN
    c_rec :=
'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
,NULL ou_hrs,ou_amt,NULL ou_pricep,ou_partno,ou_trade
,ou_wo,listagg(ou_comment,CHR(10)) ou_comment,ou_catalogue,ou_partprice,ou_partqty
,ou_partdesc,ou_partuom,ou_others
FROM r5events
JOIN u5wosupp ON (ou_wo = evt_code)
WHERE evt_code = '''||p_scode||'''
AND (ou_parts IS NOT NULL OR ou_amt IS NOT NULL OR ou_others = ''+'')
AND NOT EXISTS(SELECT 1 FROM r5orderlines WHERE orl_event = '''||p_scode||''')
GROUP BY ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
,ou_amt,ou_partno,ou_trade
,ou_wo,ou_catalogue,ou_partprice,ou_partqty
,ou_partdesc,ou_partuom,ou_others
UNION
SELECT ou_act,NULL ou_parts,NULL ou_uoi,NULL ou_qty,NULL ou_catprice
,1 ou_hrs,NULL ou_amt,SUM(ou_pricep*ou_hrs) ou_pricep,NULL ou_partno,ou_trade
,ou_wo,listagg(ou_comment,CHR(10)) ou_comment,NULL ou_catalogue,NULL ou_partprice,NULL ou_partqty
,NULL ou_partdesc,NULL ou_partuom,''-'' ou_others
FROM r5events
JOIN u5wosupp ON (ou_wo = evt_code)
WHERE evt_code = '''||p_scode||'''
AND ou_hrs IS NOT NULL
AND NOT EXISTS(SELECT 1 FROM r5orderlines WHERE orl_event = '''||p_scode||''')
GROUP BY ou_act,ou_trade,ou_wo
ORDER BY 1,2';
  ELSIF p_ssource = 'WOC' THEN
    c_rec :=
'SELECT ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
,NULL ou_hrs,ou_amt,NULL ou_pricep,ou_partno,ou_trade
,ou_wo,listagg(ou_comment,CHR(10)) ou_comment,ou_catalogue,ou_partprice,ou_partqty
,ou_partdesc,ou_partuom,ou_others
FROM u5oupord,r5events
JOIN u5wosupp ON(ou_wo = evt_code)
JOIN u5wocont ON(ctl_seq = evt_udfchar23 AND ctl_ven = evt_udfchar19)
JOIN r5companies ON (com_code = evt_udfchar19)
WHERE por_seq = '''||p_scode||'''
AND evt_status IN (''TF'',''CA'')
AND ctl_status = ''WCC''
AND com_udfchkbox02 = ''+''
AND ctl_ven = por_ven
AND ctl_org = por_org
AND (ou_parts IS NOT NULL OR ou_amt IS NOT NULL OR ou_others = ''+'')
AND NOT EXISTS(SELECT 1 FROM r5orderlines WHERE orl_event = evt_code)
GROUP BY ou_act,ou_parts,ou_uoi,ou_qty,ou_catprice
,ou_amt,ou_partno,ou_trade
,ou_wo,ou_catalogue,ou_partprice,ou_partqty
,ou_partdesc,ou_partuom,ou_others
UNION
SELECT ou_act,NULL ou_parts,NULL ou_uoi,NULL ou_qty,NULL ou_catprice
,1 ou_hrs,NULL ou_amt,SUM(ou_pricep*ou_hrs) ou_pricep,NULL ou_partno,ou_trade
,ou_wo,listagg(ou_comment,CHR(10)) ou_comment,NULL ou_catalogue,NULL ou_partprice,NULL ou_partqty
,NULL ou_partdesc,NULL ou_partuom,''-'' ou_others
FROM u5oupord,r5events
JOIN u5wosupp ON(ou_wo = evt_code)
JOIN u5wocont ON(ctl_seq = evt_udfchar23 AND ctl_ven = evt_udfchar19)
JOIN r5companies ON (com_code = evt_udfchar19)
WHERE por_seq = '''||p_scode||'''
AND evt_status IN (''TF'',''CA'')
AND ctl_status = ''WCC''
AND com_udfchkbox02 = ''+''
AND ctl_ven = por_ven
AND ctl_org = por_org
AND ou_hrs IS NOT NULL
AND NOT EXISTS(SELECT 1 FROM r5orderlines WHERE orl_event = evt_code)
GROUP BY ou_act,ou_trade,ou_wo
ORDER BY 1,2';

  END IF;
  --get session user language
  SELECT usr_lang INTO clang FROM r5users WHERE usr_code = cuser;
  --PO creation
  --loop through all supplier/parts
  OPEN rcursor FOR c_rec;
  LOOP
  FETCH rcursor BULK COLLECT INTO cwocact,cwocpar,cwocuoi,cwocqty,cwoccatprc
                                 ,cwochrs,cwocamt,cwocprch,cwocparn,cwoctrd
                                 ,cwocwon,cwoccmn,cwocpcat,cwocpprc,cwocpqty
                                 ,cwocpdsc,cwocpuom,cwocpchk LIMIT 100;
    FOR i IN 1..cwocwon.count
    LOOP
      --get Part lines
      --get service lines with aggregate

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
      --Originator not available
      SELECT MIN(per_code) INTO cemp FROM r5personnel WHERE per_code LIKE 'APO%' and per_org = p_sorg AND per_notused = '-';
      IF cemp IS NULL THEN
        o7err.raise_error('QBZ_AUTOPO','PROC',2);
      END IF; --cemp IS NULL
      --Store not available
      SELECT MIN(str_code) INTO cstore FROM r5stores WHERE str_code LIKE 'APO%' AND str_org = p_sorg AND str_notused = '-';
      IF cstore IS NULL THEN
        o7err.raise_error('QBZ_AUTOPO','PROC',3);
      END IF; --cstore IS NULL
      --create PO and PD line, if Part not exists then create Part first
      IF cwocpchk(i) = '+' THEN
        --create part if not exits
        o7inspar(cpart,'*',cwocpdsc(i),'-',cwocpuom(i),cchk);
        --raise error part is not generated correctly
        IF NVL(cchk,0) <> 0 THEN
          RAISE_APPLICATION_ERROR(-20003,'Error occured while generating new Part. Please contact System Administrator.');
        END IF; --NVL(cchk,0) <> 0
        --create supplier catalogue
        INSERT INTO r5catalogue(cat_part,cat_supplier,cat_date,cat_gross,cat_purprice,cat_puruom,cat_ref,cat_curr,cat_supplier_org,cat_part_org,cat_desc)
        VALUES (cpart,csupplier,TRUNC(SYSDATE),cwocpprc(i),cwocpprc(i),cwocpuom(i),cwocpcat(i),'EUR','*','*',cwocpdsc(i));

        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,cpart,'*',dcurdate,cwocpprc(i),'EUR',nexch,cwocpqty(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocpuom(i),'PD','PD',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        --update PAR_PREFSUP for get the value of preffered Supplier
        IF SUBSTR(cpart, 1, 1) = 'N' THEN
          UPDATE r5parts
          SET par_prefsup     = csupplier
             ,par_prefsup_org = '*'
          WHERE par_code      = cpart
          AND par_org         = '*';
        END IF;--SUBSTR(cpart, 1, 1) = 'N'
        cpart := NULL;

        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails(add_entity,add_rentity,add_type,add_rtype,add_code,add_lang,add_line,add_print,add_text,add_user,add_updatecount)
          VALUES ('PORL','PORL','*','*',corder||'#'||p_sorg||'#'||nordline,clang,10,'+',cwoccmn(i),cuser,0);
        END IF; --cwoccmn(i) IS NOT NULL
      END IF; --cwocpchk(i) = '+'
      --create PO and PD line if Part exists
      IF cwocpar(i) IS NOT NULL AND cwocpchk(i) = '-' THEN
        --if Part not exists then raise error
        SELECT COUNT(1) INTO ncnt FROM r5parts WHERE par_code = cwocparn(i) AND par_org = '*';
        IF ncnt = 0 THEN
          RAISE_APPLICATION_ERROR(-20003,'Part code '||cwocparn(i)||' not found.');
        END IF; -- ncnt = 0
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,cwocparn(i),'*',dcurdate,cwoccatprc(i),'EUR',nexch,cwocqty(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'PD','PD',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails(add_entity,add_rentity,add_type,add_rtype,add_code,add_lang,add_line,add_print,add_text,add_user,add_updatecount)
          VALUES ('PORL','PORL','*','*',corder||'#'||p_sorg||'#'||nordline,clang,10,'+',cwoccmn(i),cuser,0);
        END IF; --cwoccmn(i) IS NOT NULL
      END IF; --cwocpar(i) IS NOT NULL
      --create PO and SF line
      IF cwocamt(i) IS NOT NULL THEN
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,NULL,NULL,dcurdate,cwocamt(i),'EUR',nexch,1,NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'SF','SF',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails(add_entity,add_rentity,add_type,add_rtype,add_code,add_lang,add_line,add_print,add_text,add_user,add_updatecount)
          VALUES ('EVNT','EVNT','*','*',cwocwon(i)||'#'||cwocact(i),clang,10,'+',cwoccmn(i),cuser,0);
        END IF; --cwoccmn(i) IS NOT NULL
      END IF; --cwocamt(i) IS NOT NULL
      --create PO and ST line
      IF cwochrs(i) IS NOT NULL THEN
        o7crord1(corder,nordline,p_sorg,dcurdate,csupplier,'*',cstore,cemp,NULL,NULL
                ,NULL,NULL,NULL,dcurdate,cwocprch(i),'EUR',nexch,cwochrs(i),NULL,NULL
                ,NULL,cwocwon(i),cwocact(i),cwocuoi(i),'ST','ST',1,NULL,NULL,NULL
                ,NULL,cwoctrd(i),'-','KA',cchk,NULL,ccuruser);
        IF cwoccmn(i) IS NOT NULL THEN
          INSERT INTO r5addetails(add_entity,add_rentity,add_type,add_rtype,add_code,add_lang,add_line,add_print,add_text,add_user,add_updatecount)
          VALUES ('EVNT','EVNT','*','*',cwocwon(i)||'#'||cwocact(i),clang,10,'+',cwoccmn(i),cuser,0);
        END IF; --cwoccmn(i) IS NOT NULL
      END IF; --cwochrs(i) IS NOT NULL

      --update udfchar24 to PO Number
      UPDATE r5events
      SET evt_udfchar24 = corder
      WHERE evt_code    = cwocwon(i);
    END LOOP; --i
    EXIT WHEN rcursor%NOTFOUND;
  END LOOP; --rcursor
  CLOSE rcursor;
  --PO not created
  IF corder IS NULL THEN
    o7err.raise_error('QBZ_AUTOPO','PROC',4);
  END IF;
  IF p_ssource = 'WO' THEN
    --update udfchar05 to automatic and copied eventdesc to PO desc
    UPDATE r5orders
    SET ord_desc   = cevtdesc
    ,ord_udfchar05 = 'AUT'
    WHERE ord_Code = corder
    AND ord_org    = p_sorg;
  ELSE
    --update udfchar05 to automatic
    UPDATE r5orders
    SET ord_udfchar05 = 'AUT'
    WHERE ord_Code    = corder
    AND ord_org       = p_sorg;
    --UPDATE PO and created by
    UPDATE u5oupord
    SET por_po    = corder
    ,por_date     = dcurdate
    ,por_genby    = ccuruser
    WHERE por_seq = p_scode
    AND NVL(por_po,'!@#$') <> corder;
  END IF; --p_ssource = 'WO'
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

DELETE FROM r5errtexts  WHERE ert_code  IN ('QBZATPO04');
DELETE FROM r5errsource WHERE ers_source IN ( 'QBZ_AUTOPO') AND ers_code in ('QBZATPO04');

INSERT INTO R5ERRSOURCE ( ERS_SOURCE, ERS_TYPE, ERS_DESC, ERS_NUMBER, ERS_CODE, ERS_NAME) VALUES ( 'QBZ_AUTOPO', 'PROC', NULL, 4, 'QBZATPO04', NULL);
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'No record found to Generate PO.','EN', '-');
INSERT INTO R5ERRTEXTS ( ERT_CODE, ERT_TEXT, ERT_LANG, ERT_TRANSLATE ) VALUES ( 'QBZATPO04', 'Geen record gevonden om PO te genereren.','NL', '-');
COMMIT;

PROMPT ...END of error texts
PROMPT
PROMPT ...End of qbz_autopo.prc.sql
PROMPT
