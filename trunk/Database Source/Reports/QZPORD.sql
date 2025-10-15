/*
REM========================================================================
REM FILE          : qzpord_bot.sql
REM AUTHOR        : MCT
REM CREATION DATE : 22-Nov-2023
REM========================================================================
REM (c) The contents of this file, and of any file or document derived from
REM it, are copyright to MCT India Infotech Pvt. Ltd. Unlicensed alteration,
REM change or copying in any form, whether written, by photocopy, by disk,
REM by print or by any other methods of reproduction is strictly prohibited.
REM========================================================================
REM PURPOSE OF FILE
REM Creation of report.
REM========================================================================
REM CHANGE HISTORY
REM  
REM========================================================================
*/

PROMPT ...Begin of qzpord_bot.sql

SET DEFINE OFF;

PROMPT ...Start of Boilerlexts: QZPORD

BEGIN

   
   
   
   DELETE FROM r5boilertexts WHERE bot_function = 'QZPORD'  ;
   DELETE FROM r5permissions WHERE prm_function = 'QZPORD' ;
   DELETE FROM r5functions WHERE fun_code = 'QZPORD' ;
   DELETE FROM r5repparms WHERE pmt_function = 'QZPORD' ;
  

  
--Create Function
  INSERT INTO r5functions  ( fun_code    ,fun_desc           ,fun_class   ,fun_subtype   ,fun_file  
                          ,fun_delete  ,fun_insert         ,fun_update  ,fun_select    ,fun_mekey 
                          ,fun_auto    ,fun_background     ,fun_dirsel  ,fun_system    ,fun_class_org)  
                   SELECT 'QZPORD'     ,'Purchase Order '  ,'REPC'      ,'R'          ,'QBUZZ/QZPORD.XML'  
                          ,NULL        ,NULL               ,NULL        ,'?'          ,'YY'  
                          ,'N'         ,'-'                ,'-'         ,'+'          ,'*'  FROM DUAL  ;

                  
                  


  --Create Permissions
  INSERT INTO r5permissions (prm_function  ,prm_group  ,prm_select  ,prm_update  ,prm_insert  ,prm_delete  ,prm_printer  ,prm_screen  ,prm_prfile  ,prm_local) 
                       VALUES('QZPORD'      ,'R5'       ,'?'         ,NULL        ,NULL        ,NULL        ,'-'          ,'-'         ,'-'          ,'-'   );
           
           
  --Create report parameters                     
  INSERT INTO r5repparms(pmt_function  ,pmt_line     ,pmt_parameter  ,pmt_rentity  ,pmt_rtype ,pmt_datatype  ,pmt_length   ,pmt_format     ,pmt_default  ,pmt_mandatory  ,pmt_upper     ,pmt_options  ,pmt_ewslovdef                           ,pmt_mekey    ,pmt_fixed  ,pmt_bottext)  
                      VALUES ('QZPORD'     ,1            ,'SEL_ORDER'    ,'PORD'       ,NULL      ,'C'           ,'30'         ,NULL           ,NULL         ,'-'            ,'+'           ,NULL         ,'LVREPCOGALLPO;gridtagname=code'  ,'YY'         ,'-'        ,NULL);  
                         
  INSERT INTO r5repparms(pmt_function  ,pmt_line     ,pmt_parameter  ,pmt_rentity  ,pmt_rtype ,pmt_datatype  ,pmt_length   ,pmt_format     ,pmt_default  ,pmt_mandatory  ,pmt_upper     ,pmt_options  ,pmt_ewslovdef                           ,pmt_mekey    ,pmt_fixed  ,pmt_bottext)  
                   VALUES ('QZPORD'    ,2            ,'SEL_ORG'      ,'ORG'        ,NULL      ,'O'           ,'30'         ,NULL           ,NULL         ,'-'            ,'+'           ,NULL         ,'LVRPTORG;gridtagname=organization'     ,'YY'         ,'-'        ,NULL);                      
 
  
  
  --Create Boilerlexts
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',1  ,50,0,0,'NL','PO'                                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',1  ,50,0,0,'EN','PO'                                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',2  ,50,0,0,'NL','Organization'                                      ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',2  ,50,0,0,'EN','Organization'                                      ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',5  ,50,0,0,'NL','PURCHASE ORDER'                                    ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',5  ,50,0,0,'EN','PURCHASE ORDER'                                    ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',6  ,50,0,0,'NL','LEVERANCIER'                                       ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',6  ,50,0,0,'EN','LEVERANCIER'                                       ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',7  ,50,0,0,'NL','AFLEVERADRES'                                      ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',7  ,50,0,0,'EN','AFLEVERADRES'                                      ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',8  ,50,0,0,'NL','AANVRAGER'                                         ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',8  ,50,0,0,'EN','AANVRAGER'                                         ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',9  ,50,0,0,'NL','LEVERINGSCONDITIES'                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',9  ,50,0,0,'EN','LEVERINGSCONDITIES'                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',10 ,50,0,0,'NL','BETALINGSCONDITIES'                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',10 ,50,0,0,'EN','BETALINGSCONDITIES'                                ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',11 ,50,0,0,'NL','INKOOPDETAILS:'                                    ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',11 ,50,0,0,'EN','INKOOPDETAILS:'                                    ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',12 ,50,0,0,'NL','EAM Werkordernr.:'                                 ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',12 ,50,0,0,'EN','EAM Werkordernr.:'                                 ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',13 ,50,0,0,'NL','Referentie'                                        ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',13 ,50,0,0,'EN','Referentie'                                        ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',14 ,50,0,0,'NL','Onderhoudspartij'                                  ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',14 ,50,0,0,'EN','Onderhoudspartij'                                  ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',15 ,50,0,0,'NL','Totaal'                                            ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',15 ,50,0,0,'EN','Totaal'                                            ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',16 ,50,0,0,'NL','Sub totaal'                                        ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',16 ,50,0,0,'EN','Sub totaal'                                        ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',17 ,50,0,0,'NL','BTW'                                               ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',17 ,50,0,0,'EN','BTW'                                               ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',18 ,50,0,0,'NL','AANVULLENDE INFORMATIE:'                           ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',18 ,50,0,0,'EN','AANVULLENDE INFORMATIE:'                           ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',19 ,50,0,0,'NL','Wij verzoeken u bovenstaande goederen en of diensten te leveren conform de algemene inkoopvoorwaarden van Qbuzz'                              ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',19 ,50,0,0,'EN','Wij verzoeken u bovenstaande goederen en of diensten te leveren conform de algemene inkoopvoorwaarden van Qbuzz'                             ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',20 ,50,0,0,'NL','gedeponeerd bij de KvK onder nummer 32134138. Indien U vragen of opmerkingen heeft over deze inkooporder contact de aanvrager!'               ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',20 ,50,0,0,'EN','gedeponeerd bij de KvK onder nummer 32134138. Indien U vragen of opmerkingen heeft over deze inkooporder contact de aanvrager!'               ,'F',1,NULL           ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',21 ,50,0,0,'NL','Voor Akkoord:'                                     ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',21 ,50,0,0,'EN','Voor Akkoord:'                                     ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',22 ,50,0,0,'NL','Handtekening(digitaal)'                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',22 ,50,0,0,'EN','Handtekening(digitaal)'                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',23 ,50,0,0,'NL','Date'                                              ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',23 ,50,0,0,'EN','Date'                                              ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',24 ,50,0,0,'NL','PO nr.'                                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',24 ,50,0,0,'EN','PO nr.'                                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',25 ,50,0,0,'NL','Rev.'                                              ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',25 ,50,0,0,'EN','Rev.'                                              ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',26 ,50,0,0,'NL','Piet Mondriaanplein 31'                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',26 ,50,0,0,'EN','Piet Mondriaanplein 31'                            ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',27 ,50,0,0,'NL','3812 GZ Amersfoort'                                ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',27 ,50,0,0,'EN','3812 GZ Amersfoort'                                ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',28 ,50,0,0,'NL','Franko afleveradres'                               ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',28 ,50,0,0,'EN','Franko afleveradres'                               ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',29 ,50,0,0,'NL','30 dagen na factuurdatum'                          ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',29 ,50,0,0,'EN','30 dagen na factuurdatum'                          ,'F',1,NULL            ,'100000','+','-','-' FROM dual;
  --INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',30 ,50,0,0,'NL','Ron Snijder en Kees Broertjes'                    ,'F',1,NULL            ,'100000','+','-','-'FROM dual;
  --INSERT INTO r5boilertexts (bot_function,bot_number,bot_length,bot_xpos,bot_ypos,bot_lang,bot_text,bot_dest,bot_page,bot_fld1,bot_pool,bot_changed,bot_display,bot_cloned) SELECT 'QZPORD',30 ,50,0,0,'EN','Ron Snijder en Kees Broertjes'                    ,'F',1,NULL            ,'100000','+','-','-'FROM dual;
  
END;
/
COMMIT;
PROMPT ...End of Boilertexts:QZPORD

PROMPT ...End of qzpord_bot.sql











