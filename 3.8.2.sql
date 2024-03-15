WITH RankedMurders AS (
    SELECT 
        state_ut, 
        district, 
        year, 
        murder,
        ROW_NUMBER() OVER(PARTITION BY state_ut, year ORDER BY murder DESC) AS murder_rank
    FROM  ipc_crimes
	WHERE district != 'TOTAL'
)
SELECT 
    state_ut,
    district,
    year,
    murder
FROM 
    RankedMurders
WHERE 
    murder_rank = 1;