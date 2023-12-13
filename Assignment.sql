create database Assesment05Db
use Assesment05Db

create schema bank


create table bank.Customer(
CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact nvarchar(50) not null unique,
CPwd as substring(CName,Len(CName) -1,2)+ cast(CId as nvarchar) + ' ' + left(Contact,2) persisted )



create table bank.MailInfo(
MailTo nvarchar(50),
MailDate date ,
MailMessage nvarchar(50))



create trigger bank.trgMailToCust
on bank.Customer
after insert
as
begin
insert into bank.MailInfo(MailTo,MailDate,MailMessage)
select inserted.CEmail, getdate(), 'Your net banking password is: ' +inserted.CPwd + 'It is valid upto 2 days only. Update it.'
from inserted
end

select * from bank.Customer
select * from bank.MailInfo

insert into bank.Customer (CName,CEmail,Contact) values
('Raj','raj@gmail.com','1234567890'),
('Sameer','sameer@gmail.com','0987654321'),
('Shnaya','shnaya@gmail.com','9856743210')



