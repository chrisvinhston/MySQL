USE mavenmovies;


SELECT 
	customer_id, 
	rental_date
FROM rental;


SELECT
	first_name,
	last_name,
    email
FROM customer;
	
SELECT DISTINCT
	rating
FROM film;


SELECT DISTINCT
	rental_duration
FROM film;


SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount = 0.99;


#WHERE
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE payment_date > '2006-01-01';


#WHERE BETWEEN
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id BETWEEN 1 AND 100
AND amount > .99 AND amount < 4.99;


#WHERE & AND
SELECT 
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id < 101
	AND amount > 5
	AND payment_date > '2006-01-01';


#WHERE & OR
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id=5
	OR customer_id=11
    OR customer_id=29;


#WHERE & OR
SELECT
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > 5
	OR customer_id = 42
	OR customer_id = 53
    OR customer_id = 60
    OR customer_id = 73;
    
    
#WHERE & IN
SELECT 
	customer_id,
	rental_id,
	amount,
	payment_date
FROM payment
WHERE customer_id IN (5, 11, 29);
    
    
-- LIKE Operator
SELECT
	title,
	description
FROM film
WHERE description LIKE '%EPIC%';
    
    
-- LIKE Operattor
SELECT
	title,
	special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%'; 
		

-- GROUP BY
SELECT
	rating,
    COUNT(film_id)
FROM film
GROUP BY 
	rating;
    
    
-- Alisas 'AS'
SELECT
	rating,
    -- COUNT(film_id),
    COUNT(film_id) AS count_of_films_with_rating  -- this a single line
FROM film
GROUP BY
	rating;



SELECT 
	rental_duration,
    COUNT(film_id) AS films_with_this_rental_duration
FROM film
GROUP BY rental_duration;


SELECT
	rental_duration,
	rating,
    replacement_cost,
    COUNT(film_id) AS count_of_films
FROM film
GROUP BY
	rental_duration,
	rating,
	replacement_cost;
    
    
# Aggrigate functions for GROUP BY
SELECT
	rating,
	COUNT(film_id) AS count_of_films,
	MIN(length)	AS shortest_film,
	MAX(length) AS longest_film,
	AVG(length) AS average_length_of_film,
	-- SUM(length) AS total_minutes
	AVG(rental_duration) AS average_rental_duration
FROM film
GROUP BY
	rating;


# Summary functions and GROUP BY
SELECT 
	replacement_cost,
	COUNT(film_id) AS count_of_films,
    MIN(rental_rate) AS cheapest_rental,
    MAX(rental_rate) AS expensive_rental,
	AVG(rental_rate) AS average_rental
FROM film
GROUP BY replacement_cost;

	
    
#Having - only used after GROUP BY
SELECT 
	customer_id,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) >= 30;

# Having
SELECT
	customer_id,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15;


#ORDER BY
SELECT 
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
ORDER BY amount DESC, customer_id DESC;

#ORDER BY w/ GROUP BY
SELECT 
	customer_id,
	SUM(amount) AS total_payment_amount
FROM payment
GROUP BY customer_id
ORDER BY 
	SUM(amount) DESC;
    
    
#ASSIGNMENT ORDER BY
SELECT 
	title,
    length,
    rental_rate
FROM film
ORDER BY length DESC;


