-- Количество фильмов, продолжительность которых
-- больше средней продолжительности всех фильмов.

SELECT
    COUNT(*) AS films_above_average
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);
