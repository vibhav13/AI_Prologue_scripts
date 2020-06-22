leftof(X,Y,L):-nth1(PX,L,X),nth1(PY,L,Y),PX<PY.
between(X,Y,Z,L):-nth1(PX,L,X),nth1(PY,L,Y),nth1(PZ,L,Z),PX<PY,PY<PZ.

crypto(L):-length(L,5),
    nth1(1,L,X1),nth1(1,X1,'Charles'),nth1(2,X1,'black'),nth1(3,X1,'bike'),length(X1,6),
    nth1(2,L,X2),length(X2,6),
    nth1(3,L,X3),nth1(5,X3,100),nth1(6,X3,'hashtag'),length(X3,6),
    nth1(4,L,X4),nth1(2,X4,'yellow'),length(X4,6),
    nth1(5,L,X5),nth1(6,X5,'1234'),length(X5,6),
    member(C,L),nth1(3,C,'computer'),(X1=C;X5=C),
    (nth1(6,X1,'brainzilla');nth1(6,X5,'brainzilla')),
    member(R,L),nth1(1,R,'Russel'),nextto(B,R,L),member(B,L),nth1(3,B,'Boat'),
    member(F,L),nextto(R,F,L),nth1(5,F,400),
    member(Le,L),nth1(1,Le,'Leslie'),nextto(J,Le,L),member(J,L),nth1(3,J,'Jewel'),
    nextto(Z,J,L),member(Z,L),nth1(4,Z,'Coinzillas'),
    member(O,L),nth1(1,O,'Oliver'),nextto(O,S,L),member(S,L),nth1(4,S,'SudoCoins'),
    member(W,L),nth1(2,W,'white'),(nextto(J,W,L);nextto(W,J,L)),
    member(FH,L),nth1(5,FH,500),(nextto(FH,C,L);nextto(C,FH,L)),
    member(E,L),nth1(1,E,'Eugene'),nth1(2,E,'green'),
    member(IQ,L),nth1(4,IQ,'IQCoins'),nth1(5,IQ,300),
    member(Br,L),nth1(4,Br,'BrainCoins'),nth1(5,Br,200),
    member(Ca,L),nth1(3,Ca,'car'),nth1(6,Ca,'qwert'),
    member(Bl,L),nth1(2,Bl,'blue'),nth1(4,Bl,'LogiCoins'),
    member(G,L),nth1(2,G,'green'),between(Br,G,C,L),
    member(Re,L),nth1(6,Re,'rex'),leftof(W,Re,L).

