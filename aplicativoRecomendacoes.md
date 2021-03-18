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
* Se o *username* ou a *senha* são invalidos (podendo ser ambos inválidos), o sistema retorna a mensagem "Login ou senha Inválida" e o caso de uso retorna para o passo 2.


## 8.2. Registrar usuário

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



# 9. Wireframes




# 10. Diagrama de classes de domínio


 
