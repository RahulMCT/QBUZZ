-- -------------------------------------------------------------------------------
--
-- Copyright © 2020 by Spectades BV
--
-- Filename    : qbz_uds_oustat_bot.sql
--
-- Description : Update boilertexts for OUSTAT
--
-- Product     : EAM             Release : 11.7          Build :
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 15-09-2022  - MCT - SPC254  - Creation
-- -------------------------------------------------------------------------------

PROMPT ...Begin of qbz_uds_oustat_bot.sql
PROMPT

SET DEFINE OFF;
--uds WCST boilertext
PROMPT ...Start of Boierlexts: OUSTAT

UPDATE r5boilertexts SET bot_text = 'List View' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'LST' AND bot_lang = 'EN' and  bot_text <> 'List View';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_DESCRIPTION' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_CODE' AND bot_lang = 'EN' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'User Group' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_UG' AND bot_lang = 'EN' and  bot_text <> 'User Group';
UPDATE r5boilertexts SET bot_text = 'Entity' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_ENTITY' AND bot_lang = 'EN' and  bot_text <> 'Entity';
UPDATE r5boilertexts SET bot_text = 'From Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUS' AND bot_lang = 'EN' and  bot_text <> 'From Status';
UPDATE r5boilertexts SET bot_text = 'To Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUS' AND bot_lang = 'EN' and  bot_text <> 'To Status';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUSDESC' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUSDESC' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'User' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_USER' AND bot_lang = 'EN' and  bot_text <> 'User';
UPDATE r5boilertexts SET bot_text = 'Record View' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'HDR' AND bot_lang = 'EN' and  bot_text <> 'Record View';
UPDATE r5boilertexts SET bot_text = 'Details' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_1' AND bot_lang = 'EN' and  bot_text <> 'Details';
UPDATE r5boilertexts SET bot_text = 'ProcessUserDefinedScreenService' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_2' AND bot_lang = 'EN' and  bot_text <> 'ProcessUserDefinedScreenService';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_3' AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_CF' AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_4' AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_5' AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_6' AND bot_lang = 'EN' and  bot_text <> '<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = 'Status Auth ' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_7' AND bot_lang = 'EN' and  bot_text <> 'Status Auth ';
UPDATE r5boilertexts SET bot_text = 'Submit' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_lang = 'EN' and  bot_text <> 'Submit';
UPDATE r5boilertexts SET bot_text = 'Clear' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_lang = 'EN' and  bot_text <> 'Clear';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_DESCRIPTION' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_CODE' AND bot_lang = 'EN' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'User Group' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_UG' AND bot_lang = 'EN' and  bot_text <> 'User Group';
UPDATE r5boilertexts SET bot_text = 'Entity' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_ENTITY' AND bot_lang = 'EN' and  bot_text <> 'Entity';
UPDATE r5boilertexts SET bot_text = 'From Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUS' AND bot_lang = 'EN' and  bot_text <> 'From Status';
UPDATE r5boilertexts SET bot_text = 'To Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUS' AND bot_lang = 'EN' and  bot_text <> 'To Status';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUSDESC' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'Description' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUSDESC' AND bot_lang = 'EN' and  bot_text <> 'Description';
UPDATE r5boilertexts SET bot_text = 'User' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_USER' AND bot_lang = 'EN' and  bot_text <> 'User';
UPDATE r5boilertexts SET bot_text = 'Comments' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'CMT' AND bot_lang = 'EN' and  bot_text <> 'Comments';
UPDATE r5boilertexts SET bot_text = 'Documents' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC' AND bot_lang = 'EN' and  bot_text <> 'Documents';
UPDATE r5boilertexts SET bot_text = 'Add Document' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_ADDNEW' AND bot_lang = 'EN' and  bot_text <> 'Add Document';
UPDATE r5boilertexts SET bot_text = 'Create/Upload Document' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_CREATEORUPLOADDOCUMENT' AND bot_lang = 'EN' and  bot_text <> 'Create/Upload Document';
UPDATE r5boilertexts SET bot_text = 'Upload Document' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_UPLOADDOCUMENT' AND bot_lang = 'EN' and  bot_text <> 'Upload Document';
UPDATE r5boilertexts SET bot_text = 'Create Document' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_CREATEDOCUMENT' AND bot_lang = 'EN' and  bot_text <> 'Create Document';
UPDATE r5boilertexts SET bot_text = 'Documents' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_DOCDETAILS' AND bot_lang = 'EN' and  bot_text <> 'Documents';
UPDATE r5boilertexts SET bot_text = 'Lijstweergave' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'LST' AND bot_lang = 'NL' and  bot_text <> 'Lijstweergave';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_DESCRIPTION' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_CODE' AND bot_lang = 'NL' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Gebruikersgroep' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_UG' AND bot_lang = 'NL' and  bot_text <> 'Gebruikersgroep';
UPDATE r5boilertexts SET bot_text = 'Entiteit' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_ENTITY' AND bot_lang = 'NL' and  bot_text <> 'Entiteit';
UPDATE r5boilertexts SET bot_text = 'Van Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUS' AND bot_lang = 'NL' and  bot_text <> 'Van Status';
UPDATE r5boilertexts SET bot_text = 'Naar Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUS' AND bot_lang = 'NL' and  bot_text <> 'Naar Status';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUSDESC' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUSDESC' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Gebruiker' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_USER' AND bot_lang = 'NL' and  bot_text <> 'Gebruiker';
UPDATE r5boilertexts SET bot_text = 'Record View' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'HDR' AND bot_lang = 'NL' and  bot_text <> 'Record View';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_1' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?ProcessUserDefinedScreenService' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_2' AND bot_lang = 'NL' and  bot_text <> '?ProcessUserDefinedScreenService';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_3' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_CF' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_4' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_5' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_6' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = '?<SECTION TITLE>' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'BLOCK_10_7' AND bot_lang = 'NL' and  bot_text <> '?<SECTION TITLE>';
UPDATE r5boilertexts SET bot_text = 'Bevestigen' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'GWPSUBMITBUTTON' AND bot_lang = 'NL' and  bot_text <> 'Bevestigen';
UPDATE r5boilertexts SET bot_text = 'Wissen' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'GWPCLEARBUTTON' AND bot_lang = 'NL' and  bot_text <> 'Wissen';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_DESCRIPTION' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Code' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_CODE' AND bot_lang = 'NL' and  bot_text <> 'Code';
UPDATE r5boilertexts SET bot_text = 'Gebruikersgroep' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_UG' AND bot_lang = 'NL' and  bot_text <> 'Gebruikersgroep';
UPDATE r5boilertexts SET bot_text = 'Entiteit' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_ENTITY' AND bot_lang = 'NL' and  bot_text <> 'Entiteit';
UPDATE r5boilertexts SET bot_text = 'Van Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUS' AND bot_lang = 'NL' and  bot_text <> 'Van Status';
UPDATE r5boilertexts SET bot_text = 'Naar Status' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUS' AND bot_lang = 'NL' and  bot_text <> 'Naar Status';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_FROMSTATUSDESC' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Omschrijving' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_TOSTATUSDESC' AND bot_lang = 'NL' and  bot_text <> 'Omschrijving';
UPDATE r5boilertexts SET bot_text = 'Gebruiker' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'WSPF_10_STA_USER' AND bot_lang = 'NL' and  bot_text <> 'Gebruiker';
UPDATE r5boilertexts SET bot_text = 'Opmerkingen' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'CMT' AND bot_lang = 'NL' and  bot_text <> 'Opmerkingen';
UPDATE r5boilertexts SET bot_text = 'Documenten' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC' AND bot_lang = 'NL' and  bot_text <> 'Documenten';
UPDATE r5boilertexts SET bot_text = 'Document toevoegen' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_ADDNEW' AND bot_lang = 'NL' and  bot_text <> 'Document toevoegen';
UPDATE r5boilertexts SET bot_text = 'Document aanmaken/uploaden' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_CREATEORUPLOADDOCUMENT' AND bot_lang = 'NL' and  bot_text <> 'Document aanmaken/uploaden';
UPDATE r5boilertexts SET bot_text = 'Document uploaden' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_UPLOADDOCUMENT' AND bot_lang = 'NL' and  bot_text <> 'Document uploaden';
UPDATE r5boilertexts SET bot_text = 'Document aanmaken' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_CREATEDOCUMENT' AND bot_lang = 'NL' and  bot_text <> 'Document aanmaken';
UPDATE r5boilertexts SET bot_text = 'Documenten' WHERE bot_function = 'OUSTAT' AND bot_fld1 = 'DOC_DOCDETAILS' AND bot_lang = 'NL' and  bot_text <> 'Documenten';

PROMPT ...End of Boilertexts:OUSTAT


COMMIT;
SET DEFINE ON;

PROMPT
PROMPT ...End of qbz_uds_oustat_bot.sql
