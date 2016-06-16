with monthly_activity as (
  select distinct
    date_trunc('month', created_at) as month,
    user_id
  from events
)

date_trunc('datepart', source)

GROUP BY 1: group by first column
COUNT(1): count first column