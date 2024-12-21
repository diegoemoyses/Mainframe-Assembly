## Programa em Assembly Mainframe para o cálculo de medidas de tendências centrais.

### Definição da medidas de tendências centrais:
<br>

>São usadas para resumir os dados em torno de um valor típico da amostra. Essas medidas consistem em uma parte fundamental da estatística descritiva, isto é, quando almejamos sumarizar e dar sentido aos dados que temos em mãos.  - <a href="https://www.blog.psicometriaonline.com.br/medidas-de-tendencia-central-media-mediana-e-moda"/>Psicometria.online</a> 
<br>

* **Moda:** valor com a maior ocorrência no conjudo de dados.

* **Mediana**: o valor central de um conjunto de dados.

* **Média aritmética (simples):** a soma de todos os dados do conjunto dividido pela quantidade de elementos.

<br>

### Arquivos:

* <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/JOBESTAT.jcl">JOBESTAT.jcl</a>  - Job em JCL para a ordenação do conjunto de dados e a execução do programa em Assembly.
* <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/ESTATI01.asm">ESTATI01.asm</a> - Código fonte do programa Assembly que realiza o cálculo da moda, mediana e média.

<br>

### Conjunto de dados utilizado:
>000021 000251 000257 000288 000156 000257 000087 000229 000081 000216 000050 000168 000036 000250 000257 000140 000100 000041 000295 000192 000256 000238 000257 
000293 000267 000181 000157 000227 000073 000100 000100 000166 000102 000167 000219 000022 000002 000253 000275 000047 000163

<br>

### Resultado da execução do job  <a href="https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/JOBESTAT.jcl">JOBESTAT.jcl</a>:
<br>

*********** DADOS DO CONJUNTO INFORMADO  ***********    
                                                        
  QTD DE ELEMENTOS 000041                               
SOMA DOS ELEMENTOS 0069,37                              
                                                        
                                                        
**** MEDIDAS DE TENDENCIAS CENTRAIS DO CONJUNTO *****   
                                                        
  MEDIA 0001,69                                         
   MODA 0002,57                                         
MEDIANA 000167                      

<br>

![Resultado.](https://github.com/diegoemoyses/Mainframe-Assembly/blob/main/ESTATI01.png)
                                                        
