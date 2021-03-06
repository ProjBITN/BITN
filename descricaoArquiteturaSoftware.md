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

## 3.1 Ferramentas 
As ferramentas utilizadas para a elaboração do projeto:
- Para desenvolvimento: Netbeans e Dreamvweaver;
- Para Framework: Bootstrap;
- API disponível no https://developers.google.com/.
 

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

Visão pode ser qualquer saída de representação dos dados, como uma tabela ou um diagrama. É onde os dados solicitados do Modelo (Model) são exibidos. É possível ter várias visões do mesmo dado, como um gráfico de barras para gerenciamento e uma visão tabular para contadores. A Visão também provoca interações com o usuário, que interage com o Controle (Controller). O exemplo básico disso é um botão gerado por uma Visão, no qual um usuário clica e aciona uma ação no Controle

Não se dedica em saber como o conhecimento foi retirado ou de onde ela foi obtida, apenas mostra a referência. Segundo Gamma et al (2006), ”A abordagem MVC separa a View e Model por meio de um protocolo inserção/notificação (subscribe/notify). Uma View deve garantir que sua expressão reflita o estado do Model. Sempre que os dados do Model mudam, o Model altera as Views que dependem dele. Em resposta, cada View tem a oportunidade de modificar-se”. Adiciona os elementos de exibição ao usuário : HTML, ASP, XML, Applets. É a camada de interface com o usuário. É utilizada para receber a entrada de dados e apresentar visualmente o resultado. 


- **Camada de controle ou controlador (Controller)**

Controle é o componente final da tríade, faz a mediação da entrada e saída, comandando a visão e o modelo para serem alterados de forma apropriada conforme o usuário solicitou através do mouse e teclado. O foco do Controle é a ação do usuário, onde são manipulados os dados que o usuário insere ou atualiza, chamando em seguida o Modelo

O Controle (Controller) envia essas ações para o Modelo (Model) e para a janela de visualização (View) onde serão realizadas as operações necessárias. 

# 6. Requisitos e Restrições Arquiteturais


# 7. Visão de Casos de Uso

## 7.1. Realização de Casos de Uso

| **Ator**     | **Descrição**  |
| ------|-----|
| Usuário Comum  	| Usuário que somente pode utilizar as funcionalidades padrão do aplicativo	|
| Usuário Administrador	| Usuário que pode utilizar as funcionalidades padrão e outras funcionalidades exclusivas	| 


- A figura a seguir apresenta o diagrama de casos de uso:
![Caso de Uso](https://github.com/ProjBITN/BITN/blob/main/casoDeUso/caso-de-uso.png)

## 7.1. Descrição dos Casos de Uso

| **Caso de Uso**     | **Descrição**  |
| ------|-----|
| Realizar Login 	| Para ganhar acesso a informações restritas ou personalizadas, fazer recomendações ou avaliar conteúdo, um usuário precisa se autenticar e o sistema determinará seu nível de acesso.|
| Registrar Usuário	|  Para ter acesso a informações restritas ou personalizadas, fazer recomendações ou avaliar conteúdo, o usuário precisa realizar um cadastro.	| 
| Atualizar Perfil	|  Cada membro poderá, a qualquer momento, atualizar os dados do seu perfil.	| 
| Cadastrar Conteúdo |  Após acessar o sistema, o usuário pode cadastrar um novo filme, série ou livro.| 
| Acessar Avaliações Realizadas |  Cada membro terá uma página pessoal que listará todas as avaliações que ele já realizou.| 
| Pesquisar Usuário | Os membros logados poderão pesquisar por outros membros pelo nome e acessar as suas páginas pessoais.| 
| Solicitação de Amizade | Cada membro poderá propor relacionamento de amizade a outro membro. O relacionamento de amizade será estabelecido quando o outro membro aceitar a proposta.|
| Curtir Publicação de Outro Usuário.| Um membro poderá das um "joinha" nas avaliações de outro membro. Em cada avaliação aparecerá o número de "joinhas" que ela já recebeu. O membro que deu o “joinha” para a avaliação poderá retirá-lo posteriormente se assim desejar.|
| Mostrar Amigos em Comum  | Quando um membro acessar a página de outro, o sistema deverá mostrar os amigos que eles têm em comum. |
| Vizualizar Relatório  | O sistema apresenta um relatório ao administrador. |
| Indicar Conteúdo  | Após o sistema ter pelo menos 10 membros cadastrados e cada membro entrar em pelo menos 10 avaliações, o sistema passará a apresentar para cada membro recomendações de filmes, séries e livros que podem ser de seu interesse. |
|Sugerir Amizade | Sempre que um membro acessar o sistema, ele deverá receber a sugestão de 3 membros que poderiam ser seus amigos. O critério será sugerir membros que têm preferências semelhantes, com base nas avaliações já realizadas. |
| Avaliar Conteúdo Cadastrado |O adminitrador valida o conteúdo cadastrado pelo usuário comum.|

# 8. Visão Lógica

![Descrição - MVC](https://github.com/ProjBITN/BITN/blob/main/arquiteturaSoftware/diagramaMVC2.png)

## 8.1. Camadas

- Model - É nessa camada que se implementa as classes que serão responsáveis por definir as informações que estarão presentes na tabela de dados (banco de dados) e como esses dados serão acessados , validados e relacionados, isto é, a model é responsável por conter todas as informações referentes à manipulação de dados.

- Controller - É camada controller que fica responsável pelo fluxo do usuário na aplicação. Esta é usada para comunicação com a Model e renderização das Views, com informações procedentes da Model.

- View - É onde os dados solicitados do Modelo (Model) são exibidos. 


# 9. Diagrama de Classes

![Diagrama de Classe](https://github.com/ProjBITN/BITN/blob/main/diagramasClasseSequencia/6.diagramaPadraoProjeto.png)

## 9.1 Padrões aplicados ao diagrama de classes

- **Polimorfismo**

De acordo com o princípio do polimorfismo, a responsabilidade de definir a variação dos comportamentos com base no tipo é atribuída ao tipo para o qual essa variação ocorre. Isto é conseguido utilizando operações polimórficas. O usuário do tipo deve usar operações polimórficas em vez de ramificações explícitas com base no tipo. 


- **Creator (criador)**

A criação de objetos é uma das mais comuns atividades em um sistema orientado a objetos. Descobrir qual classe é responsável por criar objetos é uma propriedade fundamental da relação entre objetos de classes particulares.

Em geral, uma classe B deve ser responsável por criar instâncias de classe A se uma, ou preferencialmente mais, das seguintes afirmações se aplicam:

- Instâncias de B contêm ou agregam instâncias de A;
- Instâncias de B gravam instâncias de A;
- Instâncias de B utilizam de perto instâncias de A;
- Instâncias de B têm as informações de iniciação das instâncias de A e passam isso na criação.





