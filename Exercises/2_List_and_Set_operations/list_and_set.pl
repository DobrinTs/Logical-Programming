append([],B,B).
append([H|A],B,[H|AB]) :- append(A,B,AB).

%1st way
%member(X,L) :- append(A,[X],C), append(C,B,L).
%2nd way
member(X,L) :- append(_,[X|_],L).

last(X,L) :- append(_,[X],L).

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).

%infix(A,L) :- append(_,A,P), append(P,_,L). bezbr mn resh
infix(A,L) :- append(P,_,L), append(_,A,P).

%subset(S,L)
%% subset([],L).
%% subset([H|S],L) :- member(H,L), subset(S,L).
%% subset([H|S],L) :- subset(S,L), member(H,L).

%% subset([],L).
%% subset([H|S1],[H|S]) :- subset(S1,S).
%% subset(S1,[H|S]) :- subset(S1,S).

subset([],_).
subset([X|S],L) :- append(_,[X|B],L), subset(S,B).

%s append
%% remove(X,L,N) :- append(A,[X|B],L), append(A,B,N).

%without append
remove(X,[X|L],L).
remove(X,[H|L],[H|B]) :- remove(X,L,B).

add(X,L,N) :- remove(X,N,L).

perm([],[]).
perm([H|P],L) :- remove(H,L,S), perm(P,S).

%non-empty intersection
c(A,B) :- member(X,A), member(X,B).

eqs(A,B) :- sub(A,B), sub(B,A).
%new subset
sub(A,B) :- not((member(X,A),not(member(X,B)))).

sub1([],_).
sub1([H|T],B) :- member(H,B),sub1(T,B).

less(A,B) :- A=<B.
sorted([]).
sorted([_]).
sorted([A,B|T]) :- less(A,B), sorted([B|T]).

sorted1(L) :- not( (infix([A,B],L), not(less(A,B)) ) ).

%--------------------------------------------------------
%there is an element in X that is in an element of Y
p1(X,Y) :- member(A,X), member(B,Y), member(A,B).

%there is an element in X that is in every element of Y
p2(X,Y) :- member(A,X), not(( member(B,Y), not( member(A,B) ) )).

%every element in X is in an element of Y
p3(X,Y) :- not(( member(A,X), not(( member(B,Y), member(A,B) )) )).

%every element in X is in every element of Y
p4(X,Y) :- not(( member(A,X), member(B,Y), not(member(A,B)) )).