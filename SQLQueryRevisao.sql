/*###################-----[01]-[SELECT]------##########################################################################################################*/
SELECT *
FROM Person.Person

SELECT Title
FROM Person.Person

SELECT FirstName, LastName
FROM Person.Person

/*###################-----[02]-[DISTINCT]------########################################################################################################*/

SELECT DISTINCT FirstName
FROM Person.Person

SELECT DISTINCT LastName
FROM Person.Person

SELECT DISTINCT PersonType
FROM Person.Person

/*###################-----[03]-[WHERE]------###########################################################################################################*/

SELECT *
FROM Person.Person
WHERE LastName = 'Miller'

SELECT *
FROM Person.Person
WHERE LastName = 'Miller' AND FirstName = 'Anna'

SELECT *
FROM Production.Product
WHERE Color = 'Blue'

SELECT *
FROM Production.Product
WHERE Color = 'Black' OR Color = 'Read'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500

SELECT * 
FROM Production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000

SELECT *
FROM Production.Product
WHERE Color <> 'Yellow'

SELECT DISTINCT Name
FROM Production.Product
WHERE Weight > 500 AND Weight < 700

SELECT Name, Weight
FROM Production.Product
WHERE Weight > 500 AND Weight < 700

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

/*###################-----[04]-[COUNT]------###########################################################################################################*/

SELECT COUNT (Title) AS 'QNT.REGISTROS'
FROM Person.Person

SELECT COUNT (DISTINCT Title) AS 'QNT.TITLE'
FROM Person.Person

SELECT COUNT (*) AS REGISTROS
FROM Production.Product

SELECT COUNT (ProductID) AS REGISTROS
FROM Production.Product

SELECT COUNT (Size) AS REGISTROS
FROM Production.Product

SELECT COUNT (DISTINCT Size) AS 'QNT.SIZE'
FROM Production.Product

SELECT COUNT (Size) AS REGISTROS, COUNT (DISTINCT Size) AS 'QNT.SIZE'
FROM Production.Product

/*###################-----[05]-[TOP]------#############################################################################################################*/

SELECT TOP 10 *
FROM Production.Product

/*###################-----[06]-[ORDER BY]------########################################################################################################*/

SELECT *
FROM Person.Person
ORDER BY FirstName ASC

SELECT *
FROM Person.Person
ORDER BY FirstName DESC

SELECT *
FROM Person.Person
ORDER BY FirstName ASC, LastName DESC

SELECT *
FROM Person.Person
ORDER BY FirstName ASC, LastName ASC

SELECT FirstName, LastName
FROM Person.Person
ORDER BY FirstName ASC, LastName DESC

SELECT FirstName, LastName
FROM Person.Person
ORDER BY FirstName ASC, LastName ASC

SELECT FirstName, LastName
FROM Person.Person
ORDER BY MiddleName ASC

SELECT TOP 10 *
FROM Production.Product
ORDER BY ListPrice ASC

SELECT TOP 10 *
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 4 Name, ProductID
FROM Production.Product
ORDER BY ProductID ASC

SELECT Name, ProductID
FROM Production.Product
WHERE ProductID >= 1 AND ProductID <= 4
ORDER BY ProductID DESC

SELECT Name, ProductID
FROM Production.Product
WHERE ProductID BETWEEN 1 AND 4
ORDER BY ProductID ASC

/*###################-----[07]-[BETWEEN]------#########################################################################################################*/

SELECT * 
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500

SELECT * 
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2020/01/01'
ORDER BY HireDate 

/*###################-----[08]-[IN]------##############################################################################################################*/

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)

/*###################-----[09]-[LIKE]------############################################################################################################*/

/*###################-----[10]-[MIN MAX SUM AVG]------#################################################################################################*/

/*###################-----[11]-[GROUP BY]------########################################################################################################*/

SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
ORDER BY SpecialOfferID ASC

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY CONTAGEM DESC

SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName
ORDER BY CONTAGEM DESC

SELECT Color, AVG(ListPrice) AS "MEDIA"
FROM Production.Product
GROUP BY Color
ORDER BY MEDIA DESC

SELECT Color, AVG(ListPrice) AS "MEDIA"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

SELECT Color, LEN(Color) AS "CARACTERES"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

SELECT MiddleName, COUNT(MiddleName) AS CONTAGEM
FROM Person.Person
GROUP BY MiddleName
ORDER BY CONTAGEM DESC

SELECT ProductID, AVG(OrderQty) AS CONTAGEM
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY CONTAGEM DESC

SELECT TOP 10 ProductID, SUM(LineTotal) AS TOTAL
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TOTAL DESC

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM", AVG(OrderQty) AS "MEDIA"
FROM Production.WorkOrder
GROUP BY ProductID
ORDER BY MEDIA DESC

/*###################-----[12]-[HAVING]------##########################################################################################################*/

SELECT FirstName, COUNT(FirstName) AS CONTAGEM
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 80
ORDER BY CONTAGEM DESC

SELECT ProductID, SUM(LineTotal) AS TOTAL
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000

SELECT FirstName, COUNT(FirstName) AS "QNT"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

SELECT StateProvinceID, COUNT(StateProvinceID) AS "CONTAGEM"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

SELECT ProductID, AVG(LineTotal) AS MEDIA
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) <= 100000

/*###################-----[13]-[AS]------##############################################################################################################*/

/*###################-----[14]-[JOINS]------###########################################################################################################*/

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress
FROM Person.Person AS P


/*###################-----[15]-[INNER JOINS]------#####################################################################################################*/

/*###################-----[16]-[LEFT OUTER JOINS]------################################################################################################*/

/*###################-----[17]-[UNION]------###########################################################################################################*/

/*###################-----[18]-[SELF JOIN]------#######################################################################################################*/

/*###################-----[19]-[SUBQUERIES ou SUBSELECT]------#########################################################################################*/

/*###################-----[20]-[DATEPART]------########################################################################################################*/

/*###################-----[21]-[MANIMULACAO DE STRING]------###########################################################################################*/

/*###################-----[22]-[OPERACOES MATEMATICAS]------###########################################################################################*/

/*###################-----[23]-[TIPOS DE DADOS]------##################################################################################################*/

/*###################-----[24]-[CHAVES PRIMARIAS E ESTRANGEIRAS]------#################################################################################*/

/*###################-----[25]-[CREATE TABLE]------####################################################################################################*/

/*###################-----[26]-[INSERT INTO]------#####################################################################################################*/

/*###################-----[27]-[UPDATE]------##########################################################################################################*/

/*###################-----[28]-[DELETE]------##########################################################################################################*/

/*###################-----[29]-[ALTER TABLE]------#####################################################################################################*/

/*###################-----[30]-[DROP TABLE]------######################################################################################################*/

/*###################-----[31]-[NOT NULL CONSTRAINT]------#############################################################################################*/

/*###################-----[32]-[CHECK CONSTRAINT]------################################################################################################*/

/*###################-----[33]-[UNIQUE CONSTRAINT]------###############################################################################################*/

/*###################-----[34]-[VIEWS]------###########################################################################################################*/