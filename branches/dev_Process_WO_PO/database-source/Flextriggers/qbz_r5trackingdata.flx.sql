-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_r5trackingdata.flx.sql
--
-- Description : flexes on R5TRACKINGDATA
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 13-Mar-2023 - MCT - SPC226 - Creation
-- 0002 22-Aug-2023 - MCT - SPC416 - use csm_udfchar28 for problem code and csm_udfchar29 for csm_code, only updated variable name
-- 0003 05-Mar-2024 - MCT - SPC452 - EAM - AFAS interface
-- -------------------------------------------------------------------------------

PROMPT ...Begin Of qbz_r5trackingdata.flx.sql
PROMPT


DECLARE
  vaction varchar2(5);
BEGIN
  vaction := 'ADD';
  o7crflex('R5TRACKINGDATA',vaction);
END;
/

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5TRACKINGDATA' AND flx_trigger = 'POST-INSERT' AND flx_seq = 100;
sstmt :=
'DECLARE
nerrno   NUMBER;
serrmsg  VARCHAR2(1000);
BEGIN
  FOR c IN (SELECT
            tkd_transid
           ,tkd_promptdata1    udfchar02    --incidentId
           ,''SCH''            casetype     --incidentType
           ,tkd_promptdata3    org
           ,tkd_promptdata4    object       --vehicleAffected
           ,tkd_promptdata5    udfchar28    --damageDefect
           ,to_date(replace(replace(tkd_promptdata6,''T'','' ''),''Z'',''''),''yyyy-mm-dd hh24:mi:ss'')      requested    --currentdate
           ,tkd_promptdata7    area         --locationStreet
           ,tkd_promptdata8    udfchar05    --locationCity
           ,tkd_promptdata9    udfchar30    --locationLine
           ,tkd_promptdata10   udfchar06    --employeeId
           ,tkd_promptdata11   chklst10     --injuredDriver
           ,tkd_promptdata12   chklst20     --injuredPassengers
           ,tkd_promptdata13   chklst30     --injuredCounterParty
           ,tkd_promptdata14   chklst40     --alarmedAmbulance
           ,tkd_promptdata15   chklst50     --alarmedPolice
           ,tkd_promptdata16   chklst60     --alarmedFireBrigade
           ,tkd_promptdata17   chklst70     --hydrogenBus
           ,tkd_promptdata18   chklst80     --voaResearch
           ,tkd_promptdata19   chklst90     --informedVvo
           ,tkd_promptdata20   chklst100    --informedTeamleader
           ,tkd_promptdata21   chklst110    --engagedSalvage
           ,tkd_promptdata22   chklst120    --drawnUpSafSat
           ,tkd_promptdata23   chklst140    --listedWitnesses
           ,tkd_promptdata24   chklst150    --registrationNrCounterParty
           ,tkd_promptdata25   chklst160    --counterPartyDidNotStop
           ,tkd_promptdata26   chklst170    --securedCctvFootage
           ,tkd_promptdata27   chklst180    --damagedRoadFurniture
           ,tkd_promptdata28   chklst190    --photosOfDamage
           ,tkd_promptdata51   incidentText
           FROM r5trackingdata
           WHERE rowid   = :rowid
           AND tkd_trans = ''QDMG''
           AND upper(tkd_promptdata2) = ''DAMAGE'')
  LOOP
    --call procedure to update Work Order and Position
    QBZ_DAMAGEINCIDENT(c.udfchar02,c.casetype,c.org,c.object,c.udfchar28,c.requested,c.area,c.udfchar05,c.udfchar30,c.udfchar06
                      ,c.chklst10,c.chklst20,c.chklst30,c.chklst40,c.chklst50,c.chklst60,c.chklst70,c.chklst80,c.chklst90,c.chklst100
                      ,c.chklst110,c.chklst120,c.chklst140,c.chklst150,c.chklst160,c.chklst170,c.chklst180,c.chklst190,c.incidentText
                      ,nerrno,serrmsg);
    --on successful processing delete R5TRACKINGDATA record
    IF nerrno = 0 THEN
      --delete older records
      DELETE FROM r5trackingdata WHERE tkd_trans = ''QDMG'' and tkd_trackdate < SYSDATE-15;
    ELSIF NVL(nerrno,-999) <> 0
    THEN
      --update r5trackingdata status
      UPDATE r5trackingdata SET tkd_rstatus = ''P'',tkd_promptdata51 = SUBSTR(serrmsg,1,1000) WHERE tkd_transid = c.tkd_transid;
      --log error
      INSERT INTO r5interfaceerrors(ine_transid,ine_error,ine_create,ine_errsource,ine_errtype,ine_errnumber)
      VALUES (c.tkd_transid,SUBSTR(serrmsg,1,240),o7gttime(''''),''QBZ_DAMAGEINCIDENT'',''PROC'',nerrno);
      --create record in xmltranstatus to send message out
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
      SELECT ''TKDATA'',''R5TRACKINGDATA'',c.tkd_transid,NULL,NULL,o7sess.get_messageid()
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                     WHERE xts_trantype = ''TKDATA''
                     AND   xts_keyfld1  = c.tkd_transid);
    END IF;
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5TRACKINGDATA','POST-INSERT',100,'+','-'
    ,'+','R5TRACKINGDATA, POST-INSERT, 10','Flex for Qrane Damage incident Inbound process through R5TRACKINGDATA','-',0,'-',sysdate,sstmt);
END;
/
COMMIT;

DECLARE
sstmt VARCHAR2(8000);
BEGIN
DELETE FROM r5flexsql WHERE flx_table = 'R5TRACKINGDATA' AND flx_trigger = 'POST-INSERT' AND flx_seq = 110;
sstmt :=
'DECLARE
nerrno   NUMBER;
serrmsg  VARCHAR2(4000);
BEGIN
  FOR c IN (SELECT
             tkd_transid
            ,tkd_promptdata1    POCODE
            ,(SELECT MIN(org_code) FROM r5organization WHERE org_udfchar01 = tkd_promptdata2) POORG
            ,tkd_promptdata3    POREVISION
            ,tkd_promptdata4    POAFASCODE
            FROM r5trackingdata
            WHERE ROWID   = :ROWID
            AND tkd_trans = ''AUPO'')
  LOOP
    --update PO with AFAS number
    IF c.POCODE IS NOT NULL
     AND c.POORG IS NOT NULL
     AND c.POREVISION IS NOT NULL
     AND c.POAFASCODE IS NOT NULL THEN
      BEGIN
        --set databridge session
        o7sess.set_userfunction(''DATABRIDGEINTERNALUSER'',NULL);
        --update PO header with AFAS number
        UPDATE r5orders
        SET ord_udfchar04 = c.POAFASCODE
        WHERE ord_code    = c.POCODE
        AND ord_org       = c.POORG
        AND ord_revision  = c.POREVISION;
        --Approve PO that triggers Auto receiving
        UPDATE r5orderlines
        SET orl_status    = ''A''
           ,orl_rstatus   = ''A''
        WHERE orl_order   = c.POCODE
        AND orl_order_org = c.POORG;
        --separated from AFAS number update so that no new message to be send to EAM
        UPDATE r5orders
        SET ord_status    = ''A2''
           ,ord_rstatus   = ''A''
           ,ord_auth      = ''DATABRIDGEINTERNALUSER''
        WHERE ord_code    = c.POCODE
        AND ord_org       = c.POORG
        AND ord_revision  = c.POREVISION;
        --on successful processing delete R5TRACKINGDATA record
        DELETE FROM r5trackingdata WHERE tkd_transid = c.tkd_transid;
      EXCEPTION
      WHEN OTHERS THEN
        nerrno  := SQLCODE;
        serrmsg := SQLERRM;
        --update r5trackingdata status
        UPDATE r5trackingdata SET tkd_rstatus = ''P'',tkd_promptdata51 = SUBSTR(serrmsg,1,1000) WHERE tkd_transid = c.tkd_transid;
        --log error
        INSERT INTO r5interfaceerrors(ine_transid,ine_error,ine_create,ine_errsource,ine_errtype,ine_errnumber)
        VALUES (c.tkd_transid,SUBSTR(serrmsg,1,240),o7gttime(''''),''R5TRACKINGDATA,PI,110'',''FLEX'',nerrno);
      END;
    END IF; --c.POCODE IS NOT NULL
  END LOOP;
END;';
INSERT INTO r5flexsql
    (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
    ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
VALUES
    ('R5TRACKINGDATA','POST-INSERT',110,'+','-'
    ,'+','R5TRACKINGDATA, POST-INSERT, 110','Flex for AFAS Inbound process through R5TRACKINGDATA','-',0,'-',sysdate,sstmt);
END;
/

COMMIT;

PROMPT ...End of qbz_r5trackingdata.flx.sql
PROMPT
