-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_sumcost.fnc.sql
--
-- Description : Created new function to fetch Sum of Cost.
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 20-12-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT Begin of qbz_sumcost.fnc.sql
PROMPT


PROMPT  ..Creating Function qbz_sumcost

CREATE OR REPLACE FUNCTION qbz_sumcost(p_case IN VARCHAR2
                                      ,p_line IN VARCHAR2)
RETURN VARCHAR2
IS
--local variables
  cSUM  u5dmcost.cos_totalcost%type;
  
  CURSOR csm_cur IS
  SELECT NVL(SUM(cos_cost),0)
  FROM u5dmcost
  WHERE cos_case = p_case
  AND cos_line <= p_line
  ORDER by cos_line;
BEGIN
  OPEN  csm_cur;
  FETCH csm_cur INTO cSUM;
  CLOSE csm_cur;

  RETURN cSUM;
END qbz_sumcost;
/
SHOW ERRORS FUNCTION qbz_sumcost
PROMPT

PROMPT ...Created Function qbz_sumcost

PROMPT End of qbz_sumcost.fnc.sql
PROMPT
