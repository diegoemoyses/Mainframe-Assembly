*********************************************************************** 
* OBJETIVOS: VERIFICA A QTD DE REGISTROS NO DSN INFORMADO EM ARQ        
*            EXIBE A QTD DE REGISTROS NO CARTAO SYSPRINT                
*            SE HOUVER REGISTROS RC 0                                   
*            SE NAO HOUVER REGISTROS RC 99                              
*********************************************************************** 
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)       
*********************************************************************** 
CONTDSN  AMODE 31                                                       
CONTDSN  RMODE 24                                                       
CONTDSN  CSECT                                                          
         STM   R14,R12,12(13)                                           
         USING CONTDSN,R10                                              
         LR    R10,R15                                                  
         ST    R13,CONTDSN_SAVE_AREA+4                                  
         LA    R8,CONTDSN_SAVE_AREA                                     
         ST    R8,8(R13)                                                
         LR    R13,R8                                                   
*********************************************************************** 
* CORPO DO PROGRAMA                                                     
*********************************************************************** 
         OPEN  (ARQ,INPUT)                                              
         OPEN  (SYSPRINT,OUTPUT)                                        
         PACK  NAP,NUMA                                                 
         PACK  N1P,NUM01                                                
*                                                                       
LERARQ   EQU   *                                                        
         GET   ARQ,DADOARQ                                              
         AP    NAP,N1P                                                  
         B     LERARQ                                                   
*                                                                       
FIMARQ   EQU   *                                                        
         CLOSE ARQ                                                      
         MVC   MSGOUT,=X'40204B2020204B20212060'                        
         ED    MSGOUT,NAP                                               
         PUT   SYSPRINT,MSG                                             
         CLOSE SYSPRINT                                                 
         ZAP   TRAB,NAP                                                 
         CVB   R2,TRAB                                                  
         LA    R15,R2                                                   
         BZ    RET99                                                    
*********************************************************************** 
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
*********************************************************************** 
CONTDSN_MODULO_RETORNA_OK     DS  0H                                    
         L     R13,CONTDSN_SAVE_AREA+4                                  
         LM    R14,R12,12(R13)                                          
         LA    R15,0                                                    
         BR    R14                                                      
*                                                                       
RET99    EQU   *                                                        
         L     R13,CONTDSN_SAVE_AREA+4                                  
         LM    R14,R12,12(R13)                                          
         LA    R15,99                                                   
         BR    R14                                                      
*********************************************************************** 
* DEFINIÇÃO DE ÁREAS DE DADOS                                           
*********************************************************************** 
*                                                                       
NUM01    DC    CL2'01'                                                  
NUMA     DC    CL2'00'                                                  
*                                                                       
DADOARQ  DS    CL80                                                     
*                                                                       
N1P      DS    PL4                                                      
NAP      DS    PL4                                                      
TRAB     DS    PL8                                                      
*                                                                       
MSG      DS    0CL80                                                    
         DC    CL1' '                                                   
MSGOUT   DS    CL11                                                     
         DC    CL1' '                                                   
         DC    CL9'REGISTROS'                                           
         DC    58CL1' '                                                 
*                                                                       
* AREA DE MEMORIA DCB                                                   
*                                                                       
ARQ      DCB   DDNAME=ARQ,                                             X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X		 
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIMARQ                                             
*                                                                       
SYSPRINT DCB   DDNAME=SYSPRINT,                                        X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=80,                                               X
               BLKSIZE=4000,                                           X
               RECFM=FBA                                                
*                                                                       
CONTDSN_SAVE_AREA               DS  18F                                 
*                                                                       
R0       EQU   0                                                        
R1       EQU   1                                                        
R2       EQU   2                                                        
R3       EQU   3                                                        
R4       EQU   4                                                        
R5       EQU   5                                                        
R6       EQU   6                                                        
R7       EQU   7                                                        
R8       EQU   8                                                        
R9       EQU   9                                                        
R10      EQU  10                                                        
R11      EQU  11                                                        
R12      EQU  12                                                        
R13      EQU  13                                                        			   
R14      EQU  14   
R15      EQU  15   
*                  
         LTORG     
*                  
         END       