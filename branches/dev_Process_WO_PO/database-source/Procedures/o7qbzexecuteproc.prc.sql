-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : o7qbzexecuteproc.prc.sql
--
-- Description : Procedure
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 17-10-2022 - MCT - SPC254 - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of o7qbzexecuteproc.prc.sql
PROMPT

PROMPT  ...Creating Procedure O7QBZEXECUTEPROC

CREATE OR REPLACE PROCEDURE O7QBZEXECUTEPROC (p_sexecstmt       IN VARCHAR2
                                             ,p_soutparam1      OUT VARCHAR2
                                             ,p_soutparam2      OUT VARCHAR2
                                             ,p_soutparam3      OUT VARCHAR2)
IS
sSQLERRM     VARCHAR2(4000);
BEGIN
  --execute passed statement
  EXECUTE IMMEDIATE (p_sexecstmt);
  EXCEPTION WHEN OTHERS THEN

  sSQLERRM     := SUBSTR(SQLERRM, 1 ,4000);
  p_soutparam1 := SQLCODE;
  p_soutparam2 := SUBSTR(sSQLERRM, 1 ,80);
  p_soutparam3 := SUBSTR(sSQLERRM, 81,80);

END O7QBZEXECUTEPROC;
/
SHOW ERRORS PROCEDURE O7QBZEXECUTEPROC
PROMPT

PROMPT ...End of o7qbzexecuteproc.prc.sql
PROMPT
