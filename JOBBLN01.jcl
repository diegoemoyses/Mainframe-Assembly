//JOBBLN01   JOB    ('00'),TSO.&SYSUID,NOTIFY=&SYSUID,                  
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A                               
//*                                                                     
//*---------------------------------------------------------------------
//STEP0001 EXEC PGM=ICEGENER,COND=(0,NE)                                
//SYSPRINT DD   SYSOUT=*                                                
//SYSOUT   DD   SYSOUT=*                                                
//SYSUT1   DD   *                                                       
21234ABREU DE SOUZA      000110200                                     
23455JOAO DE DEUS        000006735                                     
26754ALFREDO JR          000376400                                     
51454JAIR OLIVEIRA       000053490                                     
52455LUIZ DE LIMA        000007499                                     
25679HELENA DA LUZ       000024574                                     
*                                                                      
//SYSUT2   DD   DSN=&&ST01,                                             
//         DISP=(,PASS),SPACE=(TRK,(10,10),RLSE),                       
//         DCB=(LRECL=80,RECFM=FB,DSORG=PS),UNIT=3390                   
//*---------------------------------------------------------------------
//STEP0002 EXEC PGM=ICEGENER,COND=(0,NE)                                
//SYSPRINT DD   SYSOUT=*                                                
//SYSOUT   DD   SYSOUT=*                                                
//SYSUT1   DD   *                                                       
21234ABREU DE SOUZA      000281256                                     
22419ANTONIA OLIVEIRA    000198422                                     
52455LUIZ B. DE LIMA     00000205}                                     
507723MARCILIO NOE        00002733K                                     
922976ANGELA FERREIRA     000014300                                     
/*                                                                      
//SYSUT2   DD   DSN=&&ST02,                                             
//         DISP=(,PASS),SPACE=(TRK,(10,10),RLSE),                       
//         DCB=(LRECL=80,RECFM=FB,DSORG=PS),UNIT=3390                   
//*---------------------------------------------------------------------
//STEP0003 EXEC PGM=SORT,COND=(0,NE)                                    
//SYSPRINT DD   SYSOUT=*                                                
//SYSOUT   DD   SYSOUT=*                                                
//SORTIN   DD   DSN=&&ST01,DISP=OLD                                     
//SORTOUT  DD   DSN=&&ST01SRT,                                          
//         DISP=(,PASS),SPACE=(TRK,(10,10),RLSE),                       
//         DCB=(LRECL=80,RECFM=FB,DSORG=PS),UNIT=3390                   
//SYSIN    DD *                                                         
  SORT FIELDS=(01,06,BI,A)                                              
/*                                                                      
//STEP0004 EXEC PGM=SORT,COND=(0,NE)                                    
//SYSPRINT DD   SYSOUT=*                                                
//SYSOUT   DD   SYSOUT=*                                                
//SORTIN   DD   DSN=&&ST02,DISP=OLD                                     
//SORTOUT  DD   DSN=&&ST02SRT,                                          
//         DISP=(,PASS),SPACE=(TRK,(10,10),RLSE),                       
//         DCB=(LRECL=80,RECFM=FB,DSORG=PS),UNIT=3390                   
//SYSIN    DD *                                                         
  SORT FIELDS=(01,06,BI,A)    
  SORT FIELDS=(01,06,BI,A)                               
/*                                                       
//*------------------------------------------------------
//STEP0005 EXEC PGM=PASMBLN1,COND=(0,NE)                 
//SYSPRINT DD   SYSOUT=*                                 
//SYSOUT   DD   SYSOUT=*                                 
//STEPLIB  DD   DSN=ADCD.USERLOAD,DISP=SHR                          
//CONTCORA DD   DSN=&&ST01SRT,DISP=SHR                   
//CONTCORB DD   DSN=&&ST02SRT,DISP=SHR                   
//CONTCORC DD   SYSOUT=*                                   
