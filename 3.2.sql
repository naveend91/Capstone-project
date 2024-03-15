SELECT *
FROM Women_Crime
JOIN (
    SELECT MAX(Rape) AS max_A, MAX(Kidnapping_and_Abduction) AS max_B
    FROM Women_Crime
	WHERE district NOT IN ('TOTAL')
) AS max_values
ON Women_Crime.rape = max_values.max_a OR Women_Crime.Kidnapping_and_Abduction = max_values.max_b