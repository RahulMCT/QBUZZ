-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_s5process.seq.sql
--
-- Description : sequence for table u5r5process.
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT Begin of qbz_s5process.seq.sql
PROMPT

TRUNCATE TABLE U5R5PROCESS;

PROMPT  ...Creating sequence S5PROCESS
DECLARE
sexist INT;
BEGIN
  --check existence
  SELECT COUNT(1) INTO sexist FROM dual WHERE EXISTS(SELECT 1 FROM user_sequences WHERE sequence_name = 'S5PROCESS');
  --create sequence if not exists
  IF sexist = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE S5PROCESS START WITH 10000 INCREMENT BY 1 NOCACHE NOCYCLE';
  END IF;
END;
/

PROMPT  ...Created sequence S5PROCESS


--create default record to invoke the screen from EF
INSERT INTO u5r5process(prs_id,prs_screen,prs_status,prs_object,createdby,created,lastsaved,updatecount)
SELECT 'KUPRCS','KUPRCS','NEW','DUMMY','R5',SYSDATE,SYSDATE,0
FROM dual WHERE NOT EXISTS(SELECT 1 FROM u5r5process WHERE prs_id = 'KUPRCS');

COMMIT;

PROMPT End of qbz_s5process.seq.sql
PROMPT
