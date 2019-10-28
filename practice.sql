use world;

select * from city;
select name, population from city;

select id, 'city_population', population/100, lower(countrycode) from city;

show tables from world;

select distinct language from countrylanguage;
select ci.name as city_name, ci.district as city_district from city as ci;

-- Select all data from 'countrylanguage' table where the language is official to the country and 
-- the percentage spoken is greater than 70%.
desc countrylanguage;
select * from countrylanguage;
select * from countrylanguage where isofficial = 'T' and percentage > 70;

-- Select name and population of the cities where population is between 180000 and 190000.
select * from country;

select name, population from city where population between 180000 and 190000;
select * from countrylanguage where countrycode in ('IND', 'AUS', 'USA');

select name, indepyear from country where indepyear is not Null;

select * from city order by population desc;

select name, indepyear from country order by right(name,1);
select * from city order by 5,3;

use shipping;

select * from customer;

SELECT o.order_id, o.customer_id as order_customer_id, cu.customer_id as customer_customer_id, cu.customer_name, cu.customer_city  from order  as o inner join customer as cu on cu.customer_id = o.customer_id;


select cu.customer_id as cust_cust_id, cu.customer_city, cu.customer_name,
o.customer_id as order_cust_id, o.orders_id from
customer as cu inner join orders as o on cu.customer_id = o.customer_id;

select cu.customer_id, o.orders_id, cu.customer_city from
customer as cu right join orders as o on cu.customer_id = o.customer_id;

select cu.customer_id, cu.customer_city, o.orders_id from customer as cu, orders as o where
cu.customer_id = o.customer_id;

use world;

select ci.Name, co.Name, l.language from city as ci, country as co,
countrylanguage as l where ci.countrycode = co.code and ci.countrycode = l.countrycode;

select a.name, b.name from city a, city b where a.countrycode != b.countrycode;

select code from country union all select countrycode from countrylanguage;


show databases;
