*********************************************************************** 
* OBJETIVOS: LOOP GRAVANDO O VALOR          06/11/2024                  
*          : AJUSTE PARA MELHOR COMPREENSAO 12/11/2024      
*          : OTIMIZACAO DO CODIGO           20/11/2024              
*********************************************************************** 
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)       
*********************************************************************** 
ASMPLOOP AMODE 31                                                       
ASMPLOOP RMODE 24                                                       
ASMPLOOP CSECT                                                          
         STM   R14,R12,12(13)                                           
         USING ASMPLOOP,R10                                             
         LR    R10,R15                                                  
         ST    R13,ASMPLOOP_SAVE_AREA+4                                 
         LA    R8,ASMPLOOP_SAVE_AREA                                    
         ST    R8,8(R13)                                                
         LR    R13,R8                                                   
*********************************************************************** 
* CORPO DO PROGRAMA                                                     
*********************************************************************** 
         OPEN  (SAIDA,OUTPUT)                                           
         ZAP   LIMITE,P'10'                                             
         CVB   R2,LIMITE                                                
*                                                                       
LOOP     EQU   *                                                        
         CVD   R2,TRAB                                                  
         SP    TRAB,LIMITE                                              
*        AP    TRAB,=P'1'                                               
         UNPK  MSGOUT,TRAB                                              
         OI    MSGOUT+3,X'F0'                                           
         PUT   SAIDA,MSG                                                
         BCT   R2,LOOP                                                  
*                                                                       
         CLOSE SAIDA                                                    
*********************************************************************** 
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
*********************************************************************** 
ASMPLOOP_MODULO_RETORNA_OK    DS  0H                                    
         L     R13,ASMPLOOP_SAVE_AREA+4                                 
         LM    R14,R12,12(R13)                                          
         LA    R15,0                                                    
         BR    R14                                                      
*********************************************************************** 
* DEFINIÇÃO DE ÁREAS DE DADOS                                           
*********************************************************************** 
*                                                                       
LIMITE   DS    PL8                                                      
TRAB     DS    PL8                                                      
*                                                                       
MSG      DS    0CL80                                                    
         DC    CL1' '                                                   
MSGOUT   DS    CL4                                                      
         DC    CL1' '                                                   
MSGOUX   DS    CL4                                                      
         DC    CL1' '                                                   
         DC    60CL1' '                                                 
*                                                                       
* AREA DE MEMORIA DCB APONTANDO PARA O DDNAME SAIDA                     		 
SAIDA    DCB   DDNAME=SAIDA,                                          
               DSORG=PS,                                              
               MACRF=PM,                                              
               LRECL=80,                                              
               BLKSIZE=4000,                                          
               RECFM=FBA                                              
*                                                                     
ASMPLOOP_SAVE_AREA              DS  18F                               
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
