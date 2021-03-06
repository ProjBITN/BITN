# *Padrões GRASP e GoF* 
## PROJETO: "Aplicativo para Recomendação de Filmes, Séries e Livros."
### Curso de Análise e Desenvolvimento de Sistemas
### Prática Profissional em ADS
### Turmas 05K e 05J
### 1º semestre de 2021

# Introdução

Em Engenharia de Software, um padrão de desenho ou padrão de projeto  (do inglês design pattern) é uma solução geral para um problema que ocorre com frequência dentro de um determinado contexto no projeto de software. Um padrão de projeto não é um projeto finalizado que pode ser diretamente transformado em código fonte ou de máquina, ele é uma descrição ou modelo (template) de como resolver um problema que pode ser usado em muitas situações diferentes. Padrões são melhores práticas formalizadas que o programador pode usar para resolver problemas comuns quando projetar uma aplicação ou sistema. Padrões de projeto orientados a objeto normalmente mostram relacionamentos e interações entre classes ou objetos, sem especificar as classes ou objetos da aplicação final que estão envolvidas. Padrões que implicam orientação a objetos ou estado mutável mais geral, não são tão aplicáveis em linguagens de programação funcional. 
Padrões de projeto residem no domínio de módulos e interconexões. Em um nível mais alto há padrões arquiteturais que são maiores em escopo, usualmente descrevendo um padrão global seguido por um sistema inteiro. 
As características obrigatórias que devem ser atendidas por um padrão de projeto é composto basicamente por 4 (quatro) elementos que são: 
- Nome do padrão;
-	Problema a ser resolvido;
- Solução dada pelo padrão; e
-	Consequências.

Os padrões de projeto: 
-	visam facilitar a reutilização de soluções de desenho - isto é, soluções na fase de projeto do software - e
-	estabelecem um vocabulário comum de desenho, facilitando comunicação, documentação e aprendizado dos sistemas de software.



# Padrões aplicados ao diagrama de classes


## 1. Diagrama de Classes

![Diagrama de Classe](https://github.com/ProjBITN/BITN/blob/main/diagramasClasseSequencia/6.diagramaPadraoProjeto.png)


## 1.1. Polimorfismo

De acordo com o princípio do polimorfismo, a responsabilidade de definir a variação dos comportamentos com base no tipo é atribuída ao tipo para o qual essa variação ocorre. Isto é conseguido utilizando operações polimórficas. O usuário do tipo deve usar operações polimórficas em vez de ramificações explícitas com base no tipo. 


## 1.2. Creator (criador)

A criação de objetos é uma das mais comuns atividades em um sistema orientado a objetos. Descobrir qual classe é responsável por criar objetos é uma propriedade fundamental da relação entre objetos de classes particulares.

Em geral, uma classe B deve ser responsável por criar instâncias de classe A se uma, ou preferencialmente mais, das seguintes afirmações se aplicam:

- Instâncias de B contêm ou agregam instâncias de A;
- Instâncias de B gravam instâncias de A;
- Instâncias de B utilizam de perto instâncias de A;
- Instâncias de B têm as informações de iniciação das instâncias de A e passam isso na criação.




