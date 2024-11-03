***********************************************************************     
* OBJETIVOS  : WTO DO PARAMETRO PASSADO VIA JCL                             
* 03/11/2024 : CRIACAO                                                      
***********************************************************************     
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)           
***********************************************************************     
ASMPARM1 AMODE 31                                                           
ASMPARM1 RMODE 24                                                           
ASMPARM1 CSECT                                                              
         STM   R14,R12,12(13)                                               
         USING ASMPARM1,R10                                                 
         LR    R10,R15                                                      
         ST    R13,ASMPARM1_SAVE_AREA+4                                     
         LA    R8,ASMPARM1_SAVE_AREA                                        
         ST    R8,8(R13)                                                    
         LR    R13,R8                                                       
***********************************************************************     
* CORPO DO PROGRAMA                                                         
***********************************************************************     
*                                                                           
         L     R2,0(R1)                                                     
         USING PARMLEN,R2
         LH    R3,PARMLEN                                               
         EX    R3,MOVEPARM                                              
         WTO   MF=(E,WTO)                                               
*                                                                       
*********************************************************************** 
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
*********************************************************************** 
ASMPARM1_MODULO_RETORNA_OK    DS  0H                                    
         L     R13,ASMPARM1_SAVE_AREA+4                                 
         LM    R14,R12,12(R13)                                          
         LA    R15,0                                                    
         BR    R14                                                      
*                                                                       
*********************************************************************** 
* DEFINIÇÃO DE ÁREAS DE DADOS                                           
*********************************************************************** 
ASMPARM1_SAVE_AREA              DS   18F                                
PARM                            DS   CL256' '                           
MOVEPARM                        MVC  WTO+4(0),PARMLIT                   
WTO                             WTO  '              ',ROUTCDE=(1),MF=L  
PARMADDR                        DS  F                                   
PARMLEN                         DS  H   
PARMLIT                         DS  CL256                                 
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