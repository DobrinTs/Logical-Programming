between(A,A,B) :- A=<B.
between(X,A,B) :- A<B, A1 is A+1, between(X,A1,B).

d(X,Y) :- Y mod X =:= 0.
prime(X) :- X>1, X1 is X-1, not((between(Y,2,X1),d(Y,X))).
pd(X,A) :- between(X,2,A), d(X,A), prime(X).

p(N,K) :- pd(K,N), not(( pd(Y,N), Y>K )).

q(1,[]).
q(N,[X|L]) :- p(N,X), N1 is N/X, q(N1,L).

%% ----------------------------------------------------------
%% group(L,G).
group([],[]).
group([X],[[X]]).
group([H|[H|L]], [[H|C]|T]) :- group([H|L],[C|T]).
group([H|[X|L]], [[H]|T]) :- group([X|L], T), not(H=:=X).

v(X,V) :- member(A,X), member(V,A).

a([[1,2],[1,4],[3,4]]).
b([[5,6],[6,3]]).

remove(H,[H|L],L).
remove(X,[H|L],[H|R]) :- remove(X,L,R).

edge(E, X, Y) :- member([X,Y], E).
edge(E, X, Y) :- member([Y,X], E).

path(G,V,X,X,V).
path(G,V,X,Y,P) :- edge(G,X,X1), not(member(X1,V)), path(G,[X|V], X1, Y, P).
path(G,X,Y,P) :- path(G,[],X,Y,Q), reverse(Q,P).


cycle([[1,2],[2,3],[3,1]]).
c(A) :- remove([X,Y], A, A1), path(A1, Y, X, P), length(A1,LA1), length(P,LA1).

