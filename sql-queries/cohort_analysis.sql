-- Cohort analysis

SELECT
t.user_id,
u.signup_date,
DATE_FORMAT(u.signup_date,'%Y-%m') AS cohort_month,
date AS transaction_date,
t.transaction_type,
sp.plan_name,
sp.duration_days
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
JOIN streamflow.subscription_plans sp
ON t.plan_id = sp.plan_id
WHERE t.transaction_type IN ('first_payment','renewal','upgrade')
ORDER BY t.user_id, t.date

-- Cohorts 

SELECT
user_id, MIN(date) AS first_payment_date,
DATE_FORMAT(MIN(date),'%Y-%m') AS cohort_month
FROM streamflow.transactions
WHERE transaction_type = 'first_payment'
GROUP BY user_id
