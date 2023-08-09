--Select clause
use BikeStore;
Select first_name,last_name from sales.customers;

SELECT
    first_name,
    last_name,
    email
FROM
    sales.customers;

select * from sales.customers

--using where clause
Select * from sales.customers where state='CA';
Select * from sales.customers where state='CA' order by first_name;

SELECT city,COUNT (*) FROM sales.customers WHERE state = 'CA' GROUP BY city ORDER BY city;
select city,count(*) from sales.customers where state='ca' group by city having count(*)>=10 order by city;

select city,count(*) from sales.customers where state='CA' group by city having count(*)>=10 order by city;

--order by
--ascending order
Select first_name,last_name from sales.customers order by first_name;
--descending order
select first_name from sales.customers order by first_name desc;

Select city,first_name,last_name from sales.customers order  by city asc, first_name desc;
Select city,first_name,last_name from sales.customers order  by city desc, first_name ;
--------------
SELECT
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    LEN(first_name) DESC;
-----------------
SELECT
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    LEN(first_name) ASC;
----------To skip the first 10 products and return the rest, you use the OFFSET clause as shown in the following statement:
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS;
--------To skip the first 10 products and select the next 10 products, you use both OFFSET and FETCH
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;
----
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price desc,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

---top 10 most expensive products.
SELECT TOP 10
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;
-----
SELECT TOP 1 PERCENT
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;
----------------------------
---To get distinct cities, you add the DISTINCT keyword as follows:
select city from sales.customers;

select distinct city from sales.customers;
----------------------
SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    category_id = 1
ORDER BY
    list_price DESC;
-------------- Using AND 
SELECT Top 10
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    category_id = 1 AND model_year=2018
ORDER BY
    list_price DESC;
	------------- In
	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price IN (299.99, 369.99, 489.99)
ORDER BY
    list_price DESC;
	-------------Like
	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    product_name like '%Cruiser%'
ORDER BY
    list_price DESC;
--------------
SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    product_name like '%trek%'
ORDER BY
    list_price DESC;
--------------------------------------------
SELECT
    customer_id,
    first_name,
    last_name,
    phone
FROM
    sales.customers
WHERE
    phone IS NULL
ORDER BY
    first_name,
    last_name;
-----------------------------------
SELECT
    customer_id,
    first_name,
    last_name,
    phone
FROM
    sales.customers
WHERE
    phone IS NOT NULL
ORDER BY
    first_name,
    last_name;
--------------------------------
SELECT * FROM production.products WHERE category_id = 1 AND list_price > 400 ORDER BY list_price DESC;
------------
