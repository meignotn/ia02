/* IA02 jeu de khan */


plateau([	[2,3,1,2,2,3],
			[2,1,3,1,3,1],
			[1,3,2,3,1,2],
			[3,1,2,1,3,2],
			[2,3,1,3,1,3],
			[2,1,3,2,2,1]]).

%pionsEquipe1(LARGEUR,HAUTEUR)
:- dynamic pions1/2.
pions1(0,0).
pions1(0,0).
pions1(0,0).
pions1(0,0).
pions1(0,0).
pions1(0,0).

%pionsEquipe2(LARGEUR,HAUTEUR)
:- dynamic pions2/2.
pions2(0,0).
pions2(0,0).
pions2(0,0).
pions2(0,0).
pions2(0,0).
pions2(0,0).

%affichageDuPlateau	
afficher_liste([],_,_).
afficher_liste([X|L],LARGEUR,HAUTEUR) :- afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste(L,LARGEUR1,HAUTEUR).

br(0).
br(X):-write('-'),X1 is X-1,br(X1).
br_aux(_):-write('   '),br(23).

%FonctionTestPionPas.
estpion1(L,H):-pions1(L,H).
estpion2(L,H):-pions2(L,H).

%TestCase
estCase1(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7,plateau(X),estCase1Aux(X,LARGEUR,HAUTEUR).
estCase1Aux([X|Q],LARGEUR,1):-write(X),estCase1Aux2(X,LARGEUR).
estCase1Aux([X|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase1Aux(Q,LARGEUR,HAUTEUR1).
estCase1Aux2([X|Q],1):-X=:=1.
estCase1Aux2([X|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase1Aux2(Q,LARGEUR1).

estCase2(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7,plateau(X),estCase2Aux(X,LARGEUR,HAUTEUR).
estCase2Aux([X|Q],LARGEUR,1):-write(X),estCase2Aux2(X,LARGEUR).
estCase2Aux([X|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase2Aux(Q,LARGEUR,HAUTEUR1).
estCase2Aux2([X|Q],1):-X=:=2.
estCase2Aux2([X|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase2Aux2(Q,LARGEUR1).

estCase3(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7,plateau(X),estCase3Aux(X,LARGEUR,HAUTEUR).
estCase3Aux([X|Q],LARGEUR,1):-write(X),estCase3Aux2(X,LARGEUR).
estCase3Aux([X|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase3Aux(Q,LARGEUR,HAUTEUR1).
estCase3Aux2([X|Q],1):-X=:=3.
estCase3Aux2([X|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase3Aux2(Q,LARGEUR1).

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
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
afficher_coord(_):-write('  '),afficher_coord_aux(1).

afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).

afficher_plat(_):-plateau(X),afficher_coord(_),afficher_plateau(X,1).

%ChoixDesPieces 
choix_pions1(0):-afficher_plat(_).
choix_pions1(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_pion_1(_),choix_pions1(N1).

choisir_pion_1(_):-write('Piece 1: largeur:'),read(A),write('Piece 1: hauteur:'),read(B),place_pion1(A,B).

place_pion1(_,B):-B>2,write('placement impossible'),nl,choisir_pion_1(_),!.
place_pion1(A,B):-B<3,occupe(A,B),write('place occupée veuillez essayer a nouveau'),nl,choisir_pion_1(_).
place_pion1(A,B):-B<3,libre(A,B),retract(pions1(0,0)),assert(pions1(A,B)),write('piece placée'),nl,!.

choix_pions2(0):-afficher_plat(_).
choix_pions2(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_pion_2(_),choix_pions2(N1).

choisir_pion_2(_):-write('Piece 2: largeur:'),read(A),write('Piece 2: hauteur:'),read(B),place_pion2(A,B).

place_pion2(_,B):-B<5,write('placement impossible'),nl,choisir_pion_2(_),!.
place_pion2(A,B):-B>4,occupe(A,B),write('place occupée veuillez essayer a nouveau'),nl,choisir_pion_2(_).
place_pion2(A,B):-B>4,libre(A,B),retract(pions2(0,0)),assert(pions2(A,B)),write('piece placée'),nl,!.



%CaseOccupeOuLibre?
libre(LARGEUR,HAUTEUR):-HAUTEUR>0,HAUTEUR<7,LARGEUR>0,LARGEUR<7,not(pions1(LARGEUR,HAUTEUR)),not(pions2(LARGEUR,HAUTEUR)).
occupe(LARGEUR,HAUTEUR):-HAUTEUR>0,HAUTEUR<7,LARGEUR>0,LARGEUR<7,pions1(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-HAUTEUR>0,HAUTEUR<7,LARGEUR>0,LARGEUR<7,pions2(LARGEUR,HAUTEUR),!.

%mouvement
%estPossibleJ1(ORGL,ORGH,NEWL,NEWH):-estpion1(ORGL,ORGH)

%lancementJeu
initBoard(_):-afficher_plat(_),write('placement sbires joueur1'),choix_pions1(5),write('placement sbires joueurs 2'),choix_pions2(5).
