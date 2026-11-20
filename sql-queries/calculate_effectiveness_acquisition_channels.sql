ELECT u.country, sp.plan_name, sp.list_price_usd, SUM(t.amount_usd) AS sum_paid,
COUNT(DISTINCT t.user_id) AS users_count
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
JOIN streamflow.subscription_plans sp
ON t.plan_id = sp.plan_id
WHERE u.country IN ('BR', 'MX', 'US')
AND t.amount_usd > 0
GROUP BY u.country, sp.plan_name, sp.list_price_usd
