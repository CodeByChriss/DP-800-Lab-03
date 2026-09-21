 SELECT 
     ProductID,
     Name,
     Color,
     ListPrice
 FROM SalesLT.Product
 WHERE Color IS NOT NULL
 ORDER BY ListPrice DESC
 FOR JSON PATH;