%% natural numbers
n(0).
n(X) :- n(Y), X is Y+1.

%% o(1).
%% o(X) :- o(Y), X is Y+1.
%% odd numbers
o(X) :- n(X), X mod 2 =:= 1.

%% doesnt work :/
%% n100(X) :- n(X), X<100.
%% check if a number is in an interval
between(A,A,B) :- A =< B.
between(X,A,B) :- A < B, A1 is A+1, between(X,A1,B).

n100(X) :- between(X,0,99).

%% doesnt work
%% n(0,0).
%% n(0,Y) :- Y1 is Y+1, n(Y1,0).
%% n(X,Y) :- X1 is X-1, Y1 is Y+1, n(X1,Y1).

%% all natural number pairs
n(X,Y) :- n(A), between(X,0,A), Y is A-X.

%% whole numbers
%% 1st way
z(X) :- n(Y), c(Y,X).
c(X,X).
c(X,Y) :- X>0, Y is -X.

%% fibonacci numbers
%% f(X) :- n(N), f(N,X).

g(0,1).
g(Y,Z) :- g(X,Y), Z is X+Y.
f(X) :- g(X,Y).

%% a1=a2=a3=1
%% a(n+3) = 3*a(n+1) - a(n)
p1(1,1,1).
p1(X,Y,Z) :- p1(A,X,Y), Z is 3*X-A.
pred(X) :- p1(X,Y,Z).

%% pairs of whole numbers
append([],B,B).
append([H|A],B,[H|AB]) :- append(A,B,AB).
member(X,L) :- append(_,[X|_],L).

z(X,Y) :- n(X1,Y1), member(C1,[1,-1]), member(D1,[1,-1]), X is X1*C1, Y is Y1*D1.


%% all N-tuples of natural numbers
nn(N,L) :- n(S), nn(N,L,S).
nn(0,[],0).
nn(N,[H|T],S) :- N>0, between(H,0,S), S1 is S-H, N1 is N-1, nn(N1,T,S1).