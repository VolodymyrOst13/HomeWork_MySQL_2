create database workerDB;

create table workerDB.workers
(
id int auto_increment not null primary key,
firstName varchar(15) not null,
lastName varchar(15) not null,
dateOfBirth date not null,
phone varchar(10) default 'Unknown',
email varchar(20) default 'Unknown'
);

insert into workerDB.workers
(firstName, lastName, dateOfBirth, phone, email)
values
('Іванов','Іван','1984-04-13','0991112233','ivanivanov@gmail.com'),
('Петренко','Петро','1995-01-21','0678887766','petrovidro@gmail.com'),
('Василенко','Василь','1998-09-30','0934441122','vasul@gmail.com'),
('Білецький','Андрій','1977-03-18','0991234567','andrey@gmail.com');


create table workerDB.PositionAndSalary
(
id int auto_increment not null primary key,
position varchar(25) not null,
salary double not null
);

insert into workerDB.PositionAndSalary
(position, salary)
values
('Директор','25000'),
('Заступник директора','18000'),
('Менеджер','14000'),
('Маркетолог','12000');


create table workerDB.baseInfo
(
id int auto_increment not null primary key,
workerId int not null,
positionId int not null,

foreign key(workerId) references workerDB.workers(id),
foreign key(positionId) references workerDB.PositionAndSalary(id)
);

insert into workerDB.baseInfo
(workerId, positionId)
values
('1','1'),
('2','2'),
('3','3'),
('4','4');
select * from workerDB.baseInfo;

