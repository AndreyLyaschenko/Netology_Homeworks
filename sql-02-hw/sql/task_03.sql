-- Месяц с максимальной суммой платежей.
-- Дополнительно считаем аренды, оформленные в этом месяце.

WITH monthly_payments AS (
    SELECT
        DATE_FORMAT(payment_date, '%Y-%m') AS month,
        SUM(amount) AS total_amount
    FROM payment
    GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
),
monthly_rentals AS (
    SELECT
        DATE_FORMAT(rental_date, '%Y-%m') AS month,
        COUNT(*) AS rental_count
    FROM rental
    GROUP BY DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT
    mp.month,
    ROUND(mp.total_amount, 2) AS total_amount,
    COALESCE(mr.rental_count, 0) AS rental_count
FROM monthly_payments AS mp
LEFT JOIN monthly_rentals AS mr
    ON mr.month = mp.month
ORDER BY mp.total_amount DESC
LIMIT 1;