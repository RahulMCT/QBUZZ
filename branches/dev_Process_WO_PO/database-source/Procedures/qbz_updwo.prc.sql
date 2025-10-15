-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_updwo.prc.sql
--
-- Description : Procedure
--
-- Product     : EAM             Release : 12.1          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 24-May-2024 - MCT - SPC532 - Uploaded procedure created by Spectades - Franc
-- 0002 17-Mar-2025 - MCT - SPC643 - Round total cost up to 2 decimal places on WO record view.
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_updwo.prc.sql
PROMPT

PROMPT  ...Creating Procedure QBZ_AUTOPO
CREATE OR REPLACE PROCEDURE QBZ_UPDWO(pEvent   IN VARCHAR2
                                     ,pTotCost IN VARCHAR2
                                     ,pStatus  IN VARCHAR2
                                     ,pRStatus IN VARCHAR2)
AS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  IF pTotCost IS NOT NULL THEN
    UPDATE r5events
    SET evt_udfnum09 = ROUND(pTotCost,2)
    WHERE evt_code   = pEvent
    AND NVL(evt_udfnum09,-999999) <> pTotCost;
  END IF;

  IF pStatus IS NOT NULL THEN
    UPDATE r5events
    SET evt_status = pStatus
    ,evt_rstatus   = pRStatus
    WHERE evt_code = pEvent
    AND evt_status <> pStatus;
 END IF;

 COMMIT;
END;
/
SHOW ERRORS PROCEDURE QBZ_UPDWO
PROMPT

PROMPT ...End of qbz_updwo.prc.sql
PROMPT

