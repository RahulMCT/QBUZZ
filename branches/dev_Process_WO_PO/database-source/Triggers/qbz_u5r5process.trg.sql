-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_u5r5process.trg.sql
--
-- Description : Triggers on U5R5PROCESS
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 17-10-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------

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