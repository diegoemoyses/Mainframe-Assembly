*********************************************************************** 
* OBJETIVOS: LE DDNAME ENTRADA E IMPRIME NO DDNAME SAIDA 04/04/2024     
*********************************************************************** 
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)       
*********************************************************************** 
ASMP0503 AMODE 31                                                       
ASMP0503 RMODE 24                                                       
ASMP0503 CSECT                                                          
         STM   R14,R12,12(13)                                           
         USING ASMP0503,R10                                             
         LR    R10,R15                                                  
         ST    R13,ASMP0503_SAVE_AREA+4                                 
         LA    R8,ASMP0503_SAVE_AREA                                    
         ST    R8,8(R13)                                                
         LR    R13,R8                                                   
*********************************************************************** 
* CORPO DO PROGRAMA                                                     
*********************************************************************** 
         OPEN  (SAIDA,OUTPUT)  *ABRE DDNAME SAIDA  PARA OUTPUT DE DADOS 
         OPEN  (ENTRADA,INPUT) *ABRE DDNAME ENTRADA PARA INPUT DE DADOS 
*                                                                       
LEREG    EQU   *                                                        
         GET   ENTRADA,MSG                                              
         PUT   SAIDA,MSG                                                
         B     LEREG                                                    
FIMARQ   EQU   *                                                        
         CLOSE SAIDA
         CLOSE ENTRADA                                                  
*********************************************************************** 
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
*********************************************************************** 
ASMP0503_MODULO_RETORNA_OK    DS  0H                                    
         L     R13,ASMP0503_SAVE_AREA+4                                 
         LM    R14,R12,12(R13)                                          
         LA    R15,0                                                    
         BR    R14                                                      
*********************************************************************** 
* DEFINIÇÃO DE ÁREAS DE DADOS                                           
*********************************************************************** 
MSG      DS    0CL80  * DEFINE AREA DE DADOS CARACTER DE 80 POSICOES    
MSGOUT   DS    CL20                                                     
         DC    60CL1' '                                                 
*                                                                       
* AREA DE MEMORIA DCB APONTANDO DDNAME                                  
*                                                                       
SAIDA    DCB   DDNAME=SAIDA,                                           X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=80,                                               X
               BLKSIZE=4000,                                           X
               RECFM=FBA                                                
*                                                                       
ENTRADA  DCB   DDNAME=ENTRADA,                                         X
               DSORG=PS,                                               X		 
               MACRF=GM,                                               X
               RECFM=FB,                                               X
               LRECL=80,                                               X
               BLKSIZE=4000,                                           X
               EODAD=FIMARQ                                             
*                                                                       
ASMP0503_SAVE_AREA              DS  18F                                 
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