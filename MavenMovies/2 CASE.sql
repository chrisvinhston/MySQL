USE mavenmovies;


# Case Operators
SELECT DISTINCT 
	length,
    CASE
		WHEN length < 60 THEN 'under 1 hr'
        WHEN length BETWEEN 60 and 90 THEN '1-1.5 hrs'
        WHEN length > 90 THEN 'over 1.5 hrs'
        ELSE 'UH oh... Check logic!'
	END AS length_bucket
FROM film;


SELECT DISTINCT 
	title,
    CASE
		WHEN rental_duration <= 4 THEN 'rental_too_short'
        WHEN rental_rate >= 3.99 THEN 'too_expensive'
        WHEN rating IN ('NC-17', 'R') THEN 'too_adult'
        WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
        WHEN DESCRIPTION LIKE '%Shark%' THEN 'nope_has_sharks'
        ELSE 'great_reco_for_my_neice'
	END AS fit_for_recommendation,
	CASE
		WHEN DESCRIPTION LIKE '%Shark%' THEN 'nope_has_sharks'
        WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
        WHEN rating IN ('NC-17', 'R') THEN 'too_adult'
        WHEN rental_duration <= 4 THEN 'rental_too_short'
        WHEN rental_rate >= 3.99 THEN 'too_expensive'
        ELSE 'great_reco_for_my_neice'
	END AS reordered_reco
FROM film;


#ASSIGNMENT CASE STATEMENTS 
SELECT 
	first_name,
    last_name,
	CASE
		WHEN store_id = 1 AND active = 1 THEN 'store 1 active'
        WHEN store_id = 1 AND active = 0 THEN 'store 1 inactive'
        WHEN store_id = 2 and active = 1 THEN 'store 2 active'
        WHEN store_id = 2 and active = 0 THEN 'store 2 inactive'
        ELSE 'uh oh... check logic'
    END AS 'store_and_status'
FROM customer;
	
    
    
    
## CASE COUNT 
SELECT
	film_id,
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS store_1_copies,
    COUNT(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END) AS store_2_copies,
    COUNT(inventory_id) AS total_copies
FROM inventory
GROUP BY
	film_id
ORDER BY
	film_id;
    
# CASE PIVOT CASE & COUNT
SELECT 
    film_id,
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS store_1_inventory,
    COUNT(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END) AS store_2_inventory
FROM inventory
GROUP BY
    film_id
ORDER BY film_id;

#ASSIGNMENT - CASE PIVOT CASE & COUNT
SELECT 
	store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active,
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS inactive
FROM customer
GROUP BY store_id
ORDER BY store_id