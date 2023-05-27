CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH visits AS 
	(SELECT *
	FROM person_visits pv
	RIGHT JOIN 
		(SELECT *
		FROM person p
		WHERE p.name = 'Dmitriy') AS people
			ON pv.person_id = people.id
		WHERE pv.visit_date = '2022-01-08'), pizzerias AS 
		(SELECT pz.id AS pi_id,
		 pz.name
		FROM pizzeria pz
		JOIN visits
			ON pz.id = visits.pizzeria_id), prices AS 
		(SELECT pizzerias.name,
		 menu.price
		FROM pizzerias
		JOIN menu
			ON pizzerias.pi_id = menu.pizzeria_id)
	SELECT DISTINCT pr.name
FROM prices pr
WHERE pr.price < 800;