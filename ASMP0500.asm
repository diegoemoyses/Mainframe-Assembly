***********************************************************************   
* OBJETIVOS: PRIMEIRO PROGRAMA EM ASSEMBLY - 01/11/2024                   
***********************************************************************   
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
***********************************************************************   
ASMP0500 AMODE 31                                                         
ASMP0500 RMODE 24                                                         
ASMP0500 CSECT                                                            
         STM   R14,R12,12(13)                                             
         USING ASMP0500,R10                                               
         LR    R10,R15                                                    
         ST    R13,ASMP0500_SAVE_AREA+4                                   
         LA    R8,ASMP0500_SAVE_AREA                                      
         ST    R8,8(R13)                                                  
         LR    R13,R8                                                     
***********************************************************************   
* CORPO DO PROGRAMA                                                       
***********************************************************************   
         WTO 'HELLO WORLD - MEU PRIMEIRO PGM EM ASSEMBLY'                 
***********************************************************************   
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)           
***********************************************************************   
ASMP0500_MODULO_RETORNA_OK    DS  0H                                         
         L     R13,ASMP0500_SAVE_AREA+4                                      
         LM    R14,R12,12(R13)                                               
         LA    R15,0                                                         
         BR    R14                                                           
***********************************************************************      
* DEFINIÇÃO DE ÁREAS DE DADOS                                                
***********************************************************************      
ASMP0500_SAVE_AREA              DS  18F                                      
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
