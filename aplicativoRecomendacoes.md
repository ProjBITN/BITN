---
title: "Aplicativo para Recomendação de Filmes, Séries e Livros."
author: "Grupo BNTI"
---


**Índice**

- [1. Introdução](#1-introdução)
- [2. Informações sobre a empresa](#2-informações-sobre-a-empresa)
- [3. Escopo do projeto](#3-escopo-do-projeto)
- [4. Interessados](#4-interessados)
- [5. Objetivos funcionais](#5-objetivos-funcionais)
- [6. Objetivos não-funcionais](#6-objetivos-não-funcionais)
- [7. Casos de uso](#8-casos-de-uso)
  - [7.1. Realizar Login](#71-realizar-login)  
  - [7.2. Registrar Usuário](#72-registrar-usuário)  
  - [7.3. Atualizar Perfil](#73-atualizar-perfil)  
  - [7.4. Avaliar Conteúdo](#74-avaliar-conteúdo)  
  - [7.5. Cadastrar Conteúdo](#75-cadastrar-conteúdo)  
  - [7.6. Acessar Avaliações Realizadas](#76-acessar-avaliações-realizadas)  
  - [7.7. Pesquisar Usuário](#77-pesquisar-usuário)  
  - [7.8. Solicitar Amizade](#78-solicitar-amizade)  
  - [7.9. Curtir Publicação](#79-curtir-publicação)  
  - [7.10. Mostrar Amigos em Comum](#710-mostrar-amigos-em-comum)  
  - [7.11. Mostrar Relatório](#711-mostrar-relatório)  
  - [7.12. Indicar Conteúdo](#712-indicar-conteúdo)
  - [7.13. Sugerir Amizade](#713-sugerir-amizade)
- [8. Wireframes](#8-wireframes)
- [9. Diagrama de classes de domínio](#9-diagrama-de-classes-de-domínio)


# 1. Introdução

Este é um documento de especificação de requisitos para um Aplicativo para Recomendações de Filmes, Séries e Livros. 

Este documento descreve os requisitos não-funcionais, modela os requisitos funcionais com casos de uso e modela os conceitos do domínio do problema.



# 2. Informações sobre a empresa 



# 3. Escopo do projeto




# 4. Interessados

Esse aplicativo tem como público-alvo pessoas que tem interesse em publicar coonteúdo e discutir sobre livros, filmes e séries.


# 5. Objetivos funcionais

O sistema deve permitir que qualquer pessoa, dependendo do seu nível de acesso, possa usufruir das seguintes funcionalidades: 
- Esqueci minha senha;
- Tipos de Usuários:
	- Padrão;
	- Administrador.
	
- Dashboard (Pagina de Perfil Padrão):
	- Avaliações;
	- Objetos Enviados;
	- Objetos assistidos / lidos;
	- Meus amigos;
	- Botão para seguir / desmarcar;
	- É preciso confirmar a solicitação de amizade;
	- Perfis seguidos (Amigos);
	- Compartilhar comentários;
	- Ao efetuar logon salvar o último acesso;
	- Acrescer contador de acesso.
	
- Dashboard (Pagina de Perfil Administrador):
	- Cadastrar Usuários;
	- Cadastrar / Autorizar Objetos;
	- Resumo dos 10 mais conectados (Contador de acesso);
	- Resumo / gráfico de numero de usuários por estado.

- É possível realizar buscar por:
	- Filmes;
	- Series;
	- Livros;
	- Usuários.

- É possível curtir e/ou vizualizar:
	- Filmes;
	- Series;
	- Livros;
	- Perfis;
	- Comentários;
	- Exibir totalizadores de curtidas.

- Na página principal, o usuário poderá: 
	- Vizualizar Filmes, Séries e Livros (Objeto);
	- Filtrar por objeto (Filmes, Séries e Livros);
	- Buscar por nome;
	- Atribir nota;
	- Realizar comentários;
	- Sugerir conteúdo (o usuario pode sugerir, mas liberação depende do administrador, isto é, se não existe cadastra; se existe vincula);
	- Tipos de objetos a disposição do usuário:
		- Filmes (título, diretor, elenco principal, país, ano.);
		- Séries (título, diretor, elenco principal, país, ano, número de temporadas);
		- Livros (título, autor(es), editora, país, ano de lançamento).

		



# 6. Objetivos não-funcionais

a) O sistema deverá utilizar um algoritmo colaborativo para oferecer as recomendações a um determinado membro. 

b) É desejável que o tempo de carga para uma página não seja superior a 5 segundos.

c) A disponibilidade da aplicação deverá atender o padrão 99.99%, em regime 24x7.




# 7. Casos de uso

A figura a seguir apresenta o diagrama de casos de uso:

## 7.1. Realizar Login


**Nome do caso de uso:** Acesso do Usuário 

**Resumo:** Para ganhar acesso a informações restritas ou personalizadas, fazer recomendações ou avaliar conteúdo, um usuário precisa se autenticar e o sistema determinará seu nível de acesso.

**Pré-condições:**
* O usuário já se registrou.

**Pós-condições:**
* O usuário pode obter informações e realizar funções disponíveis para o seu nível de acesso.

**Fluxo principal:** 
1. O usuário seleciona a operação para efetuar o login.
2. O sistema solicita o seu *username* e a sua senha.
3. O usuário entra seu *username*  e sua senha.
4. O sistema verifica que o *username* e a senha correspondem às informações de um de seus usuários registrados.
5. O sistema inicia uma sessão.

**Fluxos alternativos:**
Passo 4:
* Se o *username* ou a *senha* são inválidos (podendo ser ambos inválidos), o sistema retorna a mensagem "Login ou senha Inválida" e o caso de uso retorna para o passo 2.


## 7.2. Registrar Usuário

**Nome do caso de uso:** Registro do Usuário 

**Resumo:** Para ter acesso a informações restritas ou personalizadas, fazer recomendações ou avaliar conteúdo, o usuário precisa realizar um cadastro.

**Pré-condições:**
* Não ser registrado.

**Pós-condições:**
* O usuário pode acessar informações e realizar funções disponíveis para o seu nível de acesso.

**Fluxo principal:** 
1. O usuário seleciona a operação Cadastre-se.
2. O usuário preencher os dados solicitados (Nome, E-mail, Data de Nascimento, Cidade, Estado, Usuário e Senha).
3. O usuário solicita que a criação da conta.
4. O sistema verifica se as informações não constam em seu banco de dados.
5. O usuário é criado.

**Fluxos alternativos:**
Passo 4:
* Se os dados já constarem no sistema, o usuário é recebe a mensagem "Usuário já Cadastrado"


## 7.3. Atualizar Perfil
**Nome do caso de uso:** Atualização de Dados do Usuário

**Resumo:** Cada membro poderá, a qualquer momento, atualizar os dados do seu perfil.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* O usuário pode acessar informações e altera-las em seu perfil.

**Fluxo principal:** 
1. O usuário realiza o login.
2. O usuário seleciona Perfil, em seu menu de opções.
3. Acessa a opção Editar Perfil, que aparecerá após a página de usuário ser carregada.
4. O sistema verifica se o usuário editou algum dado e/ou preencheu os campos obrigatórios.
5. O Perfil é atualizado.

**Fluxos alternativos:**
Passo 4:
* Caso o usuário não preencha os campos obrigatórios, o sistema indicará com realce e não permitirá que o usuário atualize o cadastro.


## 7.4. Avaliar Conteúdo
**Nome do caso de uso:** Avaliação de Conteúdo

**Resumo:** Após acessar o sistema, cada membro poderá avaliar os filmes, séries e livros que desejar.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* A avaliação feita pelo usuário será publicada.

**Fluxo principal:** 
1. O usuário realiza o login.
2. O usuário, em sua pagina principal, vizualiza os conteúdos já publicados.
3. Seleciona o conteúdo que quiser avaliar.
4. Seleciona a opção Adiconar Comentário.
5. Informa uma nota e inclui um comentário obrigatório.
6. O sistema publica a avaliação.

**Fluxos alternativos:**
Passo 5:
* Caso o usuário não preencha os campos obrigatórios, o sistema indicará com realce e não permitirá que o usuário realize a avaliação.


## 7.5. Cadastrar Conteúdo
**Nome do caso de uso:** Cadastrar Conteúdo (filmes, séries e livros). 

**Resumo:** Após acessar o sistema, o usuário pode cadastrar um novo filme, série ou livro.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Conteúdo enviado para avaliação do administrador do sistema.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa a operação Compartilhe.
3. Seleciona o tipo de conteúdo (filme, série ou livro).
4. Insere as informações necessárias para o cadastro:
- Livro: Título do Post, Titulo do Livro, Nome do Autor, Nome da Editora, Pais de Origem, Ano de Lançamento do Livro, Foto, Nota, Resenha;
- Filme: Título do Post, Título do Filme, Nome do Diretor, Elenco Principal, Pais, Ano, Foto, Nota, Resenhra;
- Série: Título do Post, Título da Série, Nome do Diretor, Elenco Principal, Pais, Ano, Temporada, Foto, Nota, Resenha.
6. Salva e encaminha para avaliação do administrador do sistema.

**Fluxos alternativos:**
Passo 4:
* Caso o usuário não preencha os campos obrigatórios, o sistema indicará com realce e não permitirá que o usuário envie o conteúdo.


## 7.6. Acessar Avaliações Realizadas
**Nome do caso de uso:** Acesso as Avaliações. 

**Resumo:** Cada membro terá uma página pessoal que listará todas as avaliações que ele já realizou.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Vizualizar todas as publicações realizadas.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa a opção Perfil no menu de opções do usuário;
3. O usuário visualiza em sua página pessoal:
- Meus Artigos;
- Meus Amigos;
- Amigos em Comum;
- Minhas Avaliações.

**Fluxos alternativos:**
Passo 3:
* Caso o usuário não tenha realizado nenhuma avalição, o sistema exibirá a mensagem "Nenhum Comentário Disponível".


## 7.7. Pesquisar Usuário
**Nome do caso de uso:** Pesquisar Usário 

**Resumo:** Descrição:	Os membros logados poderão pesquisar por outros membros pelo nome e acessar as suas páginas pessoais.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Acesso a página pessoal de outros usuários.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa a operação Buscar Novos Amigos.
3. Insere o nome do outro usuário que pretende buscar.
4. Seleciona a pessoa que está procurando.
5. Acessa a página pessoal do usuário selecionado.

**Fluxos alternativos:**
Passo 3:
* Caso o sitema não encontre o usuário que está sendo procurado, exibirá a mensagem "Usuário não encontrado".


## 7.8. Solicitar Amizade
**Nome do caso de uso:** Solicitação de Amizade

**Resumo:** Descrição:Cada membro poderá propor relacionamento de amizade a outro membro. O relacionamento de amizade será estabelecido quando o outro membro aceitar a proposta.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Estabelecimento de um vínculo de amizade entre dois usuários.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa a operação Buscar Novos Amigos.
3. Insere o nome do outro usuário que pretende buscar.
4. Seleciona a pessoa que está procurando.
5. Acessa a página pessoal do usuário selecionado.
6. Seleciona a opção Solcitar Amizade e aguarda o aceite do outro usuário.
7. Após o outro usuário aceitar a proposta, o vinculo de amizade é criado.

**Fluxos alternativos:**
Passo 3:
* Caso o sitema não encontre o usuário que está sendo procurado, exibirá a mensagem "Usuário não encontrado".


## 7.9. Curtir Publicação
**Nome do caso de uso:** Curtir Publicação de Outro Usuário.

**Resumo:** Descrição:	Um membro poderá das um "joinha" nas avaliações de outro membro. Em cada avaliação aparecerá o número de "joinhas" que ela já recebeu. O membro que deu o “joinha” para a avaliação poderá retirá-lo posteriormente se assim desejar.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Conteúdo “curtido”.

**Fluxo principal:** 
1. O usuário realiza o login.
2. A página principal é exibida.
3. São exibidos conteúdos publicados por membros.
4. O usuário vizualiza uma postagem de seu interesse.
5. E curte a publicação clicando no "joinha".

**Fluxos alternativos:**
Passo 3:
* O usuário curtiu a publicação por engano e pode corrigir o erro clicando no “botão de curtir” novamente.


## 7.10. Mostrar Amigos em Comum
**Nome do caso de uso:** Mostra Amigos em Comum Entre os Membros.

**Resumo:** Descrição:	Quando um membro acessar a página de outro, o sistema deverá mostrar os amigos que eles têm em comum.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Acesso a lista de amigos em comum.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa o perfil de outro membro;
3. O usuário visualiza página pessoal do outro, onde encontra as informações:
- Meus Artigos;
- Meus Amigos;
- Amigos em Comum;
- Minhas Avaliações.

**Fluxos alternativos:**
Passo 3:
* O sistema não identifica amizades em comum.


## 7.11. Mostrar Relatório
**Nome do caso de uso:** Mostra um relatório.

**Resumo:** Descrição:	O sistema apresenta um relatório ao administrador. 

**Pré-condições:**
* Ser registrado como administrador.

**Pós-condições:**
* Acesso a um relatório de performance .

**Fluxo principal:** 
1. O usuário (administrador) realiza o login.
2. Acessa a opção Performance no menu do usuário.
3. Na nova tela são exibidos dados sobre:
- Amigos (Ativos);
- Média (Relacionados);
- Total de Artigos (Ativos);
- Total de Artigos ( A Validar);
- Top 10 - Membros Mais conectados;
- Densidade Demográfica Usuários. 

**Fluxos alternativos:**
Passo 2:
* O sistema não identifica o usuário como administrador, portanto, não lhe mostra a opção Performance.


## 7.12. Indicar Conteúdo
**Nome do caso de uso:** Indicação de Conteúdo.

**Resumo:** Descrição:	Após o sistema ter pelo menos 10 membros cadastrados e cada membro entrar em pelo menos 10 avaliações, o sistema passará a apresentar para cada membro recomendações de filmes, séries e livros que podem ser de seu interesse.

**Pré-condições:**
* Ter pelo menos 10 membros cadastrados e cada membro entrar em pelo menos 10 avaliações.

**Pós-condições:**
* O sistema indica o conteúdo.

**Fluxo principal:** 
1. O sistema identifica que há mais de 10 usuários cadastrados.
2. Em seguida identifica que cada usuário fez 10 ou mais avaliações.
3. O sistema passa a indicar o conteúdo com base no histórico de avaliações.

**Fluxos alternativos:**
Passo 1:
* Não há 10 membros cadastrados e/ou não há 10 avaliações.


## 7.13. Sugerir Amizade
**Nome do caso de uso:** Sugestão de amizade

**Resumo:** Descrição:	Sempre que um membro acessar o sistema, ele deverá receber a sugestão de 3 membros que poderiam ser seus amigos. O critério será sugerir membros que têm preferências semelhantes, com base nas avaliações já realizadas.

**Pré-condições:**
* Membros com preferências semelhantes, com base nas avaliações já realizada.

**Pós-condições:**
* Vincular membros.

**Fluxo principal:** 
1. Usuário realiza o login.
2. Na página principal aparecem 3 sugestões de amizade.
3. O usuário seleciona ou não outro membro.

**Fluxos alternativos:**
Passo 2:
* O sistema não identificou membros com preferências semelhantes, pois não há avaliações feitas pelo usuário para servir como parâmetro.




# 8. Wireframes

## 8.1. Tela de Cadastro

![Tela Inicial](diagramas/tela-inicial.png)


# 9. Diagrama de classes de domínio


 
