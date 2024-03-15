SELECT district
FROM Crime_against_st
JOIN (
    SELECT MAX(dacoity) AS max_A, MAX(robbery) AS max_B
    FROM Crime_against_st
    WHERE district NOT IN ('TOTAL')
) AS max_values
ON Crime_against_st.dacoity = max_values.max_A OR Crime_against_st.robbery = max_values.max_B
ORDER BY dacoity desc LIMIT 1
