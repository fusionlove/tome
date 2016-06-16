automatic joins:

select * from [gameplays+users];
select * from [gameplays+users+purchases];

--yes_cache
Force run on cache

against your database. For cases like these, a great way to debug the query is to append "-- --yes_cache" to the top of your query. This explicitly tells it to try running only on the Periscope cache, and will give us a much clearer error message :)

After adding that line to the top of the query, I received an error of:

column "users.created_at" must appear in the GROUP BY clause or be used in an aggregate function

Our cache is built on Redshift clusters, and therefore requires Redshift syntax. And a unique quirk of Redshift is that it is very picky in terms of what you group by! It requires that you group by every non-aggregate function. In the case of your query, it looks like you would also want to group by "users.created_at::date" in your subquery. After doing that, the query runs successfully on the cache!

Let me know if this all makes sense, and if there's anything else that we can do to help :)