
/*plateau([['a1(double)','a2(triple)','a3(simple)','a4(double)','a5(double)','a6(triple)'],['b1(double)','b2(simple)','b3(triple)','b4(simple)','b5(triple)','b6(simple)'],['c1(simple)','c2(triple)','c3(double)','c4(triple)','c5(simple)','c6(double)'],['d1(triple)','d2(simple)','d3(double)','d4(simple)','d5(triple)','d6(double)'],['e1(double)','e2(triple)','e3(simple)','e4(triple)','e5(simple)','e6(triple)'],['f1(double)','f2(simple)','f3(triple)','f4(double)','f5(double)','f6(simple)']]). */

plateau([	[2,3,1,2,2,3],
			[2,1,3,1,3,1],
			[1,3,2,3,1,2],
			[3,1,2,1,3,2],
			[2,3,1,3,1,3],
			[2,1,3,2,2,1]]).



/*Toutes les cases simples. A changer pour prendre en compte l'état actuel du plateau  */

:-dynamic kalistar/2.
kalistar(0,0).

:-dynamic pions1/2.
pions1(0,0).

:-dynamic pions2/2.
pions2(0,0).

:-dynamic kalistao/2.
kalistao(0,0). 


/*Les types de cases (double, simple, triple) sont gérés par des couleurs */ 
afficher_pion(X,L,H):-X =:= 1,estpion1(L,H),ansi_format([bg(yellow),fg(black)], 'SR ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estpion2(L,H),ansi_format([bg(yellow),fg(white)], 'SO ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaR(L,H),ansi_format([bg(yellow),fg(black)], 'KR ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaO(L,H),ansi_format([bg(yellow),fg(white)], 'KO ',[world]),!.
afficher_pion(X,_,_):-X =:= 1,ansi_format([bg(yellow),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estpion1(L,H),ansi_format([bg(magenta),fg(black)], 'SR ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estpion2(L,H),ansi_format([bg(magenta),fg(white)], 'SO ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaR(L,H),ansi_format([bg(magenta),fg(black)], 'KR ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaO(L,H),ansi_format([bg(magenta),fg(white)], 'KO ',[world]),!.
afficher_pion(X,_,_):-X =:= 2,ansi_format([bg(magenta),fg(white)], '   ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estpion1(L,H),ansi_format([bg(blue),fg(black)], 'SR ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estpion2(L,H),ansi_format([bg(blue),fg(white)], 'SO ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaR(L,H),ansi_format([bg(blue),fg(black)], 'KR ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaO(L,H),ansi_format([bg(magenta),fg(white)], 'KO ',[world]),!.
afficher_pion(X,_,_):-X =:= 3,ansi_format([bg(blue),fg(white)], '   ',[world]),!.

estpion1(L,H):-pions1(L,H).
estpion2(L,H):-pions2(L,H).
estKalistaR(L,H):-kalistar(L,H). 
estKalistaO(L,H):-kalistao(L,H). 

afficher_liste([],_,_).
afficher_liste([X|L],LARGEUR,HAUTEUR) :- afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste(L,LARGEUR1,HAUTEUR).

/*Affichage de la première ligne, les chiffres donnant les numéros des colonnes du tableau*/ 
afficher_coord_aux(7):-nl.
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
afficher_coord(_) :-write('  '),afficher_coord_aux(1).

/*Affichage ligne par ligne du tableau */ 
afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).


go :- initBoardRouge(_), placementReineRouge(_), placementSbireRouge(5), placementReineOcre(_), placementSbireOcre(5). 


initBoardRouge(_) :- write('Les cases simples sont jaunes, les cases double sont violettes, les cases triples sont rouges'), nl,  afficher_plat(_), nl.


afficher_plat(_):-plateau(X),afficher_coord(_),afficher_plateau(X,1).
  


placementKalistaR(_,N2):- N2<5,write('placement impossible'),!.
/*La Kalista rouge est la premiere pièce placée du jeu, donc on ne cherche pas à voir si une autre pièce est déjà là */ 
placementKalistaR(N1,N2):-N2>4,assert(kalistar(N1,N2)),write('Kalista rouge placee'),nl,!. 

  
placementReineRouge(_)  :-  write('Joueur rouge: a quelle colonne placez vous la Kalista?'), nl, read(N1), write('Et a quelle ligne?'), read(N2), placementKalistaR(N1,N2),afficher_plat(_). 


placementSbireR(_,B):-B<5,write('placement impossible'),!.
placementSbireR(A,B):-B>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(_). 
placementSbireR(A,B):-B>4,libre(A,B),assert(pions1(A,B)),write('sbire place'),nl,!. 

choisir_sbire_rouge(_) :- write('A quelle colonne placer un sbire rouge?'),nl,read(N1),write('Et a quelle ligne?'), read(N2), placementSbireR(N1,N2), afficher_plat(_). 

placementSbireRouge(0) :- afficher_plat(_). 
placementSbireRouge(N) :- write('Joueur rouge: veuillez entrer un sbire'), N>0, N1 is N-1 ,nl, afficher_plat(_), nl, choisir_sbire_rouge(_), placementSbireRouge(N1). 
/*Placement de la kalista ocre */
placementKalistaO(_,N2):- N2>2, write('placement impossible'), !.
placementKalistaO(N1,N2):-N2<3,occupe(N1,N2),write('place occupee veuillez essayer a nouveau'),nl,placementReineOcre(_). 
placementKalistaO(N1,N2):-N2<3,libre(N1,N2),assert(kalistao(N1,N2)),write('kalista ocre place'),nl,!. 

placementReineOcre(_)  :-  write('Joueur ocre: a quelle colonne placez vous la Kalista?'), nl, read(N1), write('Et a quelle ligne?'), read(N2), placementKalistaO(N1,N2),afficher_plat(_). 

/*placement des sbires ocres */ 
placementSbireO(_,B):-B>2,write('placement impossible'),!.
placementSbireO(A,B):-B<3,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_ocre(_). 
placementSbireO(A,B):-B<3,libre(A,B),assert(pions2(A,B)),write('sbire place'),nl,!. 

choisir_sbire_ocre(_) :- write('A quelle colonne placer un sbire ocre?'),nl,read(N1),write('Et a quelle ligne?'), read(N2), placementSbireO(N1,N2), afficher_plat(_). 

placementSbireOcre(0) :- afficher_plat(_). 
placementSbireOcre(N) :- write('Joueur ocre: veuillez entrer un sbire'), N>0, N1 is N-1 ,nl, afficher_plat(_), nl, choisir_sbire_ocre(_), placementSbireOcre(N1). 

/*gestion des remplacements */ 
estOK(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7 .
libre(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),not(pions1(LARGEUR,HAUTEUR)),not(pions2(LARGEUR,HAUTEUR)),not(kalistar(LARGEUR,HAUTEUR)),not(kalistao(LARGEUR,HAUTEUR)).
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),pions1(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),kalistar(LARGEUR,HAUTEUR),!. 
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),pions2(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),kalistao(LARGEUR,HAUTEUR),!. 



















