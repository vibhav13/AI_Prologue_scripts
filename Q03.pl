%each state contains the coordinates of the frog(Fx,Fy), the direction
% the frog is facing Dir, the list Lp which contains the coordinate
% of all lily pads, and the list Path which stores the current path.
goal([Fx,Fy,_,Lp,_]):-member([Fx,Fy],Lp),length(Lp,1).

next([Fx1,Fy1,Dir1,Lp1,Path1],[Fx2,Fy2,Dir2,Lp2,Path2]):-delete(Lp1,[Fx1,Fy1],Lp2),member([Fx2,Fy2],Lp1),member([Fx2,Fy2],Lp2),
    ((Dir2='x',findall(X,(member([X,Fy1],Lp1),X>Fx1),Lx),min_list(Lx,Fx2),not(Dir1='-x'),Fy2=Fy1);
    (Dir2='-x',findall(MX,(member([MX,Fy1],Lp1),MX<Fx1),Lmx),max_list(Lmx,Fx2),not(Dir1='x'),Fy2=Fy1);
    (Dir2='y',findall(Y,(member([Fx1,Y],Lp1),Y>Fy1),Ly),min_list(Ly,Fy2),not(Dir1='-y'),Fx2=Fx1);
    (Dir2='-y',findall(MY,(member([Fx1,MY],Lp1),MY<Fy1),Lmy),max_list(Lmy,Fy2),not(Dir1='y'),Fx2=Fx1)),
    append([[Fx1,Fy1]],Path1,Path2).

%modified breadth-first search from lecture slides
bfs([X|_],_):-goal(X),!,
    nth1(1,X,Fx),nth1(2,X,Fy),nth1(5,X,Steps),reverse([[Fx,Fy]|Steps],Path),write(Path).
bfs([X|Fr],Exd):-member(X,Exd),!
%,append(Steps,[[Fx,Fy]],NewSteps
    ,bfs(Fr,Exd).
bfs([X|Fr],Exd):-allnext(X,L),
    append(Fr,L,NewFr)
    ,bfs(NewFr,[X|Exd]).
allnext(X,L):-findall(Y,next(X,Y),L).

do:-
%level1
   % lv1=[[0,1],[1,1],[1,2],[1,3],[2,0],[2,3],[3,0],[3,3],[4,1],[4,2],[4,3],[5,1]],
%initial state:
   % st1=[0,1,'x',lv1],

%level2
   % lv2=[[0,1],[0,2],[0,3],[1,1],[1,3],[2,0],[2,1],[2,3],[2,4],[3,1],[3,3],[4,1],[4,2],[4,3]],
%initial state:
   % st2=[2,0,'y',lv2],
    writeln('For level 1:'),
    bfs([[0,1,'x',[[0,1],[1,1],[1,2],[1,3],[2,0],[2,3],[3,0],[3,3],[4,1],[4,2],[4,3],[5,1]],[]]],[]),
    writeln(''),
    writeln('For level 2:'),
    bfs([[2,0,'y',[[0,1],[0,2],[0,3],[1,1],[1,3],[2,0],[2,1],[2,3],[2,4],[3,1],[3,3],[4,1],[4,2],[4,3]],[]]],[]).
