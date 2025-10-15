-- -------------------------------------------------------------------------------
--
-- Filename    : qbz_sumcstcost.fnc.sql
--
-- Description : Created new function to fetch Costcode cost.
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 20-06-2023 - MCT - SPC364 - Creation
-- 0002 13-06-2024 - MCT - SPC530 - change costcode from 4505 to 4585
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_sumcstcost.sql
PROMPT

CREATE OR REPLACE FUNCTION QBZ_SUMCSTCOST(csmcode IN VARCHAR)
RETURN NUMBER IS
/*
   001 SPC-422 - Add SD Schadeherstelkosten Cost to Total Cost
*/
cost    u5dmcost.cos_cost%type;
cost1   u5dmcost.cos_cost%type;
cost2   u5dmcost.cos_cost%type;
cost3   u5dmcost.cos_cost%type;
cost4   u5dmcost.cos_cost%type;
cost5   u5dmcost.cos_cost%type;
sumcost u5dmcost.cos_cost%type;

BEGIN

  SELECT NVL(SUM(cos_cost),0) INTO cost  FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4406';
  SELECT NVL(SUM(cos_cost),0) INTO cost1 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4407';
  SELECT NVL(SUM(cos_cost),0) INTO cost2 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4413';
  SELECT NVL(SUM(cos_cost),0) INTO cost3 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4580';
  SELECT NVL(SUM(cos_cost),0) INTO cost4 FROM u5dmcost WHERE cos_case = csmcode AND cos_costcode= '4585';
  SELECT NVL(SUM(COS_COST),0) INTO cost5 FROM U5DMCOST WHERE COS_CASE = csmcode AND COS_COSTCODE= '4405' AND COS_WO = '-';

  sumcost := cost+cost1+cost2+cost3+cost4+cost5;

  RETURN sumcost;
--return null if exception occurs
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END QBZ_SUMCSTCOST;
/

SHOW ERRORS FUNCTION QBZ_SUMCSTCOST
PROMPT

PROMPT ...End of qbz_sumcstcost.sql
PROMPT
