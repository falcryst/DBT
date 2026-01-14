SELECT
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    o.StatusDesc,
    o.Updated_at,    
    COUNT( DISTINCT O.OrderID) AS OrderCount, 
    --COUNT( O.OrderID) AS OrderCount,
    Sum(OI.TotalPrice) AS Revenue
FROM
{{ref ('orders_stg')}} O
JOIN
    {{ref('orderitems_stg')}} OI ON O.OrderID =OI.OrderID
--    where o.orderid=800044
GROUP BY
O.OrderID,
O.OrderDate,
O.CustomerID,
O.EmployeeID,
O.StoreID,
o.StatusCD,
o.StatusDesc,
o.Updated_at