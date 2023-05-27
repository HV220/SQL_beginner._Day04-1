CREATE VIEW v_price_with_discount AS WITH orders AS 
	(SELECT *
	FROM person_order
	LEFT JOIN person p
		ON p.id = person_order.person_id), menu_orders AS 
	(SELECT *
	FROM menu
	RIGHT JOIN orders
		ON orders.menu_id = menu.id)
SELECT menu_orders.name,
		 menu_orders.pizza_name,
		 menu_orders.price,
		 ROUND(menu_orders.price * 0.9) AS discount_price
FROM menu_orders
ORDER BY  1,2;

