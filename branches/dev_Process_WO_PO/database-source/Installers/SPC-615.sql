CREATE OR REPLACE PROCEDURE QBZ_SPC615
AS
BEGIN
  -- Loop through all WOs where cost code is not populated
  FOR c IN (SELECT e.evt_code, o.obj_udfchar45
            FROM r5events e
            JOIN r5objects o ON (o.obj_code = e.evt_object AND o.obj_org = e.evt_object_org)
            WHERE e.evt_type IN ('JOB','PPM')
            AND e.evt_rstatus <> 'C'
            AND e.evt_enteredby = 'DATABRIDGEINTERNALUSER'
            AND e.evt_udfchar24 IS NULL
            AND NVL(e.evt_udfchar32, '!@#$%') <> o.obj_udfchar45
            AND ROWNUM < 500)
  LOOP
    -- Update the evt_costcode in r5events using costcode from r5objects
    UPDATE r5events
    SET evt_udfchar32 = c.obj_udfchar45
    WHERE evt_code    = c.evt_code;
  END LOOP; --c
  -- Loop through all WOs where cost code is not populated and PO is generated but not send to AFAS
  FOR c IN (SELECT e.evt_code, o.obj_udfchar45
            FROM r5events e
            JOIN r5objects o ON (o.obj_code = e.evt_object AND o.obj_org = e.evt_object_org)
            WHERE e.evt_type IN ('JOB','PPM')
            AND e.evt_rstatus <> 'C'
            AND EXISTS(SELECT 1 FROM r5orders WHERE ord_code = e.evt_udfchar24 AND ord_org = evt_org AND ord_status = 'KA')
            AND NVL(e.evt_udfchar32,'!@#$%') <> o.obj_udfchar45
            AND ROWNUM < 500)
  LOOP
    -- Update the evt_costcode in r5events using costcode from r5objects
    UPDATE r5events
    SET evt_udfchar32 = c.obj_udfchar45
    WHERE evt_code    = c.evt_code;
  END LOOP; -- Loop through all WOs
END QBZ_SPC615;