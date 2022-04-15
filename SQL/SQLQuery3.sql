select datepart(YYYY, soh.DueDate) as [Calendar Year], st.[Group] as [Sales Territory Group],
sum(soh.TotalDue) as [Sales Amount], pc.Name as Category
from Sales.SalesOrderHeader as soh
inner join Sales.SalesTerritory as st on soh.TerritoryID=st.TerritoryID
inner join Sales.SalesOrderDetail as sod on soh.SalesOrderID= sod.SalesOrderID
inner join Production.ProductCostHistory as pch on sod.ProductID=pch.ProductID
cross join Production.ProductCategory as pc
group by DATEPART(yyyy,soh.DueDate),st.[Group],pc.Name
order by [Calendar Year]
