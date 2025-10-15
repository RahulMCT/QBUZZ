-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5wsmessagestatus.trg.sql
--
-- Description : Triggers on r5casemanagement
--
-- Product     : EAM             Release : 12.0         Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 13-03-2023 - MCT - SPC226 - Creation
-- -------------------------------------------------------------------------------
PROMPT ...Start of qbz_r5wsmessagestatus.trg.sql
PROMPT

PROMPT ...Creating trigger COMP_INSUPD_WSS_QBZ
CREATE OR REPLACE TRIGGER COMP_INSUPD_WSS_QBZ
FOR INSERT OR UPDATE ON R5WSMESSAGESTATUS
COMPOUND TRIGGER
  --local variables
  TYPE            wsscodetype      IS TABLE OF r5wsmessagestatus.wss_code%TYPE INDEX BY BINARY_INTEGER;
  TYPE            wssreqmsgtype    IS TABLE OF r5wsmessagestatus.wss_req_message%TYPE INDEX BY BINARY_INTEGER;
  TYPE            wsscontextidtype IS TABLE OF r5wsmessagestatus.wss_contextid%TYPE INDEX BY BINARY_INTEGER;
  wsscode         wsscodetype;
  wssreqmsg       wssreqmsgtype;
  wsscontextid    wsscontextidtype;

  countit         NUMBER;
  cnt             NUMBER := 0;
  tkdtransid      r5trackingdata.tkd_transid%type;
  tkdpromptdata1  r5trackingdata.tkd_promptdata1%type;
  nerrno          NUMBER;
  serrmsg         VARCHAR2(512);
  nstartindex     INT;
  nendindex       INT;

AFTER EACH ROW IS
BEGIN
  IF :new.wss_req_status IN ('F')
   AND UPPER(:new.wss_document) IN (UPPER('SyncMaintenanceOrder'),UPPER('SyncAssetTrackingData'))
   AND (INSERTING
        OR (UPDATING
            AND :new.wss_req_status <> :old.wss_req_status))
  THEN
    --save record for statement level processing
    cnt               := cnt + 1;
    wsscode(cnt)      := :new.wss_code;
    wssreqmsg(cnt)    := :new.wss_req_message;
    wsscontextid(cnt) := :new.wss_contextid;
  END IF; --:new.wss_req_status IN ('F')
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    BEGIN
      nstartindex    := INSTR(wsscontextid(i),':*:')+3;
      nendindex      := INSTR(wsscontextid(i),':',nstartindex);
      tkdpromptdata1 := SUBSTR(wsscontextid(i),nstartindex,nendindex-nstartindex);
      --create record in r5trackingdata table
      INSERT INTO r5trackingdata(tkd_promptdata1,tkd_promptdata2,tkd_promptdata51,tkd_sourcesystem,tkd_sourcecode,tkd_trans,tkd_trackdate)
      VALUES(tkdpromptdata1,'ERROR',wssreqmsg(i),'Qrane - Damage','Qrane - Damage','QDMG',SYSDATE)
      RETURNING tkd_transid INTO tkdtransid;
      --create record in xmltranstatus to send message out
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_keyfld3,xts_org,xts_orig_messageid )
      SELECT 'TKDATA','R5TRACKINGDATA',tkdtransid,'QDMG','R',NULL,NULL
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                       WHERE xts_trantype = 'TKDATA'
                       AND   xts_keyfld1  = tkdtransid);
    EXCEPTION
    WHEN OTHERS THEN
      nerrno  := SQLCODE;
      serrmsg := SQLERRM;
      --track record in monitor interface that, error back to Qrane stuck at databridge
      INSERT INTO r5trackingdata(tkd_promptdata1,tkd_promptdata2,tkd_promptdata51,tkd_sourcesystem,tkd_sourcecode,tkd_trans,tkd_trackdate)
      VALUES(wsscode(i),'ERROR',wssreqmsg(i),'Qrane - Damage','Qrane - Damage','QDMG',SYSDATE)
      RETURNING tkd_transid INTO tkdtransid;
      INSERT INTO r5interfaceerrors(ine_transid,ine_error,ine_create,ine_errsource,ine_errtype,ine_errnumber)
      VALUES (tkdtransid,SUBSTR(serrmsg,1,240),o7gttime(''),'QBZ_DAMAGEINCIDENT','PROC',nerrno);
    END; --END BEGIN
  END LOOP; --i IN 1..cnt
END AFTER STATEMENT;

END COMP_INSUPD_WSS_QBZ;
/
SHOW ERRORS TRIGGER COMP_INSUPD_WSS_QBZ
PROMPT


PROMPT ...End of qbz_r5wsmessagestatus.trg.sql
PROMPT
