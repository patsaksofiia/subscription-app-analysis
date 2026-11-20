SELECT u.platform, t.transaction_type, COUNT(DISTINCT t.user_id) AS users_count
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
WHERE t.transaction_type IN ('trial_start', 'first_payment')
GROUP BY u.platform, t.transaction_type
