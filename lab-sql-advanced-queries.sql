USE sakila;


# 1. List each pair of actors that have worked together.


# 2. For each film, list actor that has acted in more films.
# find the actor that has been in most films per film title

-- with cte
WITH cte_film AS (
SELECT 
	DISTINCT(F.title),
    FA.actor_id, 
    A.first_name, 
    A.last_name,
    #COUNT(FA.actor_id) AS num_films
    COUNT(FA.film_id) AS num_films
FROM film AS F   
INNER JOIN  film_actor AS FA USING (film_id)
INNER JOIN actor AS A USING (actor_id)
GROUP BY F.title, FA.actor_id
ORDER BY num_films DESC)
SELECT * FROM cte_film
WHERE actor_id  ;

-- tring to figure out a better query for the question
SELECT title, film_id, COUNT(actor_id)
FROM film AS F
INNER JOIN film_actor AS FA USING(film_id)
GROUP BY film_id;