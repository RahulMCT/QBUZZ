-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_o7custom.prc.sql
--
-- Description : Procedure
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 16-09-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------

PROMPT Begin of qbz_o7custom.prc.sql
PROMPT

PROMPT  ...Creating Procedure qbz_o7custom

CREATE OR REPLACE PROCEDURE qbz_o7custom
                          ( pv_objects IN VARCHAR2,
                            pv_date    IN VARCHAR2,
                            pv_title   IN VARCHAR2,
                            pv_desc    IN VARCHAR2) IS
lv_count  NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO lv_count
  FROM   r5custom
  WHERE  cus_objects   = UPPER(SUBSTR(pv_objects,1,30))
  AND    cus_title     = pv_title
  AND    cus_date      = TO_DATE(pv_date,'dd-mm-yyyy');

  IF lv_count = 0 THEN
    INSERT INTO r5custom( cus_date, cus_applied, cus_title, cus_objects, cus_desc)
    VALUES              ( TO_DATE(pv_date,'dd-mm-yyyy'), SYSDATE, pv_title, UPPER(SUBSTR(pv_objects,1,30)), SUBSTR(pv_desc,1,100));
  END IF;

END qbz_o7custom;
/
SHOW ERRORS PROCEDURE qbz_o7custom
PROMPT

PROMPT ...Created Procedure qbz_o7custom

PROMPT End of qbz_o7custom.prc.sql
PROMPT
