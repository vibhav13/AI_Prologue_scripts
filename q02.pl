% each state contains a list M which stores the postions of the
% male frogs, a list F which stores the postions of the female frogs,
% the variable Emp which stores the position of the empty space, and the
% list Path which stores the current path.
goal([M,F,Emp,_]):-sum_list(F,18),sum_list(M,6),Emp=4.

next([M1,F1,Emp1,Path1],[M2,F2,Emp2,Path2]):-
    ((member(Emp2,F1),Emp2 is Emp1-1,delete(F1,Emp2,F2Pre),append([Emp1],F2Pre,F2),M2=M1);
    (member(Emp2,M1),Emp2 is Emp1+1,delete(M1,Emp2,M2Pre),append([Emp1],M2Pre,M2),F2=F1);
    (member(Emp2,F1),Emp2 is Emp1-2,delete(F1,Emp2,F2Pre),append([Emp1],F2Pre,F2),M2=M1);
    (member(Emp2,M1),Emp2 is Emp1+2,delete(M1,Emp2,M2Pre),append([Emp1],M2Pre,M2),F2=F1)),
    append([[M1,F1,Emp1]],Path1,Path2).

% depth-first search
dfs([X|_],_):-goal(X),!,
    nth1(1,X,M),nth1(2,X,F),nth1(3,X,E),nth1(4,X,S),reverse([[M,F,E]|S],P),write(P).
dfs([X|Fr],Exd):-member(X,Exd),!,dfs(Fr,Exd).
dfs([X|Fr],Exd):-allnext(X,L),append(L,Fr,NewFr),dfs(NewFr,[X|Exd]).

allnext(X,L):-findall(Y,next(X,Y),L).

doDFS:-dfs([[[5,6,7],[1,2,3],4,[]]],[]).

% iterative depth-first search
idfs([X|_],_,_,_,_):-goal(X),!,
    nth1(1,X,M),nth1(2,X,F),nth1(3,X,E),nth1(4,X,S),reverse([[M,F,E]|S],P),write(P).
idfs([],_,T,T,Ini):-!,NewT is T+1,idfs(Ini,[],NewT,0,Ini).
idfs([X|Fr],Exd,T,CurT,Ini):-member(X,Exd),!,idfs(Fr,Exd,T,CurT,Ini).
idfs([X|Fr],Exd,T,T,Ini):-!,idfs(Fr,[X|Exd],T,T,Ini).
idfs([X|Fr],Exd,T,CurT,Ini):-allnext(X,L),append(L,Fr,NewFr),NewCur is CurT+1,idfs(NewFr,[X|Exd],T,NewCur,Ini).

doIDFS:-idfs([[[5,6,7],[1,2,3],4,[]]],[],1,0,[[[5,6,7],[1,2,3],4,[]]]).
