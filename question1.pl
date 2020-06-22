lastelement([L],L).
lastelement([_|L],X) :- lastelement(L,X).

sumoflist([],0).
sumoflist([Head|Tail],Sum) :- sumoflist(Tail,Sumrem), Sum is Head + Sumrem.

orderedlist( []      ).
orderedlist( [_]     ).
orderedlist( [X,Y|Z] ) :- X =< Y , orderedlist( [Y|Z] ).

concatlist([],L,L).
concatlist([X|L1],L2,[X|L3]):-concatlist(L1,L2,L3).

edge(k1,k3).
edge(k2,k5).
edge(k4,k2).
edge(k5,k1).
path(X,Y,P):-edge(X,Y),P=[X,Y].
path(X,Y,P):-edge(X,Z),path(Z,Y,P1),P=[X|P1].