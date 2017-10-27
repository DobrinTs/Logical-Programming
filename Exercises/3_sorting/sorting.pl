less(A,B) :- A=<B.

min1(X,[X]).
min1(Y,[Y|L]) :- min1(Z,L), less(Y,Z).
min1(Z,[Y|L]) :- min1(Z,L), not(less(Y,Z)).

min(X,[X]).
min(M,[Y|L]) :- min(Z,L), m(M,Z,Y).
m(Z,Z,Y) :- less(Z,Y).
m(Y,Z,Y) :- not(less(Z,Y)).

remove(X,[X|L],L).
remove(X,[H|L],[H|B]) :- remove(X,L,B).
perm([],[]).
perm([H|P],L) :- remove(H,L,S), perm(P,S).
sorted([]).
sorted([_]).
sorted([A,B|T]) :- less(A,B), sorted([B|T]).

psort(S,L) :- perm(S,L), sorted(S).

ssort([],[]).
ssort([M|S],L) :- min(M,L), remove(M,L,R), ssort(S,R).

append([],B,B).
append([H|A],B,[H|AB]) :- append(A,B,AB).

split(_,[],[],[]).
split(X,[H|T],[H|A],B) :- H<X, split(X,T,A,B).
split(X,[H|T],A,[H|B]) :- not(H<X), split(X,T,A,B).

qsort([],[]).
qsort(S,[X|L]) :- split(X,L,A,B), qsort(SA,A), qsort(SB,B), append(SA,[X|SB], S).

%% e.
%% t(T,L,R).

add(X,e,t(X,e,e)).
add(X,t(T,L,R),t(T,L1,R)) :- X<T, add(X,L,L1).
add(X,t(T,L,R),t(T,L,R1)) :- not(X<T), add(X,R,R1).

make_tree([],e).
make_tree([X|L],T) :- make_tree(L,T1), add(X,T1,T).

traverse([],e).
traverse(S,t(T,L,R)) :- traverse(SL,L), traverse(SR,R), append(SL,[T|SR],S).

tsort(S,L) :- make_tree(L,T), traverse(S,T).

reverse(S,[],S).
reverse(S,[H|T],R) :- reverse([H|S],T,R).
reverse(L,R) :- reverse([],L,R).

%% -------------------------------
%% homework: BubbleSort
%% not checked by teacher yet
bsort1([],[],0).
bsort1([X],[X],0).
bsort1([X,Y | L], [X|LS],SWITCH) :- less(X,Y), bsort1([Y|L], LS,SWITCH).
bsort1([X,Y | L], [Y|LS],1) :- not(less(X,Y)), bsort1([X|L], LS,_).

%% bsort([],[]).
bsort(L,S) :- bsort1(L,S,X), X=0.
bsort(L,S) :- bsort1(L,LS,X), X=1, bsort(LS,S).