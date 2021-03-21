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

CREATE TABLE Quantity_total
  ( 
     idquant Int Identity PRIMARY KEY 
     ,idprod Int
	 ,quanttotalinit int
	 ,idpurch int 
	 ,quanttotalrem int
	  ,foreign key (idpurch) references Purchase(idpurch)
	  ,foreign key (idprod) references Product(idprod)

  )  
GO




