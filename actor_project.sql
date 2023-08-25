
-- actor full name with title and description last year and all columns of film --
select
concat(ac.first_name,' ',ac.last_name) as 'Actor Name',
f.title,
f.description,
f.release_year,
f.rental_duration,
f.rental_rate,
f.length,
f.replacement_cost,
f.rating,
f.special_features,
l.name as 'language name'
from actor_info ac
left join film_actor as ft on ft.actor_id = ac.actor_id
left join film as f on f.film_id = ft.film_id
left join language as l on l.language_id = f.language_id
where 1=1

-- Which actors have the first name ‘Scarlett’ --

select * from actor_info
where first_name = 'Scarlett';

-- Which actors have the last name ‘Johansson’

select * from actor_info
where last_name = 'Johansson';


-- How many distinct actors last names are there?

select count(distinct last_name)
from actor_info;

-- Which last names are not repeated?

SELECT last_name
FROM actor_info
GROUP BY last_name
HAVING COUNT(*) = 1;


-- Which last names appear more than once

SELECT last_name
FROM actor_info
GROUP BY last_name
HAVING COUNT(*) > 1;


-- Which actor has appeared in the most films, top 10 ?

SELECT 
actor.actor_id,
CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name,
COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 1,2
ORDER BY film_count DESC
LIMIT 10;



-- Is ‘Academy Dinosaur’ available for rent from Store 1?
SELECT
f.title AS film_title,
s.store_id,
i.inventory_id
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN store AS s ON i.store_id = s.store_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
WHERE f.title = 'Academy Dinosaur'
AND s.store_id = 1
AND r.rental_id IS NULL
LIMIT 1;


