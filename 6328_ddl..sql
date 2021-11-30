CREATE DATABASE order_processing;
CREATE TABLE customer(
	customer_id int(8) PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(32) NOT null,
    city VARCHAR(32) 
);
 CREATE TABLE `item`(
    item_id INT(8) PRIMARY KEY ,
    unit_price INT(6) NOT NULL
);

CREATE TABLE  `order` (
    order_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    customer_id INT(8),
    FOREIGN KEY(customer_id) REFERENCES `customer`(customer_id)
);CREATE TABLE `order_item`(
    order_id INT(8) NOT NULL,
    item_id INT(8) NOT NULL,
    quantity INT(8) NOT NULL,
    PRIMARY KEY(order_id, item_id),
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(item_id) REFERENCES `item`(item_id)
); CREATE TABLE `warehouse`(
    warehouse_id INT(8) PRIMARY KEY,
    warehouse_city VARCHAR(32)
); 
 CREATE TABLE `shipment`(
    order_id INT(8),
    warehouse_id INT(8),
    ship_date DATETIME NOT NULL,
    PRIMARY KEY(order_id, warehouse_id),
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(warehouse_id) REFERENCES `warehouse`(warehouse_id)
);