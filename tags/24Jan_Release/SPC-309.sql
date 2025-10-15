-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : SPC-309.sql
--
-- Description : Changes/Issues
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 23-01-2023  - MCT - SPC309  - Creation
-- -------------------------------------------------------------------------------

SPOOL SPC-309.log

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

PROMPT ...Start of SPC-309.sql

PROMPT ...Creating trigger COMP_UPD_CSM_QBZ
PROMPT
CREATE OR REPLACE TRIGGER COMP_UPD_CSM_QBZ
FOR UPDATE ON R5CASEMANAGEMENT
COMPOUND TRIGGER
  --local variables
  TYPE            newcsmcodetype     IS TABLE OF r5casemanagement.csm_code%TYPE INDEX BY BINARY_INTEGER;

  newcsmcode      newcsmcodetype;

  cnt             NUMBER := 0;

AFTER EACH ROW IS
BEGIN
  IF (:NEW.csm_object IS NOT NULL AND :NEW.csm_object <> :OLD.csm_object)
      OR (:NEW.csm_object IS NOT NULL AND :OLD.csm_object IS NULL) 
       OR (:NEW.csm_object IS NULL AND :OLD.csm_object IS NOT NULL) THEN
     --save record for statement level processing
     cnt              := cnt + 1;
     newcsmcode(cnt)  := :new.csm_code;
  END IF;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
  --loop through PLSQL table count
  FOR i IN 1..cnt
  LOOP
    UPDATE r5casemanagement
    SET csm_udfchar01 = (SELECT obj_alias
                        FROM r5objects
                        WHERE obj_code = csm_object
                        AND   obj_org  = csm_object_org)
    WHERE csm_code    =  newcsmcode(i);
  END LOOP;--i loop
END AFTER STATEMENT;

END COMP_UPD_CSM_QBZ;
/
SHOW ERRORS TRIGGER COMP_UPD_CSM_QBZ
PROMPT

PROMPT ...Creating Flex Trigger for R5CASEMANAGEMENT
PROMPT

DECLARE
 sstmt VARCHAR2(8000);
 BEGIN
 DELETE FROM r5flexsql WHERE flx_table = 'R5CASEMANAGEMENT' AND flx_trigger = 'POST-INSERT' AND flx_seq = 4;
 sstmt :=
 'BEGIN
   FOR c IN (SELECT csm_code
             FROM r5casemanagement
             WHERE ROWID = :ROWID
             AND csm_object IS NOT NULL)
   LOOP
     UPDATE r5casemanagement
     SET csm_udfchar01 = (SELECT obj_alias
                         FROM r5objects
                         WHERE obj_code = csm_object
                         AND obj_org = csm_object_org)
     WHERE csm_code    =  c.csm_code;
   END LOOP;
 END;';
 INSERT INTO r5flexsql
     (flx_table,flx_trigger,flx_seq,flx_abortonfailure,flx_reversereturn
     ,flx_active,flx_msgfailure,flx_comment,flx_mustexist,flx_updatecount,flx_mobile,flx_lastsaved,flx_stmt)
 VALUES
     ('R5CASEMANAGEMENT','POST-INSERT',4,'+','-'
     ,'+','R5CASEMANAGEMENT, Post Insert, 4','Update Equipment alias','-',0,'-',sysdate,sstmt);
 END;
 /


SET VERIFY ON
SET SERVEROUTPUT OFF

EXEC QBZ_O7CUSTOM( 'SPC-309.sql', '23-01-2023', 'QBZ-EAM 11.7', 'Changes- Damage delivery');

COMMIT;

PROMPT ...END of SPC-309.log

SPOOL OFF