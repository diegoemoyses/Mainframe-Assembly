## Programa em Assembly Mainframe de Balance Line com ou sem correspondentes.


####  Balance Line com ou sem correspondentes

O programa realiza uma comparação entre dois arquivos de contas correntes (ARQA e ARQB) gerando um terceiro arquivo de contas correntes 
(ARQC), que conterá o registro dos dados intercalados do ARQA e ARQB utilizando como chave a conta corrente e agencia:
<br>

* ARQA e ARQB forem iguais, ARQB será gravado em ARQC.

* ARQA for maior que ARQB, ARQB será gravado em ARQC.

* ARQA for menor que ARQB, ARQA que será gravado em ARQC.
<br>

####  Layout dos arquivos: 

* 1  à 6 : numérico contendo agencia e conta.
* 7  à 26: alphanumérico nome do titular da conta
* 27 à 35: numérico saldo da conta
* 36 à 80: filler

<br>

#### Dados de ARQA:
321234ABREU DE SOUZA      000110200<br> 
323455JOAO DE DEUS        000006735<br> 
326754ALFREDO JR          000376400<br> 
351454JAIR OLIVEIRA       000053490<br> 
352455LUIZ DE LIMA        000007499<br> 
425679HELENA DA LUZ       000024574<br>


#### Dados de ARQB:
321234ABREU DE SOUZA      000281256<br>
322419ANTONIA OLIVEIRA    000198422<br>
352455LUIZ B. DE LIMA     000002050<br>
507723MARCILIO NOE        000027330<br>
922976ANGELA FERREIRA     000014300<br> 

#### Arquivos:

* <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/JOBBLN01.jcl">JOBBLN01.jcl</a>  - Job em JCL para a ordenação dos conjuntos de dados e a execução do programa em Assembly.
* <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/PASMBLN1.asm">PASMBLN1.asm</a> - Código fonte do programa Assembly.

<br><br>

#### Resultado da execução do job  <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blame/main/JOBBLN01.jcl">JOBBLN01.jcl</a>:
          

![Resultado.](https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/CONTCORC.png)
                                                        
