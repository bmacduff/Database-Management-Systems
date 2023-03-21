
drop database if exists restaurantDB;
create database restaurantDB;
use restaurantDB;

create table Restaurant(
Restaurant_name 	VARCHAR(15) not null,
Restaurant_URL		VARCHAR(15) not null,
Restaurant_street	VARCHAR(15),
Restaurant_city		VARCHAR(15),
Restaurant_PC		VARCHAR(10),

PRIMARY KEY(Restaurant_URL));

create table Menu(
Name_of_food		VARCHAR(20) not null,
Menu_price 		DECIMAL(5,2) not null,

PRIMARY KEY(Name_of_food, Menu_price));

create table RestaurantOffers(
Name_of_food		VARCHAR(20) not null,
Menu_price		DECIMAL(5,2) not null,
Restaurant_URL		VARCHAR(15) not null,

PRIMARY KEY(Restaurant_URL, Name_of_food),
FOREIGN KEY(Restaurant_URL) REFERENCES Restaurant(Restaurant_URL) on delete cascade,
FOREIGN KEY(Name_of_food, Menu_price) REFERENCES Menu(Name_of_food, Menu_price) on delete cascade);

create table Employee(
Employee_email		VARCHAR(30),
Employee_name		VARCHAR(15),
Employee_type		ENUM("Chef", "Manager", "Delivery", "Server") not null,
Employee_ID		INTEGER	not null,
Restaurant_URL		VARCHAR(15) not null,

PRIMARY KEY(Employee_ID),
FOREIGN KEY(Restaurant_URL) REFERENCES Restaurant(Restaurant_URL) on delete cascade);

create table Credentials(
Chef_ID			INTEGER	not null,
Credentials		VARCHAR(100) not null,

PRIMARY KEY(Chef_ID, Credentials),
FOREIGN KEY(Chef_ID) REFERENCES Employee(Employee_ID) on delete cascade);


create table Customer(
Customer_name		VARCHAR(20) not null,
Phone_number		INTEGER,
Customer_email		VARCHAR(30) not null,
Customer_street		VARCHAR(15) not null,
Customer_city		VARCHAR(15) not null,
Customer_PC		VARCHAR(10),

PRIMARY KEY(Customer_email));

create table Orders(
Order_price		DECIMAL(5,2),
Order_ID		INTEGER	not null,
Placement_time		TIME,
Delivery_time		TIME,
Tip			DECIMAL(5,2),
Delivery_ID		INTEGER,
Customer_email		VARCHAR(30),

PRIMARY KEY(Order_ID),
FOREIGN KEY(Customer_email) REFERENCES Customer(Customer_email) on delete set null,
FOREIGN KEY(Delivery_ID) REFERENCES Employee(Employee_ID) on delete set null);

create table OrderContains(
Order_ID		INTEGER	not null,
Name_of_food		VARCHAR(20) not null,
Menu_price 		DECIMAL(5,2) not null,
	
PRIMARY KEY(Order_ID, Name_of_food),
FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID) on delete cascade,
FOREIGN KEY(Name_of_food, Menu_price) REFERENCES Menu(Name_of_food, Menu_price) on delete cascade);		
			

create table CustomerRelations(
Customer_email		VARCHAR(30) not null,
Employee_ID		INTEGER	not null,

PRIMARY KEY(Customer_email, Employee_ID),
FOREIGN KEY(Customer_email) REFERENCES Customer(Customer_email) on delete cascade,
FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID) on delete cascade);
	
	
create table Schedule(
Schedule_day		DATE not null,
Schedule_starttime	TIME not null,
Schedule_endtime	TIME not null,
Employee_ID		INTEGER	not null,

FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID)  on delete cascade,
PRIMARY KEY(Schedule_day, Schedule_starttime, Schedule_endtime));

create table Payments(
Payment_price		DECIMAL(5,2) not null,
Payment_credit		DECIMAL(5,2) not null,
Payment_date		DATE not null,
Customer_email		VARCHAR(30) not null,

PRIMARY KEY(Payment_date),
FOREIGN KEY(Customer_email) REFERENCES Customer(Customer_email) on delete cascade);


insert into Restaurant values
('Super Sushi', 'supersushi.com', 'Lake Street', 'Kingston', 'F5F 5F5'),
('Burger Bonanza', 'burgerbonanza.com', 'King Street', 'Kingston', 'B2B 2B2'),
('Pizza Palace', 'pizzapalace.com', 'Palace Road', 'Kingston', 'C3C 3C3'),
('Chicken Chalice', 'chickenchalice.com', 'Queen Street', 'Belleville', 'D4D 4D4'),
('Sub Hub', 'subhub.com', 'Sandwich Avenue', 'Brockville', 'A1A 1A1')
;

insert into Menu values
('Sushi Roll', 7.00),
('Cheeseburger', 8.00),
('Fries', 4.00),
('Fries', 3.50),
('Turkey Club', 12.00),
('Fries', 3.00),
('Medium Pizza', 15.00)
;

insert into RestaurantOffers values
('Sushi Roll', 7.00, 'supersushi.com'),
('Cheeseburger', 8.00, 'burgerbonanza.com'),
('Fries', 4.00, 'burgerbonanza.com'),
('Fries', 3.50, 'chickenchalice.com'),
('Turkey Club', 12.00, 'subhub.com'),
('Fries', 3.00, 'pizzapalace.com'),
('Medium Pizza', 15.00, 'pizzapalace.com')
;

insert into Employee values
('caleb@gmail.com', 'Caleb', 'Manager', 6789, 'subhub.com'),
('jon@gmail.com', 'Jon', 'Chef', 1234, 'burgerbonanza.com'),
('bryan@gmail.com', 'Bryan', 'Delivery', 2345, 'pizzapalace.com'),
('ashley@gmail.com', 'Ashley', 'Server', 3456, 'supersushi.com'),
('clare@gmail.com', 'Clare', 'Manager', 4567, 'subhub.com'),
('matt@gmail.com', 'Matt', 'Chef', 5678, 'chickenchalice.com'),
('ryan@gmail.com', 'Ryan', 'Chef', 7890, 'supersushi.com'),
('brad@gmail.com', 'Brad', 'Chef', 8901, 'burgerbonanza.com'),
('craig@gmail.com', 'Craig', 'Chef', 9012, 'subhub.com'),
('phil@gmail.com', 'Phil', 'Chef', 0123, 'chickenchalice.com')
;

insert into Credentials values
(1234, 'Professional chef'),
(5678, 'Master Chef'),
(7890, 'Regular Chef'),
(8901, 'Regular Chef'),
(9012, 'Professional Chef'),
(0123, 'Junior Chef')
;

insert into Customer values
('Devin', 6666666666, 'devin@gmail.com', 'King Street', 'Kingston', 'G7H 1M0'),
('Dan', 1111111111, 'dan@gmail.com', 'University Avenue', 'Kingston', 'D4F 3S9'),
('Don', 2222222222, 'don@gmail.com', 'Nelson Street', 'Kingston', 'K7L 3W9'),
('Donna', 3333333333, 'donna@gmail.com', 'Victoria Street', 'Kingston', 'K7L 3W9'),
('Dave', 4444444444, 'dave@gmail.com', 'Brock Street', 'Brockville', 'D0W 3F5'),
('Debby', 5555555555, 'debby@gmail.com', 'Belle Road', 'Belleville', 'J9H 1B2')
;

insert into Orders values
(109.68, 5432, '08:25:50', '08:50:30', 21.00, 2345, 'devin@gmail.com'),
(62.50, 0987, '10:00:00', '10:30:00', 4.00, 2345, 'don@gmail.com'),
(38.50, 9876, '04:20:30', '05:10:00', 6.00, 2345, 'dan@gmail.com'),
(20.15, 8765, '06:36:00', '07:00:00', 5.00, 2345, 'donna@gmail.com'),
(59.67, 7654, '02:25:50', '02:45:40', 10.00, 2345, 'debby@gmail.com'),
(86.50, 6543, '01:12:10', '01:30:25', 16.45, 2345, 'dan@gmail.com')
;

insert into OrderContains values
(5432, 'Sushi Roll', 7.00),
(0987, 'Fries', 4.00),
(0987, 'Cheeseburger', 8.00),
(8765, 'Turkey Club', 12.00),
(7654, 'Medium Pizza', 15.00),
(6543, 'Fries', 3.50)
;

insert into CustomerRelations values
('devin@gmail.com', 6789),
('don@gmail.com', 1234),
('dan@gmail.com', 2345),
('don@gmail.com', 3456),
('donna@gmail.com', 3456),
('dave@gmail.com', 4567);

insert into Schedule values
('2023-02-25', '04:30:00', '07:30:00', 6789),
('2023-02-20', '04:00:00', '07:00:00', 2345),
('2023-02-21', '05:00:00', '08:00:00', 3456),
('2023-02-22', '02:00:00', '09:00:00', 4567),
('2023-02-23', '12:00:00', '05:00:00', 1234),
('2023-02-24', '06:00:00', '10:00:00', 5678);

insert into Payments values
(59.67, 80.00, '2023-02-17', 'debby@gmail.com'),
(109.68, 200.00,'2023-02-20', 'devin@gmail.com'),
(62.50, 90.00, '2023-02-24', 'dan@gmail.com'),
(20.15, 50.00, '2023-02-27', 'donna@gmail.com'),
(38.50, 60.00, '2023-02-19', 'dave@gmail.com'),
(86.50, 400.00, '2023-02-23', 'don@gmail.com');
