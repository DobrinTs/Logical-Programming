%% p(N).
between(A,A,B) :- A =< B.
between(X,A,B) :- A < B, A1 is A+1, between(X,A1,B).
p(N) :- between(X1,0,31), between(X2,0,31), between(X3,0,31), between(X4,0,31), 
	N is X1*X1 + X2*X2 + X3*X3 + X4*X4, N<1000.

%%  ------------------------------------------------------------------------------
%% group(L,G).
group([],[]).
group([X], [[X]]).
group([H| [H | T]], [[H|X]|G]) :- group([H|T], [X|G]).
group([X| [H | T]], [[X]|G]) :- not(X=:=H), group([H|T], G).

%% -------------------------------------------------------------------------------
%% graphs
empty([[],[]]).

edge([V,E], X, Y) :- member([X,Y], E).
edge([V,E], X, Y) :- member([Y,X], E).

%% -------------------------------------------------------------------------------
path(G,V,X,X,V).
path(G,V,X,Y,P) :- edge(G,X,X1), not(member(X1,V)), path(G,[X|V], X1, Y, P).
path(G,X,Y,P) :- path(G,[],X,Y,Q), reverse(Q,P).

g([[x,y,a,b,c],[[x,a],[a,b],[b,c],[c,a],[y,c]]]).