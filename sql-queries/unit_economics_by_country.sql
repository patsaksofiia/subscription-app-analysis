-- LTV

SELECT
u.country,
COUNT(DISTINCT u.user_id) AS users_count,
SUM(t.amount_usd) AS revenue
FROM streamflow.users u
LEFT JOIN transactions t
ON u.user_id = t.user_id
GROUP BY u.country
ORDER BY users_count DESC

-- CAC

WITH users_by_country AS (
SELECT
country,
COUNT(DISTINCT user_id) AS users_count
FROM streamflow.users
GROUP BY country
),
spend_by_country AS (
SELECT country,
SUM(spend_usd) AS marketing_costs
FROM streamflow.marketing_spend
GROUP BY country
)
SELECT
u.country,
u.users_count,
s.marketing_costs
FROM users_by_country u
LEFT JOIN spend_by_country s
ON u.country = s.country
ORDER BY u.users_count DESC
