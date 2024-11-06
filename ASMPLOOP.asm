*********************************************************************** 
* OBJETIVOS: LOOP GRAVANDO O VALOR          06/11/2024                  
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
*                                                                       
         SR    R2,R2     * INICIA O REGISTRO QUE SERA O CONTADOR        
         LA    R4,10     * CARREGA VALOR 10 NO R4 - LIMITE DO LOP       
LOOP     EQU   *         * INICIO DO LOOP                               
         LA    R2,1(R2)  * ADD 1 A R2                                   
*                                                                       
         ST    R2,REG2                                                  
         IC    0,MSG+L'MSG                                              
         UNPK  MSG(5),REG2(5)                                           
         NC    MSG,=8X'0F'                                              
         TR    MSG,HEXTAB                                               
         PUT   SAIDA,MSG                                                
         BCT   R4,LOOP   * FAZ O LOOP ATE ATINGIR VALOR DE R4           
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
HEXTAB   DC    C'0123456789ABCDEF'                                      
*                                                                       
REG2     DS    F                                                        
*                                                                       
MSGALL   DS    0CL80                                                    
MSG      DS    CL10                                                     
         DC    20CL60' '                                                
*                                                                       
* AREA DE MEMORIA DCB APONTANDO PARA O DDNAME SAIDA   
SAIDA    DCB   DDNAME=SAIDA,                                           X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=80,                                               X
               BLKSIZE=4000,                                           X
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
         END		 