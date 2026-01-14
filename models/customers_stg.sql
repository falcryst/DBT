SELECT 
    CustomerID,
    FirstName, 
    LastName,
    Email,
    Phone,
    Address,
    City,
    State,
    ZipCode,
    Updated_at,
    CONCAT(FIRSTNAME, ' ', LASTNAME) AS CUSTOMERNAME
    FROM
    {{ source('landing', 'cust')}}