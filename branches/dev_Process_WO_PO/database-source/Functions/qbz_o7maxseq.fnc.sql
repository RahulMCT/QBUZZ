-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_o7maxseq.fnc.sql
--
-- Description : Created new function to fetch maximum sequence. 
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT Begin of qbz_o7maxseq.fnc.sql
PROMPT


PROMPT  ..Creating Function qbz_o7maxseq

CREATE OR REPLACE FUNCTION qbz_o7maxseq(p_entity   IN VARCHAR2)
RETURN VARCHAR2 IS

v_chk            VARCHAR2(4) := '0';
ccalc          VARCHAR2(30);
seqname          VARCHAR2( 30 );
tenant           VARCHAR2( 50 );
cursor1          INTEGER;
ignore           INTEGER;
code             NUMBER;
statement        VARCHAR2( 8000 );
prefix           VARCHAR2( 30 );
CURSOR ins( curtype VARCHAR2 ) IS
  SELECT UPPER( ins_desc )
  FROM   r5install, r5seqinstallmapping
  WHERE  ins_code     = sim_installparameter
  AND    sim_sequence = curtype;

BEGIN
/* Check mandatory parameters */
   IF p_entity IS NULL THEN
     o7err.raise_error( 'O7MAXSEQ', 'PROC', 1 );
   END IF;
   IF    p_entity  = 'KUPRCS'     THEN SEQNAME := 'PROCESS';
   ELSE
       r5o7.o7maxseq(ccalc, p_entity,'1', v_chk);
   END IF;
   
   /* Retrieve tenant code */
   tenant := o7getten;
   IF tenant IS NOT NULL THEN
      tenant := '_'||tenant;
   END IF;
   /* Retrieve new code */
    statement := 'SELECT "S5'||seqname||tenant||'".NEXTVAL FROM DUAL';
   EXECUTE IMMEDIATE statement INTO ccalc;
   
   /* Prefix? */
   OPEN  ins( p_entity );
   FETCH ins INTO prefix;
   CLOSE ins;
   IF prefix IS NOT NULL AND ccalc IS NOT NULL THEN
     ccalc := prefix||ccalc;              -- CM 8383
   END IF;
   RETURN ccalc;
--return null if exception occurs
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END qbz_o7maxseq;
/

SHOW ERRORS FUNCTION qbz_o7maxseq
PROMPT

PROMPT ...Created Function qbz_o7maxseq

PROMPT End of qbz_o7maxseq.fnc.sql
PROMPT
