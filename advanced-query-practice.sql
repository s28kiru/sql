use world;

# window function
select name, countrycode, round(avg(population)  over(), 1) as avg_population from city;

select name, countrycode, population, avg(population) over(partition by countrycode) as avg_pop from city
order by countrycode desc, avg_pop;

select name, countrycode, population, row_number() over(partition by countrycode) from city;

select name, countrycode, population, first_value(name) over(partition by countrycode) from city;
select name, countrycode, population, last_value(name) over(partition by countrycode) from city;

select name, countrycode, population, lead(name, 1) over(partition by countrycode) from city;

# rank(), percent_rank(), ntile(), dense_rank(), cume_dist()
select name, rank() over(partition by countrycode order by population) from city;
select name, countrycode, population, percent_rank() over(partition by countrycode order by population) from city;
select name, countrycode, population, dense_rank() over(partition by countrycode order by population) from city;
select name, ntile(5) over(partition by countrycode order by population) from city;
select name, countrycode, population, cume_dist() over(partition by countrycode order by population) from city;

