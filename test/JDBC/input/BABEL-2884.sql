CREATE TABLE mytest
(
Id int NOT NULL,
Name varchar (100) NOT NULL,
UpdateDateTime datetime NULL
)
go

CREATE TRIGGER mytrig
ON mytest
FOR UPDATE
AS
begin
UPDATE mytest
SET Name = 'updated'
FROM inserted where inserted.Id = mytest.Id;
end;
go

CREATE TABLE Persons
( PersonId       INT
  PRIMARY KEY IDENTITY(1, 1) NOT NULL, 
  PersonName     VARCHAR(100) NULL, 
  PersonLastName VARCHAR(100) NULL, 
  PersonPostCode VARCHAR(100) NULL, 
  PersonCityName VARCHAR(100) NULL)
 
GO

CREATE TRIGGER mypersontrig
ON Persons
FOR UPDATE
AS
begin
UPDATE Persons SET  Persons.PersonCityName='updated' from Inserted  where Persons.PersonId = inserted.PersonId
end;
go

 
CREATE TABLE  AddressList(
  [AddressId] [int]  PRIMARY KEY IDENTITY(1,1) NOT NULL,
  [PersonId] [int] NULL,
  [PostCode] [varchar](100) NULL,
  [City] [varchar](100) NULL)
 
GO
 
INSERT INTO Persons
(PersonName, PersonLastName )
VALUES
(N'Salvador', N'Williams'),
(N'Lawrence', N'Brown'),
( N'Gilbert', N'Jones'),
( N'Ernest', N'Smith'),
( N'Jorge', N'Johnson')
 
GO
INSERT INTO AddressList
(PersonId, PostCode, City)
VALUES
(1, N'07145', N'Philadelphia'),
(2, N'68443', N'New York'),
(3, N'50675', N'Phoenix'),
(4, N'96573', N'Chicago')
GO

UPDATE mytest SET Name = 'x' WHERE Id = 1
go

--UPDATE Persons SET Persons.PersonCityName = 'ddd' where PersonId = 1;
--go

drop trigger mytrig
drop table mytest
drop trigger mypersontrig
drop table Persons
drop table AddressList
go
