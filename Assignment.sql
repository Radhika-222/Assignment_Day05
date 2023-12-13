create database Assesment05Db
use Assesment05Db

---creating schema
create schema bank

---creating table Customer
create table bank.Customer(
CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact nvarchar(50) not null unique,
CPwd as substring(CName,Len(CName) -1,2)+ cast(CId as nvarchar) + ' ' + left(Contact,2) persisted )


---creating table MailInfo
create table bank.MailInfo(
MailTo nvarchar(50),
MailDate date ,
MailMessage nvarchar(200))


---creating trigger 
create trigger trgMailToCust
on bank.Customer
after insert
as
begin
insert into bank.MailInfo(MailTo,MailDate,MailMessage)
select CEmail, getdate(), 'Your net banking password is: ' + CPwd + 'It is valid upto 2 days only. Update it.' from inserted
end

---displaying tables
select * from bank.Customer
select * from bank.MailInfo

---inserting records
insert into bank.Customer (CName,CEmail,Contact) values
('Raj','raj@gmail.com','1234567890'),
('Sameer','sameer@gmail.com','0987654321'),
('Shnaya','shnaya@gmail.com','9856743210')






