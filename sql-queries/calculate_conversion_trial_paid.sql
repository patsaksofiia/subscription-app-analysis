-- Trial_paid_by_country

SELECT COUNT(DISTINCT t.user_id) AS users_count,
u.country,
t.transaction_type
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
WHERE t.transaction_type IN ('trial_start','first_payment')
GROUP BY 2,3
ORDER BY
u.country,
CASE t.transaction_type
WHEN 'trial_start' THEN 1
WHEN 'first_payment' THEN 2
END

-- Trial_paid_by_channel 
  
SELECT COUNT(DISTINCT t.user_id) AS users_count,
u.acquisition_channel,
t.transaction_type
FROM streamflow.transactions t
JOIN streamflow.users u
ON t.user_id = u.user_id
WHERE t.transaction_type IN ('trial_start','first_payment')
GROUP BY 2,3
ORDER BY
u.acquisition_channel,
CASE t.transaction_type
WHEN 'trial_start' THEN 1
WHEN 'first_payment' THEN 2
END
