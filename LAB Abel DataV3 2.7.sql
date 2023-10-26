USE sakila;

-- films of each category
SELECT c.name AS category_name, COUNT(f.film_id) AS number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(p.amount) AS total_amount_rung
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id;

-- Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 1;

-- Most active customer
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC
LIMIT 1;

-- first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;

-- List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id) AS number_of_actors
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY number_of_actors DESC;

-- total paid by each customer
SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.last_name, c.first_name
ORDER BY c.last_name, c.first_name;

-- List the titles of films per category.
SELECT c.name AS category_name, GROUP_CONCAT(f.title ORDER BY f.title ASC) AS film_titles
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;





