# Café com Dados - RAIS
Este repositório contém o material e as anotações usadas para a conversa sobre os microdados da Relação Anual de Informações Sociais (RAIS). Saber o nome dela é importante pois desde o começo é indicado que sua periodicidade é anual. Essa apresentação é focada para o Stata.

#  Pré-análise
Antes de analisar com mais profundidade os microdados, é necessário entender questões relacionadas a como a base de dados é construída. Para essa seção, são usadas as informações disponibilizadas pelo Ministério da Economia para a RAIS de 2019.

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

## Em resumo, o que eu tenho com essas informações?
A partir disso, eu tenho que:

1) Pelo próprio nome da RAIS, eu sei que ela possui uma periodicidade anual. A pesar disso, os pesquisadores costumam usar a foto dos dias 31/12 para fazer as suas análises. Existem variáveis que tornam possível extrair essa informação, como é possível visualizar no dicionário.

2) Saber quem entra ou quem não entra na base é importante para o desenho da investigação. Sabemos que vários atores do mercado de trabalho formal estão inclusos nos microdados, como celetistas, servidores públicos, trabalhadores avulsos, aprendizes e dirigentes sindicais. Entretanto, a base acaba por não incluir temas importantes, como a informalidade, o estágio e o trabalho doméstico.

3) É super importante saber qual foi forma como as informações são extraídas. No caso de informações de questionário, por exemplo, eu posso consultar como uma pergunta é feita caso não tenha entendido uma informação do dicionário. No caso da RAIS, o preenchimento de um formulário dentro um sistema dá mais nuances a certas variáveis da base, principalmente no que diz respeito às informações pessoais. Como em geral existe um grupo de pessoas dentro de uma organização que preenche esse sistema, é bem comum que haja omissões e erros.

# Análise
Agora que já entendemos um pouco sobre como a base é construída e como isso impacta, já podemos falar um pouco de como os microdados são organizados e sobre o seu dicionário.

## Organização
Nessa parte, peguei algumas informações do GitHub do Guilherme Jacob e de alguns materiais que ele usa, que fez algo parecido com o que estou fazendo mas usando o R. O link está disposto no final da apresentação.

Existem dois tipos de RAIS. A primeira delas é a de vínculos, em que cada observação de la é um contrato. Aqui, peço cuidado para não confundir com indivíduo, já que é possível que uma pessoa tenha mais de um vínculo formal. O Július de Todo Mundo Odeia o Cris, por exemplo, apareceria duas vezes na RAIS se os empregos dele são formalizados. Dessa forma, ela é mais utilizada para análises de relações trabalhistas. O segundo tipo é a de estabelecimentos, ideal caso o seu foco sejam as empresas.

Existe também os dados da Caged, que são dados mensais bem parecidos com a RAIS que, inclusive, podem ser extraídos no mesmo link que a RAIS. Não vou entrar em detalhes maiores nesse sentido para não sairmos do nosso foco.

## Dicionário
Deixei um arquivo .xls para acesso ao dicionário da RAIS de 2018, a mais recente até o momento, para fins de apresentação. Caso não consiga fazê-lo, é possível obtê-lo através do link de referências que deixei mais embaixo com a explicação na seçao seguinte. Na minha não tão humilde opinião (sou de leão), o dicionário é bem mais simples que de outras bases de dados públicas, como a PNADC e o Censo, já que ela não possui tantas variáveis. Sugiro que esteja sempre com esse arquivo aberto, pois ele salva vidas.

## A base de dados
Hora de extrair a base! Quero que abra o segundo link na aba seguinte, aperte um botão verde escrito "clique aqui" (ao lado de "Para acessar a base"), e siga: RAIS/ - 2017/ - AP2017.7z para baixar o arquivo compactado referente ao Amapá do ano de 2017. Ao descompactá-lo, você terá acesso ao arquivo .txt referente ao estado. Quero que deixe em uma pasta no disco C, cujo caminho é C:\Dados\Rais\.

Também é possível baixar o dicionário, ou layout, nesse link, mas seguindo o caminho RAIS/ - Layouts/ - vínculos/ - rais_vinculos_layout_2017.xls.

Irei estimar uma equação de salários para os contratos formais no estado de Amapá. Deixo um do-file com comentários nesse repositório.


# Links de referências

1) Site da RAIS: http://www.rais.gov.br/sitio/index.jsf
2) Onde se extrai os microdados da RAIS e o seu layout: http://pdet.mte.gov.br/microdados-rais-e-caged
3) Explicação da CAGED e outros detalhes da RAIS, por Guilherme Jacob: https://guilhermejacob.github.io/2017/11/rais-caged-r/
4) Um apresentação de Luiz Júnior, com outros detalhes: https://www.ufjf.br/econs/files/2010/05/RAIS-e-CAGED-Introdu%c3%a7%c3%a3o-%c3%a0s-Bases-de-Dados-12-de-Abril-de-2010.pdf
5) Simples Nacional: http://www8.receita.fazenda.gov.br/SimplesNacional/Documentos/Pagina.aspx?id=3
6) Diferença entre CEI e CNPJ: https://apoyofinanceiro.com.br/blog/post/qual-a-diferenca-entre-cei-e-cnpj



