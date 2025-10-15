-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_damageincident.prc.sql
--
-- Description : Procedure to create Case Management records
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 13-Mar-2023 - MCT - SPC226 - Creation
-- 0002 22-Aug-2023 - MCT - SPC416 - use csm_udfchar28 for problem code and csm_udfchar29 for csm_code
-- 0003 13-Dec-2023 - MCT - SPC416 - fill default values if problem code starts with 2AD
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_damageincident.prc.sql
PROMPT

PROMPT ...Creating Procedure QBZ_DAMAGEINCIDENT
CREATE OR REPLACE PROCEDURE QBZ_DAMAGEINCIDENT (p_sudfchar02    IN VARCHAR2        --incidentId
                                               ,p_scasetype     IN VARCHAR2        --incidentType
                                               ,p_sorg          IN VARCHAR2
                                               ,p_sobject       IN VARCHAR2        --vehicleAffected
                                               ,p_sudfchar28    IN VARCHAR2        --damageDefect
                                               ,p_srequested    IN VARCHAR2        --currentdate
                                               ,p_sarea         IN VARCHAR2        --locationStreet
                                               ,p_sudfchar05    IN VARCHAR2        --locationCity
                                               ,p_sudfchar30    IN VARCHAR2        --locationLine
                                               ,p_sudfchar06    IN VARCHAR2        --employeeId
                                               ,p_schklst10     IN VARCHAR2        --injuredDriver
                                               ,p_schklst20     IN VARCHAR2        --injuredPassengers
                                               ,p_schklst30     IN VARCHAR2        --injuredCounterParty
                                               ,p_schklst40     IN VARCHAR2        --alarmedAmbulance
                                               ,p_schklst50     IN VARCHAR2        --alarmedPolice
                                               ,p_schklst60     IN VARCHAR2        --alarmedFireBrigade
                                               ,p_schklst70     IN VARCHAR2        --hydrogenBus
                                               ,p_schklst80     IN VARCHAR2        --voaResearch
                                               ,p_schklst90     IN VARCHAR2        --informedVvo
                                               ,p_schklst100    IN VARCHAR2        --informedTeamleader
                                               ,p_schklst110    IN VARCHAR2        --engagedSalvage
                                               ,p_schklst120    IN VARCHAR2        --drawnUpSafSat
                                               ,p_schklst140    IN VARCHAR2        --listedWitnesses
                                               ,p_schklst150    IN VARCHAR2        --registrationNrCounterParty
                                               ,p_schklst160    IN VARCHAR2        --counterPartyDidNotStop
                                               ,p_schklst170    IN VARCHAR2        --securedCctvFootage
                                               ,p_schklst180    IN VARCHAR2        --damagedRoadFurniture
                                               ,p_schklst190    IN VARCHAR2        --photosOfDamage
                                               ,p_sincidentText IN VARCHAR2
                                               ,p_nerrno        OUT NUMBER
                                               ,p_serrmsg       OUT VARCHAR2)
AS
  --create records in separate transaction because we need to store the error if occurred
  PRAGMA AUTONOMOUS_TRANSACTION;
  scsm_code                r5casemanagement.csm_code%type;
  scsm_desc                r5casemanagement.csm_desc%type;
  scsm_workorder           r5casemanagement.csm_workorder%type;
  scsm_object_org          r5casemanagement.csm_object_org%type;
  scsm_area                r5casemanagement.csm_area%type;
  scsm_problemdescription  r5casemanagement.csm_problemdescription%type;
  scsm_udfchar03           r5casemanagement.csm_udfchar03%type;
  scsm_udfchar04           r5casemanagement.csm_udfchar04%type;
  scsm_udfchar05           r5casemanagement.csm_udfchar05%type;
  scsm_udfchar06           r5casemanagement.csm_udfchar06%type;
  scsm_udfchar11           r5casemanagement.csm_udfchar11%type;
  scsm_udfchar20           r5casemanagement.csm_udfchar20%type;
  scsm_udfchar21           r5casemanagement.csm_udfchar21%type;
  scsm_udfchar22           r5casemanagement.csm_udfchar22%type;
  scsm_udfchar28           r5casemanagement.csm_udfchar28%type;
  scsm_udfchar29           r5casemanagement.csm_udfchar29%type;
  scsm_udfchar30           r5casemanagement.csm_udfchar30%type;
  checkresult              VARCHAR2(4);
  schk                     VARCHAR2(3);
  nerrno                   NUMBER := 0;
  serrmsg                  VARCHAR2(1000);
  sSQL                     VARCHAR2(2000);
  checklistcol             VARCHAR2(10);
  --get Case Record
  CURSOR c_getCase(c_sudfchar02 IN VARCHAR2) IS
    SELECT csm_code,csm_area,csm_udfchar05,csm_udfchar06,csm_udfchar28,csm_udfchar30,csm_problemdescription
    FROM r5casemanagement
    WHERE csm_udfchar02 = c_sudfchar02;
  --get WO
  CURSOR c_getWO(c_sudfchar06 IN VARCHAR2) IS
    SELECT evt_code,evt_object_org,r5o7.o7get_desc('EN','UCOD',evt_status,'EVST',NULL) evt_status
    FROM r5events
    WHERE evt_udfchar06 = c_sudfchar06;

BEGIN
  --set databridge session
  o7sess.set_userfunction('DATABRIDGEINTERNALUSER', '');
  p_nerrno  := 0;
  p_serrmsg := NULL;
  --check Case record existence
  OPEN  c_getCase(p_sudfchar02);
  FETCH c_getCase INTO scsm_code,scsm_area,scsm_udfchar05,scsm_udfchar06,scsm_udfchar28,scsm_udfchar30,scsm_problemdescription;
  CLOSE c_getCase;
  IF scsm_code IS NULL THEN
    --get Case max sequence value
    r5o7.o7maxseq(scsm_code,'CSM','1',checkresult );
    --get description from problem code
    scsm_desc := r5o7.o7get_desc('EN','RECO',p_sudfchar28,NULL,NULL);
    --get object org and WO
    IF p_sobject IS NOT NULL THEN
      OPEN  c_getWO(p_sudfchar02);
      FETCH c_getWO INTO scsm_workorder,scsm_object_org,scsm_udfchar03;
      CLOSE c_getWO;
      IF scsm_object_org IS NULL THEN
        SELECT MIN(obj_org) INTO scsm_object_org FROM r5objects WHERE obj_code = p_sobject AND obj_status = 'I';
      END IF; --scsm_object_org IS NULL
    END IF; --p_sobject IS NOT NULL
    scsm_udfchar29 := scsm_code||(CASE WHEN scsm_workorder IS NOT NULL THEN '#'||scsm_workorder ELSE NULL END);
    --set default values if problem code starts with 2AD
    IF p_sudfchar28 LIKE '2AD%' THEN
      scsm_udfchar04 := '25 - Bij aanvang dienst';
      scsm_udfchar11 := 'NVT';
      scsm_udfchar20 := 'Intern/niet verzekerd';
      scsm_udfchar21 := 'Qbuzz';
      scsm_udfchar22 := 'Nee';
    END IF; --p_sudfchar28 LIKE '2AD%'
    --create Case record
    INSERT INTO r5casemanagement
      (csm_code,csm_org,csm_desc,csm_object,csm_object_org
      ,csm_casetype,csm_mrc,csm_status,csm_rstatus,csm_createdby
      ,csm_created,csm_workorder,csm_requested,csm_udfchar02,csm_udfchar03
      ,csm_udfchar04,csm_udfchar05,csm_udfchar06,csm_udfchar11,csm_udfchar20
      ,csm_udfchar21,csm_udfchar22,csm_udfchar28,csm_udfchar29,csm_udfchar30
      ,csm_area,csm_problemdescription,csm_updatecount)
    VALUES
      (scsm_code,p_sorg,NVL(scsm_desc,'NA'),p_sobject,scsm_object_org
      ,p_scasetype,'VLOOT','O','O',o7sess.cur_user
      ,p_srequested,scsm_workorder,p_srequested,p_sudfchar02,scsm_udfchar03
      ,scsm_udfchar04,p_sudfchar05,p_sudfchar06,scsm_udfchar11,scsm_udfchar20
      ,scsm_udfchar21,scsm_udfchar22,p_sudfchar28,scsm_udfchar29,p_sudfchar30
      ,p_sarea,p_sincidentText,0);
    --send message back to Qrane
    IF p_sobject IS NULL
     OR (scsm_workorder IS NOT NULL AND p_sobject IS NOT NULL) THEN
      INSERT INTO r5xmltranstatus(xts_trantype,xts_table,xts_keyfld1,xts_keyfld2,xts_org,xts_orig_messageid )
      SELECT 'CSMGMT','R5CASEMANAGEMENT',scsm_code,NULL,p_sorg,NULL
      FROM dual
      WHERE NOT EXISTS(SELECT 1 FROM r5xmltranstatus
                       WHERE xts_trantype = 'CSMGMT'
                       AND   xts_keyfld1  = scsm_code);
    END IF; --p_sobject IS NULL THEN
  ELSE
    --update case record
    UPDATE r5casemanagement
    SET csm_area            = p_sarea
    ,csm_udfchar05          = p_sudfchar05
    ,csm_udfchar06          = p_sudfchar06
    ,csm_udfchar28          = p_sudfchar28
    ,csm_udfchar30          = p_sudfchar30
    ,csm_problemdescription = p_sincidentText
    WHERE csm_code          = scsm_code;
  END IF; --scsm_code IS NULL
  --update checklist from 10-190, exclude 130
  FOR c IN (SELECT LEVEL act_sequence FROM dual CONNECT BY LEVEL <= 19) LOOP
    IF c.act_sequence <> 13 THEN
      checklistcol := CASE WHEN c.act_sequence*10 = 10  THEN p_schklst10
                           WHEN c.act_sequence*10 = 20  THEN p_schklst20
                           WHEN c.act_sequence*10 = 30  THEN p_schklst30
                           WHEN c.act_sequence*10 = 40  THEN p_schklst40
                           WHEN c.act_sequence*10 = 50  THEN p_schklst50
                           WHEN c.act_sequence*10 = 60  THEN p_schklst60
                           WHEN c.act_sequence*10 = 70  THEN p_schklst70
                           WHEN c.act_sequence*10 = 80  THEN p_schklst80
                           WHEN c.act_sequence*10 = 90  THEN p_schklst90
                           WHEN c.act_sequence*10 = 100 THEN p_schklst100
                           WHEN c.act_sequence*10 = 110 THEN p_schklst110
                           WHEN c.act_sequence*10 = 120 THEN p_schklst120
                           WHEN c.act_sequence*10 = 140 THEN p_schklst140
                           WHEN c.act_sequence*10 = 150 THEN p_schklst150
                           WHEN c.act_sequence*10 = 160 THEN p_schklst160
                           WHEN c.act_sequence*10 = 170 THEN p_schklst170
                           WHEN c.act_sequence*10 = 180 THEN p_schklst180
                           WHEN c.act_sequence*10 = 190 THEN p_schklst190
                      END;
      sSQL :=
'UPDATE r5actchecklists
SET ack_yes      = CASE WHEN UPPER(NVL('''||checklistcol||''',''!@#$%'')) = ''TRUE'' THEN ''+'' ELSE ''-'' END
,   ack_no       = CASE WHEN UPPER(NVL('''||checklistcol||''',''!@#$%'')) = ''FALSE'' THEN ''+'' ELSE ''-'' END
WHERE ack_event  = '''||scsm_code||'''
AND ack_sequence = '||TO_CHAR(c.act_sequence*10)||'
AND (ack_yes    <> CASE WHEN UPPER(NVL('''||checklistcol||''',''!@#$%'')) = ''TRUE'' THEN ''+'' ELSE ''-'' END
     OR ack_no  <> CASE WHEN UPPER(NVL('''||checklistcol||''',''!@#$%'')) = ''FALSE'' THEN ''+'' ELSE ''-'' END)';
      EXECUTE IMMEDIATE sSQL;
    END IF; --c.act_sequence <> 13
  END LOOP;
  --commit to complete autonomous transaction
  COMMIT;
EXCEPTION
WHEN OTHERS THEN
  nerrno  := SQLCODE;
  serrmsg := SUBSTR(SQLERRM,1,1000);
  p_serrmsg := serrmsg;
  p_nerrno  := nerrno;
  --rollback transaction
  ROLLBACK;
END QBZ_DAMAGEINCIDENT;
/
SHOW ERRORS PROCEDURE QBZ_DAMAGEINCIDENT
PROMPT

PROMPT ...End of qbz_damageincident.prc.sql
PROMPT
