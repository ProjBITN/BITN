---
title: "Aplicativo para Recomendação de Filmes, Séries e Livros."
author: "Grupo BITN"
---


**Índice**

- [1. Introdução](#1-introdução)
  - [1.1 Objetivos](#11-objetivos)
  - [1.2 Grupo BITn](#12-grupo-bitn)
  - [1.3 Escopo](#13-escopo)
  - [1.4 Identificação de Projeto](#14-identificação-de-projeto)
- [2. Requisitos a Testar](#2-requisitos-a-testar)
- [3. Estratégia de Teste](#3-estratégia-de-teste)
  - [3.1 Teste de Integridade de Dados e do Banco de Dados](#31teste-de-integridade-de-dados-e-do-banco-de-dados)
  - [3.2 Teste de Função](#32teste-de-função)
  - [3.3 Teste de Inteface do Usuário](#33teste-de-inteface-do-usuário)
  - [3.4 Teste de Performance](#34teste-de-performance)
  - [3.5 Teste de Carga](#35teste-de-carga)
  - [3.6 Teste de Segurança e Controle de Acesso](#36-teste-de-segurança-e-controle-de-acesso)
- [4. Recursos](#4-recursos)
  - [4.1 Recursos Humanos](#41-recursos-humanos)
  - [4.2 Recursos Sistemas](#42-recursos-de-sistemas)
- [5. Cronograma](#5-cronograma)
- [5. Conclusão](#6-conclusão)



# 1. Introdução



## 1.1 Objetivos

Esse documento do Plano de Testes do "Aplicativo para Recomendação de Filmes, Séries e Livros". compõe-se dos seguintes objetivos:
- Identificar informações de projeto existentes e os componentes de software que devem ser testados.
- Listar os Requisitos a Testar.
- Recomendar e descrever as estratégias de teste a serem empregadas.
- Identificar os recursos necessários e prover uma estimativa dos esforços de teste.
- Listar os elementos resultantes do projeto de testes.


## 1.2 Grupo BITN
O grupo BITn desenolve sistemas voltados para a área do entretenimento.

## 1.3 Escopo
O escopo deste projeto trata do teste unitário e do teste de sistema da aplicação web desenvolvida pelo grupo BITn, cujo objetivo é permitir que o usuário faça recomendações de filmes, Séries e livros.

## 1.4 Identificação de Projeto

A tabela abaixo identifica a documentação e disponibilidade usados para desenvolver o plano de testes:

| **Documento**      |  **Criado ou Disponível**     | **Recebido ou Revisado** |
| ------|-----|-----|
| Especificação de Requisitos  	| (X) SIM / ( ) NÃO 	| (X) SIM / ( ) NÃO 	|
| Diagramas		| (X) SIM / ( ) NÃO 	| (X) SIM / ( ) NÃO  	|
| Protótipo		| (X) SIM / ( ) NÃO  	| (X) SIM / ( ) NÃOO 	|




# 2. Requisitos a Testar

A tabela abaixo identifica aqueles itens – use cases, requisitos funcionais e não funcionais – que foram identificados como alvos de teste. 

|   Rercurso      |   Subrecurso    |    Resultado  |   Observação   |
| ------|-----|-----|-----|
| Criar Usuário 	        |                 	|   Realizado com sucesso	 | 	  |
| Login Inválido        	|                  	| 	Realizado com sucesso  | 	  |
| Esqueci a Senha       	|                 	| 	Realizado com sucesso  | 	  |
| Efetuar Logon Comum   	|     	            | 	Realizado com sucesso  | 	  |
| Efetuar Logon Administrativo	 |           	| 	Realizado com sucesso  | 	  |
| Alterar Perfil Usuário 	|   Textos e Senha 	| 	Realizado com sucesso  | 	  |
| Alterar Perfil Usuário	|   Foto Principal 	| 	Realizado com sucesso  | 	  |
| Alterar Perfil Usuário	|   Foto Miniatura 	| 	Realizado com sucesso  | 	  |
| Alterar Perfil Usuário 	|   Fundo         	| 	Realizado com sucesso  | 	  |
| Criar Post Livros       |   Com Foto       	| 	Realizado com sucesso  | 	  |
| Criar Post Livros       |   Sem Foto       	| 	Realizado com sucesso  | 	  |
| Criar Post Séries       |   Com Foto       	| 	Realizado com sucesso  | 	  |
| Criar Post Séries       |   Sem Foto       	| 	Realizado com sucesso  | 	  |
| Criar Post Filmes       |   Com Foto       	| 	Realizado com sucesso  | 	  |
| Criar Post Filmes       |   Sem Foto       	| 	Realizado com sucesso  | 	  |
| Visualizar Post         |   Livros         	| 	Realizado com sucesso  | 	  |
| Visualizar Post         |   Séries         	| 	Realizado com sucesso  | 	  |
| Visualizar Post         |   Filmes         	| 	Realizado com sucesso  | 	  |
| Validar Post (User ADM) |   Visualizar     	| 	Realizado com sucesso  | 	  |
| Validar Post (User ADM) |   Autorizar      	| 	Realizado com sucesso | 	  |
| Validar Post (User ADM) |   Negar          	| 	Realizado com sucesso  | 	  |
| Alterar Dados do Post   |   Livros         	| 	Realizado com sucesso  | 	  |
| Alterar Dados do Post   |   Séries         	| 	Realizado com sucesso  | 	  |
| Alterar Dados do Post   |   Filmes         	| 	Realizado com sucesso  | 	  |
| Testar Like             |   Avaliações     	| 	Realizado com sucesso  | 	  |
| Criar Amigos            |                  	| 	Realizado com sucesso  | 	  |
| Desfazer Amizades       |                  	| 	Realizado com sucesso  | 	  |
| Meus Últimos Posts      |                  	| 	Realizado com sucesso | 	  |
| Últimos Visitados       |                  	| 	Realizado com sucesso  | 	  |
| Recomendados            |                  	| 	Realizado com sucesso  | 	  |
| Avaliações Recentes     |                  	| 	Realizado com sucesso  | 	  |
| Testar Tela do Perfil   |                  	| 	Realizado com sucesso  | 	  |
| Performance             |                  	| 	Realizado com sucesso  | 	  |
| Logoff                  |                  	| 	Realizado com sucesso  | 	  |


# 3. Estratégia de Teste

*Nota: As transações abaixo se referem às “transações lógicas de negócio”. Essas transações são definidas como funções específicas que um usuário final do sistema é suposto de executar ao usar a aplicação, tais como adicionar ou modificar uma dada informação.*

## 3.1	Teste de Integridade de Dados e do Banco de Dados

**Objetivo do Teste:** 
- Garantir que os métodos e processos de acesso ao banco de dados funcionam apropriadamente e sem corrupção dos dados.

**Técnica:** 
- Invocar cada método e processo de acesso ao banco de dados, alimentando cada um com dados ou requisições de dados válidos e inválidos. 
- Inspecionar o banco de dados para garantir que os dados foram populados como pretendido, que todos os eventos do banco de dados ocorreram apropriadamente, ou revisar os dados retornados para garantir que os dados corretos foram recuperados pelas razões corretas.

**Critério de Finalização:**
- Todos os métodos e processos de acesso à base de dados funcionam como projetados e sem nenhuma corrupção de dados.

**Considerações Especiais:**
-	Processos devem ser invocados manualmente
-	Bases de dados pequenas ou minimizadas (número de registros limitados) devem ser usados para aumentar a visibilidade de eventos não-aceitáveis.



## 3.2	Teste de Função

**Objetivo do Teste:**
- Garantir a funcionalidade apropriada do alvo do teste, incluindo navegação, entrada de dados, processamento, e recuperação.

**Técnica:**
- Executar cada caso de uso, fluxo de caso de uso, usando dados válidos e inválidos, para verificar o seguinte:
  - Os resultados esperados ocorrem quando dados válidos são usados
  - As mensagens de erro ou aviso apropriadas são exibidas quando dados inválidos são usados.
  - Cada regra de negócio é aplicada apropriadamente.


**Critério de Finalização:**
- Todos os testes planejados foram executados.
- Todos os defeitos identificados foram tratados.


**Considerações Especiais:**
- Nenhum.



## 3.3	Teste de Inteface do Usuário

**Objetivo do Teste:**
- Verificar o seguinte:
  - A navegação através dos alvos de teste reflete as funções e os requisitos do negócio apropriadamente, incluindo janela-a-janela, campo-a-campo, e o uso de métodos de acesso (tecla tab, movimentos do mouse, teclas aceleradoras)
  - Objetos e características da janela, tais como menus, tamanho, posição, estado e foco conformam-se aos padrões.


**Técnica:**
- Criar ou modificar os testes para cada janela para verificar a navegação e os estados de objeto apropriados para cada janela e objetos da aplicação.

**Critério de Finalização:**
- É verificado que cada janela permanece consistente com a versão de comparação ou dentro de padrões aceitáveis. 

**Considerações Especiais:**
- Nenhum.


## 3.4	Teste de Performance

**Objetivo do Teste:**
- Verificar que os comportamentos de performance para as transações designadas ou funções de negócio sob as seguintes condições:
  - Carga de trabalho normal antecipada
  - Carga de trabalho no pior caso antecipada

**Técnica:**
- Usar Procedimentos de Teste desenvolvidos para Teste da Função ou Ciclo de Negócio
- Modificar os arquivos de dados para aumentar o número de transações ou os scripts para aumentar o número de iterações que ocorre a cada transação.
- Scripts devem ser rodados em uma máquina (melhor caso para comparar um único usuário, uma única transação) e ser repetidas com múltiplos usuários.

**Critério de Finalização:**
- Único usuário ou transação: finalização com sucesso dos scripts de testes sem nenhuma falha e dentro da alocação de tempo por transação esperada ou requisitada.
- Múltiplas transações ou usuários: finalização bem sucedida dos scripts de teste sem qualquer falha e dentro da alocação de tempo aceitável. 

**Considerações Especiais:**
- Nenhum.



## 3.5	Teste de Carga

**Objetivo do Teste:**
- Verifique o tempo de resposta para as transações designadas ou casos de negócio sob condições variantes de carga de trabalho.

**Técnica:**
-	Use testes desenvolvidos para o Teste do Ciclo de Negócio ou Função.

**Critério de Finalização:**
- Múltiplas transações ou usuários: finalização bem sucedida dos testes sem qualquer falha e dentro da alocação de tempo aceitável.

**Considerações Especiais:**
- Nenhum.


## 3.6 Teste de Segurança e Controle de Acesso

**Objetivo do Teste:**
- Segurança do Nível de Aplicação:  Verifique que um ator pode acessar apenas aquelas funções ou dados para os quais o seu tipo de usuário tem permissão. 
-	Segurança do Nível de Sistema:  Verifique que apenas aqueles atores com acesso ao sistema e aplicações têm permissão de acessá-los.

**Técnica:**
- Segurança do Nível de Aplicação:  Identifique e liste cada tipo de usuário e as funções ou dados para os quais cada tipo tem permissão.
- Crie testes para cada tipo de usuário e verifique cada permissão criando transações específicos para cada tipo de usuário.
- Modifique o tipo de usuário e repita os testes para os mesmos usuários. Em cada caso, verifique que funções ou dados adicionais estão corretamente disponíveis ou negados.

**Critério de Finalização:**
- Para cada tipo de ator conhecido as funções ou dados apropriados estão disponíveis, e todas as transações funcionam como esperado e rodam nos Testes de Função anteriores.

**Considerações Especiais:**
-O Acesso ao sistema deve ser revisado ou discutido com o  administrador  de rede ou de sistema apropriado. Esse teste pode não ser necessário já que ele pode ser uma função da administração da rede ou sistema.




# 4. Recursos
Essa seção apresenta os recursos recomendados para o projeto do "Aplicativo para Recomendação de Filmes, Séries e Livros", suas principais responsabilidades, e seus conhecimentos ou conjunto de habilidades.

## 4.1 Recursos Humanos

| **Trabalhador**      |  **Recursos Minímos Recomendados**     | **Responsabilidades Específicas ou Comentários** |
| ------|-----|-----|
|<ul><li>Gerente de Teste</li><li>Gerente do Projeto de Teste</li></ul>  	| NOME 	| <ul><li>Fornece supervisionamento gerencial.</li><li>Responsabilidades: provê direcionamento técnico; adquire recursos; apropriados; fornece relatórios de gerenciamento</li></ul>|
|<ul><li>Test Designer</li></ul>  	| NOME 	| <ul><li>Identifica, prioriza, e implementa os casos de teste.</li><li>Responsabilidades: gera o plano de teste; cria o modelo de teste; avalia a efetividade do esforço de teste</li></ul>|
|<ul><li>Testador</li></ul>  	| NOME 	| <ul><li>Executa os testes.</li><li>Responsabilidades: executar os testes; registrar os resultados; reestabelecer-se dos erros; documentar solicitações de mudança</li></ul>|
|<ul><li>Administrador do Sistema de Teste</li></ul>  	| NOME 	| <ul><li>Garante que o ambiente e os bens de teste sejam gerenciados e mantidos.</li><li>Responsabilidades: administrar o sistema de gerenciamento teste; instalar e gerenciar o acesso do trabalhador ao sistema de testes</li></ul>|
|<ul><li>Gerente do Banco de Dados</li><li>Administrador do Banco de Dados</li></ul>  	| NOME 	| <ul><li>Garante que o ambiente e bens de teste de dados (banco de dados) sejam gerenciados e mantidos.</li><li>Responsabilidades: administrar os dados de teste (base de dados)</li></ul>|
|<ul><li>Designer</li></ul>  	| NOME 	| <ul><li>GIdentifica e define as operações, atributos, e associações das classes de teste.</li><li>Responsabilidades: cria as classes e pacotes de teste implementados no modelo de teste</li></ul>|
|<ul><li>Implementador</li></ul>  	| NOME 	| <ul><li>Implementa e faz os testes unitários das classes e pacotes de teste. </li><li>Responsabilidades: cria as classes e pacotes de teste implementados no modelo de teste</li></ul>|



## 4.2 Rercursos de Sistemas

A tabela seguinte expõe os recursos do sistema para o projeto de teste.

| **Recursos do Sistema** | **Descrição** |
| ------|------|
| Servidor de Banco de Dados | |
| Terminal do Usuário | 1 COMPUTADOR COM ACESSO A INTERNET |


# 5. Cronograma

| **Milestone**      |  **Data de Início**     | **Data de Término** |
| ------|-----|-----|
| Planejar Teste     	|    22/03/2021    	|       04/04/2021   	|
| Projetar Teste	    |    22/03/2021   	|       04/04/2021   	|
| Implementar Teste		|    04/04/2021    	|       15/05/2021   	|
| Executar Teste		  |    04/04/2021    	|       15/05/2021   	|
| Avaliar Teste	    	|    04/04/2021    	|       15/05/2021   	|







