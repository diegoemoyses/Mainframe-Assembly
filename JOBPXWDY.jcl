//JOBPXWDY   JOB    ('00'),TSO.&SYSUID,NOTIFY=&SYSUID,                  
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A                               
//*    
//*------------------------------------------------------------------* 
//* EXECUTA PGM ASSEMBLER CONTDSN                                      
//*------------------------------------------------------------------* 
//STEP001  EXEC PGM=CONTDSN                                            
//STEPLIB  DD   DSN=ADCD.USERLOAD,DISP=SHR                                
//SYSPRINT DD   SYSOUT=*                                               
//ARQ      DD   DSN=ADCD.ENTRADA.DADOS,DISP=SHR
//*------------------------------------------------------------------*  
//* EXECUTA PGM ASSEMBLER ASMALLC1                                      
//*------------------------------------------------------------------*  
//STEP001  EXEC PGM=ASMALLC1                                            
//STEPLIB  DD   DSN=ADCD.USERLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                
//ENTRADA  DD   DSN=ADCD.ENTRADA.DADOS,DISP=SHR                        
