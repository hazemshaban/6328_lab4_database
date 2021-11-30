SELECT customer_name 
FROM customer
WHERE customer_name LIKE "Ma%";

SELECT order_item.order_id ,sum(quantity) quantity,sum(order_item.quantity*item.unit_price) totalPrice
FROM order_item
left JOIN item
on item.item_id=order_item.item_id
GROUP BY order_item.order_id;

SELECT order_id 
FROM shipment
left JOIN warehouse
on shipment.warehouse_id=warehouse.warehouse_id
WHERE warehouse.warehouse_city LIKE "Arica";

SELECT shipment.warehouse_id ,sum(item.unit_price*order_item.quantity) totalPrice
FROM shipment
INNER JOIN order_item 
on shipment.order_id=order_item.order_id
JOIN item
on order_item.item_id=item.item_id
WHERE shipment.warehouse_id=8
GROUP BY shipment.warehouse_id;

SELECT warehouse.warehouse_id,warehouse.warehouse_city,COUNT(shipment.order_id)orderCount
FROM warehouse
LEFT JOIN shipment
on warehouse.warehouse_id=shipment.warehouse_id
GROUP BY warehouse.warehouse_id;

SELECT customer.customer_name,count(`order`.`order_id`)orderCount
FROM customer
LEft JOIN `order`
on customer.customer_id=`order`.`customer_id`
GROUP by customer.customer_id;


SELECT item.item_id
FROM item 
LEFT JOIN order_item
on item.item_id=order_item.item_id
WHERE order_item.order_id is null;