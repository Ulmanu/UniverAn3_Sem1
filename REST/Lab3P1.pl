%% Planificator a rutelor de zboruri aeriene
:- op( 50, xfy, :).
% ruta ( Loc1, Loc2, Zi, Ruta):
% Ruta este o secventa de zboruri in ziua zi, care incepe de la Loc1 si se incheie la Loc2

ruta( L1, L2, Zi, [ L1 / L2 / Fnum / Deptime ] ) :-
    zbor( L1, L2, Zi, Fnum, Deptime, _).

ruta( L1, L2, Zi, [ (L1 / L3 / Fnum1 / DeL1) | RestRuta] ) :-
    ruta( L3, L2, Zi, RestRuta),
    zbor( L1, L3, Zi, Fnum1, DeL1, Arr1),
    deptime( RestRuta, DeL2),
    transfer( Arr1, DeL2).

zbor( Loc1, Loc2, Zi, Fnum, Deptime, Arrtime) :-
    orarzboruri( Loc1, Loc2, ZborList),
    member( Deptime / Arrtime / Fnum / ZiList , ZborList),
    zborZi( Zi, ZiList).

zborZi( Zi, ZiList) :-
    member( Zi, ZiList).

zborZi( Zi, toatezilele) :-
    member( Zi, [luni,marti,miercuri,joi,vineri,sambata,duminica] ).

deptime( [ L1 / L2 / Fnum / Dep | _], Dep).

transfer( Hours1:Mins1, Hours2:Mins2) :-
    60 * (Hours2 - Hours1) + Mins2 - Mins1 >= 40.

member( X, [X | L] ).

member( X, [Y | L] ) :-
    member( X, L).

%------- Part 2 --------

	% 3AZA DE DATE Z30R	(EVIDENTA TUTUROR	Z30RURIL0R)								
	orarzboruri(	edinburgh, london,		
			[	9:40 /	10:50 /	ba4733	/	toatezilele,
				13:40 /	14:50 /	ba4773	/	toatezilele,
				15:40 /	20:50 /	ba4833	/	[luni,marti,miercuri,joi,vineri,duminica] ] ).
								
	orarzboruri(	london,	edinburgh,		
		[	5:40 /	10:50 /	ba4732	/	toatezilele,
			11:40 /	12:50 /	ba4752	/	toatezilele,
			13:40 /	15:50 /	ba4822	/	[luni,marti,miercuri,joi,vineri] ] ).
								
	orarzboruri(	london,	bucuresti,		
		[	13:20 /	16:20 /	jL212	/	(luni,marti,miercuri,vineri,duminica],
		   16:30 /	15:30 /	ba473	/	(luni,miercuri,joi,sambata] ] ).
								
	orarzboruri(	london,	zurich,			
		[	5:10 /	11:45 /	ba614	/	toatezilele,
			14:45 /	17:20 /	sr305	/	toatezilele ] ).
								
	orarzboruri(	london,	milano,			
		[	8:30 /	11:20 /	ba510	/	toatezilele,
			11:00 /	13:50 /	az455	/	toatezilele ] ).
								
	orarzboruri(	bucuresti, zurich,		
			[	11:30 /	12:40 /	jL322	/	(marti,joi] ] ).
								
	orarzboruri(	bucuresti, london,		
		[	11:10 /	12:20 /	jL211	/	[luni,marti,miercuri,vineri,duminica],
			20:30 /	21:30 /	ba472	/	[luni,miercuri,joi,sambata] ] ).
								
	orarzboruri(	milano,	london,			
		[	5:10 /	10:00 /	az458	/	toatezilele,


%--------- Part 3 ----
orarzboruri( milano, london,
            [ 9:15 / 10:00 / az458 / toatezilele,
              
orarzboruri( milano, zurich,
            [ 9:25 / 10:15 / sr612 / toatezilele,
              
orarzboruri( zurich, bucuresti,
            [ 13:30 / 14:40 / jL323 / [marti,joi] ] ).
  
orarzboruri( zurich, london,
            [ 9:00 / 9:40 / ba613 / [luni,marti,miercuri,joi,vineri,sambata],
              
orarzboruri( zurich, milano, 
            [ 7:55 / 8:45 / sr620 / toatezilele ] ).
            
query3(City1,City2,City3,FN1,FN2,FN3,FN4) :- 
            permutare( [milano,bucuresti,zurich],[City1,City2,city3]),
            zbor( london, City2, marti , FN1, DeL1, Arr1),
            zbor( City1, City2, miercuri, FN2, DeL2, Arr2),
            zbor( City2, City, joi, FN3, DeL3, Arr3),
            zbor( City3, london, vineri, FN4, DeL4, Arr4).
            
conc([], L, L).
            
conc([X|L1],L2, [X|L3]) :-
            conc(L1,L2,L3).
            
permutare( [], []).
            
permutare( L, [X | P]) :-
            del( X, L, L1),
            permutare( L1, P).
            
del( X, [X|L], L).
            
del( X, [Y|L], [Y|L1]) :-
            del( X, L, L1).
          