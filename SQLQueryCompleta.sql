/*#########-----SELECT------#################################################################################*/
--Selecionando todas as colunas-variaveis de uma tabela
--SELECT * FROM tabela
SELECT * 
FROM person.Person;

SELECT * 
FROM person.EmailAddress;

--Selecionando uma coluna-variavel especifica de uma tabela
--SELECT coluna FROM tabela
SELECT Title 
FROM person.person;

--Desafio: A equipe de marketing precisa fazer uma pesquisa sobre nomes mais comuns de seus clientes e precisa do nome e sobrenome de todos os clientes que estão cadastrados no sistema.
--Dica colunas first name, last name
--SELECT coluna1, coluna2 FROM tabela
SELECT FirstName, lastName 
FROM person.person;

/*#########-----DISTINCT------#################################################################################*/ 
--Selecionando valores não duplicados de uma variavel
--SELECT DISTINCT coluna1, coluna2 FROM tabela
SELECT DISTINCT FirstName 
FROM person.person;

--Desafio: Quantos nomes sobrenomes únicos tempos em nossa tabela person.person?
SELECT DISTINCT LastName 
FROM person.person;

/*#########-----WHERE------#################################################################################*/
--Selecionando apenas alguns valores da tabela
--SELECT coluna1, coluna2, coluna_n FROM tabela WHERE condicao
/*Operadores logicos:
OPERADOR - DESCRICAO
   =	   igual
   >       maior que
   <       menor que
   >=      maior que ou igual
   <=      menor que ou igual
   <>      diferente de
   AND     operador logico 'e' 
   OR      operador logico 'ou'
*/
--Igual a algum valor
SELECT *
FROM person.person
WHERE lastName = 'miller'
--Igual a algum valor de uma coluna e outro valor de outra coluna
SELECT * 
FROM person.person
WHERE lastName = 'miller' AND firstName = 'anna'
--Igual a algum valor
SELECT * 
FROM production.Product
WHERE color = 'blue'
--Igual a algum valor ou outro valor
SELECT * 
FROM production.Product
WHERE color = 'blue' OR color = 'black'
--Maior que algum valor
SELECT * 
FROM production.Product
WHERE ListPrice > 1500
--Intervalo de valores maior que e menor que
SELECT *
FROM production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000
--Diferente de algum valor
SELECT * 
FROM production.Product
WHERE color <> 'red'

--DESAFIO: A equipe de producao de produtos precisa do nome de todoas as pecas que pesam mais que 500kg, mas nao mais que 700kg para inspecao
--Selecionando o nome unico sem repeticao
SELECT DISTINCT Name 
FROM production.Product WHERE Weight > 500 AND Weight < 700 
--Selecionando com duas colunas para exibicao
SELECT Name, Weight 
FROM production.Product WHERE Weight > 500 AND Weight < 700
--DESAFIO: Foi pedido pelo marketing uma relacao de todos os empregados (employees) que sao casados (single=solteiro, married = casado) e sao assalariados (salaried)
SELECT * 
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1
--DESAFIO: Um usuario chmado Peter Krebs esta devendo um pagamento, consiga o e-mail dele para que possamos enviar uma cobranca (utilizar as tabelas person.person e person.emailaddress)
--Identificando o usuario e seu ID
SELECT *
FROM person.person
WHERE FirstName = 'peter' AND LastName = 'Krebs'
--Identificando o e-mail com o ID do usuario
SELECT * 
FROM person.EmailAddress
WHERE BusinessEntityID = 26

/*#########-----COUNT------#################################################################################*/
--Contegem de todas as colunas da tabela
--SELECT COUNT(*) FROM tabela
--Contagem especifca de um campo uma coluna
--SELECT COUNT(coluna) FROM tabela
--Contagem especifica de um campo uma coluna sem repeticao ou valores nulos
--SELECT COUNT(DISTINCT coluna) FROM tabela
SELECT COUNT(title)
FROM person.person

SELECT COUNT(DISTINCT title)
FROM person.person

--DESAFIO: Quantos produtos temos cadastrados em nossa tabela de produtos? Dica: production.product
SELECT COUNT (*)
FROM Production.Product

SELECT COUNT(ProductID)
FROM production.product

--DESAFIO: Quantos tamanhos de produtos temos cadastrado em nossa tabela
SELECT COUNT(Size)
FROM production.product

SELECT COUNT(DISTINCT Size)
FROM production.product

/*#########-----TOP------#################################################################################*/
--Limitar a quantidade de valores apresentados em uma consulta
--SELECT TOP numero * FROM tabela
SELECT TOP 10 *
FROM Production.Product

--ORDER BY
--Ordernar os resultados por uma coluna em ordem crescente ou decrescente
--SELECT coluna1, coluna2 FROM tabela ORDER BY coluna1 asc/desc
--Filtrando em ordem crescente
SELECT *
FROM person.person
ORDER BY FirstName asc
--Filtrando em ordem decrescente
SELECT * 
FROM person.person
ORDER BY FirstName desc
--Filtarando pela ordem de duas colunas
SELECT *
FROM person.person
ORDER BY FirstName asc, LastName desc
--Filtrando pela ordem de duas colunas apresentando apenas as duas colunas
SELECT FirstName, LastName
FROM person.person
ORDER BY FirstName asc, LastName desc
--Filtrando pela ordem de uma coluna nao apresentada (Em alguns BDs nao e possivel fazer essa selecao ou ordenacao de uma variaval nao apresentada)
SELECT FirstName, LastName
FROM person.person
ORDER BY MiddleName asc

--DESAFIO: Obter o ProductId dos 10 produtos mais caros cadastrados no sistema listando do mais caro para o mais barato
SELECT TOP 10 *
FROM Production.Product
ORDER BY ListPrice desc

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc

--DESAFIO: Obter o nome e o numero do produto dos produtos que tem o ProductID entre 1 e 4
--Selecionando com ORDER BY
SELECT TOP 4 Name, ProductID
FROM production.Product
ORDER BY ProductID asc
--Selecionando com operadores logicos WHERE 
SELECT Name, ProductID
FROM Production.Product
WHERE ProductID >= 1 AND ProductID <= 4

SELECT Name, ProductID
FROM Production.Product
WHERE ProductID BETWEEN 1 AND 4

/*#########-----BETWEEN------#################################################################################*/
--Realizar um filtro entre um valor minimo e um valor maximo, utilizado junto com o WHERE
-- valor BETWEEN minimo AND maximo
-- e o mesmo que: valor >= minimo AND valor <= maximo
--Selecionando um intervalo de consulta
SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500
--Retirando intervalo de valores da consulta
SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500
--Selecionando por um intervalo de data
SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate --ordernando por data

/*#########-----IN------#################################################################################*/
--Verificar se um valor corresponde com qualquer valor passado na lista de valores, utilizado junto com o WHERE
--valor IN(valor1, valor2)
--valor IN(SELECT valor FROM tabela), subSelect ou subQuery
--Selecionado um conjunto de valores de acordo com a instrucao
SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)
--Selecionando um conjunto de valores com restricao de alguns valores
SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)
--E o mesmo que o perador logico =, mas o melhor e utilizar o IN em um conjunto de selecao
SELECT *
FROM Person.Person
WHERE BusinessEntityID = 2
OR BusinessEntityID = 7
OR BusinessEntityID = 13

/*#########-----LIKE------#################################################################################*/
--Filtrar de acordo com a necessidade do conteudo de uma varivael, utilizado junto com o WHERE
--SELECT * FROM tabela WHERE coluna LIKE 'parteValor%' para nomes iniciados em
--SELECT * FROM tabela WHERE coluna LIKE '%parteValor' para nomes terminados em
--SELECT * FROM tabela WHERE coluna LIKE '%parteValor%' para nomes que contenham
--Selecionando para nomes iniciados em
SELECT *
FROM Person.Person
WHERE FirstName LIKE 'ovi%'
--Selecionando para nomes terminados em
--Obs. ao utilizar o '_' a consulta vai se limitar a mais um caractere apos o declarado
SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%to'
--Selecionando para nomes que cotenham
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%essa%'
--Selecionando para nomes terminados em
--Obs. ao utilizar o '_' a consulta vai se limitar a mais um caractere apos o declarado
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro_'

--DESAFIOS: 
--1 Quanotos produtos temos cadastrado no sistema que custam mais de 1500 dolares? Dicas: tabela production.product, COUNT e WHERE mais algum operador de comparacao
SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice >= 1500

--2 Quantas pessoas temos com o sobrenome que iniciam com a letra P? Dicas: tabela person.person, COUNT, WHERE e LIKE
SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'p%'

--3 Em quantas cidades unicas estao cadastrados nossos clientes?
SELECT COUNT(DISTINCT City)
FROM Person.Address

--4 Quais sao as cidades unicas cadastradas em nosso sistema?
SELECT DISTINCT City
FROM Person.Address
ORDER BY City

--5 Quantos produtos vermelhos tem preco entre 500 a 1000 dolares?
SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' 
AND ListPrice BETWEEN 500 AND 1000

--6 Quantos produtos cadastrados tem a palavra 'road' no nome deles?
SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE '%road%'

/*#########-----MIN MAX SUM AVG------#################################################################################*/
--Funcoes de agregacao ou combinacao de dados de uma tabela em um unico resultado
--Somando as 10 primeiras linhas de valores de uma tabela
SELECT TOP 10 *
FROM  Sales.SalesOrderDetail
--Somando os valores de uma coluna das 10 primeiras linhas e atribuindo um nome para coluna do resultado
SELECT TOP 10 SUM(LineTotal) AS "Soma"
FROM Sales.SalesOrderDetail
--Somando os valores de uma coluna e atribuindo um nome para coluna do resultado
SELECT SUM(LineTotal) AS "Soma"
FROM Sales.SalesOrderDetail
--Selecionando o valor minimo de uma coluna
SELECT TOP 10 MIN(LineTotal)
FROM Sales.SalesOrderDetail
--Selecionando o valor maximo de uma coluna
SELECT TOP 10 MAX(LineTotal)
FROM Sales.SalesOrderDetail
--Selecionando o valor medio de uma coluna
SELECT TOP 10 AVG(LineTotal)
FROM Sales.SalesOrderDetail

/*#########-----GROUP BY------#################################################################################*/
--Divide o resultado da busca em grupos. Para cada grupo, vc pode aplicar uma função de agregação, por exemplo: Calcular a soma de intens ou Contar o numero de intens naquele grupo
--SELECT coluna1, funcAgregacao(coluna2) FROM tabela GROUP BY coluna1
SELECT *
FROM Sales.SalesOrderDetail
--Somando valores e agrupando por uma variavel
SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
ORDER BY SpecialOfferID
--Contando valores e agrupando por uma variavel
SELECT ProductId, COUNT(ProductId) AS "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
--Contando os nomes unicos de uma tabela
SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName
ORDER BY CONTAGEM desc
--Obtendo a media de precos para os produtos de acordo com a cor
SELECT Color, AVG(ListPrice) AS "MEDIA"
FROM Production.Product
GROUP BY Color
--Obtendo a media de precos para os produtos que sao pratas "silver"
SELECT Color, AVG(ListPrice) AS "MEDIA"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

--DESAFIOS: 
--Quantas pessoas tem o mesmo MiddleName agrupadas por MiddleName. Dicas: tabela Person.Person, GROUP BY + funcAgregacao
SELECT MiddleName, COUNT(MiddleName) AS "CONTAGEM"
FROM Person.Person
GROUP BY MiddleName
ORDER BY CONTAGEM desc
--Quantidade media de venda de produto em cada ordem(venda). Dica: tabela Sales.SalesOrderDetail e GROUP BY
SELECT ProductID, AVG(OrderQty) AS "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY CONTAGEM DESC
--verificando resultado
SELECT * 
FROM Sales.SalesOrderDetail
WHERE ProductID = 863
--verificando resultado
SELECT AVG(OrderQty) AS "MEDIA"
FROM Sales.SalesOrderDetail
WHERE ProductID = 863
--Quais foram os 10 produtos de maiores vendas(LineTotal) com nome de coluna
SELECT TOP 10 ProductID, SUM(LineTotal) AS "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TOTAL DESC
--Quais foram os 10 produtos de maiores vendas(LineTotal) sem nome de coluna
SELECT TOP 10 ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC
--Qual a quantidade total e Qual a quantidade media de produtos cadastrados nas ordens de servicos (WorkOrder), agrupados por produto
SELECT ProductID, COUNT(ProductID) AS "CONTAGEM", AVG(OrderQty) AS "MEDIA"
FROM Production.WorkOrder
GROUP BY ProductID
ORDER BY MEDIA DESC

/*#########-----HAVING------#################################################################################*/
--Para realizar filtros de dados ja agrupados pelo GROUP BY, utilizado junto com o GROUP BY
--Uma WHERE para os dados agrupados, a diferenca esta no momento de aplicacao. WHERE e aplicando antes do GROUP BY e o HAVING e aplicado apos o GROUP BY
--SELECT coluna1, funcaoAgregacao(coluna2) FROM tabela GROUP BY coluna1 HAVING condicao
--Queremos saber quais nomes no sistema tem uma ocorrenica maior que 10 vezes
SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 50
ORDER BY CONTAGEM DESC
--Queremos saber quais produtos que no total de vendas estejam entre 162k a 500k
SELECT ProductID, SUM(LineTotal) AS "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000
--Quermos saber quais nomes no sistema tem uma ocorrencia maior que 10 vezes, porem somente onde o titulo e 'Mr.'
SELECT FirstName, COUNT(FirstName) AS "QNT"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

--DESAFIOS:
/*Estamos querendo identificar as provincias(stateProvinceID) com o maior numero de cadastros no nosso sistema, entao
e preciso encontrar quais provincias (stateProvinceID) estao registradas no banco de dados mais que 1000 vezes*/
SELECT StateProvinceID, COUNT(StateProvinceID) AS "CONTAGEM"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000
--Sabendo que se trata de uma multinasional, os gerentes querem saber quais produtos não estao trazendo em media no minimo 1m em total de vendas
SELECT ProductID, AVG(LineTotal) AS "MEDIA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) <= 1000000

/*#########-----AS------#################################################################################*/
--Para Renomear ou dar apelidos para colunas
--Podemos atribuir o nome simples sem aspas
SELECT TOP 10 ListPrice AS PRECO
FROM Production.Product
--Para mais de um nome na coluna devemos colocar aspas
SELECT TOP 10 ListPrice AS "PRECO DO PRODUTO"
FROM Production.Product
--Para mais de um nome na coluna devemos colocar aspas
SELECT TOP 10 AVG(ListPrice) AS "PREÇO MÉDIO"
FROM Production.Product

--DESAFIOS:
--1 Substituir o nome das colunas FirstName e LastName de person.person para "Nome" e "Sobrenome"
SELECT TOP 10 FirstName AS "Nome", LastName AS "Sobrenome"
FROM Person.Person
--2 Substituir o nome da coluna ProductNumber de production.product para "NumeroDoProduto"
SELECT TOP 10 ProductNumber AS "NumeroDoProduto"
FROM Production.Product
--3 Substituir o nome da coluna UnitPrice de Sales.SalesOrderDetail para "PrecoUnitario"
SELECT TOP 10 UnitPrice AS "PrecoUnitario"
FROM Sales.SalesOrderDetail

/*#########-----JOINS------#################################################################################*/
--INNER JOIN, OUTER JOIN e SELF-JOIN
--INNER JOIN - Apenas o que tem em comum nas tabelas A e B
--FULL OUTER JOIN - Tudo de todas as tabelas A e B
--LEFT OUTER JOIN - Tudo da tabela A

/*#########-----INNER JOINS------#################################################################################*/
--Queremos os seguintes dados BusinessEntityID, FirstName, LastName, EmailAddress
--Tabela 1 (BusinessEntityID, FirstName e LastName)
SELECT TOP 10 *
FROM Person.Person
--Tabela 2 (BusinessEntityID e EmailAddress)
SELECT TOP 10 *
FROM Person.EmailAddress
--Juntando variaveis da tabela 1 e varivael da tabela 2
SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person AS P
INNER JOIN Person.EmailAddress PE ON p.BusinessEntityID = pe.BusinessEntityID
--Vamos dizer que nos queremos os nomes dos produtos e as informaceos de suas subcategorias
--ListPrice, Nome do Produto, Nome da Subcategoria
SELECT TOP 10 *
FROM Production.Product

SELECT TOP 10 *
FROM Production.ProductSubcategory

SELECT pr.ListPrice, pr.Name, pc.Name
FROM Production.Product Pr
INNER JOIN Production.ProductSubcategory Pc ON pc.ProductSubcategoryID = pr.ProductSubcategoryID

--Juntando todas as colunas
SELECT TOP 10 *
FROM Person.BusinessEntityAddress

SELECT TOP 10 *
FROM Person.Address

SELECT TOP 10 * 
FROM Person.BusinessEntityAddress BA
INNER JOIN Person.Address PA ON pa.AddressID = ba.AddressID

--Juntando todas as tabelas
SELECT TOP 10 *
FROM Person.PhoneNumberType

SELECT TOP 10 *
FROM Person.PersonPhone

--BusinessEntityID, Name, PhoneNumberTypeID, PhoneNumber
SELECT p.BusinessEntityID, pn.Name, pn.PhoneNumberTypeID, p.PhoneNumber
FROM Person.PersonPhone P
INNER JOIN Person.PhoneNumberType PN ON p.PhoneNumberTypeID = pn.PhoneNumberTypeID

SELECT TOP 10 *
FROM Person.StateProvince

SELECT TOP 10 *
FROM Person.Address

--AddressID, City, StateProvinceID, StateProvinceCode
SELECT TOP 10 pa.AddressID, pa.City, pa.StateProvinceID, ps.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS ON pa.StateProvinceID = ps.StateProvinceID

SELECT *	
FROM Production.Product

--Quero descobrir quais pessoas tem cartao de credito registrado
SELECT *
FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC ON PP.BusinessEntityID = PC.BusinessEntityID

/*#########-----LEFT OUTER JOINS------#################################################################################*/
-- Forma utilizada comumente apenas como 'LEFT JOIN'
--Quero descobrir quais pessoas nao tem cartao de credito registrado
SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL

/*#########-----UNION------#################################################################################*/
--Combinar dois ou mais resultados de um select em apenas um resultado
--SELECT Coluna1, Coluna2 FROM Tabela1 UNION SELECT Coluna1, Coluna2 FROM Tabela2
SELECT [FirstName], [Title]
FROM Person.Person
WHERE Title = 'Mr'
UNION
SELECT [FirstName], [Title]
FROM Person.Person
WHERE [MiddleName] = 'A'

SELECT [FirstName], [Tilte], [LastName]
FROM Person.Person
WHERE [Tile] = 'Mr.'
UNION
SELECT [FirstName], [Title], [LastName]
FROM Person.Person
WHERE [LastName] LIKE '%che%'

/*#########-----SELF JOIN------#################################################################################*/
--Agrupamento ou ordenacao de dados de uma mesma tabela, pode ser utilizado apenas se aplidando as tabelas 'AS'
--SELECT [coluna1], [coluna2] FROM Tabela1 AS A WHERE Condicao
SELECT *
FROM Customers
--Queremos todos os clientes que moram na mesma regiao
SELECT [A].[ContactName], [A].[Region], [B].[ContactName], [B].[Region]
FROM Customers AS A, Customers AS B
WHERE [A].[Region] = [B].[Region]
--Quero contratar (nome e data de contratacao) de todos os funcionarios que foram cadastrados no mesmo ano
SELECT *
FROM Employees
--
SELECT [A].[FirstName], [A].[HireDate], [B].[FirstName], [B].[HireDate]
FROM Employees AS A, Employees AS B
WHERE DATEPART(YEAR, [A].[HireDate]) = DATEPART(YEAR, [B].[HireDate])

--DESAFIO: Na tabela detalhe do pedido (OrderDetails), quais sao os produtos com mesmo percentual de desconto
SELECT *
FROM [Order Details]
--
SELECT TOP 10 [A].[ProductID], [A].[Discount], [B].[ProductID], [B].[Discount]
FROM [Order Details] AS A, [Order Details] AS B
WHERE [A].[Discount] = [B].[Discount]
ORDER BY [A].[Discount] DESC

/*#########-----SUBQUERIES ou SUBSELECT------#################################################################################*/
--Monte um relatorio em que todos os produtos cadastrados tenham preco de venda acima da media
SELECT *
FROM Production.Product
--Forma trabalhosa (dois selects)
SELECT AVG(ListPrice)
FROM Production.Product
SELECT *
FROM Production.Product
WHERE [ListPrice] > 438.67
--forma simples (subqueries)
SELECT *
FROM Production.Product
WHERE [ListPrice] > (SELECT AVG(ListPrice) FROM Production.Product)
--Identificar os funcionarios com cargo de 'Design Engineer'
SELECT *
FROM Person.Person
SELECT * 
FROM HumanResources.Employee
--Forma trabalhosa (Dois selects)
SELECT * 
FROM HumanResources.Employee
WHERE [JobTitle] = 'Design Engineer'
SELECT *
FROM Person.Person
WHERE [BusinessEntityID] in (5,6,15)
--Forma simples (subqueries)
SELECT *
FROM Person.Person
WHERE [BusinessEntityID] IN (
SELECT BusinessEntityID 
FROM HumanResources.Employee 
WHERE [JobTitle] = 'Design Engineer')
--Forma simples (Join)
SELECT *
FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E 
ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'

--DESAFIO: Encontrar todos os enderecos que estao no estado de 'Alberta'. Pode trazer todasa as informacoes
SELECT * 
FROM Person.Address
SELECT * 
FROM Person.StateProvince
--Froma trabalhosa
SELECT StateProvinceID
FROM Person.StateProvince
WHERE Name = 'Alberta'
SELECT *
FROM Person.Address
WHERE StateProvinceID = 1
--Forma simples (Subqueries)
SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
SELECT StateProvinceID 
FROM Person.StateProvince
WHERE Name = 'Alberta')
--Forma simples (Join)
SELECT *
FROM Person.Address AS A
INNER JOIN Person.StateProvince AS S 
ON A.StateProvinceID = S.StateProvinceID
AND S.Name = 'Alberta'

/*#########-----DATEPART------#################################################################################*/
--Funcao para tratar e filtrar datas
--Filtrando Ano
SELECT SalesOrderID, DATEPART(YEAR, OrderDate) AS Ano
FROM Sales.SalesOrderHeader
ORDER BY Ano ASC
--Filtrando Mes
SELECT SalesOrderID, DATEPART(MONTH, OrderDate) AS Mes
FROM Sales.SalesOrderHeader
ORDER BY Mes ASC
--Filtrando dia
SELECT SalesOrderID, DATEPART(DAY, OrderDate) AS Dia
FROM Sales.SalesOrderHeader
ORDER BY Dia DESC
--Qual a media do valor devido por ANO
SELECT AVG(TotalDue) AS MEDIA, DATEPART(YEAR, OrderDate) AS ANO
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YEAR, OrderDate)
ORDER BY ANO
--Qual a media do valor devido por MES
SELECT AVG(TotalDue) AS MEDIA, DATEPART(MONTH, OrderDate) AS MES
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY MES
--Qual a media do valor devido por DIA
SELECT AVG(TotalDue) AS MEDIA, DATEPART(DAY, OrderDate) AS DIA
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(DAY, OrderDate)
ORDER BY DIA

--DESAFIO: Realizar filtro em datas (Ano, mes e dia) de qualquer variavel 
SELECT *
FROM Production.Product
--ANO
SELECT AVG(ListPrice) AS MEDIA, DATEPART(YEAR, SellStartDate) AS ANO
FROM Production.Product
GROUP BY DATEPART(YEAR, SellStartDate)
ORDER BY ANO
--MES
SELECT AVG(ListPrice) AS MEDIA, DATEPART(MONTH, SellStartDate) AS MES
FROM Production.Product
GROUP BY DATEPART(MONTH, SellStartDate)
ORDER BY MES
--DIA
SELECT AVG(ListPrice) AS MEDIA, DATEPART(DAY, SellStartDate) AS DIA
FROM Production.Product
GROUP BY DATEPART(DAY, SellStartDate)
ORDER BY DIA

/*#########-----MANIMULACAO DE STRING------#################################################################################*/
-- Realizar operacoes em strings
--Concat
--LEN
--Lower
--Upper
--Substring
--Replace
--Concatenando variaveis
SELECT CONCAT(FirstName, ' ', LastName)
FROM Person.Person
--Tudo maiuscula e minuscola
SELECT UPPER(FirstName) AS MAIU, LOWER(Firstname) AS MINU
FROM Person.Person
--Tamanho de uma palavra ou string, contagem de caracteres
SELECT FirstName, LEN(FirstName) AS CARACTERES
FROM Person.Person
ORDER BY CARACTERES DESC
--Substring, pegando uma quantidade especifica de caracteres
SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person
--Replace, substituicoes
SELECT ProductNumber, REPLACE(ProductNumber, '-', '$') AS SUBS
FROM Production.Product

--DESAFIO:
--Concat
SELECT CONCAT(JobTitle, '-', MaritalStatus)
FROM HumanResources.Employee
--LEN
SELECT JobTitle, LEN(JobTitle) AS CARACTERES
FROM HumanResources.Employee
ORDER BY CARACTERES DESC 
--Lower
SELECT LOWER(JobTitle) AS MINU
FROM HumanResources.Employee
--Upper
SELECT UPPER(JobTitle) AS MAIU
FROM HumanResources.Employee
--Substring
SELECT JobTitle, SUBSTRING(JobTitle, 1, 4)
FROM HumanResources.Employee
--Replace
SELECT LoginID, REPLACE(LoginID, '-', '|') AS REPL
FROM HumanResources.Employee

/*#########-----OPERACOES MATEMATICAS------#################################################################################*/
--Funcoes matematicas sql server mais comuns
--SOMA
SELECT UnitPrice + LineTotal AS SOMA
FROM Sales.SalesOrderDetail
--SUBTRACAO
SELECT UnitPrice - LineTotal AS SUBTRACAO
FROM Sales.SalesOrderDetail
--MULTIPLICACAO
SELECT UnitPrice * LineTotal AS MULTIPLICACAO
FROM Sales.SalesOrderDetail
--DIVISAO
SELECT UnitPrice / LineTotal AS DIVISAO
FROM Sales.SalesOrderDetail
--MEDIA
SELECT AVG(LineTotal) AS MEDIA
FROM Sales.SalesOrderDetail
--SOMA
SELECT SUM(LineTotal) AS SOMA
FROM Sales.SalesOrderDetail
--MINIMO
SELECT MIN(LineTotal) AS MINIMO
FROM Sales.SalesOrderDetail
--MAXIMO
SELECT MAX(LineTotal) AS MAXIMO
FROM Sales.SalesOrderDetail
--ARREDONDAMENTO
SELECT LineTotal, ROUND(LineTotal, 2) AS ARREDONDAMENTO
FROM Sales.SalesOrderDetail
--RAIZ QUADRADA
SELECT SQRT(Linetotal) AS RAIZ
FROM Sales.SalesOrderDetail

/*#########-----TIPOS DE DADOS------#################################################################################*/
--BOLEANOS: 
	--Por padrao e inicializado como nulo e pode receber 1 ou 0 BIT
--CARACTERES: 
	--Tamanho fixo - char // permite inserir ate uma quantidade fixa de caracteres e sempre ocupa todo o espaco reservado 10/50
	--Tamanho fixo - varchar ou nvarchar // permite inserir ate uma quantidade que for definida, prem so usa o espaco que for preenchido 10/50
--NUMEROS:
	--Valores Exatos:
		--TINYINT - nao tem parte valor fracionados (ex.: 1.4333325)
		--SMALLINT - mesma coisa porem limite maior
		--INT - mesma coisa porem limite maior
		--BIGINT - mesma coisa porem limite maior
		--NUMERIC ou DECIMAL - valores exatos, porem permite ter parte fracionados, que também pode ser especificado a precisao e escala (escala e o numero de digitos na parte fracional) ex.: NUMERIC (5, 2) 113,44
	--Valores Aproximados:
		--REAL - Tem precisao aproximada de ate 15 digitos
		--FLOAT - Mesmo conceito do REAL
--TEMPORAIS
	--DATE: Armazena data no formato AAAA/MM/DD
	--DATETIME: Armazena data no formato AAAA/MM/DD HH:MM:SS
	--DATETIME2: Armazena data no formato AAAA/MM/DD HH:MM:SS.MSsssssss
	--SMALLDATETIME: Data e hora respeitando o limite entre '1900-01-01:00:00:00' ate '2079-06-06:23:59:59'
	--TIME: Horas, minutos, segundos e milissegundos respeitando o limite entre '00:00:00.0000000000' ate '23:59:59.9999999999999'
	--DATETIMEOFFSET: Permite armazenar informaceos de data e horas incluindo o fuso horario

/*#########-----CHAVES PRIMARIAS E ESTRANGEIRAS------#################################################################################*/
--Uma CHAVE PRIMARIA e basicamente uma coluna ou grupo de colunas, usada para identificar unicamente uma linha em uma tabela
--Voce consegue criar essas chaves primarias atraves de restricoes (ou constraints em ingles), que sao regras que vc define quando esta criando uma coluna
--Assim quando vc faz isso, esta criando um indice unico para aquela coluna ou grupo de colunas
/*
CREATE TABLE nome_tabela (
	nomeColuna tipoDeDados PRIMARY KEY
	nomeColuna tipoDeDados ...
)
*/
--Uma CHAVE ESTRANGEIRA e uma coluna ou grupo de colunas em uma tabela que identifica unicamente uma linha em outra tabela
--Uma CHAVE ESTRANGEIRA e definida em uma tabela onde ela e apenas uma referencia e nao contem todos os dados ali
--Uma CAHVE ESTRANGEIRA e simplemsente uma coluna ou grupo de colunas que e uma chave primaria em outra tabela
--A tabela que contem a chave estrangeira e chamada de tabela referencia ou tabela filho. E a tabela na qual a chave estrangeira e referenciada e chamada de tabela referenciada ou tabela pai
--Uma tabela pode ter mais de uma chave estrangeira dependendo do seu relacionamento com as outras tabelas
--No SQL Server vc define uma CHAVE ESTRANGEIRA atravez de um "Foreign Key Constraint" ou restricao de chave estrangeira
--Uma restricao de CHAVE ESTRANGEIRA indica que os valores em uma coluna ou grupo de colunas na tabela filho correspondem aos valores na tabela pai
--Nos podemos entender que uma chave estrangeira mantem a 'integridade referencial'

/*#########-----CREATE TABLE------#################################################################################*/
--Principais tipos de restricoes que podem ser aplicadas:
	--NOT NULL - Nao se permite nulos
	--UNIQUE - Forca que todos os valores em uma coluna sejam diferentes
	--PRIMARY KEY - Uma juncao de NOT NULL e UNIQUE
	--FOREIGN KEY - Identifica unicamente uma linha em outra tabela
	--CHECK - FORCA uma condicao especifica em uma coluna
	--DEFAULT - Forca um valor padrao quando nenhum valor e passado

CREATE TABLE Canal (
CanalID INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
ContagemInscirtos INT DEFAULT 0,
DataCriacao DATETIME NOT NULL
)

CREATE TABLE Video(
VideoID INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Visualizacoes INT DEFAULT 0,
Likes INT DEFAULT 0,
Dislikes INT DEFAULT 0,
Duracao INT NOT NULL,
CanalID INT FOREIGN KEY REFERENCES Canal(CanalID)
)

--DESAFIO: Criar duas tabelas que tenham relacionamento
CREATE TABLE Garagem(
GaragemID INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
ContagemVeiculos INT DEFAULT 0,
DataCriacao DATETIME NOT NULL
)

CREATE TABLE Veiculo(
VeiculoID INT PRIMARY KEY,
TipoVeiculo VARCHAR(150) NOT NULL,
MarcaVeiculo VARCHAR(150) NOT NULL,
ModeloVeiculo VARCHAR(150) NOT NULL,
AnoVeiculo DATE NOT NULL,
CorVeiculo VARCHAR(50) NOT NULL,
PlacaVeiculo VARCHAR(50) NOT NULL,
GaragemID INT FOREIGN KEY REFERENCES Garagem(GaragemID)
)

/*#########-----INSERT INTO------#################################################################################*/
--Inserir dados ou na criacao da tabela ou depois de ja ter uma tabela
--INSERT INTO nomeTabela(Coluna1, Coluna2,...) VALUES(valor1, valor2) VALUES(valor1, valor2)
--Inserir as informacoes de uma tabela existente em outra nova tabela:
--INSERT INTO TabelaA (Coluna1) SELECT Coluna2 FROM TabelaB
--Criando uma tabela
CREATE TABLE Aula(
Id INT PRIMARY KEY,
Nome VARCHAR(200)
)
--Unica linha de registro
INSERT INTO Aula(Id, Nome)
VALUES(1, 'Aula 1')
--Varias linhas de registro
INSERT INTO Aula(Id, Nome)
VALUES
(2, 'Aula 2'),
(3, 'Aula 3'),
(4, 'Aula 4'),
(5, 'Aula 5')
--Copiar dados de uma tabela existenta para uma segunda tabela nova
SELECT * 
INTO tabelaNova 
FROM Aula 

--DESAFIO:
	--Crie uma tabela nova
	--Insira uma linha de dados nela
	--Insira 3 linhas de dados ao mesmo tempo
	--Crie uma segunda tabela
	--Insira 1 linha nessa tabela nova
	--Copie os dados da segunda tabela para a primeira

CREATE TABLE Tabela1 (
Tabela1ID INT PRIMARY KEY,
Nome VARCHAR(150),
)
INSERT INTO Tabela1 (Tabela1ID, Nome)
VALUES (1, 'Dado1')
--
INSERT INTO Tabela1 (Tabela1ID, Nome)
VALUES 
(3, 'Dado3'),
(4, 'Dado4')
--
CREATE TABLE Tabela2 (
Tabela2ID INT PRIMARY KEY,
Nome VARCHAR(150)
)
--
INSERT INTO Tabela2 (Tabela2ID, Nome)
VALUES (5, 'Dado5')
--
SELECT * 
INTO Tabela2
FROM Tabela1

/*#########-----UPDATE------#################################################################################*/
--Alterar valores de uma ou mais linhas de uma coluna
--UPDATE nomeTabela SET coluna1 = valor1 coluna2 = valor2 WHERE condicao
--Alterando todas as linhas de uma coluna
UPDATE Aula
SET Nome = 'teste'
--Alterando apenas uma linha de uma coluna
UPDATE Aula
SET Nome = 'mudei'
WHERE Id = 3

--DESAFIO: Alterar os valores de duas linhas de uma coluna
UPDATE Aula
SET Nome = 'alterei' /*AND 'novo'*/
WHERE Id BETWEEN 4 AND 5 

UPDATE Aula
SET Nome = 'mudei'
WHERE Id >= 1 AND Id <= 2

/*#########-----DELETE------#################################################################################*/
--Apagar valores de uma ou mais linhas de uma coluna 
--DELETE FROM nomeTabela WHERE conidcao
DELETE
FROM Aula
WHERE Nome = 'novo'

/*#########-----ALTER TABLE------#################################################################################*/
--Altera a estrutura de uma tabela
--ALTER TABLE nomeDaTabela ACAO
	--ACOES QUE PODEM SER FEITAS
		--Add, remover, alterar uma coluna
		--Setar valores padroes para uma coluna
		--Add ou remover restricoes de colunas
		--Renomear uma tabela
CREATE TABLE Youtube (
Id INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL UNIQUE,
Categoria VARCHAR(200) NOT NULL,
DataCriacao DATETIME NOT NULL
)
--Inserindo uma coluna
ALTER TABLE Youtube
ADD Ativo BIT
--Alterando algum limite de uma coluna da tabela
ALTER TABLE Youtube
ALTER COLUMN Categoria VARCHAR(300) NOT NULL
--Alterando nome de uma coluna (Em SQL Server e utilizado a funcao 'EXEC sp_RENAME')
--EXEC sp_RENAME 'nomeTabela.nomeColunaAtual', 'nomeColunaNova', 'COLUMN'
EXEC sp_RENAME 'Youtube.Nome', 'NomeCanal', 'COLUMN'
--Alterando nome de uma tabela (Em SQL Server e utilizado a funcao 'EXEC sp_RENAME')
--EXEC sp_RENAME 'nomeTabelaAtual', 'nomeTabelaNova'
EXEC sp_RENAME 'Youtube', 'Youtube2'

--DESAFIO:
	--Criar uma tabela nova com 3 colunas
	--Alterar o tipo de uma coluna
	--Renomear o nome de uma coluna
	--Renomear o nome de uma tabela que voce criou
CREATE TABLE TabelaNova (
Id INT PRIMARY KEY,
Coluna1 VARCHAR(150) NOT NULL UNIQUE,
Coluna2 VARCHAR(80) NOT NULL,
Coluna3 DATETIME NOT NULL
)
--
ALTER TABLE TabelaNova
ALTER COLUMN Coluna2 INT NOT NULL
--
EXEC sp_RENAME 'TabelaNova.Coluna1', 'Coluna0', 'COLUMN'
--
EXEC sp_RENAME 'TabelaNova', 'NovaTabela'

/*#########-----DROP TABLE------#################################################################################*/
--Excluir uma tabela que nao seja referenciada a outras tabelas
--DROP TABLE nomeDaTabela
DROP TABLE NovaTabela
DROP TABLE Youtube2
DROP TABLE Veiculo
DROP TABLE Garagem
-- 
INSERT INTO TabelaNova (Id, Coluna1, Coluna2, Coluna3)
VALUES 
(3, 'Nome3', 'Texto3', 2021-05-15),
(4, 'Nome4', 'Texto4', 2021-05-15),
(5, 'Nome5', 'Texto5', 2021-05-15),
(6, 'Nome6', 'Texto6', 2021-05-15),
(7, 'Nome7', 'Texto7', 2021-05-15),
(8, 'Nome8', 'Texto8', 2021-05-15),
(9, 'Nome9', 'Texto9', 2021-05-15)
--Apagando todos os dados de todas as colunas de uma tabela
TRUNCATE TABLE TabelaNova

/*#########-----NOT NULL CONSTRAINT------#################################################################################*/
--Nao permitir inserir dados
/*#########-----CHECK CONSTRAINT------#################################################################################*/
--Criar restricoes sobre valores, ao inserir ou ao alterar o valor
/* Syntax
CREATE TABLE CarteiraMotorista (
	Id INT NOT NULL,
	Nome VARCHAR(255) NOT NUL,
	Idade INT CHECK(Idade >= 18)
)
*/
CREATE TABLE CarteiraMotorista (
	Id INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Idade INT CHECK(Idade >= 18)
)
--Validando o CHECK, nao deve passar
INSERT INTO CarteiraMotorista (Id, Nome, Idade) VALUES (1, 'Aquila', 17)
--Validando o CHECK, deve passar
INSERT INTO CarteiraMotorista (Id, Nome, Idade) VALUES (1, 'Aquila', 18)

--DESAFIO: Criar duas tabelas que tenha variaveis NOT NULL e uma com restriceos CHECK
--TABELA 1
CREATE TABLE Prova (
	Id INT NOT NULL,
	Nome VARCHAR(255),
	Nota INT CHECK(Nota >= 6 AND Nota <= 10)
	)
--Validando o CHECK, nao deve passar
INSERT INTO Prova (Id, Nome, Nota) VALUES (1, 'Aquila', 5)
--Validando o CHECK, nao deve passar
INSERT INTO Prova (Id, Nome, Nota) VALUES (2, 'Aquila', 11)
--Validando o CHECK, deve passar
INSERT INTO Prova (Id, Nome, Nota) VALUES (3, 'Aquila', 7)
--TABELA 2
CREATE TABLE Rodovia (
	Id INT NOT NULL,
	Nome VARCHAR(255),
	Velocidade INT CHECK(Velocidade <= 80 )
)
--Validando o CHECK, nao deve passar
INSERT INTO Rodovia (Id, Nome, Velocidade) VALUES (1, 'Aquila', 81)
--Validando o CHECK, nao deve passar
INSERT INTO Rodovia (Id, Nome, Velocidade) VALUES (2, 'Aquila', 100)
--Validando o CHECK, deve passar
INSERT INTO Rodovia (Id, Nome, Velocidade) VALUES (3, 'Aquila', 80)
--Validando o CHECK, deve passar
INSERT INTO Rodovia (Id, Nome, Velocidade) VALUES (4, 'Estavão', 60)

/*#########-----UNIQUE CONSTRAINT------#################################################################################*/
--Nao permiti inserir valores repetidos
CREATE TABLE CarteiraMotorista (
	Id INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Idade INT CHECK(Idade >= 18),
	CodigoCNH INT NOT NULL UNIQUE
)
--Validando o CHECK, deve passar
INSERT INTO CarteiraMotorista (Id, Nome, Idade, CodigoCNH) VALUES (1, 'Aquila', 19, 123456)
--Validando o CHECK, nao deve passar com um CNH já registrado
INSERT INTO CarteiraMotorista (Id, Nome, Idade, CodigoCNH) VALUES (1, 'Estevao', 19, 123456)

/*#########-----VIEWS------#################################################################################*/
--Criar views com informacoes especificas de uma outra tabela para construcao de relatorios
--Syntaxe
/*
CREATE VIEW [nomeTabelaViewNova] AS
SELECT coluna1, coluna2, coluna3
FROM nomeTabelaCopiada
WHERE algumaCondicao
*/
CREATE VIEW [Pessoas Simplificado] AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE Title = 'Ms.'

SELECT *
FROM [Pessoas Simplificado]