/* IA02 jeu de khan */


plateau([	[2,3,1,2,2,3],
			[2,1,3,1,3,1],
			[1,3,2,3,1,2],
			[3,1,2,1,3,2],
			[2,3,1,3,1,3],
			[2,1,3,2,2,1]]).
:-dynamic arbre/1.
arbre([]).
%kalista rouge
:-dynamic kalistar/2.
%sbires rouge
:-dynamic sbireR/2.
%sbires ocre
:-dynamic sbireO/2.
%kalista ocre
:-dynamic kalistao/2.


%coupPossibles
:-dynamic cp1/4.
%fin de partie
termine(_):-not(kalistao(_,_)).
termine(_):-not(kalistar(_,_)).

victoireRouge(_):-kalistar(_,_).
victoireOcre(_):-kalistao(_,_).

%affichageDuPlateau	
afficher_liste([],_,_).
afficher_liste([X|L],LARGEUR,HAUTEUR) :- afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste(L,LARGEUR1,HAUTEUR).

%FonctionTestPion.
estSbire(L,H):-estSbireRouge(L,H).
estSbire(L,H):-estSbireOcre(L,H).
estKalista(L,H):-estKalistaRouge(L,H).
estKalista(L,H):-estKalistaOcre(L,H).
estSbireRouge(L,H):-sbireR(L,H).
estSbireOcre(L,H):-sbireO(L,H).
estKalistaRouge(L,H):-kalistar(L,H). 
estKalistaOcre(L,H):-kalistao(L,H). 
estRouge(L,H):-estSbireRouge(L,H).
estRouge(L,H):-estKalistaRouge(L,H).
estOcre(L,H):-estSbireOcre(L,H).
estOcre(L,H):-estKalistaOcre(L,H).

%TestCase
estCase1(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase1Aux(X,LARGEUR,HAUTEUR).
estCase1Aux([X|_],LARGEUR,1):-estCase1Aux2(X,LARGEUR).
estCase1Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase1Aux(Q,LARGEUR,HAUTEUR1).
estCase1Aux2([X|_],1):-X=:=1.
estCase1Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase1Aux2(Q,LARGEUR1).

estCase2(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase2Aux(X,LARGEUR,HAUTEUR).
estCase2Aux([X|_],LARGEUR,1):-estCase2Aux2(X,LARGEUR).
estCase2Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase2Aux(Q,LARGEUR,HAUTEUR1).
estCase2Aux2([X|_],1):-X=:=2.
estCase2Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase2Aux2(Q,LARGEUR1).

estCase3(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase3Aux(X,LARGEUR,HAUTEUR).
estCase3Aux([X|_],LARGEUR,1):-estCase3Aux2(X,LARGEUR).
estCase3Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase3Aux(Q,LARGEUR,HAUTEUR1).
estCase3Aux2([X|_],1):-X=:=3.
estCase3Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase3Aux2(Q,LARGEUR1).

/*affichage des case du plateaux cyan=1 bleu =2 noir =3*/
afficher_pion(X,L,H):-X =:= 1,estSbireRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estSbireOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], ' K ',[world]),!.
afficher_pion(X,_,_):-X =:= 1,ansi_format([bg(cyan),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireRouge(L,H),ansi_format([bold,bg(blue),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireOcre(L,H),ansi_format([bold,bg(blue),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaRouge(L,H),ansi_format([bold,bg(blue),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaOcre(L,H),ansi_format([bold,bg(blue),fg(white)], ' K ',[world]),!.
afficher_pion(X,_,_):-X =:= 2,ansi_format([bg(blue),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireRouge(L,H),ansi_format([bold,bg(black),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireOcre(L,H),ansi_format([bold,bg(black),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaRouge(L,H),ansi_format([bold,bg(black),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaOcre(L,H),ansi_format([bold,bg(black),fg(white)], ' K ',[world]),!.
afficher_pion(X,_,_):-X =:= 3,ansi_format([bg(black),fg(white)], '   ',[world]),!.

/*affichage des case du plateau pour un deplacement possible cyan=1 bleu =2 noir =3 vert=prise jaune=case libre*/
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], ' K ',[world]),!.


afficher_coord_aux(7):-nl.
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
afficher_coord(_):-write('  '),afficher_coord_aux(1).

afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).

afficher_plat(_):-nl,plateau(X2),afficher_coord(_),afficher_plateau(X2,1).

%ChoixDesPieces 
choix_sbire_rouge(0):-afficher_plat(_).
choix_sbire_rouge(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_sbire_rouge(_),choix_sbire_rouge(N1).
choisir_sbire_rouge(_):-write('Sbire rouge: colonne:'),read(A),write('Sbire rouge: ligne:'),read(B),place_sbire_rouge(A,B).
place_sbire_rouge(_,B):-B<5,write('placement impossible'),nl,choisir_sbire_rouge(_),!.
place_sbire_rouge(A,B):-B>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(_).
place_sbire_rouge(A,B):-B>4,libre(A,B),assert(sbireR(A,B)),write('piece placee'),nl,!.

choix_sbire_ocre(0):-afficher_plat(_).
choix_sbire_ocre(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_pion_ocre(_),choix_sbire_ocre(N1).
choisir_pion_ocre(_):-write('Sbire ocre: colonne:'),read(A),write('Sbire ocre: ligne:'),read(B),place_sbire_ocre(A,B).
place_sbire_ocre(_,B):-B>2,write('placement impossible'),nl,choisir_pion_ocre(_),!.
place_sbire_ocre(A,B):-B<3,occupe(A,B),write('place occupée veuillez essayer a nouveau'),nl,choisir_pion_ocre(_).
place_sbire_ocre(A,B):-B<3,libre(A,B),assert(sbireO(A,B)),write('piece placee'),nl,!.

choisir_kalista_rouge(_):-write('Kalista rouge: colonne:'),read(A),write('Kalista rouge: ligne:'),read(B),place_kalista_rouge(A,B).
place_kalista_rouge(_,B):-B<5,write('placement impossible'),nl,choisir_kalista_rouge(_),!.
place_kalista_rouge(A,B):-B>4,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.

choisir_kalista_ocre(_):-write('Kalista ocre: colonne:'),read(A),write('Kalista ocre: ligne:'),read(B),place_kalista_ocre(A,B).
place_kalista_ocre(_,B):-B>2,write('placement impossible'),nl,choisir_kalista_ocre(_),!.
place_kalista_ocre(A,B):-B<3,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.



%CaseOccupeOuLibre?
libre(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),not(estSbireRouge(LARGEUR,HAUTEUR)),not(estSbireOcre(LARGEUR,HAUTEUR)),not(estKalistaRouge(LARGEUR,HAUTEUR)),not(estKalistaOcre(LARGEUR,HAUTEUR)).
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estSbireRouge(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estSbireOcre(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estKalistaRouge(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estKalistaOcre(LARGEUR,HAUTEUR),!.
estOK(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7 .


%mouvementPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 

estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),estPossibleRouge(ORGL,ORGH,NEWL,NEWH).
estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estOcre(ORGL,ORGH),estPossibleOcre(ORGL,ORGH,NEWL,NEWH).

estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,1).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOcre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,1).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,2).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOcre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,2).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOcre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).

estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,1).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estRouge(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,1).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,2).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estRouge(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,ORGL,ORGH,2).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-libre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estRouge(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).


%cheminPossible depuis (ORGL,ORGH) vers (NEWL,NEWH)
cheminPossible(ORGL,ORGH,NEWL,NEWH,PREL,PREH,1):-(NEWL,NEWH)\=(PREL,PREH),abs(NEWL-ORGL)+abs(NEWH-ORGH)=:=1,!.
cheminPossible(ORGL,ORGH,NEWL,NEWH,PREL,PREH,2):-ORGL1 is ORGL-1,libre(ORGL1,ORGH),(ORGL1,ORGH)\=(PREL,PREH),cheminPossible(ORGL-1,ORGH,NEWL,NEWH,ORGL,ORGH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,PREL,PREH,2):-ORGL1 is ORGL+1,libre(ORGL1,ORGH),(ORGL1,ORGH)\=(PREL,PREH),cheminPossible(ORGL+1,ORGH,NEWL,NEWH,ORGL,ORGH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,PREL,PREH,2):-ORGH1 is ORGH-1,libre(ORGL,ORGH1),(ORGL,ORGH1)\=(PREL,PREH),cheminPossible(ORGL,ORGH-1,NEWL,NEWH,ORGL,ORGH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,PREL,PREH,2):-ORGH1 is ORGH+1,libre(ORGL,ORGH1),(ORGL,ORGH1)\=(PREL,PREH),cheminPossible(ORGL,ORGH+1,NEWL,NEWH,ORGL,ORGH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-ORGL1 is ORGL-1,libre(ORGL1,ORGH),cheminPossible(ORGL1,ORGH,NEWL,NEWH,ORGL,ORGH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-ORGL1 is ORGL+1,libre(ORGL1,ORGH),cheminPossible(ORGL1,ORGH,NEWL,NEWH,ORGL,ORGH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-ORGH1 is ORGH-1,libre(ORGL,ORGH1),cheminPossible(ORGL,ORGH1,NEWL,NEWH,ORGL,ORGH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-ORGH1 is ORGH+1,libre(ORGL,ORGH1),cheminPossible(ORGL,ORGH1,NEWL,NEWH,ORGL,ORGH,2).

testdif(A,B,C,D):-(A,B)\=(C,D).
%mouvement 

move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireRouge(ORGL,ORGH),moveSbireRouge(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireOcre(ORGL,ORGH),moveSbireOcre(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaRouge(ORGL,ORGH),moveKalistaRouge(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaOcre(ORGL,ORGH),moveKalistaOcre(ORGL,ORGH,NEWL,NEWH).

moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Deplacement du sbire rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								assert(sbireR(NEWL,NEWH)).
								%afficher_plat(_).
								
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise d'un sbire ocre par un sbire rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(sbireR(NEWL,NEWH)).
								%afficher_plat(_).
								
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise de la kalista ocre par le sbire rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(sbireR(NEWL,NEWH)),
								assert(victoire(1)),
								nl.

moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Deplacement du sbire ocre sur une case libre */ 
								libre(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								assert(sbireO(NEWL,NEWH)),
								afficher_plat(_).
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire rouge par un sbire ocre */ 
								estSbireRouge(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								retract(sbireR(NEWL,NEWH)),
								assert(sbireO(NEWL,NEWH)).
								%afficher_plat(_).
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par le sbire ocre */ 
								estKalistaRouge(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								retract(kalistar(NEWL,NEWH)),
								assert(sbireO(NEWL,NEWH)),
								assert(victoire(2)),nl.

moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Deplacement de la kalista rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								assert(kalistar(NEWL,NEWH)).
								%afficher_plat(_).
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire ocre par la kalista rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(kalistar(NEWL,NEWH)).
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista ocre par la kalista rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(kalistar(NEWL,NEWH)),
								assert(victoire(1)),nl. 
								
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Deplacement de la kalista sur une case libre*/ 
								libre(NEWL,NEWH),
								retract(kalistao(ORGL,ORGH)),
								assert(kalistao(NEWL,NEWH)).
								%afficher_plat(_).
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH),  /*Prise d'un sbire rouge par la kalista ocre */ 
								estSbireRouge(NEWL,NEWH),
								retract(kalistao(ORGL,ORGH)),
								retract(sbireR(NEWL,NEWH)),
								assert(kalistao(NEWL,NEWH)).
								%afficher_plat(_).
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par la kalista ocre */ 
								estKalistaRouge(NEWL,NEWH),
								retract(kalistao(ORGL,ORGH)),
								retract(kalistar(NEWL,NEWH)),
								assert(kalistao(NEWL,NEWH)),
								assert(victoire(2)),nl. 



%entre_movement
choix_moveRouge(_):-nl,afficher_plat(_),nl,write('colonne du pion Rouge a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveRougeAux(A,B).
choix_moveRougeAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveRouge(_).
choix_moveRougeAux(A,B):-estOK(A,B),not(estRouge(A,B)),write('Case vide ou pion Ocre'),choix_moveRouge(_).
choix_moveRougeAux(A,B):-nl,estOK(A,B),estRouge(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),move(A,B,C,D).
choix_moveRougeAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveRougeAux(A,B).
choix_moveRougeAux2(A,B,C,D):-estOK(C,D),not(move(A,B,C,D)),write('Deplacement impossible'),choix_moveRougeAux(A,B).
choix_moveRougeAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).


choix_moveOcre(_):-nl,afficher_plat(_),nl,write('colonne du pion Ocre a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveOcreAux(A,B).
choix_moveOcreAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveOcre(_).
choix_moveOcreAux(A,B):-estOK(A,B),not(estOcre(A,B)),write('Case vide ou pion Rouge'),choix_moveOcre(_).
choix_moveOcreAux(A,B):-nl,estOK(A,B),estOcre(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),move(A,B,C,D).
choix_moveOcreAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveOcreAux(A,B).
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),not(move(A,B,C,D)),write('Deplacement impossible'),choix_moveOcreAux(A,B).
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).


/*affichage des coups possible pour une pièce */ 

afficherCoupPossible(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H).
afficherCoupPossible(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H).
afficherCoupPossible(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H).

%Coup Possible pour une piece
coupPossible(L,H,M):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,M).
coupPossible(L,H,M):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,M).
coupPossible(L,H,M):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,M).


coupPossibleAux(L,H,_,Y,[]):-estCase1(L,H),Y=:=H+2.
coupPossibleAux(L,H,X,Y,A):-estCase1(L,H),X=:=L+2,Y1 is Y+1,X1 is L-1,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,_,Y,[]):-estCase2(L,H),Y=:=H+3.
coupPossibleAux(L,H,X,Y,A):-estCase2(L,H),X=:=L+3,Y1 is Y+1,X1 is L-2,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,_,Y,[]):-estCase3(L,H),Y=:=H+4.
coupPossibleAux(L,H,X,Y,A):-estCase3(L,H),X=:=L+4,Y1 is Y+1,X1 is L-3,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,X,Y,[(X,Y)|A]):-X1 is X+1,estPossible(L,H,X,Y),coupPossibleAux(L,H,X1,Y,A).
coupPossibleAux(L,H,X,Y,A):-X1 is X+1,coupPossibleAux(L,H,X1,Y,A).

%fonction pour affichage
affichage_coup_possible(_,C,A,B):-nl,afficher_coord(_),plateau(X),afficher_coup_possibleAux(X,1,C,A,B).
afficher_coup_possibleAux([],_,_,_,_).
afficher_coup_possibleAux([X|L],HAUTEUR,C,A,B):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste_coup_possible(X,1,HAUTEUR,C,A,B),nl,afficher_coup_possibleAux(L,HAUTEUR1,C,A,B).
afficher_liste_coup_possible([],_,_,_,_,_).
afficher_liste_coup_possible([X|L],LARGEUR,HAUTEUR,C,A,B) :- member((LARGEUR,HAUTEUR),C),afficher_pion_coup_possible(X,LARGEUR,HAUTEUR,A,B),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).
afficher_liste_coup_possible([X|L],LARGEUR,HAUTEUR,C,A,B) :- afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).



%lancementJeu

initBoard(_):-viderPlateau,write('Les cases bleu clair correspondent aux cases simples, les cases bleu fonce aux cases doubles, les cases noires correspondent aux cases triples'),nl,
			afficher_plat(_),

			nl,write('placement kalista rouge'),choisir_kalista_rouge(_),
			write('placement sbires rouge'),choix_sbire_rouge(5),
			write('placement kalista ocre'),choisir_kalista_ocre(_),
			write('placement sbires ocre'),choix_sbire_ocre(5),
			tourRouge. 

:-dynamic victoire/1. 
victoire(0). 


tourRouge:-termine(_),victoireOcre(_),afficher_plat(_),nl,write('Victoire des Ocres').
tourRouge:-afficher_plat(_),choix_moveRouge(_),tourOcre.
tourOcre:-termine(_),victoireRouge(_),afficher_plat(_),nl,write('Victoire des Rouges').
tourOcre:-afficher_plat(_),choix_moveOcre(_),tourRouge.

/* creer fausse partie pour debug initialisée comme au début d'une vraie partie */ 
viderPlateau:-retractall(sbreO(_,_)),retractall(sbireR(_,_)),retractall(kalistar(_,_)),retractall(kalistao(_,_)).
creerDebugPartie:-viderPlateau,assert(sbireR(2,5)),
								assert(sbireR(3,5)),
								assert(sbireR(4,6)),
								assert(sbireR(6,6)),
								assert(sbireR(1,5)),
								assert(kalistar(2,6)),
								assert(sbireO(1,2)),
								assert(sbireO(2,2)),
								assert(sbireO(3,2)),
								assert(sbireO(4,1)),
								assert(sbireO(4,2)),
								assert(kalistao(6,1)),
								afficher_plat(_),
								tourRouge.




main :-initBoard(_).


estEnDanger.

%trouve tout les rouges
getRouge(M):-findall((A,B),estRouge(A,B),M).
getOcre(M):-findall((A,B),estOcre(A,B),M).

%renvoi tout les coups possible [[(ORG,ORG),(NEW,NEW)],...]
possibleMovesRouge(B):-getRouge(M),possibleMovesAux(M,A),possibleMoveFormat(A,B).
possibleMovesOcre(B):-getOcre(M),possibleMovesAux(M,A),possibleMoveFormat(A,B).

%renvoie les coup possible pour tout la liste passé en arg
possibleMovesAux([],[]).
possibleMovesAux([(X,Y)|A],[R|C]):-coupPossible(X,Y,B),possibleMovesAux2(X,Y,B,R),possibleMovesAux(A,C).

%modification de liste
possibleMovesAux2(_,_,[],[]).
possibleMovesAux2(X,Y,[(A,B)|N],[[(X,Y),(A,B)]|K]):-possibleMovesAux2(X,Y,N,K).

%permet de formater les coup possible en [[(ORG,ORG),(NEW,NEW)],...]
possibleMoveFormat([],[]).
possibleMoveFormat([[]|C],R):-possibleMoveFormat(C,R).
possibleMoveFormat([[A|B]|C],[A|R]):-possibleMoveFormat([B|C],R).


happn([],_,[]).
happn([K|A],B,[K|C]):-happn(A,B,C).


/*
generatepossiblesMovesOcre(M):-retractall(cp1(_,_,_)),forall(estRouge(A,B),assertCoupPossible(A,B)).
possibleMovesRouge(M):-generatepossiblesMovesRouge,findall((A,B,C,D),cp1(A,B,C,D),M).
possibleMovesOcre(M):-generatepossiblesMovesOcre,findall((A,B,C,D),cp1(A,B,C,D),M).


%plateau origine
:-dynamic plat_org/4.
savePlateau:-retractall(plat_org(_,_,_,_)),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_org(KR,KO,R,O)).
testa:-plat_org(X,Y,Z,K),write(X),nl,write(Y),nl,write(Z),nl,write(K).
%arbre [racine,[fils1...],[fils2...]]
createArbre(A):-savePlateau,findall((X,Y,Z,K),plat_org(X,Y,Z,K),A).

test(K,[],[]).
test(K,[(A,B,C,D)|H],[X]):-test([(A,B,C,D)|K],H,[(A,B,C,D)|R]).


test2(B):-createArbre(J),possibleMovesRouge(M),test(J,M,R),write(R).
%HEURISTIQUE METHODE MINMAX
*/