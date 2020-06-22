succ(0).
add(X,0,X).
add(X,succ(Y),succ(Z)):-add(X,Y,Z).

natNum(0).
natNum(N) :-add(X,succ(0),N), natNum(X).

isZero(0).

pred(0,0).
pred(N,P):-add(P,succ(0),N).

eq(0,0).
eq(0,succ(0)):-!,false.
eq(succ(0),0):-!,false.
eq(X,Y):-pred(X,A),pred(Y,B),eq(A,B).

minus(X,0,X).
minus(X,Y,Z):-pred(Y,P),add(Z,succ(0),Q),minus(X,P,Q).

times(_,0,0).
times(X,_,0):-!,isZero(X).
times(_,Y,0):-!,isZero(Y).
times(X,Y,Z):-pred(Y,P),minus(Z,X,M),times(X,P,M).