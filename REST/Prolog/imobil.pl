/** Imobile din Chisinau */
/**adresa, anul constructiei, nr.etaje, tip reparatie, sector, camere, etaj, suprafata, ascensor, pret**/
/**centru**/
imobil('str. Avram Iancu 12',2020,12,'euro','Centru',2,5,70,'da',40000).
imobil('str. Ismail 20',1980,16,'cosmetic','Centru',3,7,68,'da',35000).
imobil('str. Miorita 45',2012,9,'vechi','Centru',2,3,45,'da',25000).

/**ciocana**/
imobil('str. Alecu Russo 24',1970,9,'vechi','Ciocana',1,6,45,'da',20000).
imobil('str. Igor Vieru 50',2020,16,'nu','Ciocana',3,4,85,'da',45000).
imobil('str. Maria Dragan 32',1960,5,'vechi','Ciocana',2,4,43,'nu',18000).

/**rascani**/
imobil('str. Kiev 30/1',2010,12,'cosmetic','Rascani',3,10,90,'da',50000).
imobil('bd. Moscova 5',2020,16,'euro','Rascani',2,4,58,'da',40000).
imobil('str. Florilor 2',1980,9,'vechi','Rascani',2,7,50,'da',30000).

/**botanica**/
imobil('str. Grenoble 202',1970,9,'euro','Botanica',3,4,70,'da',50000).
imobil('str. Burebista 45/2',2018,12,'nu','Botanica',1,11,45,'da',35000).
imobil('str. Traian 12',2005,9,'vechi','Botanica',2,6,55,'da',35000).

/**buiucani**/
imobil('str. Alba Iulia 23',2017,12,'euro','Buiucani',4,6,100,'da',60000).
imobil('str. Ion Creanga 50',1980,5,'cosmetic','Buiucani',2,3,50,'nu',35000).
imobil('str. Ghioceilor 46',2007,10,'vechi','Buiucani',1,3,40,'da',28000).

/**suburbie**/
imobil('sat Bacioi str Muncesti 2',2002,2,'euro','Suburbie',7,1,200,'nu',70000).
imobil('sat Bubuieci str Mihai Eminescu 23',1980,1,'vechi','Suburbie',4,1,80,'nu',40000).
imobil('or. Codru str Schinoasei 40',2012,3,'cosmetic','Suburbie',9,1,220,'nu',90000).

anConstructie(Y,Z,O)		:- imobil(Y,X,_,_,_,_,_,_,_,Z), X < 2000, O =='veche'.
anConstructie(Y,Z,O)		:- imobil(Y,X,_,_,_,_,_,_,_,Z), 2000 < X, X < 2011, O =='medie'.
anConstructie(Y,Z,O)		:- imobil(Y,X,_,_,_,_,_,_,_,Z), 2011 < X, O =='noua'.

nretaje(Y,Z,O)			    :- imobil(Y,_,X,_,_,_,_,_,_,Z), 0 < X, X < 5, O =='redusa'.
nretaje(Y,Z,O)				:- imobil(Y,_,X,_,_,_,_,_,_,Z), 5 < X, X < 13, O =='medie'.
nretaje(Y,Z,O)				:- imobil(Y,_,X,_,_,_,_,_,_,Z), 13< X, O =='inalta'.

tipReparatie(Y,Z,O)         :- imobil(Y,_,_,X,_,_,_,_,_,Z), X == 'euro', O =='euro'.
tipReparatie(Y,Z,O)         :- imobil(Y,_,_,X,_,_,_,_,_,Z), X == 'cosmetic', O =='cosmetic'.
tipReparatie(Y,Z,O)         :- imobil(Y,_,_,X,_,_,_,_,_,Z), X == 'vechi', O =='vechi'.
tipReparatie(Y,Z,O)         :- imobil(Y,_,_,X,_,_,_,_,_,Z), X == 'nu', O =='fara reparatie'.

sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Centru', O =='Centru'.
sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Botanica', O =='Botanica'.
sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Buiucani', O =='Buiucani'.
sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Ciocana', O =='Ciocana'.
sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Rascani', O =='Rascani'.
sector(Y,Z,O)               :- imobil(Y,_,_,_,X,_,_,_,_,Z), X == 'Suburbie', O =='Suburbie'.

camere(Y,Z,O)               :- imobil(Y,_,_,_,_,X,_,_,_,Z), 0 < X, X < 2, O =='redus'.
camere(Y,Z,O)               :- imobil(Y,_,_,_,_,X,_,_,_,Z), 1 < X, X < 3, O =='mediu'.
camere(Y,Z,O)               :- imobil(Y,_,_,_,_,X,_,_,_,Z), 2 < X, O =='mare'.

etaj(Y,Z,O)			    :- imobil(Y,_,_,_,_,_,X,_,_,Z), 0 < X, X < 5, O =='redus'.
etaj(Y,Z,O)				    :- imobil(Y,_,_,_,_,_,X,_,_,Z), 4 < X, X < 13, O =='mediu'.
etaj(Y,Z,O)				    :- imobil(Y,_,_,_,_,_,X,_,_,Z), 13< X, O =='mare'.

suprafata(Y,Z,O)            :- imobil(Y,_,_,_,_,_,_,X,_,Z), 0 < X, X < 51, O =='redusa'.
suprafata(Y,Z,O)            :- imobil(Y,_,_,_,_,_,_,X,_,Z), 50 < X, X < 71, O =='medie'.
suprafata(Y,Z,O)            :- imobil(Y,_,_,_,_,_,_,X,_,Z), 70 < X, X < 101, O =='mare'.
suprafata(Y,Z,O)            :- imobil(Y,_,_,_,_,_,_,X,_,Z), 100 < X, O =='foarte mare'.

lift(Y,Z,O)                 :- imobil(Y,_,_,_,_,_,_,_,X,Z),  X =='nu', O =='nu'.
lift(Y,Z,O)                 :- imobil(Y,_,_,_,_,_,_,_,X,Z),  X =='da', O =='da'.

alegeImobil(Y, Z, O1,O2,O3,O4,O5,O6,O7,O8)	:- mainFunction(Y,Z,O1,O2,O3,O4,O5,O6,O7,O8).

mainFunction(Y,Z,O1,O2,O3,O4,O5,O6,O7,O8)	:- anConstructie(Y,Z,O1),nretaje(Y,Z,O2),tipReparatie(Y,Z,O3),sector(Y,Z,O4),camere(Y,Z,O5),etaj(Y,Z,O6),suprafata(Y,Z,O7),lift(Y,Z,O8),!.


boot:-

                write('Sistem expert de alegere a unui imobil'),nl,
                write('Va rog sa raspundeti la intrebarile de mai jos'),nl,
		write('Aceste raspunsuri vor permite sa alegem imobilul dorit de dvs'),nl,nl,

		write('Care este numele dvs? '),
		read(Name),nl,
		write('Salut'),
				write(Name),nl,

			write('Care este varsta casei dorite? '),nl,
				write('1. Veche'),nl,
				write('2. Medie'),nl,
				write('3. Noua'),nl,
				read(Ans1),nl,

				write('Care este inaltimea casei ?'),nl,
				write('1. Redusa'),nl,
				write('2. Medie'),nl,
                write('3. Inalta'),nl,
				read(Ans2),nl,

                write('Care tipul d reparatie  ?'),nl,
				write('1. Euro'),nl,
				write('2. Cosmetic'),nl,
                write('3. Vechi'),nl,
                write('4. Fara reparatie'),nl,
				read(Ans3),nl,

				write('Ce sector preferati?'),nl,
				write('1. Centru'),nl,
				write('2. Botanica'),nl,
				write('3. Buiucani'),nl,
				write('4. Ciocana'),nl,
				write('5. Rascani'),nl,
				write('6. Suburbie'),nl,
				read(Ans4),nl,

                write('Numarul de camere dorit ?'),nl,
				write('1. Redus'),nl,
				write('2. Mediu'),nl,
                write('3. Mare'),nl,
				read(Ans5),nl,

                write('Numarul etajului ?'),nl,
				write('1. Redus'),nl,
				write('2. Mediu'),nl,
                write('3. Mare'),nl,
				read(Ans6),nl,

                write('Suprafata imobilului ?'),nl,
				write('1. Redusa'),nl,
				write('2. Medie'),nl,
                write('3. Mare'),nl,
                write('4. Foarte mare'),nl,
				read(Ans7),nl,

                write('Doriti ascensor ?'),nl,
				write('1. Nu'),nl,
				write('2. Da'),nl,
				read(Ans8),nl,


				alegeImobil(Y, Z,Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8),
				write('Imobilul dorit:'),nl,
			    write(Y),nl,
                write('Pretul imobilului:'),nl,
                write(Z),nl.
