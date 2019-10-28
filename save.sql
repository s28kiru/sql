use world;

select distinct countrycode from countrylanguage where language = 'English' and countrycode not in 
(select distinct countrycode from countrylanguage where language = 'Spanish');

desc country;

select name from city where population > all (select population from city where countrycode = "USA");

select countrycode, language from countrylanguage where language = any(select language from countrylanguage where 
isofficial = 'T');


select countrycode from countrylanguage A where A.language = 'English' and not exists(
select * from countrylanguage B where B.language = 'Spanish' and A.countrycode = B.countrycode);

select c.name from country c where (select count(cl.language) from countrylanguage cl where c.code = cl.countrycode) < 2;

select name, population, (select max(population) from city ) - population as pd from city order by pd;

select *  from  city order by population;

select min(population) from city where population > 42;

select name from city where population = (select max(population) from city);
select name from city order by population desc limit 4,1;
select name, population from city order by population desc;

select name, population from city order by population;

select name, population from city c1 where (3-1) = (select count(distinct population) from city c2
where c1.population  < c2.population);

select name, population from city c1 where 3 = (select count(distinct population) from city c2
where c1.population >= c2.population);

select name, population from city c1 where (3-1) = 
(select count(distinct population) from city c2 where c1.population > c2.population);


create schema company;
use company;

create table department(
dept_id int(3),
dept_name varchar(20),
dept_phone varchar(15),
constraint pk_key primary key (dept_id));

use world;

desc city;

select population, Name from city where population > (select avg(population) from city);

set @i = 0;
select i, id, Name from (select @i := @i + 1 as i, id, Name from city) a where mod(a.i, 2) = 0;



