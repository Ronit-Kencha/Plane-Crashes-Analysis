WITH cleansing_ AS (
	SELECT *, 
		PARSENAME(REPLACE(p.Date, '/', '.'), 1) AS year_,
		PARSENAME(REPLACE(p.Location, ',', '.'), 2) AS loc1,
		PARSENAME(REPLACE(p.Location, ',', '.'), 1) AS loc2,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 2) AS op1,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 1) AS op2,
		ROUND(((p.Aboard - p.Fatalities)/(p.Aboard)), 3) AS Survival_Rate
	FROM plane_crashes p
	WHERE p.Aboard IS NOT NULL AND p.Fatalities IS NOT NULL AND p.Aboard != 0 AND p.Location IS NOT NULL
	)
SELECT c.year_, ROUND(AVG(Survival_Rate), 2) AS survival_rate
FROM cleansing_ c
WHERE c.year_ IS NOT NULL
GROUP BY c.year_;

WITH cleansing_ AS (
	SELECT *, 
		PARSENAME(REPLACE(p.Date, '/', '.'), 1) AS year_,
		PARSENAME(REPLACE(p.Location, ',', '.'), 2) AS loc1,
		PARSENAME(REPLACE(p.Location, ',', '.'), 1) AS loc2,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 2) AS op1,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 1) AS op2,
		ROUND(((p.Aboard - p.Fatalities)/(p.Aboard)), 3) AS Survival_Rate
	FROM plane_crashes p
	WHERE p.Aboard IS NOT NULL AND p.Fatalities IS NOT NULL AND p.Aboard != 0 AND p.Location IS NOT NULL
	)
SELECT c.loc2 AS location_, COUNT(*) AS num_of_crashes
FROM cleansing_ c
WHERE c.loc2 IS NOT NULL
GROUP BY c.loc2
ORDER BY num_of_crashes DESC;

WITH cleansing_ AS (
	SELECT *, 
		PARSENAME(REPLACE(p.Date, '/', '.'), 1) AS year_,
		PARSENAME(REPLACE(p.Location, ',', '.'), 2) AS loc1,
		PARSENAME(REPLACE(p.Location, ',', '.'), 1) AS loc2,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 2) AS op1,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 1) AS op2,
		ROUND(((p.Aboard - p.Fatalities)/(p.Aboard)), 3) AS Survival_Rate
	FROM plane_crashes p
	WHERE p.Aboard IS NOT NULL AND p.Fatalities IS NOT NULL AND p.Aboard != 0 AND p.Location IS NOT NULL
	)
SELECT c.op2 AS operator, COUNT(*) AS num_of_crashes
FROM cleansing_ c
WHERE c.op2 IS NOT NULL
GROUP BY c.op2
ORDER BY num_of_crashes DESC;

WITH cleansing_ AS (
	SELECT *, 
		PARSENAME(REPLACE(p.Date, '/', '.'), 1) AS year_,
		PARSENAME(REPLACE(p.Location, ',', '.'), 2) AS loc1,
		PARSENAME(REPLACE(p.Location, ',', '.'), 1) AS loc2,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 2) AS op1,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 1) AS op2,
		ROUND(((p.Aboard - p.Fatalities)/(p.Aboard)), 3) AS Survival_Rate
	FROM plane_crashes p
	WHERE p.Aboard IS NOT NULL AND p.Fatalities IS NOT NULL AND p.Aboard != 0 AND p.Location IS NOT NULL
	)
SELECT c.op1 AS operator_classification, COUNT(*) AS num_of_crashes
FROM cleansing_ c
WHERE c.op1 IS NOT NULL
GROUP BY c.op1
ORDER BY num_of_crashes DESC;

WITH cleansing_ AS (
	SELECT *, 
		PARSENAME(REPLACE(p.Date, '/', '.'), 1) AS year_,
		PARSENAME(REPLACE(p.Location, ',', '.'), 2) AS loc1,
		PARSENAME(REPLACE(p.Location, ',', '.'), 1) AS loc2,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 2) AS op1,
		PARSENAME(REPLACE(p.Operator, ' - ', '.'), 1) AS op2,
		ROUND(((p.Aboard - p.Fatalities)/(p.Aboard)), 3) AS Survival_Rate
	FROM plane_crashes p
	WHERE p.Aboard IS NOT NULL AND p.Fatalities IS NOT NULL AND p.Aboard != 0 AND p.Location IS NOT NULL
	)
SELECT c.year_, COUNT(*) AS num_of_crashes
FROM cleansing_ c
WHERE c.year_ IS NOT NULL
GROUP BY c.year_
ORDER BY num_of_crashes DESC;


