***********************************************************************
* OBJETIVOS: ALOCACAO DINAMICA DE DSN COM BPXWDYN - 13-10-2025
***********************************************************************
* PROCEDIMENTOS DE INICIALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMALLC1    AMODE 31
ASMALLC1 RMODE 24
ASMALLC1 CSECT
         STM   R14,R12,12(13)
         USING ASMALLC1,R10
         LR    R10,R15
         ST    R13,SAVE_AREA+4
         LA    R8,SAVE_AREA
         ST    R8,8(R13)
         LR    R13,R8
***********************************************************************
* INICIO
***********************************************************************
         OPEN  (SYSPRINT,OUTPUT)
         PUT   SYSPRINT,=CL133' INICIO'
         PUT   SYSPRINT,=133CL1' '
         MVC   SPRINT,=133CL1'-'
         MVC   SPRINT+2(7),=C'ARQUIVO'
         MVC   SPRINT+31(9),=C'REGISTROS'
         MVC   SPRINT+45(10),=C'BPXWDYN RC'
         PUT   SYSPRINT,SPRINT
         OPEN  (ENTRADA,INPUT)
         ZAP   NAP,=P'0'
         BAL   R9,ALLOCNEW
*
READENTR EQU   *
         GET   ENTRADA,DADOARQ
         PUT   SAIDA,DADOARQ
         AP    CONTREG,=P'1'
         CP    CONTREG,=P'70'
         BL    READENTR
         BAL   R9,UNLLOCN
         BAL   R9,ALLOCNEW
         B     READENTR
*
UNLLOCN  EQU   *
         CLOSE (SAIDA)
         LINK  EP=BPXWDYN,PARAM=(P2ADDR),VL=1
         MVC   DSNAME,PARM01+20
         MVC   SPRINT+2(27),DSNAME
         UNPK  QTDREG,CONTREG
         OI    QTDREG+1,X'F0'
         MVC   SPRINT+34(2),QTDREG
         PUT   SYSPRINT,SPRINT
         BR    R9
*
ALLOCNEW EQU   *
         AP    NAP,=P'1'
         UNPK  NUMDSN,NAP
         OI    NUMDSN+1,X'F0'
         MVC   PARM01+45(2),NUMDSN
*
         LINK  EP=BPXWDYN,PARAM=(P1ADDR),VL=1
         LTR   R15,R15
         CVD   R15,R15CVD
         UNPK  BPXM1R15(8),R15CVD+4(4)
         CLI   BPXM1R15+7,C'J'
         BL    BPXPLUS
         MVI   BPXMSG1+14,C'-'
         B     PUTCODE
BPXPLUS  EQU   *
         MVI   BPXMSG1+14,C'+'
PUTCODE  EQU   *
         MVC   SPRINT,=133CL1' '
         OI    BPXM1R15+7,X'F0'
         MVC   SPRINT+46(8),BPXM1R15
         ZAP   CONTREG,=P'0'
         OPEN  (SAIDA,(OUTPUT))
         BR    R9
*
UNLLOC   EQU   *
         CLOSE (SAIDA)
         LINK  EP=BPXWDYN,PARAM=(P2ADDR),VL=1
         BR    R9
*        RETURN (14,12),RC=(15)
***********************************************************************
* PROCEDIMENTOS DE FINALIZAÇÃO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIM      EQU   *
         BAL   R9,UNLLOCN
         PUT   SYSPRINT,=133CL1' '
         PUT   SYSPRINT,=CL133' FIM'
         CLOSE (SYSPRINT)
         CLOSE (ENTRADA)
         L     R13,SAVE_AREA+4
         LM    R14,R12,12(R13)
         LA    R15,0
         BR    R14
***********************************************************************
SAVE_AREA      DS  18F
*
DADOARQ  DS    CL80
NAP      DS    PL4
CONTREG  DS    PL4
NUMDSN   DC    CL2' '
QTDREG   DC    CL2' '
DSNAME   DC    CL27' '
SPRINT   DS    CL133
         DS    CL133
*
P1ADDR   DC    H'100'
PARM01   DC    CL100'ALLOC DD(SAIDA) DA(''DIEGO.A.BPXWDYN.FILE.DATA'') X
               NEW CATALOG TRACKS SPACE(1,1) LRECL(80) RECFM(F,B)'
         CNOP  0,4
P2ADDR   DC    H'14'
PARM02   DC    CL14'FREE DD(SAIDA)'
R15CVD   DS    D
BPXMSG1  DC    0CL133
BPXMSG2  DC    0CL80
         DC    CL15' BPXWDYN R15 = '
BPXM1R15 DS    CL8
         DC    CL110' '
***********************************************************************
ENTRADA  DCB   DDNAME=ENTRADA,                                         X
               DSORG=PS,                                               X
               MACRF=GM,                                               X
               LRECL=0,                                                X
               BLKSIZE=0,                                              X
               RECFM=FB,                                               X
               EODAD=FIM
*
SYSPRINT DCB   DDNAME=SYSPRINT,                                        X
               DSORG=PS,                                               X
               MACRF=PM,                                               X
               LRECL=133,                                              X
               BLKSIZE=0,                                              X
               RECFM=FBA
*
SAIDA    DCB   DDNAME=SAIDA,                                           X
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
