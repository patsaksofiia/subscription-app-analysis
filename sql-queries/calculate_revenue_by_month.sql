-- Revenue_by_month

SELECT SUM(amount_usd) AS revenue,
DATE_FORMAT(`date`,'%Y-%m') AS month
FROM streamflow.transactions
GROUP BY month

-- Annual_revenue_by_month

SELECT SUM(amount_usd) AS revenue,
DATE_FORMAT(`date`,'%Y-%m') AS month
FROM streamflow.transactions
WHERE plan_id = 'P04'
GROUP BY month

-- Annual_transactions_by_month

SELECT COUNT(transaction_id) AS annual_count,
DATE_FORMAT(`date`,'%Y-%m') AS month
FROM streamflow.transactions
WHERE plan_id = 'P04'
GROUP BY month

-- Revenue_by_country_and_month

SELECT SUM(t.amount_usd) AS revenue, u.country,
DATE_FORMAT(date,'%Y-%m') AS month
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
GROUP BY month, u.country
