-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_dml_r5auth.sql
--
-- Description : DML entries related to Status Change Authorizations
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_dml_r5auth.sql
PROMPT
--R5
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','-','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','-','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','-','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','-','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','C','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','C','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','CANC','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'CANC'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','CANC','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'CANC'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','O','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','O','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','R','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','CASE','CASE','R','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','Q','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'Q');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RMS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RMS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','-','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','A','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','A','RPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'RPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','AG','IC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'IC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','C','BRNC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'BRNC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','C','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'C'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','CA','TF','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'CA'
                   AND aut_statnew = 'TF');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','CPO','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'CPO'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','DOS','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','DOS','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DOS'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','GBV','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'GBV'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','HVL','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'HVL'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','IC','TF','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'TF');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','P','T','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'P'
                   AND aut_statnew = 'T');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','Q','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'Q'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','Q','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'Q'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','P','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'P');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','R','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RAI','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RAI'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RGV','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RGV'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RMS','RWS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RMS'
                   AND aut_statnew = 'RWS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RPO','CPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RPO'
                   AND aut_statnew = 'CPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','CSM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'CSM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RSM','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RSM'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWI','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWI'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWP','RWV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWP'
                   AND aut_statnew = 'RWV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWS','RGV','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'RGV');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RAI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RAI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RWI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','RWV','RWP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWV'
                   AND aut_statnew = 'RWP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','T','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'T'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','T','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'T'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','EVNT','EVNT','TCS','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'IBL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','-','KA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'KA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','R','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORD','PORD','U','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','CL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'CL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'R5','*','PORL','PORL','U','J','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'R5'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'J');
--SUPPLIER

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','A','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','AG','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','DI','CAL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'DI'
                   AND aut_statnew = 'CAL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','IC','DI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'DI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','TCS','AG','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'AG');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','AL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'AL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'SUPPLIER','*','EVNT','EVNT','W','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'SUPPLIER'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBL');
--VLOOT-MAN

INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','-','O','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = '-'
                   AND aut_statnew = 'O');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','IBH','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'IBH'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','O','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','O','CANC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'CANC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','CASE','CASE','O','IBH','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'CASE'
                   AND aut_status  = 'O'
                   AND aut_statnew = 'IBH');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','-','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = '-'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','A','RPO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'RPO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','A','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','AG','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AG'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','AL','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'AL'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','CAL','CA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'CAL'
                   AND aut_statnew = 'CA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBL','TCS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBL'
                   AND aut_statnew = 'TCS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','OP','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'OP');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','PA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'PA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','TC','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'TC');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IBQ','WM','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IBQ'
                   AND aut_statnew = 'WM');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','IC','DI','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'IC'
                   AND aut_statnew = 'DI');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','OP','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'OP'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','PA','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'PA'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','R','W','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'W');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','RWS','DOS','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'RWS'
                   AND aut_statnew = 'DOS');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','TC','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TC'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','TCS','AG','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'TCS'
                   AND aut_statnew = 'AG');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','AL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'AL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','EVO','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'EVO');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','IBL','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBL');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','EVNT','EVNT','W','IBQ','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'EVNT'
                   AND aut_status  = 'W'
                   AND aut_statnew = 'IBQ');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','-','KA','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'KA');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','GA1','A2','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'GA1'
                   AND aut_statnew = 'A2');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','KA','GA1','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'KA'
                   AND aut_statnew = 'GA1');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','R','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'R'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORD','PORD','U','R','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORD'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'R');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','-','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = '-'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','A','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','A','U','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'A'
                   AND aut_statnew = 'U');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','A','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'A');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','C','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'C');
INSERT INTO r5auth(aut_group,aut_user,aut_entity,aut_rentity,aut_status,aut_statnew,aut_type,aut_created)
  SELECT 'VLOOT-MAN','*','PORL','PORL','U','J','+',sysdate
  FROM dual
  WHERE NOT EXISTS(SELECT 1 FROM r5auth
                   WHERE aut_group = 'VLOOT-MAN'
                   AND aut_user    = '*'
                   AND aut_entity  = 'PORL'
                   AND aut_status  = 'U'
                   AND aut_statnew = 'J');
COMMIT;

PROMPT ...END of qbz_dml_r5auth.sql
PROMPT