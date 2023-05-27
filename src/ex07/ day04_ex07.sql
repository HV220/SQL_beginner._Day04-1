INSERT INTO person_visits VALUES (
	(SELECT MAX(id)
	FROM person_visits) + 1, 
		(SELECT p.id
		FROM person p
		WHERE p.name = 'Dmitriy'), 
			(SELECT t1.id
			FROM 
				(SELECT *
				FROM pizzeria pz) t1
				JOIN 
					(SELECT *
					FROM menu m
					WHERE m.price < 800) t2
						ON t1.id = t2.pizzeria_id EXCEPT 
						(SELECT pz.id
						FROM pizzeria pz
						JOIN mv_dmitriy_visits_and_eats mdvae
							ON pz.name = mdvae.name)
						ORDER BY  1 LIMIT 1), TIMESTAMP '2022-01-08'); REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;