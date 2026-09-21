 WITH RankedProducts AS (
     SELECT 
         p.ProductID,
         p.Name AS ProductName,
         pc.Name AS CategoryName,
         p.ListPrice,
         ROW_NUMBER() OVER (
             PARTITION BY pc.ProductCategoryID 
             ORDER BY p.ListPrice DESC
         ) AS PriceRank
     FROM SalesLT.Product AS p
     INNER JOIN SalesLT.ProductCategory AS pc
         ON p.ProductCategoryID = pc.ProductCategoryID
     WHERE p.ListPrice > 0
 )
 SELECT 
     ProductID,
     ProductName,
     CategoryName,
     ListPrice,
     PriceRank
 FROM RankedProducts
 WHERE PriceRank <= 3
 ORDER BY CategoryName, PriceRank
 FOR JSON PATH, ROOT('TopProducts');