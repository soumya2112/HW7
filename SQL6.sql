

select first_name, last_name from actor;


select concat(first_name, ' ', last_name) as Actor_Name from actor;

select actor_id, first_name, last_name from actor where first_name = "JOE";


SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE '%GEN%';

SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

SELECT country_id,  country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER table actor
ADD column description BLOB;

ALTER table actor
DROP column description;

select last_name, count(*) 
FROM actor 
GROUP BY last_name;

select last_name, count(*) 
FROM actor 
GROUP BY last_name
HAVING count(*) >=2;

UPDATE actor
SET first_name = "GROUCHO " 
WHERE first_name = "HARPO" AND last_name = "WILLIAMS";

UPDATE actor
SET first_name = "HARPO " 
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

DESCRIBE sakila.address


SELECT s.first_name, s.last_name, a.address
FROM staff s
LEFT JOIN address a on s.address_id = a.address_id;

SELECT s.first_name, s.last_name, SUM(p.amount) as TOTAL
FROM staff s 
LEFT JOIN payment p ON p.staff_id = s.staff_id
GROUP BY s.first_name, s.last_name;

SELECT f.title, COUNT(a.actor_id) AS 'TOTAL'
FROM film f INNER JOIN film_actor  a ON f.film_id = a.film_id
GROUP BY f.title;

SELECT c.first_name, c.last_name, SUM(p.amount) AS 'TOTAL'
FROM customer c 
LEFT JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name;

SELECT title
FROM film
WHERE (title LIKE 'K%' OR title LIKE 'Q%') 
AND language_id=(SELECT language_id FROM language where name='English')

SELECT first_name, last_name
FROM actor
WHERE actor_id
IN (SELECT actor_id FROM film_actor WHERE film_id 
IN (SELECT film_id from film where title='ALONE TRIP'));

SELECT first_name, last_name, email 
FROM customer ct
JOIN address a 
ON (ct.address_id = a.address_id)
JOIN city c ON (a.city_id = c.city_id)
JOIN country County 
ON (c.country_id = County.country_id);

SELECT title from film F
JOIN film_category FC 
ON (f.film_id = FC.film_id)
JOIN category c 
ON (FC.category_id = c.category_id);


SELECT title, COUNT(F.film_id) AS 'Count'
FROM  film F
JOIN inventory i 
ON (F.film_id= i.film_id)
JOIN rental R 
ON (i.inventory_id = R.inventory_id)
GROUP BY title 
ORDER BY Count DESC;

SELECT S.store_id, SUM(p.amount) 
FROM payment p
JOIN staff S 
ON (p.staff_id = S.staff_id)
GROUP BY store_id;


SELECT store_id, city, country 
FROM store S
JOIN address A 
ON (S.address_id = A.address_id)
JOIN city C ON (A.city_id = C.city_id)
JOIN country County 
ON (C.country_id = County.country_id);


SELECT C.name AS "Top5", SUM(p.amount) AS "Revenue" 
FROM category C
JOIN film_category F 
ON (C.category_id = F.category_id)
JOIN inventory i 
ON (F.film_id = i.film_id)
JOIN rental R 
ON (i.inventory_id = R.inventory_id)
JOIN payment p 
ON (R.rental_id = p.rental_id)
GROUP BY C.name 
ORDER BY Revenue LIMIT 5;


CREATE VIEW TopFive as
SELECT C.name AS "Top5", SUM(p.amount) AS "Revenue" 
FROM category C
JOIN film_category F 
ON (C.category_id = F.category_id)
JOIN inventory i 
ON (F.film_id = i.film_id)
JOIN rental R 
ON (i.inventory_id = R.inventory_id)
JOIN payment p 
ON (R.rental_id = p.rental_id)
GROUP BY C.name 
ORDER BY Revenue LIMIT 5;

select* from TopFive;

Drop view TopFive;






