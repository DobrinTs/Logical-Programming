%% L is a list of lists
%% d(D,L) generates Cartesian product of the lists in L
%% d(D,L).
%% d([],[]).
%% d([H|D1],[A|L]) :- member(H,A), d(D1,L).

%% ---------------
%% functions from last time
n(0).
n(X) :- n(Y), X is Y+1.
between(A,A,B) :- A =< B.
between(X,A,B) :- A < B, A1 is A+1, between(X,A1,B).

%% [] is a tree
%% if A and B are trees then [A|B] is a tree
%% p(T) generates all trees
%% p(T) :- n(N), p(N,T).
%% p(0,[]).
%% p(N,[A,B]) :- N>0, N1 is N-1, between(X,0,N1), Y is N1-X, p(X,A), p(Y,B).

%% sums(N,S).
%% generates lists of >0 numbers, the sum of which is N
sums(0,[]).
sums(N,[H|T]) :- between(H,1,N), N1 is N-H, sums(N1,T).

%% all lists of natural numbers
n(X,Y) :- n(A), between(X,0,A), Y is A-X.
nlist(L) :- n(M,N), nlist(M,N,L). % M is max element, N is list length
nlist(M,0,[]).
nlist(M,N,[H|L]) :- N>0, between(H,0,M), N1 is N-1, nlist(M,N1,L).

%% p(A,B) check if A and B have the same prime divisors
p(A,B) :- pdc(A,B), pdc(B,A).
d(X,Y) :- Y mod X =:= 0.
prime(X) :- X>1, X1 is X-1, not((between(Y,2,X1),d(Y,X))).
pd(X,A) :- between(X,2,A), d(X,A), prime(X).
pdc(A,B) :- not((pd(X,A), not(d(X,B)))). % pdc - every prime divisor of A is a divisor of B

%% transpose matrix
%% tr(M,T).
tr([[]|_],[]).
tr(M, [H|T]) :- helper(M,H,M1), tr(M1,T). % H is list of first elements from each row; M1 is the remainder from each row
helper([],[],[]).
helper([[H|T]|L], [H|A], [T|B]) :-  helper(L, A, B).