use mavenmovies;

SELECT DISTINCT
	inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id;
        

SELECT DISTINCT
	rental.rental_id
FROM inventory
	INNER JOIN rental
    ON inventory.inventory_id = rental.inventory_id;


# Assignment INNER JOIN
SELECT 
	inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description
FROM inventory
	INNER JOIN film
    ON inventory.film_id = film.film_id;


#INNER JOIN   --   LEFT JOIN shows 5 from left table and null for right table.  INNER JOIN removes the 5
SELECT DISTINCT 
	inventory.inventory_id,
    rental.inventory_id
FROM inventory
	INNER JOIN rental
		ON inventory.inventory_id = rental.inventory_id
LIMIT 5000;



#LEFT JOIN
SELECT
	actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS number_of_films
FROM actor
	LEFT JOIN film_actor
		ON actor.actor_id = film_actor.actor_id
GROUP BY
	actor.first_name,
    actor.last_name;
    

#Assignment LEFT JOIN
# How many actors are listed for each film title?
SELECT 
	film.title,
    COUNT(film_actor.actor_id) as number_of_actors
FROM film
	LEFT JOIN film_actor
		ON film.film_id = film_actor.film_id
GROUP BY film.title;


#!!!!RIGHT JOIN -- DONT USE right join

#!!!!FULL OUTER JOIN aka FULL JOIN - Takes all columns from each table


#BRIDGING unrelated tables.  Find table that relates the two other non joinable tables
SELECT
	film.film_id,
    film.title,
    category.name AS category_name
FROM film
	INNER JOIN film_category
		ON film.film_id = film_category.film_id
	INNER JOIN category
		ON film_category.category_id = category.category_id;
        
        
# ASSIGNMENT BRIDGING tables
#List of all actors with each title they appear in. 
SELECT 
	actor.first_name,
    actor.last_name,
    film.title
FROM actor
	INNER JOIN film_actor
		ON actor.actor_id = film_actor.actor_id
	INNER JOIN film
		ON film_actor.film_id = film.film_id;
		
        
#       
### BRIDING with a condition Vs.   Multi-condition JOINS
SELECT 
	film.film_id,
    film.title,
    film.rating,
    category.name
FROM film
	INNER JOIN film_category
		ON film.film_id = film_category.film_id
	INNER JOIN category
		ON film_category.category_id = category.category_id
Where category.name = 'horror'
ORDER BY film_id;

#above same as Multi-condition JOINS but we can add more conditions
SELECT 
	actor.first_name,
    actor.last_name,
    film.title
FROM actor
	INNER JOIN film_category
		ON film.film_id = film_category.film_id
	INNER JOIN category
		ON film_category.category_id = category.category_id
		AND category.name='horror'
ORDER BY film_id;
		
        
# Assignment Multi-condition JOINS
# Pull list of distinct titles and their descriptions currently available in inventory at store 2?
SELECT DISTINCT
	film.title,
    film.description
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id
        AND store.store_id = '2';
    

# UNION - join two tables, returns all data from frist table then second table appened to the end. 
#Stacks two similar tables ontop of each other.  adds rows.   When Join adds columns
# Write second select statement instead of JOIN.
# UNION will deduplicate records.  
# UNION ALL will keep duplicates.
SELECT
	'advisor' AS type,
    first_name,
    last_name
FROM advisor

UNION

SELECT 
	'investor' AS type,
    first_name,
    last_name
FROM investor;

# Assignment UNION
# Pull a list of all staff & advisor names, and include a column noting if they are staff members or advisor


SELECT
	'advisor' AS type,
    first_name,
    last_name
FROM advisor

UNION

SELECT
	'staff' AS type,
    first_name,
    last_name
FROM staff
