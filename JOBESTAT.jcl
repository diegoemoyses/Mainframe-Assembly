//JOBESTAT  JOB ('SYS1NPD080618'),TSO.&SYSUID,                       
//          REGION=0M,NOTIFY=&SYSUID,                                
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A                            
//********************************************************           
//* CALCULO DA MEDIA DE TENDENCIAS CENTRAIS                          
//*                                                                  
//* OBS: OS NUMEROS PRECISAM ESTAR NO FORMATO NNNNDD                 
//*      OS ZEROS A ESQUERDA DEVEM SER INFORMADOS                    
//*      N - REPRESTA NUMERO INTEIRO                                 
//*      D - REPRESTA NUMERO DECIMAL                                 
//********************************************************           
//*                                                                  
//* STEP01 -  SORT PARA ORDENAR OS NUMEROS                           
//********************************************************           
//STEP01   EXEC PGM=SORT                                             
//SYSOUT   DD SYSOUT=*
//*ORTOUT  DD SYSOUT=*
//SORTOUT  DD DSN=&&SORTOUT,
//         DISP=(,PASS),SPACE=(TRK,(10,10),RLSE),
//         DCB=(LRECL=80,RECFM=FB,DSORG=PS),UNIT=3390
//SORTIN   DD *
000021
000251
000257
000288
000156
000257
000087
000229
000081
000216
000050
000168
000036
000250
000257
000140
000100
000041
000295
000192
000256
000238
000257
000293
000267
000181
000157
000227
000073
000100
000100
000166
000102
000167
000219
000022
000002
000253
000275
000047
000163
/*
//SYSIN    DD *
  SORT FIELDS=(1,6,CH,A)
/*
//*
//************************************************************   
//* ASSEMBLY PARA CALCULAR MEDIA, MODA E MEDIANA DO CONJUNTO   
//* OBRIGATORIO O CONJUNTO ESTAR ORDENADO                      
//************************************************************   
//STEP02   EXEC PGM=ESTATI01,COND=(0,NE)                       
//STEPLIB  DD   DSN=USER.LOAD,DISP=SHR                         
//SAIDA    DD   SYSOUT=*                                       
//ENTRADA  DD   DSN=&&SORTOUT,DISP=OLD
//*
