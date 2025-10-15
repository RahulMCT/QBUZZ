-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_autoporec.prc.sql
--
-- Description : Procedure
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 19-10-2022 - MCT - SPC254 - Creation
-- 0002 22-07-2024 - MCT - SPC562 - Issue on PO approval, at the time of receipt getting error.
-- 0003 30-07-2024 - MCT - SPC562 - Issue on PO approval, remove variable material list on WO complete.
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_autoporec.prc.sql
PROMPT

PROMPT  ...Creating Procedure QBZ_AUTOPOREC

CREATE OR REPLACE PROCEDURE QBZ_AUTOPOREC (p_cordcode       IN VARCHAR2
                                          ,p_cordorg        IN VARCHAR2
                                          ,p_nerrno         OUT NUMBER
                                          ,p_serrmsg        OUT VARCHAR2)
AS
  --local variables
  ccuruser      r5users.usr_Code%type := NVL(o7sess.cur_user,'R5');
  dcurdatetime  DATE := o7gttime(p_cordorg);
  ctrans        r5transactions.tra_code%type;
  cbin          r5bins.bin_code%type;
  cdock         r5dockreceipts.dck_code%type;
  cdckcode      r5dockreceipts.dck_code%type;
  cevtmrc       r5events.evt_mrc%type;
  sorl_eventold r5events.evt_code%type;
  sdeltmatl     r5install.ins_desc%type;
  countit       NUMBER;
  cchk          VARCHAR2(3);
  nerrno        NUMBER := 0;
  serrmsg       VARCHAR2(4000);
  db_error      EXCEPTION;
  --check PO existence
  CURSOR PODCK IS
    SELECT dck_code
    FROM r5dockreceipts
    WHERE dck_order = p_cordcode;
  --get WO mrc
  CURSOR womrc(p_sevt VARCHAR2) IS
    SELECT evt_mrc
    FROM r5events
    WHERE evt_code = p_sevt;
BEGIN
  p_nerrno  := 0;
  p_serrmsg := NULL;
  --return if PO-receiving already created
  OPEN  podck;
  FETCH podck INTO cdckcode;
  CLOSE podck;
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
            ORDER BY DECODE(orl_type,'PD',1,2),orl_event,orl_ordline)
  LOOP
    BEGIN
      --reset transaction header code when WO changes
      IF p.orl_type = 'PD'
       AND NVL(sorl_eventold,'!@#$%') <> p.orl_event THEN
        sorl_eventold := p.orl_event;
        ctrans        := NULL;
      END IF; --p.orl_type = 'PD'
      --get bin from store
      IF cbin IS NULL THEN
        SELECT MIN(bin_code) INTO cbin FROM r5bins WHERE bin_store = p.orl_store AND bin_notused = '-';
        --raise error if bin not available
        IF cbin IS NULL THEN
          o7err.raise_error('QBZ_AUTOPOREC','PROC',2);
        END IF; --cbin IS NULL
      END IF; --cbin IS NULL
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
        IF ctrans IS NULL THEN
          --get trans code
          r5o7.o7maxseq(ctrans,'TRAN',1,cchk);
          INSERT INTO r5transactions
            (tra_code,tra_org,tra_desc,tra_class,tra_class_org,tra_type,tra_rtype,tra_auth,tra_date,tra_order
            ,tra_order_org,tra_status,tra_rstatus,tra_fromentity,tra_fromrentity,tra_fromtype,tra_fromrtype,tra_fromcode,tra_fromcode_org,tra_toentity
            ,tra_torentity,tra_totype,tra_tortype,tra_tocode,tra_tocode_org,tra_interface,tra_printed,tra_dckcode)
          VALUES
            (ctrans,p.ord_org,p.ord_desc,p.ord_class,p.ord_class_org,'RECV','RECV',ccuruser,dcurdatetime,p.ord_code
            ,p.ord_org,'A','A','COMP','COMP','*','*',p.ord_supplier,p.ord_supplier_org,'EVNT'
            ,'EVNT','*','*',p.orl_event,NULL,NULL,'-',cdock);
        END IF; --ctrans IS NULL
        --update transcode to dockreceive code
        UPDATE r5docklines
        SET dkl_recvcode  = ctrans
        WHERE dkl_dckcode = cdock
        AND   dkl_line    = p.orl_ordline;
        --create Transaction lines
        INSERT INTO r5translines
          (trl_trans,trl_type,trl_rtype,trl_line,trl_date,trl_store,trl_order,trl_order_org,trl_ordline,trl_costcode
          ,trl_project,trl_projbud,trl_event,trl_act,trl_part,trl_part_org,trl_req,trl_reqline,trl_multiply,trl_io
          ,trl_stockprice,trl_price,trl_qty,trl_scrapqty,trl_bin,trl_lot,trl_sourcesystem,trl_sourcecode,trl_interface,trl_object
          ,trl_object_org,trl_obtype,trl_obrtype,trl_rejectreason,trl_transorgid,trl_transcode,trl_transgroup)
        VALUES
          (ctrans,'RECV','RECV',p.orl_ordline,dcurdatetime,p.orl_store,p.ord_code,p.ord_org,p.orl_ordline,NULL
          ,NULL,NULL,p.orl_event,p.orl_act,p.orl_part,p.orl_part_org,NULL,NULL,p.orl_multiply,p.nio
          ,NULL,((p.orl_price/p.orl_multiply)/p.orl_exch),p.orl_ordqty,0,cbin,'*',NULL,NULL,NULL,NULL
          ,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
      ELSIF p.orl_type = 'SF' THEN
        OPEN  womrc(p.orl_event);
        FETCH womrc INTO cevtmrc;
        CLOSE womrc;
        --create BookVendor hours
        INSERT INTO r5bookedhours
          (boo_event,boo_act,boo_date,boo_trade,boo_mrc,boo_person,boo_octype,boo_ocrtype,boo_on,boo_off,boo_hours,boo_rate,boo_cost,boo_entered)
        VALUES
          (p.orl_event,p.orl_act,dcurdatetime,p.orl_trade,cevtmrc,NULL,'N','N',NULL,NULL,p.orl_price,p.orl_ordqty,(p.orl_ordqty*p.orl_price),dcurdatetime);
      ELSIF p.orl_type = 'ST' THEN
        OPEN  womrc(p.orl_event);
        FETCH womrc INTO cevtmrc;
        CLOSE womrc;
        --create BookVendor hours
        INSERT INTO r5bookedhours
          (boo_event,boo_act,boo_date,boo_trade,boo_mrc,boo_person,boo_octype,boo_ocrtype,boo_on,boo_off,boo_hours,boo_rate,boo_cost,boo_entered)
        VALUES
          (p.orl_event,p.orl_act,dcurdatetime,p.orl_trade,cevtmrc,NULL,'N','N',NULL,NULL,p.orl_ordqty,p.orl_price,(p.orl_ordqty*p.orl_price),dcurdatetime);
      END IF; --p.orl_type = 'PD'
    EXCEPTION
    WHEN OTHERS THEN
      nerrno    := SQLCODE;
      serrmsg   := SQLERRM;
      p_nerrno  := nerrno;
      p_serrmsg := SUBSTR('ERR1, PO Line: '||p.orl_ordline||' , '||serrmsg,1,4000);
      EXIT;
    END;
  END LOOP;--p
  --update PO line and PO receipt after transaction creation
  IF p_nerrno = 0 THEN
    BEGIN
      --update status and rstatus to 'A'
      UPDATE r5dockreceipts
      SET dck_status = 'A'
      ,dck_rstatus   = 'A'
      WHERE dck_code = cdock;
      --update all PO Lines and mark them to received
      UPDATE r5orderlines
      SET orl_active    = '-'
      ,orl_recvqty      = orl_ordqty
      ,orl_recvvalue    = orl_ordqty*orl_price
      WHERE orl_order   = p_cordcode
      AND orl_order_org = p_cordorg;
    EXCEPTION
    WHEN OTHERS THEN
      nerrno    := SQLCODE;
      serrmsg   := SQLERRM;
      p_nerrno  := nerrno;
      p_serrmsg := SUBSTR('ERR2, '||serrmsg,1,4000);
    END;
  END IF; --p_nerrno <> 0
  --if no error then proceed
  IF p_nerrno = 0 THEN
    --close all WOs
    FOR i IN (SELECT DISTINCT orl_event
              FROM r5orderlines
              WHERE orl_order   = p_cordcode
              AND orl_order_org = p_cordorg)
    LOOP
      BEGIN
        --unlink variable material from activities
        sdeltmatl := o7dflt('DELTMATL',cchk);
        IF NVL(sdeltmatl,'Y') = 'Y' THEN
          o7upact8(i.orl_event,cchk);
        END IF;
        --When PO status is Approved (A2) then associated work order status will be updated to Completed
        UPDATE r5events
        SET evt_status = 'C'
        ,evt_rstatus   = 'C'
        ,evt_completed = o7gttime(p_cordorg)
        WHERE evt_code = i.orl_event;
      EXCEPTION
      WHEN OTHERS THEN
        nerrno    := SQLCODE;
        serrmsg   := SQLERRM;
        p_nerrno  := nerrno;
        p_serrmsg := SUBSTR('ERR3, WO: '||i.orl_event||' , '||serrmsg,1,4000);
        EXIT;
      END;
    END LOOP;--i
  END IF; --p_nerrno <> 0
EXCEPTION
WHEN OTHERS THEN
  nerrno    := SQLCODE;
  serrmsg   := SQLERRM;
  p_nerrno  := nerrno;
  p_serrmsg := SUBSTR('ERR4, '||serrmsg,1,4000);
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
