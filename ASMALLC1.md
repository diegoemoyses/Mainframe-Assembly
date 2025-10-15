## Programa em Assembler Mainframe para demonstrar o uso da macro BPXWDYN


#### Informações sobre a macro BPXWDYN podem ser encontradas no link abaixo

https://www.ibm.com/docs/en/zos/2.4.0?topic=output-requesting-allocation-information


#### Arquivos:

* <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/JOBPXWDY.jcl">JOBPXWDY.jcl</a>  - Job em JCL contendo:

  <strong>Step01</strong> - Execução do programa  <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/CONTDSN.asm">CONTDSN</a> para exibir a quantidade de registros para fim de comparação.<br><br>
 <strong> Step02</strong> - Execução do programa  <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/ASMALLC1.asm">ASMALLC1</a> aonde os dados do arquivo ENTRADA serão divididos, neste exemplo, em 70 registros por arquivo.

<br><br>

#### Resultado da execução do job  <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/JOBPXWDY.jcl">JOBPXWDY.jcl</a>:<br><br>
          
<strong>Step01</strong> - Exibindo a quantidade de registros do arquivo com a execução do programa <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/CONTDSN.asm">CONTDSN</a>.
<br><br>
![Resultado.](https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/JOBPXWDYstep01.png)

<br><br>
<strong>Step02</strong> - A execução do programa <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/ASMALLC1.asm">ASMALLC1</a> aonde para cada 70 registros será criado um novo arquivo.
<br><strong>Obs:</strong> o campo  BPXWDYN RC é referente
ao return code da operação da macro BPXWDYN ao alocar o novo arquivo.
<br><br>
![Resultado.](https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/JOBPXWDYstep02.png)
