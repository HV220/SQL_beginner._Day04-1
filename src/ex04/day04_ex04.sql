CREATE VIEW v_symmetric_union
AS
WITH R AS (SELECT *
           FROM person_visits pv
           WHERE pv.visit_date = '2022-01-02'),
     S AS (SELECT *
           FROM person_visits pv
           WHERE pv.visit_date = '2022-01-06'),
     R_RES AS (SELECT R.person_id
                FROM R
                EXCEPT
                SELECT S.person_id
                FROM S),
     S_RES AS (SELECT S.person_id
                FROM S
                EXCEPT
                SELECT R.person_id
                FROM R)
SELECT *
FROM R_RES
UNION
SELECT *
FROM S_RES
ORDER BY 1;