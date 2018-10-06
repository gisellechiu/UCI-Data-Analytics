USE sakila;

select first_name, last_name from actor;

select upper(concat( first_name,' ',last_name)) as 'actor name' from actor;

select actor_id, first_name, last_name from actor
where first_name = "joe";

select last_name from actor
where last_name like  "%GEN%"; 


select  last_name, first_name from actor 
where last_name like "%LI%";

select country_id, country from country
where country in ('Afghanistan', 'Bangladesh', 'China');

alter table actor
add column middle_name varchar(50) after first_name;

alter table actor
modify column middle_name blob;

alter table actor
drop column middle_name;

select last_name, count(*) as ' number of last name'
from actor
group by last_name;

select last_name, count(*) as ' number of last name'
from actor
group by last_name having count > 2;

update  actor
set first_name = ' harpo'
where first_name = 'groucho' and last_name = 'williams';

update actor
set first_name = 'groucho' 
where first_name = 'harpo' and last_name = 'williams';

describe sakila.address;

select first_name, last_name, address
from staff s 
join address a 
on s.address_id = a.address_id;

select payment.staff_id, staff.first_name, staff.last_name,payment.amount, payment.payment_date
from staff inner join payment on 
staff.staff_id = payment.staff_id and payment_date like '2005-08%';

select f.title as ' film title', count (fl.actor_id) as ' number of actors'
from film_actor fl 
inner join film f 
on fl.film_id = f.film_id
group by f.title;

select title,(
select count(*) from inventroy
where film.film_id = inventroy.film_id
) as ' number of copies'
from film
where title = 'Hunchback impossible';

select c.first_name, c.last_name, sum(p.amount) as 'total paid'
from customer c 
join payment p
on c.customer_id = p.customer_id
group by c.last_name;

select titile 
from film where title
like 'K%' or titile like 'Q%'
and title in
(
select title 
from film
where language_id = 1
);

select first_name, last_name 
from actor
where actor_id in
(
select actor_id
from film_actor
where film_id in 
(
select film_id
from film
where title = 'alone trip'
));

select c.first_name, c.last_name, c.email
from customer c
join address a 
on (c.address_id = a.address_id)
join city ct
on (ct.city_id = a.city_id)
join country
on(country.country_id = ct.country_id)
where country.country = 'canada';


select title, description from film
where film_id in 
(
select film_id from film_category
where category_id in 
(
select category_id from category
where name = "family"
));

select f.title, count(rental_id) as 'times rent'
from rental r 
join inventory i 
on (r.inventroy_id = i.inventroy_id)
join film f 
on (i.film_id = f.film_id)
group by f.title
order by ' times rent' desc;

select s.store_id, sum(amount) as ' revenue'
from payment p 
join rental r
on (p.rental_id = r.rental_id)
join store s 
on (s.store_id = i.store_id)
group by s.store_id;

select s.store_id, ct.city, country.country
from store s
join address a 
on ( country.country_id = ct.country_id);

select c.name as 'genre' , sum(p.amount) as 'gross'
from category c
join film_category fc
on (c.category_id = fc.category_id)
join inventory i
on ( fc.film_id = i.film_id)
join rental r 
on(i.inventroy_id = r.inventroy_id)
join payment p
on (r.rental_id = p.rental_id)
group by c.name order by gross limit 5;

create view genre_revenue as 
select c.name as 'genre', sum(p.amount) as 'gross'
from category c 
join film_category fc 
on (c.category_id = fc.category_id)
join inventory i
on (fc.film_id=i.film_id)
join rental r 
on(i.inventory_id=r.inventory_id)
join payment p
on( r.rental_id = p.rental_id)
group by c.name order by gross limit 5;

select* from gnere_revenue;

drop view genre_recenue;






