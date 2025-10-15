-- -------------------------------------------------------------------------------
--
-- Copyright © 2023 by Mct India PVT. LTD.
--
-- Filename    : SPC-579.sql
--
-- Description :  Populate evt_udfnote2 with WO,Activity,Object,Problemcode
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 14-09-2023  - MCT - SPC579  - Creation.
-- -------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE QBZ_SPC579
AS
--cursor to get WO records
CURSOR c_WO IS
  SELECT evt_code,MAX(act_act) act_act
  FROM r5events
  JOIN r5activities ON (evt_code = act_event)
  WHERE evt_jobtype IN ('STO','SCH','VOHP')
  AND evt_rstatus <> 'C'
  AND act_hire    = '+'
  GROUP BY evt_code;
--local variables
TYPE    T_R5EVENTS IS TABLE OF c_WO%ROWTYPE;
tt      T_R5EVENTS;
c_limit CONSTANT PLS_INTEGER DEFAULT 1000;
BEGIN
  --temporary disable flex as it slows down the update, will be enabled later
  UPDATE r5flexsql SET flx_comment = flx_comment||'TEMP_DISABLE',flx_active = '-' WHERE flx_active = '+';
  --open curser to get WO records
  OPEN c_WO;
  LOOP
    FETCH c_WO BULK COLLECT INTO tt LIMIT c_limit;
    EXIT WHEN tt.COUNT = 0;
    FORALL c IN 1..tt.COUNT SAVE EXCEPTIONS
      UPDATE r5events
      SET evt_udfnote02 = evt_code||','||tt(c).act_act||','||evt_object||CASE WHEN evt_reqm IS NOT NULL THEN ','||evt_reqm ELSE NULL END
      WHERE evt_code    = tt(c).evt_code;
  END LOOP;
  CLOSE c_WO;
  --enable earlier disabled flex
  UPDATE r5flexsql SET flx_comment = REPLACE(flx_comment,'TEMP_DISABLE',''),flx_active = '+' WHERE INSTR(flx_comment,'TEMP_DISABLE') > 0;
END QBZ_SPC579;
/
SHOW ERRORS PROCEDURE QBZ_SPC579
PROMPT



