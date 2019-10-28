# Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.

use org;
select * from worker;
select first_name as worker_name from worker;

#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) from worker;

#Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct department from worker;

# Q-4. Write An SQL Query To Print The First Three Characters Of  FIRST_NAME From Worker Table.
select substr(first_name, 1,3) from worker;

# Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’)
#  In The First Name Column ‘Amitabh’ From Worker Table.
select locate('a', first_name, 5) from worker where first_name = "Amitabh";

# Select INSTR(FIRST_NAME, BINARY'A') from Worker where FIRST_NAME = 'Amitabh';

# locate and instr can be used
# instr starts search from 1st char
# locate has 3rd parameter where we can specify the search location

# Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After 
# Removing White Spaces From The Right Side.
select rtrim(first_name) from worker;

# Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table 
# After Removing White Spaces From The Left Side.
select ltrim(department) from worker;

# Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT 
# From Worker Table And Prints Its Length.
select distinct length(department), department from worker;

# Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘A’ With ‘A’.
select replace(first_name, 'a','A') from worker;

# Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table 
# Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat_ws(' ', first_name, last_name) from worker;

# Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from worker order by first_name;

# Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By 
# FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name, department desc;

# Q-13. Write An SQL Query To Print Details For Workers With The First Name 
# As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name = 'Vipul' or first_name = 'Satish';
select * from worker where first_name in ('Vipul', 'Satish');

# Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names,
#  “Vipul” And “Satish” From Worker Table.
select * from worker where first_name not in ('Vipul', 'Satish');

# Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where department = 'Admin';

# Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like '%a%';

# Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';

# Q-18. Write An SQL Query To Print Details Of The Workers Whose 
# FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from worker where first_name like '_____h';

# Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from worker where salary between 100000 and 500000;

# Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where year(joining_date) = '2014' and month(joining_date) = '02';

# Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select count(worker_id) from worker where department = 'Admin';

# Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select concat_ws(' ', first_name, last_name), salary from worker where salary between 50000 and 100000;

# with sub query
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

# Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select count(worker_id), department from worker group by department order by count(worker_id) desc;

# Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select w.first_name, w.last_name from worker w inner join title t  on w.worker_id = t.worker_ref_id 
where t.worker_title = 'Manager';

# Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select worker_title, affected_from, count(*) from title group by worker_title, affected_from having count(*) > 1;

# Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where mod(worker_id,2) != 0;

# Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2) = 0;

# Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table workerclone like worker;

# Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id = any (select worker_id from worker);

# Q-31. Write An SQL Query To Show The Current Date And Time.
select current_date(), current_time();

# Q-32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
select * from worker order by salary desc limit 10;

# Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select * from worker order by salary desc limit 4,1;

# Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select w1.first_name, w2.first_name, w1.salary from worker w1, worker w2 where w1.worker_id != w2.worker_id and
w1.salary = w2.salary and w1.first_name < w2.first_name;

# Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select * from worker order by salary desc limit 2,1;

# with subquery
select max(salary) from worker where salary not in (select max(salary) from worker);

# Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id <= (select count(worker_id)/2 from worker);

# Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
select count(*), department from worker group by department having count(*) > 3;

# Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select count(*), department from worker group by department;

# Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker where worker_id = (select max(worker_id) from worker);

# Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker where worker_id = (select min(worker_id) from worker);

# Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker order by worker_id desc limit 5;

# Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select first_name, max(salary), department from worker group by department;

# Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select distinct salary from worker order by salary desc limit 3;

# Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select distinct salary from worker order by salary asc limit 3;

# Q-48. Write An SQL Query To Fetch Nth (say 5th) Max Salaries From A Table.
select distinct salary from worker order by salary desc limit 4,1;

# Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
select department, sum(salary) from worker group by department;

# Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select first_name from worker where salary = (select max(salary) from worker);

# city with largest population
select name from city where population = (select max(population) from city);
select name from city order by population desc limit 1;

select name from city where population = (select max(population) from city where population < (select max(population) from city));