s(Lstart,Lfin):-
    np(Lstart,Subject,Lrest),
    vp(Lrest,Object,Lfin,Semverb),
    append(["Subiect"],Subject,Sbj),
    append(["Complement"],Object,Obj),
	append(Sbj,Obj,Attributes),
    append(["Predicat"],[Semverb],Pr),
	append(Pr,Attributes,Rezultat),
	printlist(Rezultat),!.

np(Lstart,[Semdet,Semnoun|_],Lfin):-
    det(Lstart,Semdet,Lrest),
    n(Lrest,Semnoun,Lfin).
np(L1,[Semnoun],L2):-
    n(L1,Semnoun,L2).

vp(L1,[Lsemnp,Sempp],L4,Semverb):-
	vt(L1,Semverb,L2),
	np(L2,Lsemnp,L3),
    pp(L3,Sempp,L4,_).
vp(L1,_,L2,Semverb):-
	vi(L1,Semverb,L2).
vp(L1,Lsemnp,L3,Semverb):-
	vt(L1,Semverb,L2),
	np(L2,Lsemnp,L3).

pp(L1,[Semprep,Semnp],L3,Semnp):-
    prep(L1,Semprep,L2),
    np(L2,Semnp,L3).

append([], List, List).
   append([X|L1], List2, [X|L3]) :-
          append(L1, List2, L3).

prep(['in'|R],loc,R).

det(['the'|R],semthe,R).
det(['an'|R],semany,R).
det(['a'|R],semany,R).
n(['leul'|R],leul,R).
n(['undita'|R],undita,R).
n(['lac'|R],lac,R).

vt(['arunca'|R],arunca,R).
vi(['walks'|R],semwalks,R).
vi(['grow'|R],semgrow,R).

printlist([]).
printlist([X|List]) :-
        write(X), write(' '),
        printlist(List).

