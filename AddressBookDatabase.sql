--UC1
CREATE DATABASE Address_Book_SystemService_Database;
USE Address_Book_SystemService_Database;

--UC2
CREATE TABLE AddressBookTable
(
FirstName VARCHAR(15) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(15) NOT NULL,
State VARCHAR(15) NOT NULL,
Zip Int NOT NULL,
MobNo Int NOT NULL,
Email VARCHAR(30) NOT NULL
)
SELECT * From AddressBookTable;

--UC3
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Vaibhav','Jadhav','Somatane Phata','Pune','Maharashtra',410506,987654321,'vaibhavvjadhav1604@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Shreeram','Jadhav','Talegaon','Pune','Maharashtra',410506,963852741,'shreeramjadhav@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Satyajeet','Jadhav','Ekvira Nagar','Kolhapur','Maharashtra',422771,741852963,'satyejeetjadhav@gmail.com');
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email)VALUES('Pubg','Mobile','Pochinki','Errangel','New State',416,123456789,'mpubg192837@gmail.com');

--UC4
UPDATE AddressBookTable SET Zip = 411506 WHERE FirstName = 'Satyajeet';

--UC5
DELETE FROM AddressBookTable WHERE FirstName = 'Satyajeet';

--UC6
SELECT * From AddressBookTable WHERE State='Maharashtra' AND City='Pune';

--UC7
SELECT COUNT(*) From AddressBookTable WHERE State='Maharashtra' AND City='Pune';

--UC8
SELECT * FROM AddressBookTable WHERE City = 'Pune' ORDER BY FirstName;

--UC9
ALTER TABLE AddressBookTable ADD Type VARCHAR(15);
ALTER TABLE AddressBookTable ADD AddressBookName VARCHAR(30);
UPDATE AddressBookTable SET Type='Family' WHERE FirstName='Shreeram';
UPDATE AddressBookTable SET Type='Family' WHERE FirstName='Vaibhav';
UPDATE AddressBookTable SET Type='Profession' WHERE FirstName='Pubg';
UPDATE AddressBookTable SET AddressBookName='FamilyZone' WHERE Type='Family';
UPDATE AddressBookTable SET AddressBookName='ProfessionalZone' WHERE Type='Profession';

--UC10
SELECT Type,COUNT(Type) From AddressBookTable Group By Type;

--UC11
INSERT INTO AddressBookTable(FirstName,LastName,Address,City,State,Zip,MobNo,Email,Type,AddressBookName)VALUES('UC','Greed','ShivajiNagar','Hulsur','Karnataka',546546,789654123,'ucgreed@gmail.com','Friend','FriendZone');
