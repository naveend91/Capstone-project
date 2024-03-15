SELECT state_ut, district, year, rape, Kidnapping_and_Abduction
FROM Women_Crime
JOIN (
    SELECT MIN(Rape) AS min_A, MIN(Kidnapping_and_Abduction) AS min_B
    FROM Women_Crime
	WHERE district NOT IN ('TOTAL')
) AS min_values
ON Women_Crime.rape = min_values.min_a OR Women_Crime.Kidnapping_and_Abduction = min_values.min_b