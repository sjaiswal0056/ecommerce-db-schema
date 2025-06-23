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











