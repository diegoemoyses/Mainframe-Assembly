***********************************************************************
* OBJETIVOS: CALCULAR A MODA, MEDIA E MEDIANA DO CONJUNTO DE DADOS
*            INFORMADO NO CARTAO ENTRADA.
*       OBS: O CONJUNTO DE DADOS PRECISA ESTAR ORDENADO.
*17/12/2024: CRIACAO DO PROGRAMA.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ESTATI01 AMODE 31
ESTATI01 RMODE 24
ESTATI01 CSECT
         STM   R14,R12,12(13)
         USING ESTATI01,R10
         LR    R10,R15
         ST    R13,ESTATI01_SAVE_AREA+4
         LA    R8,ESTATI01_SAVE_AREA
         ST    R8,8(R13)
         LR    R13,R8
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (ENTRADA,INPUT)
         OPEN  (SAIDA,OUTPUT)
*
         ZAP   NUMANTP,=P'0'
         ZAP   CONTMDP,=P'0'
         ZAP   CONTREG,=P'0'
         ZAP   CONTREM,=P'0'
         ZAP   SOMAREG,=P'0'
*
LERARQ   EQU   *
         GET   ENTRADA,DADO
         PACK  NUMATUP,DADOIN
*CALCULOS MEDIA ARITMETICA
         AP    CONTREG,=P'1'
         AP    SOMAREG,NUMATUP
*CALCULOS DA MODA
         CP    NUMATUP,NUMANTP
         BE    NUM_REPT
         ZAP   NUMANTP,NUMATUP
         ZAP   CONTOCP,=P'1'
         B     LERARQ
*
NUM_REPT EQU   *
         AP    CONTOCP,=P'1'
         CP    CONTOCP,CONTMDP
         BH    SETA_MOD
         B     LERARQ
*
SETA_MOD EQU   *
         ZAP   CONTMDP,CONTOCP
         ZAP   NUMODAP,NUMATUP
         B     LERARQ
*
FIMARQ   EQU   *
         MVC   MSG,=80CL1' '
         PUT   SAIDA,MSG
         MVC   MSG(41),=C'************ DADOS DO CONJUNTO INFORMADO'
         MVC   MSG+41(12),=C' ***********'
         PUT   SAIDA,MSG
         MVC   MSG,=80CL1' '
         PUT   SAIDA,MSG
         MVC   RESULTO,=X'2120202020212060'
         ED    RESULTO,CONTREG
         MVC   MSG(35),=C'   QTD DE ELEMENTOS                '
         MVC   MSG+19(7),RESULTO
         PUT   SAIDA,MSG
         MVC   MSG,=80CL1' '
         MVC   RESULTO,=X'21202020206B212060'
         ED    RESULTO,SOMAREG
         MVC   MSG(35),=C' SOMA DOS ELEMENTOS                  '
         MVC   MSG+19(8),RESULTO
         PUT   SAIDA,MSG
*
         MVC   MSG,=80CL1' '
         PUT   SAIDA,MSG
         PUT   SAIDA,MSG
         MVC   MSG(28),=C'***** MEDIDAS DE TENDENCIAS '
         MVC   MSG+28(26),=C'CENTRAIS DO CONJUNTO *****'
         PUT   SAIDA,MSG
         MVC   MSG,=80CL1' '
         PUT   SAIDA,MSG
*********MEDIA ARITMETICA**********
         ZAP   TRAB,SOMAREG
         CVB   R4,TRAB
         SRDA  R4,32
         ZAP   TRAB,CONTREG
         CVB   R6,TRAB
         ST    R6,N2F
         D     R4,N2F
         CVD   R5,TRAB
         ZAP   RESULT,TRAB
         MVC   MEDIARIT,=X'21202020206B212060'
         ED    MEDIARIT,RESULT
         MVC   MSG(35),=C'   MEDIA                           '
         MVC   MSG+8(8),MEDIARIT
         PUT   SAIDA,MSG
*********MODA**********************
         MVC   MODANUM,=X'21202020206B212060'
         ED    MODANUM,NUMODAP
         MVC   MSG(35),=C'    MODA                           '
         MVC   MSG+8(8),MODANUM
         PUT   SAIDA,MSG
         CLOSE ENTRADA
*********MEDIANA*******************
         ZAP   TRAB,CONTREG
         DP    TRAB,N2P
         MVC   RESULT,TRAB
         MVC   CONTREG,RESULT
         MVC   RESULT,TRAB+4
*
         ZAP   CONTREM,=P'0'
         OPEN  (ENTRAD2,INPUT)
*
         CP    RESULT,=P'0000'
         BH    LER2IMPAR
*
LER2PAR  EQU   *
         GET   ENTRAD2,DADO
         AP    CONTREM,=P'1'
         CP    CONTREG,CONTREM
         BE    MEDIANAPAR
         B     LER2PAR
*
MEDIANAPAR   EQU *
*        PUT   SAIDA,DADO
         PACK  MEDIANA1P,DADOIN
         GET   ENTRAD2,DADO
*        PUT   SAIDA,DADO
         PACK  MEDIANA2P,DADOIN
         AP    MEDIANA1P,MEDIANA2P
         ZAP   TRAB,MEDIANA1P
         CVB   R4,TRAB
         SRDA  R4,32
         ZAP   TRAB,N2P
         CVB   R6,TRAB
         ST    R6,N2F
         D     R4,N2F
         CVD   R5,TRAB
         ZAP   RESULT,TRAB
         MVC   MEDIANAM,=X'21202020206B212060'
         ED    MEDIANAM,RESULT
         MVC   MSG,=80CL1' '
         MVC   MSG(35),=C' MEDIANA                           '
         MVC   MSG+8(8),MEDIANAM
         PUT   SAIDA,MSG
         B FIM_PGM
*
LER2IMPAR EQU  *
         GET   ENTRAD2,DADO
         AP    CONTREM,=P'1'
         CP    CONTREG,CONTREM
         BE    MEDIANAIMPAR
         B     LER2IMPAR
*
MEDIANAIMPAR EQU *
         MVC   MSG,=80CL1' '
         MVC   MSG(35),=C' MEDIANA                           '
         MVC   MSG+9(6),DADOIN
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIM_PGM  EQU   *
         MVC   MSG,=80CL1' '
         PUT   SAIDA,MSG
         PUT   SAIDA,MSG
         CLOSE SAIDA
         L     R13,ESTATI01_SAVE_AREA+4
         LM    R14,R12,12(R13)
         LA    R15,0
         BR    R14
*
***********************************************************************
* DEFINIÇÃO DE ÁREAS DE DADOS
***********************************************************************
*
MSG      DS    CL80
*
DADO     DS    0CL80
DADOIN   DS    CL6
         DC    76CL1' '
*
CONTREG  DS    PL4
CONTREM  DS    PL4
SOMAREG  DS    PL4
TRAB     DS    PL8
RESULT   DS    PL4
N2P      DC    PL4'0002'
MEDIANA1P DS   PL4
MEDIANA2P DS   PL4
*
MEDIARIT DS    CL8
MODANUM  DS    CL8
N1F      DS    F
N2F      DS    F
MEDIANAM DS    CL8
RESULTO  DS    CL8
*
NUMATUP  DS    PL4  * NUMERO DO REGISTRO CORRENTE
NUMODAP  DS    PL4  * NUMERO MODA ATUAL
NUMANTP  DS    PL4  * NUMERO ANTERIOR
CONTOCP  DS    PL4  * NUMERO DE VEZES QUE OCORREU
CONTMDP  DS    PL4  * NUMERO DE VEZES QUE DA MODA ATUAL OCORREU
*
*
* AREA DE MEMORIA DCB
*
ENTRADA  DCB   DDNAME=ENTRADA,                                         X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIMARQ
*
ENTRAD2  DCB   DDNAME=ENTRADA,                                         X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIM_PGM
*
SAIDA    DCB   DDNAME=SAIDA,                                           X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=80,                                               X
               BLKSIZE=0,                                              X
               RECFM=FBA
*
ESTATI01_SAVE_AREA              DS  18F
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
