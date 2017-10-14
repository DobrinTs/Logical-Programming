p(ivan,maria).
p(georgi,maria).
p(aaa,maria).
p(adsad,maria).
p(maria,pesho).

gp(X,Y) :- p(X,Z) , p(Z,Y).

member(X, [X|_]).
member(X, [_|L]) :- member(X,L).

first(X,[X|_]).
second(X,[_|[X|_]]).

last(X,[X]).
last(X, [_|L]) :- last(X,L).

append([],B,B).
append([H|A],B,[H|AB]) :- append(A,B,AB).