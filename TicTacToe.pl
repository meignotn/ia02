%
%
% Motaz Ayyad TicTacToe Game :D :D
%
%

/*Ce programme fonctionne sur SWI mais pas sur GNU  */

win(Brd, Plyr) :- rwin(Brd, Plyr);
                  cwin(Brd, Plyr);
                  dwin(Brd, Plyr).

rwin(Brd, Plyr) :- Brd = [Plyr,Plyr,Plyr,_,_,_,_,_,_];
                   Brd = [_,_,_,Plyr,Plyr,Plyr,_,_,_];
		   Brd = [_,_,_,_,_,_,Plyr,Plyr,Plyr].

cwin(Brd, Plyr) :- Brd = [Plyr,_,_,Plyr,_,_,Plyr,_,_];
                   Brd = [_,Plyr,_,_,Plyr,_,_,Plyr,_];
		   Brd = [_,_,Plyr,_,_,Plyr,_,_,Plyr].

dwin(Brd, Plyr) :- Brd = [Plyr,_,_,_,Plyr,_,_,_,Plyr];
		   Brd = [_,_,Plyr,_,Plyr,_,Plyr,_,_].

omove([a,B,C,D,E,F,G,H,I], Plyr, [Plyr,B,C,D,E,F,G,H,I]).
omove([A,a,C,D,E,F,G,H,I], Plyr, [A,Plyr,C,D,E,F,G,H,I]).
omove([A,B,a,D,E,F,G,H,I], Plyr, [A,B,Plyr,D,E,F,G,H,I]).
omove([A,B,C,a,E,F,G,H,I], Plyr, [A,B,C,Plyr,E,F,G,H,I]).
omove([A,B,C,D,a,F,G,H,I], Plyr, [A,B,C,D,Plyr,F,G,H,I]).
omove([A,B,C,D,E,a,G,H,I], Plyr, [A,B,C,D,E,Plyr,G,H,I]).
omove([A,B,C,D,E,F,a,H,I], Plyr, [A,B,C,D,E,F,Plyr,H,I]).
omove([A,B,C,D,E,F,G,a,I], Plyr, [A,B,C,D,E,F,G,Plyr,I]).
omove([A,B,C,D,E,F,G,H,a], Plyr, [A,B,C,D,E,F,G,H,Plyr]).

xmove([a,B,C,D,E,F,G,H,I], 1, [x,B,C,D,E,F,G,H,I]).
xmove([A,a,C,D,E,F,G,H,I], 2, [A,x,C,D,E,F,G,H,I]).
xmove([A,B,a,D,E,F,G,H,I], 3, [A,B,x,D,E,F,G,H,I]).
xmove([A,B,C,a,E,F,G,H,I], 4, [A,B,C,x,E,F,G,H,I]).
xmove([A,B,C,D,a,F,G,H,I], 5, [A,B,C,D,x,F,G,H,I]).
xmove([A,B,C,D,E,a,G,H,I], 6, [A,B,C,D,E,x,G,H,I]).
xmove([A,B,C,D,E,F,a,H,I], 7, [A,B,C,D,E,F,x,H,I]).
xmove([A,B,C,D,E,F,G,a,I], 8, [A,B,C,D,E,F,G,x,I]).
xmove([A,B,C,D,E,F,G,H,a], 9, [A,B,C,D,E,F,G,H,x]).
xmove(Brd, _, Brd) :- write('Illegal move.'), nl.


disp([A,B,C,D,E,F,G,H,I]) :-
	write('|'),
	write([A,B,C]),write('|'),nl,
	write('|'),
	write([D,E,F]),write('|'),nl,	write('|'),
        write([G,H,I]),write('|'),nl,nl.


go :- how_to_play, strt([a,a,a,a,a,a,a,a,a]). 
 
how_to_play :-
  write('You are x player, enter positions followed by a period.'),
  nl,  /*On va utiliser disp, qui est définie juste au-dessus, à la ligne 46 */ 
  disp([1,2,3,4,5,6,7,8,9]). 

/*Si le joueur humain a gagné (le prédicat win regarde s'il y a un gagnant) la partie est arrêtée et un message annonçant la victoire du joueur est affiché. */ 
strt(Brd) :- win(Brd, x), write('You win!').
/*La partie stoppe également dans le cas d'une victoire de l'IA */ 
strt(Brd) :- win(Brd, o), write('AI win!').
/*Si ni l'homme ni la machine n'a gagné, on refait un tour du jeu. On lit d'abord le mouvement du joueur, on remet à jour l'écran et on l'affiche, l'ordinateur
joue, et remet à jour l'écran aussi. brd est le tableau avec des a partout du depart. */ 
strt(Brd) :- read(N), xmove(Brd, N, NewBrd), disp(NewBrd), oplay(NewBrd, NewnewBrd), disp(NewnewBrd), strt(NewnewBrd).


can_x_win(Brd) :- omove(Brd, x, NewBrd), win(NewBrd, x).

oplay(Brd,NewBrd) :-
  omove(Brd, o, NewBrd),
  win(NewBrd, o),!.
oplay(Brd,NewBrd) :-
  omove(Brd, o, NewBrd),
  not(can_x_win(NewBrd)).
oplay(Brd,NewBrd) :-
  omove(Brd, o, NewBrd).
oplay(Brd,NewBrd) :-
  not(member(a,Brd)),!,
  write('Game Ended without Winner!'), nl,
  NewBrd = Brd.
