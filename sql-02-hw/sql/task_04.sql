-- Количество продаж каждого сотрудника.
-- Если продаж больше 8000, сотруднику положена премия.

SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    COUNT(p.payment_id) AS sales_count,
    CASE
        WHEN COUNT(p.payment_id) > 8000 THEN 'Да'
        ELSE 'Нет'
    END AS bonus
FROM staff AS s
LEFT JOIN payment AS p
    ON p.staff_id = s.staff_id
GROUP BY
    s.staff_id,
    s.first_name,
    s.last_name
ORDER BY sales_count DESC;
