# Café com Dados - RAIS
Este repositório contém o material e as anotações usadas para a conversa sobre os microdados da Relação Anual de Informações Sociais (RAIS). Essa apresentação é focada para o Stata.

#  Pré-análise
Antes de analisar com mais profundidade as informações, é necessário entender questões relacionadas a como a base de dados é construída. Para essa seção, são usadas as informações disponibilizadas pelo Ministério da Economia para a RAIS de 2019.

## O que é a RAIS?
A RAIS não é nada mais que um recurso do Governo Federal para coletar informações sobre o mercado de trabalho formal brasileiro. De acordo com o Ministério da Economia, o seu objetivo é:

1) Suprir às necessidades de controle da atividade trabalhista no País,
2) Prover dados para a elaboração de estatísticas do trabalho,
3) Disponibilizar informações do mercado de trabalho às entidades governamentais.

## Quem deve declarar a RAIS?
Abaixo, segue a listagem de quem deve declarar a RAIS.

1) Inscritos no Cadastro Nacional de Pessoas Jurídicas - CNPJ com ou sem empregados – o estabelecimento que não possuiu empregados ou manteve suas atividades paralisadas durante o ano-base está obrigado a entregar a RAIS Negativa;
2) Todos os empregadores, conforme definidos na CLT;
3) Todas as pessoas jurídicas de direito privado, inclusive as empresas públicas domiciliadas no País, com registro, ou não, nas Juntas Comerciais, no Ministério da Fazenda, nas secretarias de Finanças ou da Fazenda dos governos estaduais e nos cartórios de registro de pessoa jurídica;
4) Empresas individuais, inclusive as que não possuem empregados;
5) Cartórios extrajudiciais e consórcios de empresas;
6) Empregadores urbanos pessoas físicas (autônomos e profissionais liberais) que mantiveram empregados no ano-base;
7) Órgãos da administração direta e indireta dos governos federal, estadual ou municipal, inclusive as fundações supervisionadas e entidades criadas por lei, com atribuições de fiscalização do exercício das profissões liberais;
8) Condomínios e sociedades civis;
9) Empregadores rurais pessoas físicas que mantiveram empregados no ano-base;
10) Filiais, agências, sucursais, representações ou quaisquer outras formas de
entidades vinculadas à pessoa jurídica domiciliada no exterior.

## Quem é relacionado?
Abaixo, segue a listagem de quem deve ser relacionado na RAIS.

1) Empregados contratados por empregadores, pessoa física ou jurídica, sob o regime da CLT, por prazo indeterminado ou determinado, inclusive a título de experiência;
2) Servidores da administração pública direta ou indireta, federal, estadual ou municipal, bem como das fundações supervisionadas;
3) Trabalhadores avulsos (aqueles que prestam serviços de natureza urbana ou rural a diversas empresas, sem vínculo empregatício, com a intermediação obrigatória do órgão gestor de mão-de-obra, nos termos da Lei nº 8.630, de 25 de fevereiro de 1993, ou do sindicato da categoria);
4) Empregados de cartórios extrajudiciais;
5) Trabalhadores temporários, regidos pela Lei nº 6.019, de 3 de janeiro de 1974;
6) Trabalhadores com Contrato de Trabalho por Prazo Determinado, regido pela Lei nº 9.601, de 21 de janeiro de 1998;
7) Diretores sem vínculo empregatício, para os quais o estabelecimento/entidade tenha optado pelo recolhimento do FGTS (Circular CEF nº 46, de 29 de março de 1995);
8) Servidores públicos não-efetivos (demissíveis ad nutum ou admitidos por meio de legislação especial, não regidos pela CLT);
9) Trabalhadores regidos pelo Estatuto do Trabalhador Rural (Lei nº 5.889, de 8 de junho de 1973);
10) Aprendiz (maior de 14 anos e menor de 24 anos), contratado nos termos do art. 428 da CLT, regulamentado pelo Decreto nº 5.598, de 1º de dezembro de 2005;
11) Trabalhadores com Contrato de Trabalho por Tempo Determinado, regido pela Lei nº 8.745, de 9 de dezembro de 1993, com a redação dada pela Lei nº 9.849, de 26 de outubro de 1999;
12) Trabalhadores com Contrato de Trabalho por Prazo Determinado, regido por lei estadual;
13) Trabalhadores com Contrato de Trabalho por Prazo Determinado, regido por lei municipal;
14) Servidores e trabalhadores licenciados;
15) Servidores públicos cedidos e requisitados; e
16) Dirigentes sindicais.

## Quem não é relacionado?
Abaixo, segue a listagem de quem não deve ser relacionado na RAIS.

1) Diretores sem vínculo empregatício para os quais não é recolhido FGTS;
2) Autônomos;
3) Eventuais;
4) Ocupantes de cargos eletivos (governadores, deputados, prefeitos, vereadores, conselheiro tutelar, etc.), a partir da data da posse, desde que não tenham feito opção pelos vencimentos do órgão de origem;
5) Estagiários regidos pela Portaria MTPS nº 1.002, de 29 de setembro de 1967, e pela Lei nº 11.788, de 25 de setembro de 2008;
6) Empregados domésticos regidos pela Lei nº 11.324/2006 e Lei Complementar 150 de junho de 2015;
7) Cooperados ou cooperativados;
8) Trabalhadores afastados por processos judiciais em tramite, ocorrido no ano anterior ao da declaração do ano-base 2019;
9) Diretores e assessores de órgãos, institutos e fundações dos partidos, quando remunerados com valor mensal igual ou superior a 2 (duas) vezes o limite máximo do benefício do Regime Geral de Previdência Social;

## Como é declarada?
Através de um sistema fornacido pelo Governo Federal, que se chama Programa Gerador de Declaração RAIS (GDRAIS2019).

## Tá, mas qual a moral dessa história?
Calma, senhor apressadinho, só estou começando.
Primeiro, é importante entender como a base funciona porque talvez ela não se encaixe para a análise que você queira fazer. Ela não te serve, por exemplo, para um estudo sobre os empregados domésticos.
Segundo, saber que os dados são informações administrativas postadas em um sistema explica o porquê de algumas variáveis serem problemáticas.
Por fim, e talvez o que acho mais importante, é que não existe informalidade no mundinho RAIS BR.

# Análise
Agora que vocês entenderam um pouco sobre como a base é construída, it's time for the estimations! Pero antes, vamos falar um pouco de como se tem organizado e analisado as bases da RAIS

## Organização
Existem dois tipos de RAIS: a de vínculos e a de estabelecimentos. Para esse minicurso, vamos analisar a RAIS vínculos, em que cada observação é um contrato (não confundir com indivíduo, já que é possível que uma pessoa tenha mais de um vínculo formal). Caso a sua vontade seja analisar as intituições em geral, utiliza-se a RAIS estabelecimentos.
Além disso, é possível classificar entre a base identificada e não-identificada. A diferença entre uma e outra é que a primeira possui algumas variáveis que identificam quem é o contratado (CPF e nome) e quem é a instituição (CNPJ e nome dela), enquanto a segunda não possui essas informações. Por isso, para ter acesso aos dados identificados, é necessário preencher alguns formulários do Ministério da Economia, ao passo que a não-identificada é de acesso público.

## O dicionário
Deixei um arquivo .xls para acesso ao dicionário da RAIS. Caso não consiga fazê-lo, é possível obtê-lo através do link http://pdet.mte.gov.br/microdados-rais-e-caged. Particularmente, acho que o dicionário é bem mais simples que de outras bases de dados públicas, como a PNADC e o Censo, já que a premissa de compilar a base a partir de dados administrativos 

## A base de dados



# Links de referências

1) Site da RAIS: http://www.rais.gov.br/sitio/index.jsf
2) Onde se extrai os microdados da RAIS: http://pdet.mte.gov.br/microdados-rais-e-caged



