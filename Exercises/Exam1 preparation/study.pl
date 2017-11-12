%% add(X,L,[X|L]).

append([],B,B).
append([H|A1], B, [H|AB1]) :- append(A1,B,AB1).

infix(A,L) :- append(P,_,L), append(_,A,P).

remove(X,[X|L],L).
remove(X,[H|L],[H|B]) :- remove(X,L,B).

add(X,L,N) :- remove(X,N,L).

perm([],[]).
perm([H|P],L) :- remove(H,L,S), perm(P,S).


member(X,L) :- append(_,[X|_],L).
sub1([],_).
sub1([H|T],B) :- member(H,B),sub1(T,B).

test(X) :- X is 0.

%% reverse(R,L).
reverse(L,R) :- rev([],L,R).

rev(S,[],S).
rev(S,[H|T], R) :- rev([H|S], T, R).

n(0).
n(X) :- n(Y), X is Y+1.