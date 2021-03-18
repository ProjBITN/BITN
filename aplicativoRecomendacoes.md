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
- [7. COTS (Commercial Off-The-Shelf)](#7-cots-commercial-off-the-shelf)
- [8. Casos de uso](#8-casos-de-uso)
- [9. Wireframes](#9-wireframes)
- [10. Diagrama de classes de domínio](#10-diagrama-de-classes-de-domínio)


# 1. Introdução

Este é um documento de especificação de requisitos para um Aplicativo para Recomendações de Filmes, Séries e Livros. 

Este documento descreve os requisitos não-funcionais, modela os requisitos funcionais com casos de uso e modela os conceitos do domínio do problema.



# 2. Informações sobre a empresa 



# 3. Escopo do projeto




# 4. Interessados




# 5. Objetivos funcionais

a) O sistema deverá permitir que qualquer pessoa se cadastre e faça recomendações de Filmes, Séries e Livros.



# 6. Objetivos não-funcionais

a) O sistema deverá utilizar um algoritmo colaborativo para oferecer as recomendações a um determinado membro. 

b) É desejável que o tempo de carga para uma página não seja superior a 5 segundos.

c) A disponibilidade da aplicação deverá atender o padrão 99.99%, em regime 24x7.



# 7. COTS (Commercial Off-The-Shelf)




# 8. Casos de uso

## 8.1. Realizar Login

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


## 8.2. Registrar Usuário

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


## 8.3. Atualizar Perfil
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


## 8.4. Avaliar Conteúdo
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


## 8.5. Cadastrar Conteúdo
**Nome do caso de uso:** Cadastrar Conteúdo (filmes, séries e livros). 

**Resumo:** Após acessar o sistema, o usuário pode cadastrar um novo filme, série ou livro.

**Pré-condições:**
* Ser registrado.

**Pós-condições:**
* Conteúdo enviado para avaliação do administrador do sistema.

**Fluxo principal:** 
1. O usuário realiza o login.
2. Acessa a operação Compartilhe;
3. Seleciona o tipo de conteúdo (filme, série ou livro);
4. Insere as informações necessárias para o cadastro:
- Livro: Título do Post, Titulo do Livro, Nome do Autor, Nome da Editora, Pais de Origem, Ano de Lançamento do Livro, Foto, Nota, Resenha);
- Filme: Título do Post, Título do Filme, Nome do Diretor, Elenco Principal, Pais, Ano, Foto, Nota, Resenhra;
- Série: Título do Post, Título da Série, Nome do Diretor, Elenco Principal, Pais, Ano, Temporada, Foto, Nota, Resenha).
6. Salva e encaminha para avaliação do administrador do sistema.


**Fluxos alternativos:**
Passo 5:
* Caso o usuário não preencha os campos obrigatórios, o sistema indicará com realce e não permitirá que o usuário realize a avaliação.


# 9. Wireframes




# 10. Diagrama de classes de domínio


 
