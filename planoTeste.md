---
title: "Aplicativo para Recomendação de Filmes, Séries e Livros."
author: "Grupo BITN"
---


**Índice**

- [1. Introdução](#1-introdução)
  - [1.1 Objetivos](#11-objetivos)
  - [1.2 BITn](#12-bitn)
  - [1.3 Escopo](#13-escopo)
  - [1.4 Identificação de Projeto](#14-identificação-de-projeto)
- [2. Requisitos a Testar](#2-requisitos-a-testar)
- [3. Estratégia de Teste](#3-estratégia-de-teste)
- [4. Recursos](#4-recursos)
  - [4.1 Recursos Humanos](#41-recursos-humanos)
  - [4.2 Recursos Sistemas](#42-recursos-de-sistemas)
- [5. Cronograma](#5-cronograma)



# 1. Introdução



## 1.1 Objetivos

Esse documento do Plano de Testes do "Aplicativo para Recomendação de Filmes, Séries e Livros". compõe-se dos seguintes objetivos:
- Identificar informações de projeto existentes e os componentes de software que devem ser testados.
- Listar os Requisitos a Testar.
- Recomendar e descrever as estratégias de teste a serem empregadas.
- Identificar os recursos necessários e prover uma estimativa dos esforços de teste.
- Listar os elementos resultantes do projeto de testes.


## 1.2 BITN
A empresa BITn desenolve sistemas voltados para a área do entretenimento.

## 1.3 Escopo
O escopo deste projeto trata do teste unitário e do teste de sistema da aplicação web desenvolvida pelo grupo BITn, cujo objetivo é permitir que o usuário faça recomendações de filmes, Séries e livros.

## 1.4 Identificação de Projeto

A tabela abaixo identifica a documentação e disponibilidade usados para desenvolver o plano de testes:

| **Documento**      |  **Criado ou Disponível**     | **Recebido ou Revisado** |
| ------|-----|-----|
| Especificação de Requisitos  	| (X) SIM / ( ) NÃO 	| ( ) SIM / (X) NÃO 	|
| Diagramas		| (X) SIM / ( ) NÃO 	| ( ) SIM / (X) NÃO  	|
| Protótipo		| ( ) SIM / (X) NÃO  	| ( ) SIM / (X) NÃO 	|




# 2. Requisitos a Testar

A tabela abaixo identifica aqueles itens – use cases, requisitos funcionais e não funcionais – que foram identificados como alvos de teste. 

|   Rercurso      |   Subrecurso    |    Resultado  |   Observação   |
| ------|-----|-----|-----|
| Criar Usuário 	         |     	| 	  | 	  |
| Login Inválido        	|     	| 	  | 	  |
| Esqueci a Senha       	|     	| 	  | 	  |
| Efetuar Logon Comum   	|     	| 	  | 	  |
| Efetuar Logon Administrativo	 |     	| 	  | 	  |
| Alterar Perfil Usuário 	|   Textos e Senha 	| 	  | 	  |
| Alterar Perfil Usuário	|   Foto Principal 	| 	  | 	  |
| Alterar Perfil Usuário	|   Foto Miniatura 	| 	  | 	  |
| Alterar Perfil Usuário 	|   Fundo         	| 	  | 	  |
| Criar Post Livros       |   Com Foto       	| 	  | 	  |
| Criar Post Livros       |   Sem Foto       	| 	  | 	  |
| Criar Post Séries       |   Com Foto       	| 	  | 	  |
| Criar Post Séries       |   Sem Foto       	| 	  | 	  |
| Criar Post Filmes       |   Com Foto       	| 	  | 	  |
| Criar Post Filmes       |   Sem Foto       	| 	  | 	  |
| Visualizar Post         |   Livros         	| 	  | 	  |
| Visualizar Post         |   Séries         	| 	  | 	  |
| Visualizar Post         |   Filmes         	| 	  | 	  |
| Validar Post (User ADM) |   Visualizar     	| 	  | 	  |
| Validar Post (User ADM) |   Autorizar      	| 	  | 	  |
| Validar Post (User ADM) |   Negar          	| 	  | 	  |
| Alterar Dados do Post   |   Livros         	| 	  | 	  |
| Alterar Dados do Post   |   Séries         	| 	  | 	  |
| Alterar Dados do Post   |   Filmes         	| 	  | 	  |
| Testar Like             |   Avaliações     	| 	  | 	  |
| Criar Amigos            |                  	| 	  | 	  |
| Desfazer Amizades       |                  	| 	  | 	  |
| Meus Últimos Posts      |                  	| 	  | 	  |
| Últimos Visitados       |                  	| 	  | 	  |
| Recomendados            |                  	| 	  | 	  |
| Avaliações Recentes     |                  	| 	  | 	  |
| Testar Tela do Perfil   |                  	| 	  | 	  |
| Performance             |                  	| 	  | 	  |
| Logoff                  |                  	| 	  | 	  |


# 3. Estratégia de Teste

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
| Terminal do Usuário |  |


# 5. Cronograma

| **Milestone**      |  **Data de Início**     | **Data de Término** |
| ------|-----|-----|
| Planejar Teste 	|     	| 	|
| Projetar Teste	|   	|   	|
| Implementar Teste		|    	|   	|
| Executar Teste		|    	|   	|
| AvaliarTeste		|    	|   	|
