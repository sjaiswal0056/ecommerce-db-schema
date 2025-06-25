create database EcommerceDB;
use EcommerceDB;
create table Customer(
	Customer_id int primary key auto_increment,
    name varchar(100) ,
    email varchar(100) unique,
    phoneno varchar(100)
);


create table Category (
	Category_id int primary key auto_increment,
    name varchar(100),
    description text
    
);

create table product(
	product_id int primary key auto_increment,
    name varchar(20),
    price decimal(10,2),
    Category_id int ,
    foreign key(Category_id) references Category(Category_id)
);

create table `Order`(
	order_id int primary key auto_increment,
    Customer_id int,
    order_date date ,
    total_amount decimal(10,2),
    foreign key(customer_id) references Customer(Customer_id)
);
create table OrderItem (
	OrderItem_id int primary key auto_increment,
    order_id int,
    product_id int,
    quality int,
    foreign key(order_id) references `order`(order_id),
	foreign key(product_id) references product(product_id)
	);
   
   
   CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

INSERT INTO Customer (name, email, phoneno)
VALUES
('Shivani', 'shivani@gmail.com', NULL),
('Priyanka', 'pkjaiswal@gmail.com', '768594848');


INSERT INTO Category (name, description)
VALUES
('Electronics', 'Electronic gadgets and devices'),
('Fashion', 'Clothing and accessories');

INSERT INTO Product (name, price, Category_id)
VALUES
('Smartphone', 19999.99, 1),
('Laptop', NULL, 1),         
('T-Shirt', 499.00, 2);

INSERT INTO `Order` (Customer_id, order_date, total_amount)
VALUES
(1, '2024-06-01', 20498.99),
(2, '2024-06-02', NULL);  

INSERT INTO OrderItem (order_id, product_id, quality)
VALUES
(1, 1, 1),   -- Shivani ordered 1 unit of Smartphone
(1, 3, 2),   -- Shivani also ordered 2 units of T-Shirt
(2, 2, 1);   -- Priyanka ordered 1 unit of Laptop

insert into Payment(payment_id,order_id,amount,payment_method)
values
(1,1,89.0,"credit_card"),
(2,2,89.0,"credit_card");


update Payment set amount=4.0
where Payment_id=1;
select * from Payment;

update payment set amount=50000.000
where  payment_id=2;
select * from Payment;

delete from OrderItem
where Order_id=1 and product_id=1;










