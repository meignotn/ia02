/* IA02 jeu de khan */


plateau([[2,3,1,2,2,3],[2,1,3,1,3,1],[1,3,2,3,1,2],[3,1,2,1,3,2],[2,3,1,3,1,3],[2,1,3,2,2,1]]).
pions1([[1,2],[2,3],[4,5],[1,6]]).
pions2([[3,5],[4,3],[6,5],[6,6]]).
test([1,2,3,4,5,6]).

%affichageDuPlateau	
afficher_liste([],_,_):-write('|').
afficher_liste([X|L],LARGEUR,HAUTEUR) :- write('|'),afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste(L,LARGEUR1,HAUTEUR).

br(0).
br(X):-write('-'),X1 is X-1,br(X1).
br_aux(_):-write('   '),br(23).

%FonctionTestPionPas %PasTermine

is_equal([],[]).
is_equal([H1|T1],[H2|T2]):- H1=:=H2,is_equal(T1,T2).
estpion_aux([X|_],P):-is_equal(X,P).
estpion_aux([_|Q],P):-estpion_aux(Q,P).
estpion1(L,H):-pions1(X),estpion_aux(X,[L,H]).
estpion2(L,H):-pions2(X),estpion_aux(X,[L,H]).

/*affichage des case du plateaux*/
afficher_pion(X,L,H):-X =:= 1,estpion1(L,H),ansi_format([bg(yellow),fg(black)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estpion2(L,H),ansi_format([bg(yellow),fg(white)], ' o ',[world]),!.
afficher_pion(X,_,_):-X =:= 1,ansi_format([bg(yellow),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estpion1(L,H),ansi_format([bg(magenta),fg(black)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estpion2(L,H),ansi_format([bg(magenta),fg(white)], ' o ',[world]),!.
afficher_pion(X,_,_):-X =:= 2,ansi_format([bg(magenta),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estpion1(L,H),ansi_format([bg(red),fg(black)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estpion2(L,H),ansi_format([bg(red),fg(white)], ' o ',[world]),!.
afficher_pion(X,_,_):-X =:= 3,ansi_format([bg(red),fg(white)], '   ',[world]),!.

afficher_coord_aux(7):-nl.
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write('  '),afficher_coord_aux(X1).
afficher_coord(_):-write('  '),afficher_coord_aux(1).

afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,br_aux(_),nl,afficher_plateau(L,HAUTEUR1).

afficher_plat(_):-plateau(X),afficher_coord(_),afficher_plateau(X,1).

%ChoixDesPieces 
/* placement piece test coordonnée mais pas l'existence d'une autre piece*/

choisir_pieces:- write('Piece 1: hauteur:'),read(A),write('Piece 1: largeur:'),read(B),test_piece_coord(A,B).

test_piece_coord(X,Y):-X>0,X<7,Y>0,Y<7,write('Piece placée').
test_piece_coord(X,_):-X<0,nl,ansi_format([bold,fg(red)], 'placement impossible',[world]),nl,choisir_pieces.
test_piece_coord(_,Y):-Y<0,nl,ansi_format([bold,fg(red)], 'placement impossible',[world]),nl,choisir_pieces.
test_piece_coord(X,_):-X>6,nl,ansi_format([bold,fg(red)], 'placement impossible',[world]),nl,choisir_pieces.
test_piece_coord(_,Y):-Y>6,nl,ansi_format([bold,fg(red)], 'placement impossible',[world]),nl,choisir_pieces.
