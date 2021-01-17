
s(L1,L3):-
        np(L1,L5,L2,Semsubj),
        vp(L2,L4,L3,Semverb,_),
	sem_rest(Semverb,Semsubj),    
	append(['Subiect:'],L5,L6),  
	append(L6,L4,L7),              
	append([Semverb],L7,L8),       
	printlist(L8),!.

np(L1,[Semdet,Semnoun],L3,Semnoun):-
        det(L1,Semdet,L2),                 
        n(L2,Semnoun,L3).                  
np(L1,[Semnoun|_],L2,Semnoun):-
        n(L1,Semnoun,L2).

vp(L1,[Semverb],L2,Semverb,_):-
	vi(L1,Semverb,L2).                
vp(L1,Ls,L3,Semverb,_):-                  
	vi(L1,Semverb,L2),                 
	pp(L2,Ls,L3,_,_).

pp(L1,Lsem,L3,Semprep,Semnoun):-
	prep(L1,Semprep,L2),
	np(L2,Ls,L3,Semnoun),
	append([Semprep],Ls,Lsem).

printlist([]).
printlist([X|List]) :-
        write(X), write(' '),
        printlist(List).
                 
append([], List, List).
   append([X|L1], List2, [X|L3]) :-
          append(L1, List2, L3).

det(['the'|R],semthe,R).
det(['a'|R],semany,R).
n(['boy'|R],semboy,R).
n(['computer'|R],semcomputer,R).
n(['yard'|R],semyard_location,R).         
n(['program'|R],semprogram_software,R).    
prep(['in'|R],semin_location,R).
prep(['on'|R],semon_workplace,R).
vi(['runs'|R],semrun_work,R).
vi(['runs'|R],semrun_move,R).

isa(individual, all).
isa(location, all).

isa(physobj, individual).
isa(abstractobj, individual).

isa(nonliving, physobj).
isa(living, physobj).

isa(animate, living).
isa(vegetative, living).

isa(human, animate).                     
isa(animal, animate).                   
isa(artefact, nonliving).
isa(natural_object, nonliving).

isa(machine, artefact).
isa(hardware, machine).
isa(semcomputer, hardware).

isa(semboy, human).

isa(software, abstractobj).
isa(semprogram_software, software).

isa(semyard_location, location).

restriction(X,Y):-
	isa(X,Y).
restriction(X,Y):-
	isa(X,Z),
	restriction(Z,Y).

sem_rest(semrun_move, Agent):-
	restriction(Agent, animate).       
sem_rest(semrun_work, Theme):-            
	restriction(Theme, software).
