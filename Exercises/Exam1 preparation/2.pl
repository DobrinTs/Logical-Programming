member(X,[X|_]).
member(X,[H|L]) :- member(X,L).

remove(X,[X|L],L).
remove(X,[H|L],[H|B]) :- remove(X,L,B).

add(X,L,[X|L]).
add(X,[H|L],[H|B]) :- add(X,L,B).

add1(X,L,N) :- remove(X,N,L).

perm([],[]).
perm([H|P],L) :- remove(H,L,S), perm(P,S).

perm1([],[]).
perm1(P,[H|L]) :- perm1(P1,L), add(H,P1,P).

subset([],L).
subset([X|S],L) :- append(_,[X|B],L), subset(S,B).

sub(A,B) :- not(( member(X,A), not(member(X,B)) )).

p(X,Y) :- Y is X mod 2.

min(X,[X]).
min(M,[X|L]) :- min(Y,L), m(M,X,Y).
m(X,X,Y) :- X=<Y.
m(Y,X,Y) :- not(X=<Y).

between(A,A,B) :- A=<B.
between(X,A,B) :- A<B, A1 is A+1, between(X,A1,B).

n(0).
n(X) :- n(Y), X is Y+1.
n(X,Y) :- n(S), between(X,0,S), Y is S-X.

z(X) :- n(Y), c(X,Y).
c(Y,Y).
c(X,Y) :- Y>0, X is -Y.
z(X,Y) :- n(X1,Y1), c(X,X1), c(Y,Y1).

f(0,1).
f(X,Y) :- f(Z,X), Y is Z+X.
fib(X) :- f(X,_).