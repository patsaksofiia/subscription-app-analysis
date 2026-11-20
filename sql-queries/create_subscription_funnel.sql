-- Subscription_funnel
SELECT COUNT(DISTINCT user_id) AS users_count, 'sign_up' AS stage
FROM streamflow.users
UNION
SELECT COUNT(DISTINCT user_id), transaction_type AS stage
FROM streamflow.transactions
GROUP BY transaction_type
ORDER BY
CASE stage
WHEN 'sign_up' THEN 1
WHEN 'trial_start' THEN 2
WHEN 'first_payment' THEN 3
WHEN 'renewal' THEN 4
WHEN 'upgrade' THEN 5
WHEN 'refund' THEN 6
END
  
-- Subscription_funnel_by_country

SELECT COUNT(DISTINCT u.user_id) AS users_count, 'sign_up' AS stage, u.country
FROM streamflow.users u
GROUP BY u.country
UNION
SELECT COUNT(DISTINCT t.user_id), t.transaction_type AS stage, u.country
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
GROUP BY t.transaction_type, u.country
ORDER BY
CASE stage
WHEN 'sign_up' THEN 1
WHEN 'trial_start' THEN 2
WHEN 'first_payment' THEN 3
WHEN 'renewal' THEN 4
WHEN 'upgrade' THEN 5
WHEN 'refund' THEN 6
END

-- Direct_payers_total

SELECT COUNT(DISTINCT sub.user_id)
FROM (
SELECT user_id, transaction_type, `date`,
MIN(date) OVER (PARTITION BY user_id) AS first_date
FROM streamflow.transactions
) AS sub
WHERE `date` = first_date
AND transaction_type = 'first_payment'

-- Direct_payers_by_country 
  
SELECT COUNT(DISTINCT sub.user_id) AS users_direct_pay, u.country
FROM (
SELECT t.user_id, t.transaction_type, t.`date`,
MIN(t.date) OVER (PARTITION BY t.user_id) AS first_date
FROM streamflow.transactions t
) AS sub
JOIN users u
ON sub.user_id = u.user_id
WHERE `date` = first_date
AND transaction_type = 'first_payment'
GROUP BY u.country
ORDER BY users_direct_pay DESC
