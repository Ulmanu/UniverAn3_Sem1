s(Lstart,Lfin):-
    np(Lstart,Subject,Lrest),
    vp(Lrest,Object,Lfin,Semverb),
        append(["Subject"],Subject,Subj),
        append(["Object"],Object,Obj),
	append(Subj,Obj,Attributes),
	append(["Predicat ",Semverb],Attributes,Rezultat),
	printlist(Rezultat),!.

np(Lstart,[Semdet,Semnoun|_],Lfin):-
    det(Lstart,Semdet,Lrest),
    n(Lrest,Semnoun,Lfin).
np(L1,[Semnoun|_],L2):-
    n(L1,Semnoun,L2).

vp(L1,_,L2,Semverb):-
	vi(L1,Semverb,L2).
vp(L1,Lsemnp,L3,Semverb):-
	vt(L1,Semverb,L2),
	np(L2,Lsemnp,L3).

append([], List, List).
   append([X|L1], List2, [X|L3]) :-
          append(L1, List2, L3).

det(['the'|R],semthe,R).
det(['an'|R],semany,R).
det(['a'|R],semany,R).
n(['cow'|R],semcow,R).
n(['tail'|R],semtail,R).
n(['grass'|R],semgrass,R).
vt(['eats'|R],semeat,R).
vi(['walks'|R],semwalks,R).
vi(['grow'|R],semgrow,R).

printlist([]).
printlist([X|List]) :-
        write(X), write(' '),
        printlist(List).



















