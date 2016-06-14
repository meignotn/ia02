/* IA02 jeu de khan */

%Plateau de jeu les chiffre representent les type de case
plateau([	[2,3,1,2,2,3],
			[2,1,3,1,3,1],
			[1,3,2,3,1,2],
			[3,1,2,1,3,2],
			[2,3,1,3,1,3],
			[2,1,3,2,2,1]]).

%les Sbire et Kalista
%kalista rouge
:-dynamic kalistar/2.
%sbires rouge
:-dynamic sbireR/2.
%sbires ocre
:-dynamic sbireO/2.
%kalista ocre
:-dynamic kalistao/2.
%khan
:-dynamic khan/2.



%fin de partie
termine:-not(kalistao(_,_)).
termine:-not(kalistar(_,_)).

%victoire
victoireRouge:-termine,kalistar(_,_).
victoireOcre:-termine,kalistao(_,_).

%affichageDuPlateau	
afficher_liste([],_,_).
afficher_liste([_|L],LARGEUR,HAUTEUR) :-format_afficher_liste(LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste(L,LARGEUR1,HAUTEUR).

format_afficher_liste(LARGEUR,HAUTEUR):-khan(LARGEUR,HAUTEUR),estCase1(LARGEUR,HAUTEUR),ansi_format([bg(cyan),fg(white)], '/',[world]),afficher_pion(1,LARGEUR,HAUTEUR),ansi_format([bg(cyan),fg(white)], '\\',[world]).
format_afficher_liste(LARGEUR,HAUTEUR):-khan(LARGEUR,HAUTEUR),estCase2(LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], '/',[world]),afficher_pion(2,LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], '\\',[world]).
format_afficher_liste(LARGEUR,HAUTEUR):-khan(LARGEUR,HAUTEUR),estCase3(LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)] , '/',[world]),afficher_pion(3,LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], '\\',[world]).
format_afficher_liste(LARGEUR,HAUTEUR):-estCase1(LARGEUR,HAUTEUR),ansi_format([bg(cyan),fg(white)], ' ',[world]),afficher_pion(1,LARGEUR,HAUTEUR),ansi_format([bg(cyan),fg(white)], ' ',[world]).
format_afficher_liste(LARGEUR,HAUTEUR):-estCase2(LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], ' ',[world]),afficher_pion(2,LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], ' ',[world]).
format_afficher_liste(LARGEUR,HAUTEUR):-estCase3(LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], ' ',[world]),afficher_pion(3,LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], ' ',[world]).

afficher_coord_aux(7):-nl.
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
afficher_coord(_):-write('  '),afficher_coord_aux(1).

afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).

afficher_plat(_):-nl,plateau(X2),afficher_coord(_),afficher_plateau(X2,1),!.


/*affichage des case du plateaux cyan=1 bleu =2 noir =3*/
afficher_pion(X,L,H):-X =:= 1,estSbireRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], 'x',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estSbireOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], 'o',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], 'K',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], 'K',[world]),!.
afficher_pion(X,_,_):-X =:= 1,ansi_format([bg(cyan),fg(white)], ' ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireRouge(L,H),ansi_format([bold,bg(blue),fg(red)], 'x',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireOcre(L,H),ansi_format([bold,bg(blue),fg(white)], 'o',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaRouge(L,H),ansi_format([bold,bg(blue),fg(red)], 'K',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaOcre(L,H),ansi_format([bold,bg(blue),fg(white)], 'K',[world]),!.
afficher_pion(X,_,_):-X =:= 2,ansi_format([bg(blue),fg(white)], ' ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireRouge(L,H),ansi_format([bold,bg(black),fg(red)], 'x',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireOcre(L,H),ansi_format([bold,bg(black),fg(white)], 'o',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaRouge(L,H),ansi_format([bold,bg(black),fg(red)], 'K',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaOcre(L,H),ansi_format([bold,bg(black),fg(white)], 'K',[world]),!.
afficher_pion(X,_,_):-X =:= 3,ansi_format([bg(black),fg(white)], ' ',[world]),!.

/*affichage des case du plateau pour un deplacement possible cyan=1 bleu =2 noir =3 vert=prise jaune=case libre*/
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(blue),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(blue),fg(magenta)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], 'x',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], 'o',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], 'K',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], 'K',[world]),!.

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

%ChoixDesPieces 

%choix de N sbire rouge
choix_sbire_rouge(0,_):-afficher_plat(_).
choix_sbire_rouge(N,M):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_sbire_rouge(M),choix_sbire_rouge(N1,M).

choix_sbire_ocre(0,_):-afficher_plat(_).
choix_sbire_ocre(N,M):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_sbire_ocre(M),choix_sbire_ocre(N1,M).

choisir_sbire_rouge(M):-write('Sbire rouge: colonne:'),read(A),write('Sbire rouge: ligne:'),read(B),place_sbire_rouge_S(A,B,M).
place_sbire_rouge_S(_,B,1):-B<5,write('placement impossible'),nl,choisir_sbire_rouge(1),!.
place_sbire_rouge_S(A,B,1):-B>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(1).
place_sbire_rouge_S(A,B,1):-B>4,libre(A,B),assert(sbireR(A,B)),!.
place_sbire_rouge_S(_,B,2):-B>2,write('placement impossible'),nl,choisir_sbire_rouge(2),!.
place_sbire_rouge_S(A,B,2):-B<3,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(2).
place_sbire_rouge_S(A,B,2):-B<3,libre(A,B),assert(sbireR(A,B)),!.
place_sbire_rouge_S(A,_,3):-A>2,write('placement impossible'),nl,choisir_sbire_rouge(3),!.
place_sbire_rouge_S(A,B,3):-A<3,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(3).
place_sbire_rouge_S(A,B,3):-A<3,libre(A,B),assert(sbireR(A,B)),!.
place_sbire_rouge_S(A,_,4):-A<5,write('placement impossible'),nl,choisir_sbire_rouge(4),!.
place_sbire_rouge_S(A,B,4):-A>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(4).
place_sbire_rouge_S(A,B,4):-A>4,libre(A,B),assert(sbireR(A,B)),!.

choisir_sbire_ocre(M):-write('Sbire ocre: colonne:'),read(A),write('Sbire ocre: ligne:'),read(B),place_sbire_ocre_S(A,B,M).
place_sbire_ocre_S(_,B,2):-B<5,write('placement impossible'),nl,choisir_sbire_ocre(1),!.
place_sbire_ocre_S(A,B,2):-B>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_ocre(1).
place_sbire_ocre_S(A,B,2):-B>4,libre(A,B),assert(sbireO(A,B)),!.
place_sbire_ocre_S(_,B,1):-B>2,write('placement impossible'),nl,choisir_sbire_ocre(2),!.
place_sbire_ocre_S(A,B,1):-B<3,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_ocre(2).
place_sbire_ocre_S(A,B,1):-B<3,libre(A,B),assert(sbireO(A,B)),!.
place_sbire_ocre_S(A,_,4):-A>2,write('placement impossible'),nl,choisir_sbire_ocre(4),!.
place_sbire_ocre_S(A,B,4):-A<3,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_ocre(4).
place_sbire_ocre_S(A,B,4):-A<3,libre(A,B),assert(sbireO(A,B)),!.
place_sbire_ocre_S(A,_,3):-A<5,write('placement impossible'),nl,choisir_sbire_ocre(3),!.
place_sbire_ocre_S(A,B,3):-A>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_ocre(3).
place_sbire_ocre_S(A,B,3):-A>4,libre(A,B),assert(sbireO(A,B)),!.


choisir_kalista_rouge(M):-write('Kalista rouge: colonne:'),read(A),write('Kalista rouge: ligne:'),read(B),place_kalista_rouge(A,B,M).
place_kalista_rouge(_,B,1):-B<5,write('placement impossible'),nl,choisir_kalista_rouge(1),!.
place_kalista_rouge(A,B,1):-B>4,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.
place_kalista_rouge(_,B,2):-B>2,write('placement impossible'),nl,choisir_kalista_rouge(2),!.
place_kalista_rouge(A,B,2):-B<3,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.
place_kalista_rouge(A,_,3):-A>2,write('placement impossible'),nl,choisir_kalista_rouge(3),!.
place_kalista_rouge(A,B,3):-A<3,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.
place_kalista_rouge(A,_,4):-A<5,write('placement impossible'),nl,choisir_kalista_rouge(4),!.
place_kalista_rouge(A,B,4):-A>4,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.


choisir_kalista_ocre(M):-write('Kalista ocre: colonne:'),read(A),write('Kalista ocre: ligne:'),read(B),place_kalista_ocre(A,B,M).
place_kalista_ocre(_,B,2):-B<5,write('placement impossible'),nl,choisir_kalista_ocre(1),!.
place_kalista_ocre(A,B,2):-B>4,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.
place_kalista_ocre(_,B,1):-B>2,write('placement impossible'),nl,choisir_kalista_ocre(2),!.
place_kalista_ocre(A,B,1):-B<3,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.
place_kalista_ocre(A,_,4):-A>2,write('placement impossible'),nl,choisir_kalista_ocre(4),!.
place_kalista_ocre(A,B,4):-A<3,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.
place_kalista_ocre(A,_,3):-A<5,write('placement impossible'),nl,choisir_kalista_ocre(3),!.
place_kalista_ocre(A,B,3):-A>4,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.

%place un sbire
place_sbire_rouge(A,B):-findall((A,B),sbireR(A,B),M),length(M,R),R<5,assert(sbireR(A,B)),retractall(khan(_,_)),assert(khan(A,B)).
place_sbire_ocre(A,B):-findall((A,B),sbireO(A,B),M),length(M,R),R<5,assert(sbireO(A,B)),retractall(khan(_,_)),assert(khan(A,B)).

%CaseOccupeOuLibre?
libre(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),not(estSbireRouge(LARGEUR,HAUTEUR)),not(estSbireOcre(LARGEUR,HAUTEUR)),not(estKalistaRouge(LARGEUR,HAUTEUR)),not(estKalistaOcre(LARGEUR,HAUTEUR)).
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estSbireRouge(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estSbireOcre(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estKalistaRouge(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estKalistaOcre(LARGEUR,HAUTEUR),!.
estOK(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7 .

caseLibre(M):-caseLibreAux(1,1,M),!.

caseLibreAux(_,B,[]):-B==7,!.
caseLibreAux(A,B,M):-A==7,A1 is 1,B1 is B+1,caseLibreAux(A1,B1,M).
caseLibreAux(A,B,[(A,B)|M]):-libre(A,B),A1 is A+1,caseLibreAux(A1,B,M).
caseLibreAux(A,B,[(A,B)|M]):-A1 is A+1,caseLibreAux(A1,B,M).

%utilise pour les deplacement permet de verifier le respect du khan
respecteKhan(A,B):-estCase1(A,B),khan(C,D),estCase1(C,D).
respecteKhan(A,B):-estCase2(A,B),khan(C,D),estCase2(C,D).
respecteKhan(A,B):-estCase3(A,B),khan(C,D),estCase3(C,D).
respecteKhan(_,_):-not(khan(_,_)).

%estPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 
estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),respecteKhan(ORGL,ORGH),estPossibleRouge(ORGL,ORGH,NEWL,NEWH).
estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estOcre(ORGL,ORGH),respecteKhan(ORGL,ORGH),estPossibleOcre(ORGL,ORGH,NEWL,NEWH).

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

%mouvement 
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireRouge(ORGL,ORGH),moveSbireRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireOcre(ORGL,ORGH),moveSbireOcre(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaRouge(ORGL,ORGH),moveKalistaRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaOcre(ORGL,ORGH),moveKalistaOcre(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.

moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Deplacement du sbire rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								assert(sbireR(NEWL,NEWH)).
								
								
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise d'un sbire ocre par un sbire rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(sbireR(NEWL,NEWH)).
								
								
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise de la kalista ocre par le sbire rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(sbireR(NEWL,NEWH))
								.

moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Deplacement du sbire ocre sur une case libre */ 
								libre(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								assert(sbireO(NEWL,NEWH)).
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire rouge par un sbire ocre */ 
								estSbireRouge(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								retract(sbireR(NEWL,NEWH)),
								assert(sbireO(NEWL,NEWH)).
								
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par le sbire ocre */ 
								estKalistaRouge(NEWL,NEWH),
								retract(sbireO(ORGL,ORGH)),
								retract(kalistar(NEWL,NEWH)),
								assert(sbireO(NEWL,NEWH))
								.

moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Deplacement de la kalista rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								assert(kalistar(NEWL,NEWH)).
								
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire ocre par la kalista rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(kalistar(NEWL,NEWH)).
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista ocre par la kalista rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(kalistar(NEWL,NEWH))
								. 
								
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
								
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par la kalista ocre */ 
								estKalistaRouge(NEWL,NEWH),
								retract(kalistao(ORGL,ORGH)),
								retract(kalistar(NEWL,NEWH)),
								assert(kalistao(NEWL,NEWH))
								. 



%choix_muvement
choix_moveRouge:-nl,aucunMouvementRouge,write('Aucun Mouvement Possible en respectant le Khan , entrez des coordonnée pour placer un sbire, ou selectionnez un sbire pour le deplacer'),nl,retractall(khan(_,_)),write('colonne du pion Rouge a deplacer ou placer :'),read(A),nl,write('ligne du pion rouge a deplacer ou placer:'),read(B),choix_moveRougeAux(A,B).
choix_moveRouge:-nl,write('colonne du pion Rouge a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveRougeAux(A,B).

choix_moveRougeAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveRouge.
choix_moveRougeAux(A,B):-estOK(A,B),libre(A,B),possibleMovesRougeKhan(M),length(M,L),L==0,place_sbire_rouge(A,B),afficher_plat(_).
choix_moveRougeAux(A,B):-estOK(A,B),not(estRouge(A,B)),write('Case vide ou pion Ocre'),choix_moveRouge.
choix_moveRougeAux(A,B):-coupPossible(A,B,M),length(M,C),C==0,write('Aucun deplacement possible depuis cette Piece'),choix_moveRouge.
choix_moveRougeAux(A,B):-nl,estOK(A,B),estRouge(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),choix_moveRougeAux2(A,B,C,D).
choix_moveRougeAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveRougeAux(A,B).
choix_moveRougeAux2(A,B,C,D):-estOK(C,	D),not(estPossible(A,B,C,D)),write('Deplacement impossible'),choix_moveRouge.
choix_moveRougeAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).

choix_moveOcre:-nl,aucunMouvementOcre,write('Aucun Mouvement Possible en respectant le Khan , entrez des coordonnée pour placer un sbire, ou selectionnez un sbire pour le deplacer'),nl,retractall(khan(_,_)),write('colonne du pion Ocre a deplacer ou placer :'),read(A),nl,write('ligne du pion Ocre a deplacer ou placer:'),read(B),choix_moveRougeAux(A,B).
choix_moveOcre:-nl,write('colonne du pion Ocre a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveOcreAux(A,B).
choix_moveOcreAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveOcre.
choix_moveOcreAux(A,B):-estOK(A,B),libre(A,B),possibleMovesOcreKhan(M),length(M,L),L==0,place_sbire_ocre(A,B),afficher_plat(_).
choix_moveOcreAux(A,B):-estOK(A,B),not(estOcre(A,B)),write('Case vide ou pion Rouge'),choix_moveOcre.
choix_moveOcreAux(A,B):-coupPossible(A,B,M),length(M,C),C==0,write('Aucun deplacement possible depuis cette Piece'),choix_moveOcre.

choix_moveOcreAux(A,B):-nl,estOK(A,B),estOcre(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),choix_moveOcreAux2(A,B,C,D).
choix_moveOcreAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveOcreAux(A,B).
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),not(estPossible(A,B,C,D)),write('Deplacement impossible'),choix_moveOcre.
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).


/*affichage des coups possible pour une pièce */ 
afficherCoupPossible(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
afficherCoupPossible(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
afficherCoupPossible(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.

%Coup Possible pour une piece
coupPossible(L,H,M):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,M),!. %ERREUR SANS !
coupPossible(L,H,M):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,M),!.
coupPossible(L,H,M):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,M),!.

coupPossibleAux(L,H,_,Y,[]):-estCase1(L,H),Y=:=H+2.
coupPossibleAux(L,H,X,Y,A):-estCase1(L,H),X=:=L+2,Y1 is Y+1,X1 is L-1,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,_,Y,[]):-estCase2(L,H),Y=:=H+3.
coupPossibleAux(L,H,X,Y,A):-estCase2(L,H),X=:=L+3,Y1 is Y+1,X1 is L-2,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,_,Y,[]):-estCase3(L,H),Y=:=H+4.
coupPossibleAux(L,H,X,Y,A):-estCase3(L,H),X=:=L+4,Y1 is Y+1,X1 is L-3,coupPossibleAux(L,H,X1,Y1,A).
coupPossibleAux(L,H,X,Y,[(X,Y)|A]):-X1 is X+1,estPossible(L,H,X,Y),coupPossibleAux(L,H,X1,Y,A).
coupPossibleAux(L,H,X,Y,A):-X1 is X+1,coupPossibleAux(L,H,X1,Y,A).

%fonction pour affichage des coup possible
affichage_coup_possible(_,C,A,B):-nl,afficher_coord(_),plateau(X),afficher_coup_possibleAux(X,1,C,A,B).
afficher_coup_possibleAux([],_,_,_,_).
afficher_coup_possibleAux([X|L],HAUTEUR,C,A,B):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste_coup_possible(X,1,HAUTEUR,C,A,B),nl,afficher_coup_possibleAux(L,HAUTEUR1,C,A,B).
afficher_liste_coup_possible([],_,_,_,_,_).
afficher_liste_coup_possible([_|L],LARGEUR,HAUTEUR,C,A,B) :- member((LARGEUR,HAUTEUR),C),format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).
afficher_liste_coup_possible([_|L],LARGEUR,HAUTEUR,C,A,B) :- format_afficher_liste(LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-khan(LARGEUR,HAUTEUR),estCase1(LARGEUR,HAUTEUR),ansi_format([bg(cyan)], '/',[world]),afficher_pion_coup_possible(1,LARGEUR,HAUTEUR,A,B),ansi_format([bg(cyan)], '\\',[world]).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-khan(LARGEUR,HAUTEUR),estCase2(LARGEUR,HAUTEUR),ansi_format([bg(blue)], '/',[world]),afficher_pion_coup_possible(2,LARGEUR,HAUTEUR,A,B),ansi_format([bg(blue)], '\\',[world]).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-khan(LARGEUR,HAUTEUR),estCase3(LARGEUR,HAUTEUR),ansi_format([bg(black)] , '/',[world]),afficher_pion_coup_possible(3,LARGEUR,HAUTEUR,A,B),ansi_format([bg(black)], '\\',[world]).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-estCase1(LARGEUR,HAUTEUR),ansi_format([bg(cyan),fg(white)], ' ',[world]),afficher_pion_coup_possible(1,LARGEUR,HAUTEUR,A,B),ansi_format([bg(cyan),fg(white)], ' ',[world]).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-estCase2(LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], ' ',[world]),afficher_pion_coup_possible(2,LARGEUR,HAUTEUR,A,B),ansi_format([bg(blue),fg(white)], ' ',[world]).
format_afficher_liste_coup_possible(LARGEUR,HAUTEUR,A,B):-estCase3(LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], ' ',[world]),afficher_pion_coup_possible(3,LARGEUR,HAUTEUR,A,B),ansi_format([bg(black),fg(white)], ' ',[world]).


%lancementJeu
initBoard(_):-viderPlateau,write('Les cases bleu clair correspondent aux cases simples, les cases bleu fonce aux cases doubles, les cases noires correspondent aux cases triples'),nl,
			afficher_plat(_),
			write('choix du camp Rouge : 1 pour ligne 5,6 , 2 pour ligne 1,2 , 3 pour colonne 1,2 , 4 pour colonne 5,6 :'),
			camp(M),
			nl,write('Joueur Rouge 1 pour IA 0 pour Humain :'),
			choixJ1(A),
			nl,write('Joueur Ocre 1 pour IA 0 pour Humain :'),
			choixJ2(B),
			placement(A,B,M),
			write('difficulte Rouge'),
			difficulte(C),
			write('difficulte Ocre'),
			difficulte(D),
			write('debut de la partie'),
			jeu(A,B,C,D). 

%choix difficulté
difficulte(B):-read(A),difficulteAux(A,B).
difficulteAux(1,1).
difficulteAux(2,2).
difficulteAux(_,A):-difficulte(A).


%choix camp rouge
camp(B):-read(A),campAux(A,B).
campAux(1,1).
campAux(2,2).
campAux(3,3).
campAux(4,4).
campAux(_,A):-camp(A).

%lancementJeu
jeu(0,0,_,_):-tourRouge(0,0,0,0).
jeu(0,1,_,A):-tourRouge(0,1,0,A).
jeu(1,0,A,_):-tourRougeIA(1,0,A,_).
jeu(1,1,A,B):-tourRougeIA(1,1,A,B).

%choix des IA ou non
choixJ1(B):-read(A),choixAuxJ1(A,B).
choixAuxJ1(1,1).
choixAuxJ1(0,0).
choixAuxJ1(_,A):-choixJ1(A).
choixJ2(B):-read(A),choixAuxJ2(A,B).
choixAuxJ2(1,1).
choixAuxJ2(0,0).
choixAuxJ2(_,A):-choixJ2(A).

%placement des Piece en fonction des Joueurs
placement(1,1,1):-assert(sbireR(2,5)),
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
				afficher_plat(_).

placement(1,1,2):-assert(sbireO(2,5)),
								assert(sbireO(3,5)),
								assert(sbireO(4,6)),
								assert(sbireO(6,6)),
								assert(sbireO(1,5)),
								assert(kalistao(2,6)),
								assert(sbireR(1,2)),
								assert(sbireR(2,2)),
								assert(sbireR(3,2)),
								assert(sbireR(4,1)),
								assert(sbireR(4,2)),
								assert(kalistar(6,1)),
								afficher_plat(_).
placement(1,1,3):-assert(sbireR(2,5)),
								assert(sbireR(1,1)),
								assert(sbireR(1,2)),
								assert(sbireR(1,3)),
								assert(sbireR(1,4)),
								assert(kalistar(1,5)),
								assert(sbireO(5,5)),
								assert(sbireO(5,4)),
								assert(sbireO(5,2)),
								assert(sbireO(5,6)),
								assert(sbireO(6,6)),
								assert(kalistao(6,5)),
								afficher_plat(_).
placement(1,1,4):-assert(sbireO(2,5)),
								assert(sbireO(1,1)),
								assert(sbireO(1,2)),
								assert(sbireO(1,3)),
								assert(sbireO(1,4)),
								assert(kalistao(1,5)),
								assert(sbireR(5,5)),
								assert(sbireR(5,4)),
								assert(sbireR(5,2)),
								assert(sbireR(5,6)),
								assert(sbireR(6,6)),
								assert(kalistar(6,5)),
								afficher_plat(_).
placement(0,0,M):-nl,write('placement kalista rouge'),choisir_kalista_rouge(M),
			write('placement sbires rouge'),choix_sbire_rouge(5,M),
			write('placement kalista ocre'),choisir_kalista_ocre(M),
			write('placement sbires ocre'),choix_sbire_ocre(5,M).
placement(1,0,1):-assert(sbireR(2,5)),
				assert(sbireR(3,5)),
				assert(sbireR(4,6)),
				assert(sbireR(6,6)),
				assert(sbireR(1,5)),
				assert(kalistar(2,6)),
			write('placement kalista ocre'),choisir_kalista_ocre(1,1),
			write('placement sbires ocre'),choix_sbire_ocre(5,1).
placement(1,0,2):-assert(sbireR(1,2)),
								assert(sbireR(2,2)),
								assert(sbireR(3,2)),
								assert(sbireR(4,1)),
								assert(sbireR(4,2)),
								assert(kalistar(6,1)),
			write('placement kalista ocre'),choisir_kalista_ocre(2,2),
			write('placement sbires ocre'),choix_sbire_ocre(5,2).
placement(1,0,3):-assert(sbireR(2,5)),
								assert(sbireR(1,1)),
								assert(sbireR(1,2)),
								assert(sbireR(1,3)),
								assert(sbireR(1,4)),
								assert(kalistar(1,5)),
			write('placement kalista ocre'),choisir_kalista_ocre(3),
			write('placement sbires ocre'),choix_sbire_ocre(5,3).
placement(1,0,4):-assert(sbireR(5,5)),
								assert(sbireR(5,4)),
								assert(sbireR(5,2)),
								assert(sbireR(5,6)),
								assert(sbireR(6,6)),
								assert(kalistar(6,5)),
			write('placement kalista ocre'),choisir_kalista_ocre(4),
			write('placement sbires ocre'),choix_sbire_ocre(5,4).

placement(0,1,1):-
			write('placement kalista rouge'),choisir_kalista_rouge(1),
			write('placement sbires rouge'),choix_sbire_rouge(5,1),assert(sbireO(1,2)),
				assert(sbireO(2,2)),
				assert(sbireO(3,2)),
				assert(sbireO(4,1)),
				assert(sbireO(4,2)),
				assert(kalistao(6,1)).
placement(0,1,2):-
			write('placement kalista rouge'),choisir_kalista_rouge(2),
			write('placement sbires rouge'),choix_sbire_rouge(5,2),assert(sbireO(2,5)),
								assert(sbireO(3,5)),
								assert(sbireO(4,6)),
								assert(sbireO(6,6)),
								assert(sbireO(1,5)),
								assert(kalistao(2,6)).
placement(0,1,3):-
			write('placement kalista rouge'),choisir_kalista_rouge(3),
			write('placement sbires rouge'),choix_sbire_rouge(5,3),assert(sbireO(5,5)),
								assert(sbireO(5,4)),
								assert(sbireO(5,2)),
								assert(sbireO(5,6)),
								assert(sbireO(6,6)),
								assert(kalistao(6,5)).
placement(0,1,4):-
			write('placement kalista rouge'),choisir_kalista_rouge(4),
			write('placement sbires rouge'),choix_sbire_rouge(5,4),assert(sbireO(2,5)),
								assert(sbireO(1,1)),
								assert(sbireO(1,2)),
								assert(sbireO(1,3)),
								assert(sbireO(1,4)),
								assert(kalistao(1,5)).








/* creer fausse partie pour debug initialisée comme au début d'une vraie partie */ 
viderPlateau:-retractall(sbireO(_,_)),retractall(khan(_,_)),retractall(sbireR(_,_)),retractall(kalistar(_,_)),retractall(kalistao(_,_)).
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
								write('debut de la partie'),
								tourRouge.


%trouve tout les rouges
getRouge(M):-findall((A,B),estRouge(A,B),M).
getOcre(M):-findall((A,B),estOcre(A,B),M).



%AVANT Controle KHAN
possibleMovesRougeKhan(B):-getRouge(M),possibleMovesAux(M,A),possibleMoveFormat(A,B),!.
possibleMovesOcreKhan(B):-getOcre(M),possibleMovesAux(M,A),possibleMoveFormat(A,B),!.

%APPRES echappe controle KHAN
possibleMovesPlacePion(M):-caseLibre(M).

%renvoi tout les coups possible [[(ORG,ORG),(NEW,NEW)],...]
possibleMovesRouge(E):-aucunMouvementRouge,khan(A,B),retractall(khan(_,_)),possibleMovesRougeKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).
possibleMovesRouge(E):-possibleMovesRougeKhan(E).

possibleMovesOcre(E):-aucunMouvementOcre,khan(A,B),retractall(khan(_,_)),possibleMovesOcreKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).
possibleMovesOcre(E):-possibleMovesOcreKhan(E).

%ne peut pas jouer en respectant le khan
aucunMouvementRouge:-possibleMovesRougeKhan(B),length(B,Z),Z=:=0.
aucunMouvementOcre:-possibleMovesOcreKhan(B),length(B,Z),Z=:=0.

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

%etait utilisé avec une ancienne fonction d'evaluation non retenue
nombrePrisePossibleRouge(M):-getRouge(A),nombrePrisePossibleRougeAux(A,M),!.
nombrePrisePossibleRougeAux([],0).
nombrePrisePossibleRougeAux([(A,B)|M],R):-coupPossible(A,B,C),nombrePrisePossibleRougeListeCoupPossible(C,X),nombrePrisePossibleRougeAux(M,K),R is X+K.
nombrePrisePossibleRougeListeCoupPossible([],0).
nombrePrisePossibleRougeListeCoupPossible([(A,B)|C],X1):-sbireO(A,B),nombrePrisePossibleRougeListeCoupPossible(C,X),X1 is X+2.
nombrePrisePossibleRougeListeCoupPossible([(A,B)|C],X1):-kalistao(A,B),nombrePrisePossibleRougeListeCoupPossible(C,X),X1 is X+5.

nombrePrisePossibleRougeListeCoupPossible([_|B],X):-nombrePrisePossibleRougeListeCoupPossible(B,X).

nombrePrisePossibleOcre(M):-getOcre(A),nombrePrisePossibleOcreAux(A,M),!.
nombrePrisePossibleOcreAux([],0).
nombrePrisePossibleOcreAux([(A,B)|M],R):-coupPossible(A,B,C),nombrePrisePossibleOcreListeCoupPossible(C,X),nombrePrisePossibleOcreAux(M,K),R is X+K.
nombrePrisePossibleOcreListeCoupPossible([],0).
nombrePrisePossibleOcreListeCoupPossible([(A,B)|C],X1):-sbireR(A,B),nombrePrisePossibleOcreListeCoupPossible(C,X),X1 is X+2.
nombrePrisePossibleOcreListeCoupPossible([(A,B)|C],X1):-kalistar(A,B),nombrePrisePossibleOcreListeCoupPossible(C,X),X1 is X+5.

nombrePrisePossibleOcreListeCoupPossible([_|B],X):-nombrePrisePossibleOcreListeCoupPossible(B,X).
 
%evaluation : possibilité de mouvement +1 , possiblité de mouvement adverse -1 , a gagner +infini, a perdre-infini -1 et 1000 sont les bornes inf/sup

evaluationRouge(-1):-victoireRouge.
evaluationRouge(1000):-victoireOcre.	 
evaluationRouge(B):-possibleMovesRouge(A),length(A,B),!.
evaluationOcre(B):-possibleMovesOcre(A),length(A,B),!.
evaluationOcre(1000):-victoireRouge.
evaluationOcre(-1):-victoireOcre.	 
evaluationPlacerSbire(0):-aucunMouvementRouge,aucunMouvementOcre.
evaluationPlacerSbire(10):-aucunMouvementRouge.
evaluationPlacerSbire(-10):-aucunMouvementOcre.
evaluationPlacerSbire(0).

%plateau origine permet la sauvegarde du plateau
:-dynamic plat_org/5.
:-dynamic plat_1/5.
:-dynamic plat_2/5.
:-dynamic plat_3/5.

%sauvegarde plateau seulement 4 sauvegarde possible // TODO si pas de khan sauvegarde impossible
savePlateau:-not(plat_3(_,_,_,_,_)),plat_2(_,_,_,_,_),retractall(plat_3(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_3(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
savePlateau:-not(plat_2(_,_,_,_,_)),plat_1(_,_,_,_,_),retractall(plat_2(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_2(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
savePlateau:-not(plat_1(_,_,_,_,_)),plat_org(_,_,_,_,_),retractall(plat_1(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_1(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
savePlateau:-not(plat_org(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),	assert(plat_org(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).

%retour etat precedent utilse pour revenir a l'etat precedent
assertkalistar([(A,B)]):-assert(kalistar(A,B)).
assertkalistar([]).

assertkalistao([(A,B)]):-assert(kalistao(A,B)).
assertkalistao([]).


assertkhan([]).
assertkhan([(A,B)]):-assert(khan(A,B)).

assertSbireR([]).
assertSbireR([(A,B)|C]):-assert(sbireR(A,B)),assertSbireR(C).
assertSbireO([]).
assertSbireO([(A,B)|C]):-assert(sbireO(A,B)),assertSbireO(C).

%retour etat precedent
undoMove:-plat_3(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_3(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).
undoMove:-plat_2(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_2(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).
undoMove:-plat_1(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_1(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).
undoMove:-plat_org(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_org(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).

:-dynamic save/1.
save(0).

creerListeDeListe([],[]).
creerListeDeListe([X|Q],[[X]|A]):-creerListeDeListe(Q,A).

%PERMET De creer l'arbre des coup possible de K a N  
creerArbreProfRouge(A,K,K,A):-!.
creerArbreProfRouge([[(A,B),(C,D)]],K,N,[[(A,B),(C,D)]|E]):-possibleMovesRouge(H),creerListeDeListe(H,M),iterationRouge(M,K,N,E).
creerArbreProfRouge([(A,B)],K,N,[(A,B)|E]):-possibleMovesRouge(H),creerListeDeListe(H,M),iterationRouge(M,K,N,E).
creerArbreProfRouge('root',K,N,['root'|E]):-possibleMovesRouge(H),creerListeDeListe(H,M),iterationRouge(M,K,N,E).

iterationRouge([],_,_,[]):-!.
iterationRouge([[[(A,B),(C,D)]]|Y],E,N,[G|H]):-A1 is E+1,savePlateau,move(A,B,C,D),iterationRougeAux([[(A,B),(C,D)]],A1,N,G),undoMove,iterationRouge(Y,E,N,H).
iterationRouge([[(A,B)]|Y],E,N,[G|H]):-A1 is E+1,savePlateau,place_sbire_rouge(A,B),creerArbreProfOcre([(A,B)],A1,N,G),undoMove,iterationRouge(Y,E,N,H).

iterationRougeAux([[(A,B),(C,D)]],A1,_,G):-termine,creerArbreProfOcre([[(A,B),(C,D)]],A1,A1,G).
iterationRougeAux([[(A,B),(C,D)]],A1,N,G):-creerArbreProfOcre([[(A,B),(C,D)]],A1,N,G).

creerArbreProfOcre(A,K,K,A):-!.
creerArbreProfOcre([[(A,B),(C,D)]],K,N,[[(A,B),(C,D)]|E]):-possibleMovesOcre(H),creerListeDeListe(H,M),iterationOcre(M,K,N,E).
creerArbreProfOcre([(A,B)],K,N,[(A,B)|E]):-possibleMovesOcre(H),creerListeDeListe(H,M),iterationOcre(M,K,N,E).
creerArbreProfOcre('root',K,N,['root'|E]):-possibleMovesOcre(H),creerListeDeListe(H,M),iterationOcre(M,K,N,E).

iterationOcre([],_,_,[]):-!.
iterationOcre([[[(A,B),(C,D)]]|Y],E,N,[G|H]):-A1 is E+1,savePlateau,move(A,B,C,D),iterationOcreAux([[(A,B),(C,D)]],A1,N,G),undoMove,iterationOcre(Y,E,N,H).
iterationOcre([[(A,B)]|Y],E,N,[G|H]):-A1 is E+1,savePlateau,place_sbire_ocre(A,B),creerArbreProfRouge([(A,B)],A1,N,G),undoMove,iterationOcre(Y,E,N,H).

iterationOcreAux([[(A,B),(C,D)]],A1,_,G):-termine,creerArbreProfRouge([[(A,B),(C,D)]],A1,A1,G).
iterationOcreAux([[(A,B),(C,D)]],A1,N,G):-creerArbreProfRouge([[(A,B),(C,D)]],A1,N,G).

%permet de creer l'arbre d'evaluation
creerArbreEvalRouge([],[]).
creerArbreEvalRouge(K,['root'|N]):-isroot(K),creerArbreEvalRougeAux(K,N).
creerArbreEvalRouge(K,[-1|N]):-afils(K),creerArbreEvalRougeAux(K,N).
creerArbreEvalRouge(K,[A]):-estFeuille(K),moveAndEvalRouge(K,A). %TODO EVAL
creerArbreEvalRougeAux([[(A,B),(C,D)]|Q],N):-savePlateau,move(A,B,C,D),creerArbreEvalTestRouge(Q,N),undoMove.
creerArbreEvalRougeAux([(A,B)|Q],N):-savePlateau,place_sbire_rouge(A,B),creerArbreEvalTestRouge(Q,N),undoMove.
creerArbreEvalRougeAux(['root'|Q],N):-creerArbreEvalTestOCre(Q,N).

creerArbreEvalTestRouge([],[]).
creerArbreEvalTestRouge([T|Q],[A|B]):-creerArbreEvalOcre(T,A),creerArbreEvalTestRouge(Q,B).

creerArbreEvalOcre([],[]).
creerArbreEvalOcre(K,['root'|N]):-isroot(K),creerArbreEvalOcreAux(K,N).
creerArbreEvalOcre(K,[-1|N]):-afils(K),creerArbreEvalOcreAux(K,N).
creerArbreEvalOcre(K,[A]):-estFeuille(K),moveAndEvalOcre(K,A).
creerArbreEvalOcreAux([[(A,B),(C,D)]|Q],N):-savePlateau,move(A,B,C,D),creerArbreEvalTestOCre(Q,N),undoMove.
creerArbreEvalOcreAux([(A,B)|Q],N):-savePlateau,place_sbire_ocre(A,B),creerArbreEvalTestOCre(Q,N),undoMove.
creerArbreEvalOcreAux(['root'|Q],N):-creerArbreEvalTestRouge(Q,N).

creerArbreEvalTestOCre([],[]).
creerArbreEvalTestOCre([T|Q],[A|B]):-creerArbreEvalRouge(T,A),creerArbreEvalTestOCre(Q,B).

isroot(['root'|_]).
afils(A):-is_list(A),length(A,O),O>1.
estFeuille(A):-not(afils(A)).

moveAndEvalRouge([[(A,B),(C,D)]],O):-savePlateau,move(A,B,C,D),evaluationRouge(O),undoMove.
moveAndEvalRouge([(A,B)],O):-savePlateau,place_sbire_rouge(A,B),evaluationRouge(O),undoMove.

moveAndEvalOcre([[(A,B),(C,D)]],O):-savePlateau,move(A,B,C,D),evaluationOcre(O),undoMove.
moveAndEvalOcre([(A,B)],O):-savePlateau,place_sbire_ocre(A,B),evaluationOcre(O),undoMove.


min([],R,R).
min([O|N],M,R):-O=<M,min(N,O,R).
min([O|N],M,R):-M<O,min(N,M,R).
min([O|N],R):-min(N,O,R).

minL([],R,R).
minL([[O]|N],M,R):-O=<M,minL(N,O,R).
minL([[O]|N],M,R):-M<O,minL(N,M,R).
minL([[O]|N],R):-minL(N,O,R).
maxL([],R,R).
maxL([['o']|N],M,R):-O>=M,maxL(N,O,R).
maxL([['r']|N],M,R):-O>=M,maxL(N,O,R).
maxL([[O]|N],M,R):-M>O,maxL(N,M,R).
maxL([[O]|N],R):-maxL(N,O,R).

max([],R,R).
max([O|N],M,R):-O>=M,max(N,O,R).
max([O|N],M,R):-M>O,max(N,M,R).
max([O|N],R):-max(N,O,R).

indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.


%renvoi la derniere remonté de l'arbre d'evaluation
getMove([-1|X],CPT,B):-0 is CPT mod 2,getMoveIt(X,CPT,A),min(A,B).
getMove([-1|X],CPT,B):-1 is CPT mod 2,getMoveIt(X,CPT,A),max(A,B).
getMove(['root'|X],CPT,A):-getMoveIt(X,CPT,A).
getMove([A],_,A).

getMoveIt([],_,[]).
getMoveIt([X|Q],CPT,[A|R]):-CPT1 is CPT+1,getMove(X,CPT1,A),getMoveIt(Q,CPT,R).

%renvoi le meilleur coup possible DIF represente la profondeur de recherche , elle doit etre inferieur a 4 car on ne peut pas sauvegarder plus de 4 etat du plateau
bestMoveRouge(DIF,MOVE):-nl,write('creation arbre de jeu'),creerArbreProfRouge('root',0,DIF,A),nl,write('creation arbre value'),creerArbreEvalRouge(A,B),write('recherche du meilleur coup'),nl,getMove(B,0,R),min(R,M),indexOf(R,M,T),T1 is T+1,nth0(T1,A,P),write('meilleur Coup Trouve'),bestMoveFormat(P,MOVE).
bestMoveOcre(DIF,MOVE):-nl,write('creation arbre de jeu'),creerArbreProfOcre('root',0,DIF,A),nl,write('creation arbre value'),creerArbreEvalOcre(A,B),write('recherche du meilleur coup'),nl,getMove(B,0,R),min(R,M),indexOf(R,M,T),T1 is T+1,nth0(T1,A,P),write('meilleur Coup Trouve'),bestMoveFormat(P,MOVE).

bestMoveFormat([[ (A, B), (C, D)]|_],[ (A, B), (C, D)]).
bestMoveFormat([ (A, B)|_], (A, B)).

doMoveRouge([ (A, B), (C, D)]):-move(A,B,C,D).
doMoveRouge( (A, B)):-place_sbire_rouge(A,B).
doMoveOcre([ (A, B), (C, D)]):-move(A,B,C,D).
doMoveOcre((A, B)):-place_sbire_ocre(A,B).

%action de jeu
tourRougeIA(1,1,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
tourRougeIA(1,1,DIFR,DIFO):-bestMoveRouge(DIFR,MOVE),doMoveRouge(MOVE),afficher_plat(_),tourOcreIA(1,1,DIFR,DIFO).
tourRougeIA(1,0,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
tourRougeIA(1,0,DIF,_):-bestMoveRouge(DIF,MOVE),doMoveRouge(MOVE),afficher_plat(_),tourOcre(1,0,DIF,_).

tourOcreIA(1,1,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
tourOcreIA(1,1,DIFR,DIFO):-bestMoveOcre(DIFO,MOVE),doMoveRouge(MOVE),afficher_plat(_),tourRougeIA(1,1,DIFR,DIFO).
tourOcreIA(0,1,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
tourOcreIA(0,1,_,DIF):-bestMoveOcre(DIF,MOVE),doMoveRouge(MOVE),afficher_plat(_),tourRouge(0,1,_,DIF).

tourRouge(0,0,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
tourRouge(0,0,_,_):-afficher_plat(_),choix_moveRouge,tourOcre.
tourRouge(0,1,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
tourRouge(0,1,_,DIF):-afficher_plat(_),choix_moveRouge,tourOcreIA(0,1,_,DIF).

tourOcre(0,0,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
tourOcre(0,0,_,_):-afficher_plat(_),choix_moveOcre,tourRouge.
tourOcre(1,0,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
tourOcre(1,0,DIF,_):-afficher_plat(_),choix_moveOcre,tourRougeIA(1,0,DIF,_).