*********************************************************************** 
* OBJETIVOS: BALANCE LINE COM OU SEM CORRESPONDENTES                    
* 25/02/2025: CRIACAO DO PROGRAMA.                                      
*********************************************************************** 
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)       
*********************************************************************** 
PASMBLN1 AMODE 31                                                       
PASMBLN1 RMODE 24                                                       
PASMBLN1 CSECT                                                          
         STM   R14,R12,12(13)                                           
         USING PASMBLN1,R10                                             
         LR    R10,R15                                                  
         ST    R13,PASMBLN1_SAVE_AREA+4                                 
         LA    R8,PASMBLN1_SAVE_AREA                                    
         ST    R8,8(R13)                                                
         LR    R13,R8                                                   
*********************************************************************** 
* CORPO DO PROGRAMA                                                     
*********************************************************************** 
         OPEN  (CONTCORA,INPUT)                                         
         OPEN  (CONTCORB,INPUT)                                         
         OPEN  (CONTCORC,OUTPUT)                                        
         MVC   FIMCONT(80),=80C' '                                      
         LA    R3,0                                                     
         LA    R4,0     
         LA    R6,0                   
         LA    R7,2                   
*                                     
         BAL   R9,LERCONTA            
         BAL   R9,LERCONTB            
         B     PROCESSA               
*                                     
LERCONTA EQU   *                      
         CLR   R3,R5                  
         BE    RETA                   
         GET   CONTCORA,REGCONTCA     
         PACK  AGCONTAP,AGCONTA       
RETA     EQU   *                      
         BR    R9                     
*                                     
LERCONTB EQU   *                      
         CLR   R4,R5                  
         BE    RETB                   
         GET   CONTCORB,REGCONTCB     
         PACK  AGCONTBP,AGCONTB       
RETB     EQU   *                      
         BR    R9                     
*                                     
PROCESSA EQU   *                      
         CLR   R6,R7                  
         BE    FIM_PGM                		 
*                                   
         CLR   R3,R5                
         BE    CONTA_MAIOR          
         CLR   R4,R5                
         BE    CONTA_MENOR          
* IGUAL                             
         CP    AGCONTAP,AGCONTBP    
         BE    CONTAB_EQU           
* MAIOR                             
         CP    AGCONTAP,AGCONTBP    
         BH    CONTA_MAIOR          
* MENOR                             
CONTA_MENOR    EQU *                
         PUT   CONTCORC,REGCONTCA   
         BAL   R9,LERCONTA          
         B     PROCESSA             
*                                   
CONTAB_EQU     EQU *                
         PUT   CONTCORC,REGCONTCB   
         BAL   R9,LERCONTA          
         BAL   R9,LERCONTB          
         B     PROCESSA             
*                                   
CONTA_MAIOR    EQU *                
         PUT   CONTCORC,REGCONTCB   
         BAL   R9,LERCONTB          		 
         B     PROCESSA                                                 
*                                                                       
FIMCONTA EQU   *                                                        
         LA    R3,1                                                     
         AR    R6,R5                                                    
         B     PROCESSA                                                 
*                                                                       
FIMCONTB EQU   *                                                        
         LA    R4,1                                                     
         AR    R6,R5                                                    
         B     PROCESSA                                                 
*                                                                       
*********************************************************************** 
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)         
*********************************************************************** 
FIM_PGM  EQU   *                                                        
         CLOSE CONTCORA                                                 
         CLOSE CONTCORB                                                 
         CLOSE CONTCORC                                                 
         L     R13,PASMBLN1_SAVE_AREA+4                                 
         LM    R14,R12,12(R13)                                          
         LA    R15,0                                                    
         BR    R14                                                      
*                                                                       
*********************************************************************** 
* DEFINIÇÃO DE ÁREAS DE DADOS     
 *********************************************************************** 
 PASMBLN1_SAVE_AREA              DS  18F                                 
 *                                                                       
 MSG      DS    CL80                                                     
 *                                                                       
 REGCONTCA DS   0CL80                                                    
 AGCONTA   DS   CL6                                                      
 NOMEA     DS   CL20                                                     
 SALDOA    DS   CL9                                                      
           DC   46CL1' '                                                 
 *                                                                       
 REGCONTCB DS   0CL80                                                    
 AGCONTB   DS   CL6                                                      
 NOMEB     DS   CL20                                                     
 SALDOB    DS   CL9                                                      
           DC   46CL1' '                                                 
 *                                                                       
 REGCONTCC DS   0CL80                                                    
 AGCONTC   DS   CL6                                                      
 NOMEC     DS   CL20                                                     
 SALDOC    DS   CL9                                                      
           DC   46CL1' '                                                 
 *                                                                       
 AGCONTAP  DS   PL6                                                      
 AGCONTBP  DS   PL6                                                      
 *                                                                       
 * AREA DE MEMORIA DCB                                                                                         		 
 *                                                                       
CONTCORA DCB   DDNAME=CONTCORA,                                        X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIMCONTA                                           
*                                                                       
CONTCORB DCB   DDNAME=CONTCORB,                                        X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIMCONTB                                           
*                                                                       
CONTCORC DCB   DDNAME=CONTCORC,                                        X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=80,                                               X
               BLKSIZE=0,                                              X
               RECFM=FB                                                 
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
