USE master
GO
IF EXISTS (SELECT 'True' FROM sys.databases WHERE name = 'museums')
    BEGIN
        Alter database museums set single_user with rollback immediate
        DROP DATABASE museums
    END
GO

create database museums
go
use museums
go

cREATE TABLE museum
(
    id         bigint       NOT NULL Identity,
    title       varchar(100) NOT NULL,
    address     varchar(100) not null,
    description text,
    image       text,
    lat           float,
    lon           float,
    PRIMARY KEY (id)
)
go

insert into museum (title, address, description, image, lat, lon)
values ('Muzeul de istorie', ' or.Chisianu Strada 31 August 1989 121 A ', '', 'images/museums/istorie.jpg',
        47.0225865, 28.8281315),
       ('Muzeul de istogrie', ' or.Chisianu Strada 31 August 1989 121 A ', '', 'images/museums/istorie.jpg',
        69.0225865, 28.8281315),
       ('Muzeul de Arta', ' or.Chisianu Strada 31 August 1989 121 A ', '', 'images/museums/istorie.jpg',
        47.0225865, 28.8281315);

select *
from museum;


--
-- Table structure for table section
--

CREATE TABLE section
(
    idsect      bigint       NOT NULL Identity,
    title       varchar(100) NOT NULL,
    description text,
    image       text,
    type        varchar(50),
    idmus       bigint,
    PRIMARY KEY (idsect),
    foreign key (idmus) references museum (id) ON UPDATE CASCADE ON delete CASCADE
)
go

insert into section (title, description, image, type, idmus)
values ('Sectia 3', '', 'images/museums/istorie.jpg', 'Rennaisance', 1),
       ('Sectia 5', '', 'images/museums/istorie.jpg', 'Barocco', 2);
select *
from section;
select museum.title
from museum
         inner join section on museum.id = section.idmus
where section.type like 'Barocco';

--
-- Table structure for table gallery
--

CREATE TABLE gallery
(
    idgal       bigint       NOT NULL Identity,
    title       varchar(100) NOT NULL,
    description text,
    image       text,
    idsect      bigint,
    PRIMARY KEY (idgal),
    foreign key (idsect) references section (idsect) ON UPDATE CASCADE ON delete CASCADE
)
go

insert into gallery (title, description, image, idsect)
values ('Room4', '', 'images/museums/istorie.jpg', 1),
       ('Room5', '', 'images/museums/istorie.jpg', 1);
select *
from gallery;

--
-- Table structure for table exponat
--

CREATE TABLE exponat
(
    idexp       bigint       NOT NULL Identity,
    title       varchar(100) NOT NULL unique,
    description text,
    image       text,
    idgal       bigint,
    price         float,
    PRIMARY KEY (idexp),
    foreign key (idgal) references gallery (idgal) ON UPDATE CASCADE ON delete CASCADE

)
go

insert into exponat (title, description, image, idgal, price)
values ('Picture1', '', 'images/museums/istorie.jpg', 1, 2000),
       ('Picture2', '', 'images/museums/istorie.jpg', 1, 3500);
select *
from exponat;

--
-- Table structure for table users
--

CREATE TABLE users
(
    id     bigint NOT NULL Identity,
    username varchar(100),
    name   varchar(100),
    image  text,
    password varchar(100),
    email    varchar(100),
    role     varchar(100),
    income   float       default 0.00,
    outcome  float       default 0.00,
    status   varchar(200) default 'available',
    PRIMARY KEY (id)
) 
go

-- insert into user (name, username,password, email,image,role) values
-- (''Victor Ungureanu'',''fdfd'',''a@dfsd.com'',''images/museums/istorie.jpg'',''admin'',''jj''),
-- (''Victor Ungureanu'',''fdfd'',''ad@dfsd.com'',''images/museums/istorie.jpg'','''',''hh'');



--
-- Table structure for table payment
--

CREATE TABLE payment
(
    idpay      bigint      NOT NULL Identity,
    cardnumber varchar(16) NOT NULL unique,
    amount       float,
    iduser       bigint,
    PRIMARY KEY (idpay),
    foreign key (iduser) references users (id) ON UPDATE CASCADE ON delete CASCADE
)
 go

-- insert into payment (cardnumber, amount, id) values
-- (''1234567890123456'',20000,1);
-- select * from payment;


--
-- Table structure for table souvenirs
--

CREATE TABLE souvenirs
(
    idsuv bigint       NOT NULL Identity,
    name  varchar(100) NOT NULL unique,
    price   float,
    image   text,
    qty     int          default 1000 ,
    status  varchar(200) default 'available',
    PRIMARY KEY (idsuv)
)
go



--
-- Table structure for table souvenirsamount
--

CREATE TABLE souvenirsamount
(
    idsuva bigint NOT NULL Identity,
    amount   bigint,
    idsuv    bigint unique,
    PRIMARY KEY (idsuva),
    foreign key (idsuv) references souvenirs (idsuv) ON UPDATE CASCADE ON delete CASCADE
) 
go






--
-- Table structure for table turtype
--

CREATE TABLE turtype
(
    idturtype bigint NOT NULL Identity,
    nametur     varchar(100),
    description text,
    price       float,
    idmus     bigint,
    PRIMARY KEY (idturtype),
    foreign key (idmus) references museum (id) ON UPDATE CASCADE ON delete CASCADE

) 
go

--
-- Table structure for table tur
--

CREATE TABLE tur
(
    idtur   bigint NOT NULL Identity,
    id      bigint,
    date    date,
    qty       int CHECK(qty BETWEEN 1 AND 50),
    idturtype bigint,
    cost      float,
    PRIMARY KEY (idtur),
    foreign key (id) references users (id) ON UPDATE CASCADE ON delete CASCADE,
    foreign key (idturtype) references turtype (idturtype) ON UPDATE CASCADE ON delete CASCADE

)
 go

-- insert into tur values (1,1,1,1,''2008-11-11'',1);
--
-- Table structure for table purchase
--

CREATE TABLE purchase
(
    idpur  bigint NOT NULL Identity,
    id     bigint,
    idsouvam bigint,
    date   date,
    qty      int    default 0 CHECK(qty BETWEEN 1 AND 50),
    cost     float default 0.00,
    PRIMARY KEY (idpur),
    foreign key (id) references users (id) ON UPDATE CASCADE ON delete CASCADE,
    foreign key (idsouvam) references souvenirs (idsuv) ON UPDATE CASCADE ON delete CASCADE

)
go


