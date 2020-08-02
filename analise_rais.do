***RAIS 2017 - AMAPÁ***

*Vamos estimar uma equação de salários para os contratos do Amapá
*Mesmo tratando a base mais leve da RAIS, eu ainda tenho que dar memória ao Stata
set memo 300m

*Como as variáveis no arquivo txt está separado por ;, então uso o comando insheet.
*Ele é utilizado quando os dados possuem delimitação e é composto por duas parte nesse caso:
*A primeira chama o arquivo onde está a base que quero importar ao Stata.
*A segunda eu descrevo qual é a delimitação. Como ela não é um número, devo escrever entre aspas.
insheet using "C:\Dados\Rais\AP2017.txt", delimiter (";")
tab vnculoativo3112 //No total, são 166.058 contratos.

*A primeira coisa que faço é deixar apenas os contratos ativos em 31/12.
keep if  vnculoativo3112 == 1
tab  vnculoativo3112 //127.550 contratos

*Depois, elimino algumas variáveis inúteis para análise, pois quero que a base fique mais leve
drop bairrossp bairrosfortaleza bairrosrj distritossp regiesadmdf //Eliminando as regiões administrativas de outras UFs
drop vlremjaneirocc vlremfevereirocc vlremmarocc vlremabrilcc //Eliminando os salários dos meses 1, 2, 3 e 4
drop vlremmaiocc vlremjunhocc vlremjulhocc vlremagostocc //Eliminando os salários dos meses 5, 6, 7 e 8
drop vlremsetembrocc vlremoutubrocc vlremnovembrocc //Eliminando os salários dos meses 9, 10 e 11
drop faixaetria faixahoracontrat faixaremundezemsm faixaremunmdiasm faixatempoemprego //Eu posso criar minhas próprias variáveis de faixas com as que a base me disponibilizam
drop v43 //Já temos variável mais ampla que indique o tipo de estabelecimento

*E vamos criar o logaritmo de salário-hora para ser a variável dependente
*A variável de salário é o salário nominal de dezembro, já que estamos analisando a foto de 31/12
*Façamos um sum dessa variável
sum vlremundezembronom

*Atenção: Stata é um software que usa como o ponto como separador decimal, enquanto a Rais
*considera a vírgula como separador decimal. Dessa forma, a variável de salário nominal é considerada
*string. Para isso, usamos o comando destring com a opção dpcomma, que faz as duas coisas ao mesmo tempo:
destring vlremundezembronom, replace dpcomma //Transformando em uma variável numérica
sum vlremundezembronom //Deu certo!

*Criando a variável de salário em salário-hora
gen salario =  vlremundezembronom //Facilita escrever o nome da variável
gen sh = salario/(qtdhoracontr*4.33) //Tranformando salário mensal em salário hora
gen y = ln(sh) //Calculando o logaritmo do salário-hora
drop if y == . //Nesse processo, alguns valores missings são gerados. Eles não importam na análise
			   // 118.229 contratos

*Queremos estimar um modelo em função da idade, sexo e cor. Vamos pedir as estatísticas descritivas de cada uma delas
*Idade e idade ao quadrado
sum idade //Tudo ok com essa variável. Vamos criar o seu quadrado.

gen idade2 = idade*idade
sum idade2

*Raça/cor
tab raacor, m //Olha a quantidade de missings! Vamops ignorar essa variável pois não vale a pena
			//Esse é o poder da omissão de informações. Não consigo fazer uma análise direito de raça ou cor com a RAIS.

*Escolaridade
tab escolaridadeaps2005, m //Variável categórica! Vamos ver se o ensino superior

gen superior = .
replace superior = 1 if escolaridadeaps2005 == 9
replace superior = 1 if escolaridadeaps2005 == 10
replace superior = 1 if escolaridadeaps2005 == 11
replace superior = 0 if superior == .

tab superior

*Sexo do trabalhador
tab sexotrabalhador, m //Tenho que colocar 0 para mulheres!

recode sexotrabalhador 2 = 0

*Hora de rodar uma regressão!
reg y idade idade2 superior sexotrabalhador, r
