create database storageDB;

create table storageDB.distributor
(
	id int auto_increment not null primary key,
    companyId varchar(10) not null,
    company varchar(40) not null,
    manager varchar(40) not null,
    phoneNum varchar(20) default 'Unknown',
    email varchar(50) not null,
    productType varchar(100) not null
);

insert into storageDB.distributor
(companyId, company, manager, phoneNum, email, productType)
values
('123','Vitolux','Kristina','+4366400000001','vitolux@gmail.com','Laminat'),
('012','IntererExpert','Volodymyr','+4366400000002','expert@gmail.com','SPC, Vinil'),
('210','Barlinek','Olexandr','+4366400000003','barlinek@gmail.com','Parquet'),
('321','Kronopol','Olga','+4366400000004','kronopol@gmail.com','Laminat');



create table storageDB.employees
(
	id int auto_increment not null primary key,
	firstName varchar(30) not null,
    lastName varchar(30) not null,
    position varchar(40) not null,
    salary double default '0.0'
);

insert into storageDB.employees
(firstName, lastName, position, salary)
values
('Shevchenko','Taras','Director','15000'),
('Ivanov','Ivan','Manager','12000'),
('Dmytriv','Dima','Marketolog','10000');
select * from storageDB.employees;

create table storageDB.clients 
(	
	firstName varchar(30) not null,
    lastName varchar(30) not null,
	phone VARCHAR(20) NOT NULL,   
	city VARCHAR(30) DEFAULT 'Unknown',
    primary key (phone)
);

insert into storageDB.clients
(firstName, lastName, phone, city)
values
('Poliakov','Ivan','0997757411','Kiev'),
('Pridko','Yulia','0991112233','Ternopil');

create table storageDB.stock
(	
	 id int auto_increment not null primary key,
     productName varchar (40),
     manufacturerId int not null,
     category varchar(30)  not null,
     price double not null,
     availableInStockM2 double NOT NULL,
     foreign key(manufacturerId) references storageDB.distributor(id)
);

insert into storageDB.stock																		   
(productName, manufacturerId, category, price, availableInStockM2)
VALUES
('Laminat kronopol 1280 x 193','1','Laminat','350', '380.48'),
('SPC Villeroy & Bosch','2','SPC Floors', '890','150.4'),
('Parquet barlinek','3','Parquet', '1800','200');
select * from storageDB.stock;

CREATE TABLE storageDB.sales
(	
	 id int auto_increment not null primary key,
     dataSale datetime,
     FIO varchar(70),
     stockID int not null,
     phoneId VARCHAR(30) NOT NULL,
     quantity double ,
     price double NOT NULL,
     sum double,
	foreign key(phoneId) references clients(phone),
    foreign key(stockID) references storageDB.stock(id)
);
select * from storageDB.sales;


INSERT INTO storageDB.sales																		   
(dataSale, stockID, phoneId, quantity, price, sum)
VALUES
(now(), 1, '0991112233', 40, (select price from storageDB.stock where id = 1), (price * quantity));
SELECT * FROM storageDB.sales;

