-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name, count(last_name) as repeats FROM sakila.actor
GROUP BY last_name HAVING repeats = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name, count(last_name) as repeats FROM sakila.actor
GROUP BY last_name HAVING repeats > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT count(rental_id), staff_id FROM sakila.rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT count(film_id), release_year FROM sakila.film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT count(film_id), rating FROM sakila.film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT round(AVG(length),2) AS average_length, rating FROM sakila.film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT round(AVG(length),2)  AS average_length, rating FROM sakila.film
GROUP BY rating HAVING average_length > 120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length, length AS ranking FROM sakila.film
WHERE length IS NOT NULL AND length NOT LIKE '%0%'
ORDER BY ranking DESC;