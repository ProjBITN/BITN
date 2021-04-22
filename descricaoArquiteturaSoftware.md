# *Arquitetura de Software* 
## PROJETO: "Aplicativo para Recomendação de Filmes, Séries e Livros."
### Curso de Análise e Desenvolvimento de Sistemas
### Prática Profissional em ADS
### Turmas 05K e 05J
### 1º semestre de 2021

# 1. Introdução

Neste documento iremos detalhar as principais partes da arquitetura proposta para o desenvolvimento de sistemas BITn. A arquitetura de software de um sistema consiste na definição dos componentes de software, suas propriedades externas, e seus relacionamentos com outros softwares. O termo também se refere à documentação da arquitetura de software do sistema. A documentação da arquitetura do software facilita: a comunicação entre os stakeholders,registra as decisões iniciais acerca do projeto de alto-nível, e permite o reúso do projeto dos componentes e padrões entre projetos. 


# 2. Objetivo

O Documento de Arquitetura do Software provê uma visão geral da arquitetura, usando um conjunto de visões arquiteturais para tratar aspectos diferentes do software.
Este documento serve como um meio de comunicação entre o Arquiteto de Software e outros membros da equipe de projeto sobre as decisões significativas que forem tomadas durante o projeto.


# 3. Considerações Gerais

As definições arquiteturais de um projeto de desenvolvimento de software em geral seguem as definições necessárias aos vários projetos de uma organização ou instituição e que atenda a todas as necessidades do projeto, desde a segurança, regras de negócio, até a persistência dos dados.
Para tanto, as definições do projeto já documentadas até o presente momento devem guiar as primeiras versões do Documento de Arquitetura do Software, que é desenvolvido durante a fase de Elaboração, uma vez que o propósito dessa fase é estabelecer os fundamentos arquiteturais para o projeto do software.


# 4. Responsabilidades

O Arquiteto de Software é o responsável por elaborar este documento e por manter a integridade do mesmo durante o processo de desenvolvimento do software. Ele deve:
- Aprovar todas as mudanças arquiteturais significativas e documentá-las.
- Fazer parte do comitê que decide sobre os problemas que tenham algum impacto arquitetural. 


# 5. Representação Arquitetural

O padrão de arquitetura será o MVC que separa a interação entre software e usuário. 

![MVC](https://github.com/ProjBITN/BITN/blob/main/arquiteturaSoftware/atuacao_das_camadas_mvc.png)


## 5.1. MVC

MVC é o acrônimo de Model-View-Controller (em português: Arquitetura Modelo-Visão-Controle - MVC) é um padrão de projeto de software, ou padrão de arquitetura de software formulado na década de 1970, focado no reuso de código e a separação de conceitos em três camadas interconectadas, onde a apresentação dos dados e interação dos usuários (front-end) são separados dos métodos que interagem com o banco de dados (back-end)

Normalmente usado para o desenvolvimento de interfaces de usuário que divide uma aplicação em partes (camadas/componentes) interconectadas. Isto é feito para separar representações de informação internas dos modos como a informação é apresentada para e aceita pelo usuário, levando ao desenvolvimento paralelo de maneira eficiente. 


### 5.1.1 Componentes

Tradicionalmente usado para interfaces gráficas de usuário (GUIs), esta arquitetura tornou-se popular para projetar aplicações web e até mesmo para aplicações móveis, para desktop e para outros clientes. Linguagens de programação populares como Java, C#, Object Pascal/Delphi, Ruby, PHP, JavaScript e outras possuem frameworks MVC populares que são atualmente usados no desenvolvimentos de aplicações web. 




