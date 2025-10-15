-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_wocost.fnc.sql
--
-- Description : Created new function to fetch Sum of Cost.
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 07-06-2024  - MCT - SPC521  - Function to get WO and child WO cost, to be shown on NUCOSO overview screen
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_wocost.fnc.sql
PROMPT

CREATE OR REPLACE FUNCTION QBZ_WOCOST(p_evtcode IN VARCHAR2
                                     ,p_type    IN VARCHAR2 DEFAULT 'ALL')
RETURN NUMBER
IS
--local variables
nWOcost       NUMBER;
nmatcost      NUMBER;
nownlbrcost   NUMBER;
nhirelbrcost  NUMBER;

CURSOR getWO_matcost IS
  SELECT SUM(NVL((CASE WHEN evt_status <> 'CC' THEN O7COST.MATERIAL2(evt_code) ELSE 0 END),0)) matcost
  FROM r5events
  START WITH evt_code = p_evtcode
  CONNECT BY PRIOR evt_code = evt_parent;

CURSOR getWO_ownlbrcost IS
  SELECT SUM(NVL((CASE WHEN evt_status <> 'CC' THEN NVL((SELECT evo_ownlabor FROM r5eventcost WHERE evo_event = evt_code),0) ELSE 0 END),0)) ownlbrcost
  FROM r5events
  START WITH evt_code = p_evtcode
  CONNECT BY PRIOR evt_code = evt_parent;

CURSOR getWO_hirelbrcost IS
  SELECT SUM(NVL((CASE WHEN evt_status <> 'CC' THEN NVL((SELECT evo_hiredlabor+evo_serviceslabor FROM r5eventcost WHERE evo_event = evt_code),0) ELSE 0 END),0)) hirelbrcost
  FROM r5events
  START WITH evt_code = p_evtcode
  CONNECT BY PRIOR evt_code = evt_parent;

BEGIN
  --get WO and child WO cost
  IF p_type = 'MAT' THEN
    --get Material Cost
    OPEN  getWO_matcost;
    FETCH getWO_matcost INTO nWOcost;
    CLOSE getWO_matcost;
  ELSIF p_type = 'OWNLBR' THEN
    --get Own Labour Cost
    OPEN  getWO_ownlbrcost;
    FETCH getWO_ownlbrcost INTO nWOcost;
    CLOSE getWO_ownlbrcost;
  ELSIF p_type = 'HIRELBR' THEN
    --get Hire or Service Labour cost
    OPEN  getWO_hirelbrcost;
    FETCH getWO_hirelbrcost INTO nWOcost;
    CLOSE getWO_hirelbrcost;
  ELSE
    --get Material Cost
    OPEN  getWO_matcost;
    FETCH getWO_matcost INTO nmatcost;
    CLOSE getWO_matcost;
    --get Own Labour Cost
    OPEN  getWO_ownlbrcost;
    FETCH getWO_ownlbrcost INTO nownlbrcost;
    CLOSE getWO_ownlbrcost;
    --get Hire or Service Labour cost
    OPEN  getWO_hirelbrcost;
    FETCH getWO_hirelbrcost INTO nhirelbrcost;
    CLOSE getWO_hirelbrcost;
    --sum all costs
    nWOcost := nmatcost + nownlbrcost + nhirelbrcost;
  END IF;
  --return fetched cost
  RETURN nWOcost;
END QBZ_WOCOST;
/
SHOW ERRORS FUNCTION QBZ_WOCOST
PROMPT

PROMPT ...End of qbz_wocost.fnc.sql
PROMPT

