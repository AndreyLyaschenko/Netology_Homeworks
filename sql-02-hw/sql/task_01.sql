SELECT
    s.store_id,
    st.first_name,
    st.last_name,
    ci.city,
    COUNT(DISTINCT cu.customer_id) AS customer_count
FROM store AS s
JOIN staff AS st
    ON st.store_id = s.store_id
JOIN address AS a
    ON a.address_id = s.address_id
JOIN city AS ci
    ON ci.city_id = a.city_id
JOIN customer AS cu
    ON cu.store_id = s.store_id
GROUP BY
    s.store_id,
    st.staff_id,
    st.first_name,
    st.last_name,
    ci.city
HAVING COUNT(DISTINCT cu.customer_id) > 300
ORDER BY customer_count DESC;