CREATE VIEW total AS
SELECT
	SUM(families) AS total_families,
	SUM(households) AS total_households,
	SUM(population) AS total_population,
	SUM(male) AS total_male,
	SUM(female) AS total_female
FROM census;