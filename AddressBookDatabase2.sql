--UC12
CREATE DATABASE Address_Book_SystemService_Database_2
USE Address_Book_SystemService_Database_2

CREATE TABLE AddressBook
(
AddressBookId int primary key identity(1,1),
AddressBookName varchar(255)
)
Insert Into AddressBook values('AddressBook1')
Insert Into AddressBook values('AddressBook2')
Insert Into AddressBook values('AddressBook3')
Select * From AddressBook

CREATE TABLE Person
(
PersonId int primary key identity(101,1),
AddressBookId int references AddressBook(AddressBookId),
FirstName VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
State VARCHAR(255) NOT NULL,
Zip Int NOT NULL,
MobNo Int NOT NULL,
Email VARCHAR(255) NOT NULL,
)
Insert Into Person values(1,'Oggy','Melon','Khadki','Pune','Maharashtra',410506,987654321,'oggy123@gmail.com')
Insert Into Person values(2,'Jack','Silva','pimpri','Noida','Delhi',506410,123456789,'jack321@gmail.com')
Insert Into Person values(3,'Olivia','Gracia','Lonavala','Aurangabad','Karnataka',510406,741258963,'olivia123@gmail.com')
Insert Into Person values(1,'Joey','Angels','Indore','Myanmad','Gujrat',420153,786214593,'joey123@gmail.com')
Insert Into Person values(3,'DeeDee','Martin','Indore','Myanmad','Gujrat',654231,879546213,'deedee123@gmail.com')
Select * From Person

CREATE TABLE Type
(
TypeId int primary key identity(1001,1),
TypeName varchar(255)
)
Insert Into Type values('Friend')
Insert Into Type values('Family')
Insert Into Type values('Profession')
Insert Into Type values('Friend')
Insert Into Type values('Profession')

Select * From Type

CREATE TABLE PersonType
(
PersonId int references Person(PersonId),
TypeId int references Type(TypeId)
)
Insert Into PersonType values(101,1001)
Insert Into PersonType values(102,1002)
Insert Into PersonType values(103,1003)
Insert Into PersonType values(104,1004)
Insert Into PersonType values(105,1005)
Select * From PersonType

--UC13
--UC6_Redo--
Select AddressBookName,FirstName,LastName,Address,City,State,Zip,MobNo,Email,TypeName
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId AND City='Myanmad' AND State='Gujrat'
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId

--UC7_Redo--
Select City,Count(City),State,COUNT(State)
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId Group By City,State

--UC8_Redo--
Select AddressBookName,FirstName,LastName,Address,City,State,Zip,MobNo,Email,TypeName
From AddressBook
INNER Join Person ON AddressBook.AddressBookId=Person.AddressBookId AND City='Myanmad'
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId
Order By FirstName

--UC10_Redo--
Select TypeName,Count(*)
From Person
INNER Join AddressBook ON AddressBook.AddressBookId=Person.AddressBookId
INNER Join PersonType ON Person.PersonId=PersonType.PersonId
INNER Join Type ON Type.TypeId=PersonType.TypeId
Group By TypeName