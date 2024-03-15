SELECT DISTINCT District, murder
FROM crime_against_st
WHERE District IN (
    SELECT District
    FROM crime_against_st
    GROUP BY District
    HAVING SUM(murder) = (
        SELECT MIN(total_murders)
        FROM (
            SELECT SUM(murder) AS total_murders
            FROM crime_against_st
            GROUP BY District
        ) AS min_murders
    )
)
ORDER BY district;
