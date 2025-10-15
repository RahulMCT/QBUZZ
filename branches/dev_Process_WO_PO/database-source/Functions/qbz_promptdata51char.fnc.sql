-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_promptdata51char.fnc.sql
--
-- Description : Created new function to get promptdata51 value in char. 
--
-- Product     : EAM             Release : 12.0          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 12-04-2023  - MCT - SPC226  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_promptdata51char.fnc.sql
PROMPT

CREATE OR REPLACE FUNCTION QBZ_PROMPTDATA51CHAR(p_rowid IN VARCHAR2)
RETURN VARCHAR2
IS
Long_to_Varchar   VARCHAR2(32767);
BEGIN
  SELECT tkd_promptdata51 INTO long_to_varchar
  FROM r5trackingdata
  WHERE r5trackingdata.rowid = p_rowid;
  RETURN SUBSTR(long_to_varchar,1,32767);
EXCEPTION
  WHEN OTHERS THEN
  RETURN 'Error Occurred on Conversion';
END QBZ_PROMPTDATA51CHAR;
/
SHOW ERRORS FUNCTION QBZ_PROMPTDATA51CHAR
PROMPT

PROMPT ...End of qbz_promptdata51char.fnc.sql
PROMPT
