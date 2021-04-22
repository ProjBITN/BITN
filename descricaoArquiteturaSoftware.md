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


## 5.2. Componentes

Tradicionalmente usado para interfaces gráficas de usuário (GUIs), esta arquitetura tornou-se popular para projetar aplicações web e até mesmo para aplicações móveis, para desktop e para outros clientes. Linguagens de programação populares como Java, C#, Object Pascal/Delphi, Ruby, PHP, JavaScript e outras possuem frameworks MVC populares que são atualmente usados no desenvolvimentos de aplicações web. 


- **Camada de modelo ou da lógica da aplicação (Model)**
Modelo é a ponte entre as camadas Visão (View) e Controle (Controller), consiste na parte lógica da aplicação, que gerencia o comportamento dos dados através de regras de negócios, lógica e funções. Esta fica apenas esperando a chamada das funções, que permite o acesso para os dados serem coletados, gravados e, exibidos

É o coração da execução, responsável por tudo que a aplicação vai fazer a partir dos comandos da camada de controle em um ou mais elementos de dados, respondendo a perguntas sobre o sua condição e a instruções para mudá-las. O modelo sabe o que o aplicativo quer fazer e é a principal estrutura computacional da arquitetura, pois é ele quem modela o problema que está se tentando resolver. Modela os dados e o comportamento por trás do processo de negócios. Se preocupa apenas com o armazenamento, manipulação e geração de dados. É um encapsulamento de dados e de comportamento independente da apresentação. 


- **Camada de apresentação ou visualização (View)**

Visão pode ser qualquer saída de representação dos dados, como uma tabela ou um diagrama. É onde os dados solicitados do Modelo (Model) são exibidos É possível ter várias visões do mesmo dado, como um gráfico de barras para gerenciamento e uma visão tabular para contadores. A Visão também provoca interações com o usuário, que interage com o Controle (Controller). O exemplo básico disso é um botão gerado por uma Visão, no qual um usuário clica e aciona uma ação no Controle

Não se dedica em saber como o conhecimento foi retirado ou de onde ela foi obtida, apenas mostra a referência. Segundo Gamma et al (2006), ”A abordagem MVC separa a View e Model por meio de um protocolo inserção/notificação (subscribe/notify). Uma View deve garantir que sua expressão reflita o estado do Model. Sempre que os dados do Model mudam, o Model altera as Views que dependem dele. Em resposta, cada View tem a oportunidade de modificar-se”. Adiciona os elementos de exibição ao usuário : HTML, ASP, XML, Applets. É a camada de interface com o usuário. É utilizada para receber a entrada de dados e apresentar visualmente o resultado. 


- **Camada de controle ou controlador (Controller)**

Controle é o componente final da tríade, faz a mediação da entrada e saída, comandando a visão e o modelo para serem alterados de forma apropriada conforme o usuário solicitou através do mouse e teclado. O foco do Controle é a ação do usuário, onde são manipulados os dados que o usuário insere ou atualiza, chamando em seguida o Modelo

O Controle (Controller) envia essas ações para o Modelo (Model) e para a janela de visualização (View) onde serão realizadas as operações necessárias. 

# 6. Requisitos e Restrições Arquiteturais


# 7. Visão de Casos de Uso

## 7.1. Caso de Uso 

A figura a seguir apresenta o diagrama de casos de uso:
![Caso de Uso](https://github.com/ProjBITN/BITN/blob/main/casoDeUso/caso-de-uso.png)

## 7.2.  Realização de Casos de Uso

| **Ator**     | **Descrição**   | 
| ------|-----|-----|
| Usuário Comum  	| Usuário que somente pode utilizar as funcionalidades padrão do aplicativo	|
| Usuário Administrador	| Usuário que pode utilizar as funcionalidades padrão e outras funcionalidades exclusivas	| 


