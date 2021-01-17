s(L1,L3):-
        np(L1,L5,L2,Semsubj),
        vp(L2,L4,L3,Semverb,Semobj),
	sem_rest(Semverb,Semsubj,Semobj),
	append(['Agent:'],L5,L6),
	append(L6,L4,L7),
	append([Semverb],L7,L8),
	printlist(L8),!.

np(L1,[Semdet,Semnoun|_],L3,Semnoun):-
        det(L1,Semdet,L2),
        n(L2,Semnoun,L3).
np(L1,[Semnoun|_],L2,Semnoun):-
        n(L1,Semnoun,L2).

vp(L1,Lsem,L3,Semverb,Semnoun):-
	vt(L1,Semverb,L2),
	np(L2,Ls,L3,Semnoun),
	append([ 'Theme:'],Ls,Lsem).

printlist([]).
printlist([X|List]) :-
        write(X), write(' '),
        printlist(List).

append([], List, List).
   append([X|L1], List2, [X|L3]) :-
          append(L1, List2, L3).

det(['the'|R],semthe,R).
n(['alison'|R],semalison,R).
n(['dog'|R],semdog,R).
n(['baby'|R],sembaby,R).
n(['law'|R],semlaw,R).
n(['vase'|R],semvase,R).
vt(['broke'|R],semdestroy,R).
vt(['broke'|R],semviolate,R).

hyponym(all,individual).

hyponym(individual,physobj).
hyponym(individual,abstractobj).

hyponym(physobj,nonliving).
hyponym(physobj,living).

hyponym(living,animate).
hyponym(living,vegetative).

hyponym(animate,person).
hyponym(animate,animal).

hyponym(person,semalison).
hyponym(person,sembaby).
hyponym(animal,semdog).

hyponym(abstractobj,rules).
hyponym(rules,semrule).
hyponym(rules,semlaw).

hyponym(nonliving,artefact).
hyponym(nonliving,natural_obj).

hyponym(artefact,semvase).

restriction(X,Y):-
	hyponym(X,Y).
restriction(X,Y):-
	hyponym(Z,Y),
	restriction(X,Z).

sem_rest(semviolate,Agent,Theme):-
	restriction(person,Agent),
	restriction(rules,Theme).
sem_rest(semdestroy,Agent,Theme):-
	restriction(animate, Agent),
	restriction(artefact,Theme).

%s(['alison', 'broke', 'the' ,'law'],[]).
%s(['the', 'dog', 'broke', 'the' ,'vase'],[]).