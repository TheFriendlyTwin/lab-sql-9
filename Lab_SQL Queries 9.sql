/* Lab | SQL Queries 9 */

/* Instructions
In this lab we will find the customers who were active in consecutive months of May and June. 
Follow the steps to complete the analysis. */

-- -> Create a table rentals_may to store the data from rental table with information for the month of May.
drop table if exists rentals_may;

create table `rentals_may` as
select * from sakila.rental
where 1=0; /* In this method, the SELECT * statement retrieves the column names and types from the existing_table but includes 
the WHERE 1=0 clause to ensure that no data from the existing table is copied to the new table. */

select * from sakila.rentals_may;

-- -> Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
-- Filtering only the rentals from May
select * from sakila.rental
where month(rental_date) = 5;

insert into sakila.rentals_may
select * from (select * from sakila.rental
				where month(rental_date) = 5) as rentals_subquery;  

select * from sakila.rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
drop table if exists rentals_june;

create table `rentals_june` as
select * from sakila.rental
where 1=0; 

select * from sakila.rentals_june;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
select * from sakila.rental
where month(rental_date) = 6;

insert into sakila.rentals_june
select * from (select * from sakila.rental
				where month(rental_date) = 6) as rentals_subquery;  

select * from sakila.rentals_june;

-- Check the number of rentals for each customer for May.
select customer_id, count(rental_id) as 'number_of_rentals'
from sakila.rentals_may
group by customer_id
order by count(rental_id) desc;

select c.customer_id, concat(c.first_name, ' ', c.last_name) as 'customer_name', count(r.rental_id) as 'number_of_rentals'
from sakila.customer c
join sakila.rentals_may r using(customer_id)
group by c.customer_id, c.first_name, c.last_name
order by count(rental_id) desc;

-- Check the number of rentals for each customer for June.
select customer_id, count(rental_id) as 'Number of rentals'
from sakila.rentals_june
group by customer_id
order by count(rental_id) desc;

select c.customer_id, concat(c.first_name, ' ', c.last_name) as 'customer_name', count(r.rental_id) as 'number_of_rentals'
from sakila.customer c
join sakila.rentals_june r using(customer_id)
group by c.customer_id, c.first_name, c.last_name
order by count(rental_id) desc;


