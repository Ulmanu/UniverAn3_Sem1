USE master
GO
IF EXISTS (SELECT 'True' FROM sys.databases WHERE name = 'Automall')
   BEGIN
      Alter database automall set single_user with rollback immediate
	  DROP DATABASE Automall
   END
GO   
create database Automall
GO
Alter authorization on database::automall to sa
USE Automall 
GO

CREATE TABLE Maker
  ( 
     idmaker Int Identity PRIMARY KEY 
     ,descriptions Char(250)UNIQUE
  )  
GO

CREATE TABLE Product_type
  ( 
     idtype Int Identity PRIMARY KEY 
     ,dentype Char(150)UNIQUE
  )  
GO

CREATE TABLE Product_subtype
  ( 
     idsubtype Int Identity PRIMARY KEY 
     ,densubtype Char(150)UNIQUE
	 ,idtype Int
	 ,foreign key (idtype) references Product_type(idtype)
  )  
GO

CREATE TABLE Product
  ( 
     idprod Int Identity PRIMARY KEY 
     ,denprod Char(150)UNIQUE
	 ,idmaker Int
	 ,country Char(100)
	 ,price Float
	 ,descr Char(300)
	 ,applicability Char(300)
	 ,specifications Char(300)
	 ,idsubtype Int
	 ,foreign key (idmaker) references Maker(idmaker)
	 ,foreign key (idsubtype) references Product_subtype(idsubtype)
  )  
GO

CREATE TABLE Customer
  ( 
     idcustomer Int Identity PRIMARY KEY 
    ,dencustom char(200)
	,email char(100)
	,cards char(16)
	,pass char(100)
	,phone char(20)
	,addres char(100)
  )  
GO


CREATE TABLE Shipment
  ( 
     idship Int Identity PRIMARY KEY 
     ,typeship Char(150)UNIQUE
  )  
GO

CREATE TABLE Purchase
  ( 
     idpurch Int Identity PRIMARY KEY 
     ,idprod int
	 ,idcustomer int
	 ,dates date
	 ,quantity int
	 ,pricetotal float
	 ,idship int
	 ,foreign key (idprod) references Product (idprod)
	 ,foreign key (idcustomer) references Customer (idcustomer)
	 ,foreign key (idship) references Shipment(idship)

  )  
GO




Insert into Maker (descriptions) Values
('It is a partner in motorsport at the highest level - Dakar, 24h Le Mans, MotoGP, etc.
Recommended by professionals, ensures minimum wear and engine durability.
Suppliers of first fill oils for many conveyors of many car manufacturers.')


select * from Maker

Insert into Product_type (dentype) values
('Oil and greases')

select * from Product_type

Insert into Product_subtype (densubtype,idtype) values
('Motor oil for trucks',1)

select * from Product_subtype

insert into Product (denprod,idmaker,country,price,descr,applicability,specifications,idsubtype) values
('10W40 TEKMA MEGA X 208',1,'France',17142.7,
'Technosynthese® engine oil for high-tech diesel engines. Specially designed for the latest generation of trucks, buses, construction and agricultural vehicles, stationary engines, and watercraft engines that use low sulfur fuels.'
,'No data'
,'Quality: Technosynthese
Viscosity: 10W-40
API Standards: API CI-4 / CH-4
ACEA Standards: ACEA E7
Approvals: MAN M 3275-1 - MB-Approval 228.3 - RVI RD / RD-2 / RLD / RLD-2 - VOLVO VDS-3 - CATERPILLAR ECF-1 - CUMMINS 20071-20072-20076-20077-20078 - Global DHD-1 - MACK EO-N - MTU Type II',1)


select * from Product


Insert into Customer (dencustom,email,cards,pass,phone,addres) values
('Cojocari Ion','ion@gmail.com','9011901290139014','qwerty12345','069888666','Columna 47')

select * from Customer

Insert into Shipment (typeship) values
('autocar')

insert into Purchase(idprod,idcustomer,dates,quantity,pricetotal,idship) values
(1,1,'2015-02-20',2,
((select price from Product where Product.idprod=idprod)*2),1)

select * from Purchase