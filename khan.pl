/* IA02 jeu de khan */


plateau([	[2,3,1,2,2,3],
			[2,1,3,1,3,1],
			[1,3,2,3,1,2],
			[3,1,2,1,3,2],
			[2,3,1,3,1,3],
			[2,1,3,2,2,1]]).
<<<<<<< HEAD
			
=======

>>>>>>> origin/master
%kalista rouge
:-dynamic kalistar/2.
%sbires rouge
:-dynamic sbireR/2.
%sbires ocre
:-dynamic sbireO/2.
%kalista ocre
:-dynamic kalistao/2.
<<<<<<< HEAD
%Kalista rouge subissant les effets du khan (verte)
:-dynamic kalistav/2.
%Sbire rouge subissant les effets du khan (vert)
:- dynamic sbireV/2.
%Kalista ocre subissant les effets du khan (magenta)
:-dynamic kalistam/2.
%Sbire ocre subissant les effets du khan (magenta)
:- dynamic sbireM/2.  
=======
%khan
:-dynamic khan/2.
>>>>>>> origin/master


%fin de partie
<<<<<<< HEAD
termine(_):-not(kalistao(_,_)),not(kalistam(_,_)).
termine(_):-not(kalistar(_,_)),not(kalistav(_,_)).
=======
termine:-not(kalistao(_,_)).
termine:-not(kalistar(_,_)).
>>>>>>> origin/master

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
estSbireVert(L,H):-sbireV(L,H). 
estKalistaVerte(L,H):-kalistav(L,H). 
estVert(L,H):-estSbireVert(L,H).
estVert(L,H):-estKalistaVerte(L,H). 
estSbireMagenta(L,H):-sbireM(L,H). 
estKalistaMagenta(L,H):-kalistam(L,H). 
estMagenta(L,H):-estSbireMagenta(L,H).
estMagenta(L,H):-estKalistaMagenta(L,H).

estVertOuRouge(L,H):-estVert(L,H). 
estVertOuRouge(L,H):-estRouge(L,H). 

estOcreOuMagenta(L,H):-estOcre(L,H). 
estOcreOuMagenta(L,H):-estMagenta(L,H). 


/*Il ne faut pas oublier dans ces tests qu'un numero indique si on a une case simple, double ou triple dans le programme, ensuite traduit par une couleur lors de l'affichage */ 
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
<<<<<<< HEAD
afficher_pion(X,L,H):-X =:= 1,estSbireRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estSbireOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaOcre(L,H),ansi_format([bold,bg(cyan),fg(white)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estSbireVert(L,H),ansi_format([bold,bg(cyan),fg(green)],' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaVerte(L,H),ansi_format([bold,bg(cyan),fg(green)],' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estSbireMagenta(L,H),ansi_format([bold,bg(cyan),fg(magenta)],' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 1,estKalistaMagenta(L,H),ansi_format([bold,bg(cyan),fg(magenta)],' K ',[world]),!.
afficher_pion(X,_,_):-X =:= 1,ansi_format([bg(cyan),fg(white)], '   ',[world]),!.

afficher_pion(X,L,H):-X =:= 2,estSbireRouge(L,H),ansi_format([bold,bg(blue),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireOcre(L,H),ansi_format([bold,bg(blue),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaRouge(L,H),ansi_format([bold,bg(blue),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaOcre(L,H),ansi_format([bold,bg(blue),fg(white)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireVert(L,H),ansi_format([bold,bg(blue),fg(green)],' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaVerte(L,H),ansi_format([bold,bg(blue),fg(green)],' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estSbireMagenta(L,H),ansi_format([bold,bg(blue),fg(magenta)],' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 2,estKalistaMagenta(L,H),ansi_format([bold,bg(blue),fg(magenta)],' K ',[world]),!.
afficher_pion(X,_,_):-X =:= 2,ansi_format([bg(blue),fg(white)], '   ',[world]),!.

afficher_pion(X,L,H):-X =:= 3,estSbireRouge(L,H),ansi_format([bold,bg(black),fg(red)], ' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireOcre(L,H),ansi_format([bold,bg(black),fg(white)], ' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaRouge(L,H),ansi_format([bold,bg(black),fg(red)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaOcre(L,H),ansi_format([bold,bg(black),fg(white)], ' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireVert(L,H),ansi_format([bold,bg(black),fg(green)],' x ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaVerte(L,H),ansi_format([bold,bg(black),fg(green)],' K ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estSbireMagenta(L,H),ansi_format([bold,bg(black),fg(magenta)],' o ',[world]),!.
afficher_pion(X,L,H):-X =:= 3,estKalistaMagenta(L,H),ansi_format([bold,bg(black),fg(magenta)],' K ',[world]),!.
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

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' x ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' o ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 2,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' x ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' x ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' o ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estSbireOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' o ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.

afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], ' K ',[world]),!.
afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], ' K ',[world]),!.
=======
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
>>>>>>> origin/master


afficher_coord_aux(7):-nl.
afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
afficher_coord(_):-write('  '),afficher_coord_aux(1).

afficher_plateau([],_).
afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).

afficher_plat(_):-nl,plateau(X2),afficher_coord(_),afficher_plateau(X2,1),!.

%ChoixDesPieces 
choix_sbire_rouge(0):-afficher_plat(_).
choix_sbire_rouge(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_sbire_rouge(_),choix_sbire_rouge(N1).
choisir_sbire_rouge(_):-write('Sbire rouge: colonne:'),read(A),write('Sbire rouge: ligne:'),read(B),place_sbire_rouge_S(A,B).
place_sbire_rouge_S(_,B):-B<5,write('placement impossible'),nl,choisir_sbire_rouge(_),!.
place_sbire_rouge_S(A,B):-B>4,occupe(A,B),write('place occupee veuillez essayer a nouveau'),nl,choisir_sbire_rouge(_).
place_sbire_rouge_S(A,B):-B>4,libre(A,B),assert(sbireR(A,B)),write('piece placee'),nl,!.
place_sbire_rouge(A,B):-findall((A,B),sbireR(A,B),M),length(M,R),R<5,assert(sbireR(A,B)),write('piece placee'),retractall(khan(_,_)),assert(khan(A,B)),nl.
choix_sbire_ocre(0):-afficher_plat(_).
choix_sbire_ocre(N):-N>0,N1 is N-1,nl,afficher_plat(_),nl,choisir_pion_ocre(_),choix_sbire_ocre(N1).
choisir_pion_ocre(_):-write('Sbire ocre: colonne:'),read(A),write('Sbire ocre: ligne:'),read(B),place_sbire_ocre_S(A,B).
place_sbire_ocre_S(_,B):-B>2,write('placement impossible'),nl,choisir_pion_ocre(_),!.
place_sbire_ocre_S(A,B):-B<3,occupe(A,B),write('place occupée veuillez essayer a nouveau'),nl,choisir_pion_ocre(_).
place_sbire_ocre_S(A,B):-B<3,libre(A,B),assert(sbireO(A,B)),write('piece placee'),nl,!.
place_sbire_ocre(A,B):-findall((A,B),sbireO(A,B),M),length(M,R),R<5,assert(sbireO(A,B)),write('piece placee'),retractall(khan(_,_)),assert(khan(A,B)),nl.


choisir_kalista_rouge(_):-write('Kalista rouge: colonne:'),read(A),write('Kalista rouge: ligne:'),read(B),place_kalista_rouge(A,B).
place_kalista_rouge(_,B):-B<5,write('placement impossible'),nl,choisir_kalista_rouge(_),!.
place_kalista_rouge(A,B):-B>4,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.

choisir_kalista_ocre(_):-write('Kalista ocre: colonne:'),read(A),write('Kalista ocre: ligne:'),read(B),place_kalista_ocre(A,B).
place_kalista_ocre(_,B):-B>2,write('placement impossible'),nl,choisir_kalista_ocre(_),!.
place_kalista_ocre(A,B):-B<3,libre(A,B),assert(kalistao(A,B)),write('kalista placee'),nl,!.



%CaseOccupeOuLibre?
libre(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),not(estRouge(LARGEUR,HAUTEUR)),not(estOcre(LARGEUR,HAUTEUR)),not(estVert(LARGEUR,HAUTEUR)),not(estMagenta(LARGEUR,HAUTEUR)).
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estRouge(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estOcre(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estVert(LARGEUR,HAUTEUR),!.
occupe(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),estMagenta(LARGEUR,HAUTEUR),!.
estOK(LARGEUR,HAUTEUR):-LARGEUR>0,LARGEUR<7,HAUTEUR>0,HAUTEUR<7 .

<<<<<<< HEAD
%mouvementPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 
/*Mouvement possible d'un pion rouge au premier tour de jeu*/ 
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),libre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),estOcre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),libre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),estOcre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),libre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).
estPossibleRouge1(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),estOcre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).

/*Mouvement possible d'un pion rouge à partir de 3ème tour de jeu*/ 
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),libre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),estOcreOuMagenta(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),libre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),estOcreOuMagenta(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),libre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).
estPossibleRouge(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estVert(ORGL,ORGH),estOcreOuMagenta(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).

/*Mouvement possible d'un pion ocre*/ 
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),libre(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),estVertOuRouge(NEWL,NEWH),estCase1(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,1).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),libre(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),estVertOuRouge(NEWL,NEWH),estCase2(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,2).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),libre(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).
estPossibleOcre(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estMagenta(ORGL,ORGH),estVertOuRouge(NEWL,NEWH),estCase3(ORGL,ORGH),cheminPossible(ORGL,ORGH,NEWL,NEWH,3).


%cheminPossible depuis (ORGL,ORGH) vers (NEWL,NEWH)
cheminPossible(ORGL,ORGH,NEWL,NEWH,1):-abs(NEWL-ORGL)+abs(NEWH-ORGH)=:=1,!.
cheminPossible(ORGL,ORGH,NEWL,NEWH,2):-libre(ORGL-1,ORGH),cheminPossible(ORGL-1,ORGH,NEWL,NEWH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,2):-libre(ORGL+1,ORGH),cheminPossible(ORGL+1,ORGH,NEWL,NEWH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,2):-libre(ORGL,ORGH-1),cheminPossible(ORGL,ORGH-1,NEWL,NEWH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,2):-libre(ORGL,ORGH+1),cheminPossible(ORGL,ORGH+1,NEWL,NEWH,1).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-libre(ORGL-1,ORGH),cheminPossible(ORGL-1,ORGH,NEWL,NEWH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-libre(ORGL+1,ORGH),cheminPossible(ORGL+1,ORGH,NEWL,NEWH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-libre(ORGL,ORGH-1),cheminPossible(ORGL,ORGH-1,NEWL,NEWH,2).
cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-libre(ORGL,ORGH+1),cheminPossible(ORGL,ORGH+1,NEWL,NEWH,2).
=======
caseLibre(M):-caseLibreAux(1,1,M),!.

caseLibreAux(A,B,[]):-B==7,!.
caseLibreAux(A,B,M):-A==7,A1 is 1,B1 is B+1,caseLibreAux(A1,B1,M).
caseLibreAux(A,B,[(A,B)|M]):-libre(A,B),A1 is A+1,caseLibreAux(A1,B,M).
caseLibreAux(A,B,[(A,B)|M]):-A1 is A+1,caseLibreAux(A1,B,M).


respecteKhan(A,B):-estCase1(A,B),khan(C,D),estCase1(C,D).
respecteKhan(A,B):-estCase2(A,B),khan(C,D),estCase2(C,D).
respecteKhan(A,B):-estCase3(A,B),khan(C,D),estCase3(C,D).
respecteKhan(_,_):-not(khan(_,_)).
%mouvementPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 

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
>>>>>>> origin/master

%mouvement 
move1(ORGL,ORGH,NEWL,NEWH):-estSbireRouge(ORGL,ORGH),moveSbireRouge1(ORGL,ORGH,NEWL,NEWH).
move1(ORGL,ORGH,NEWL,NEWH):-estKalistaRouge(ORGL,ORGH),moveKalistaRouge1(ORGL,ORGH,NEWL,NEWH).

<<<<<<< HEAD
move(ORGL,ORGH,NEWL,NEWH):-estSbireVert(ORGL,ORGH),moveSbireRouge(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estKalistaVerte(ORGL,ORGH),moveKalistaRouge(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estSbireMagenta(ORGL,ORGH),moveSbireOcre(ORGL,ORGH,NEWL,NEWH).
move(ORGL,ORGH,NEWL,NEWH):-estKalistaMagenta(ORGL,ORGH),moveKalistaOcre(ORGL,ORGH,NEWL,NEWH).
=======
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireRouge(ORGL,ORGH),moveSbireRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireOcre(ORGL,ORGH),moveSbireOcre(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaRouge(ORGL,ORGH),moveKalistaRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaOcre(ORGL,ORGH),moveKalistaOcre(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
>>>>>>> origin/master

/*Déplacement du sbire rouge LORS DU PREMIER TOUR DE JEU UNIQUEMENT */ 
moveSbireRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Deplacement du sbire rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
<<<<<<< HEAD
								assert(sbireV(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH). 
=======
								assert(sbireR(NEWL,NEWH)).
								
>>>>>>> origin/master
								
moveSbireRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise d'un sbire ocre par un sbire rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
<<<<<<< HEAD
								assert(sbireV(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH).
=======
								assert(sbireR(NEWL,NEWH)).
								
>>>>>>> origin/master
								
moveSbireRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Eventuelle prise de la kalista ocre par le sbire rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(sbireV(NEWL,NEWH)),
								assert(victoire(1)),
								nl.
								
moveKalistaRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Deplacement de la kalista rouge sur une case libre */ 
								libre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								assert(kalistav(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH).

moveKalistaRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire ocre par la kalista rouge */ 
								estSbireOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(kalistav(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH).
								
moveKalistaRouge1(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge1(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista ocre par la kalista rouge */ 
								estKalistaOcre(NEWL,NEWH),
								retract(kalistar(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(kalistav(NEWL,NEWH)),
								assert(victoire(1)),nl. 

/*Deplacement du sbire rouge à partir de son deuxième tour*/ 
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), 
								libre(NEWL,NEWH),
								changementMagentaOcre,
								changementVertRouge, 
								retract(sbireR(ORGL,ORGH)),
								assert(sbireV(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH).  

						
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH),
								changementMagentaOcre, 
								changementVertRouge, 
								estSbireOcre(NEWL,NEWH),
								retract(sbireR(ORGL,ORGH)),
								retract(sbireO(NEWL,NEWH)),
								assert(sbireV(NEWL,NEWH)),
								khanisationOcre(NEWL,NEWH). 

/*Eventuelle prise de la kalista ocre par le sbire rouge */ 
moveSbireRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), 
								/*On libère le contrôle du khan précédent sur la pièce ocre coloriée en magenta qui vient de bouger */ 
								changementMagentaOcre, 
								/*On libère les pions rouges coloriés en vert à cause du khan */ 
								changementVertRouge, 
								/*Il y a une Kalista ocre sur la case */ 
								estKalistaOcre(NEWL,NEWH),
								/*on retire sbire rouge précédent*/
								retract(sbireR(ORGL,ORGH)),
								/*On retire la kalista*/ 
								retract(kalistao(NEWL,NEWH)),
								/*On met un sbire vert*/ 
								assert(sbireV(NEWL,NEWH)),
								/*Le jeu est terminé, pas de colorisation nécessaire*/ 
								assert(victoire(1)),
								nl.

								
								
/*Deplacement du sbire ocre sur une case libre */ 
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								libre(NEWL,NEWH),
								/*On libère le contrôle du khan du tour précédent */
								changementVertRouge, 
								/*Changement de toutes les cases magenta en ocre*/ 
								changementMagentaOcre, 
								retract(sbireO(ORGL,ORGH)),
<<<<<<< HEAD
								/*On remet une case magenta pour indiquer au joueur rouge le type de cases qui seront vertes car contrôlées par le khan*/ 
								assert(sbireM(NEWL,NEWH)),
								/*Passage des rouges en vert */ 
								khanisationRouge(NEWL,NEWH). 
								
/*Prise d'un sbire rouge par un sbire ocre */ 			
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								/*On libère le contrôle du khan du tour précédent */
								changementVertRouge, 
=======
								assert(sbireO(NEWL,NEWH)).
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire rouge par un sbire ocre */ 
>>>>>>> origin/master
								estSbireRouge(NEWL,NEWH),
								/*Changement de toutes les cases magenta en ocre*/ 
								changementMagentaOcre, 
								retract(sbireO(ORGL,ORGH)),
								retract(sbireR(NEWL,NEWH)),
<<<<<<< HEAD
								/*On remet une case magenta pour indiquer au joueur rouge le type de cases qui seront vertes car contrôlées par le khan*/
								assert(sbireM(NEWL,NEWH)),
								/*Coloration des rouges adverses en vert */ 
								khanisationRouge(NEWL,NEWH).
								
/*Prise de la kalista rouge par le sbire ocre */ 
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								/*On libère le contrôle du khan du tour précédent */
								changementVertRouge, 
=======
								assert(sbireO(NEWL,NEWH)).
								
moveSbireOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par le sbire ocre */ 
>>>>>>> origin/master
								estKalistaRouge(NEWL,NEWH),
								/*Changement de toutes les cases magenta en ocre*/ 
								changementMagentaOcre, 
								retract(sbireO(ORGL,ORGH)),
								retract(kalistar(NEWL,NEWH)),
								assert(sbireM(NEWL,NEWH)),
								assert(victoire(2)),nl. 

								
/*Deplacement de la kalista rouge sur une case libre */ 							
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), 
								/*On vérifie que la case d'arrivée est libre */ 
								libre(NEWL,NEWH),
								/*On libère le sbire du tour précédent resté magenta */
								changementMagentaOcre, 
								/*On libère les sbires rouges devenus vert à cause du khan*/
								changementVertRouge, 
								/*On retire notre kalista devenue alors rouge grâce au prédicat précédent */ 
								retract(kalistar(ORGL,ORGH)),
<<<<<<< HEAD
								/*On pose la kalista verte car porteuse du khan*/ 
								assert(kalistav(NEWL,NEWH)),
								/*On change les pions adéquarts de l'adversaire en magenta car sous l'emprise du khan */ 
								khanisationOcre(NEWL,NEWH).

 /*Prise d'un sbire ocre par la kalista rouge */ 
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH),
	                                /* On libère le pion resté magenta en ocre */ 
								changementMagentaOcre, 
								/*On libère les sbires rouges devenus verts à cause du khan*/
								changementVertRouge, 
								/*On regarde s'il y a un sbire ocre sur la case d'arrivée (oui il sera bien ocre dans tous les cas grâce à changementMagentaOcre)*/
=======
								assert(kalistar(NEWL,NEWH)).
								
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), /*Prise d'un sbire ocre par la kalista rouge */ 
>>>>>>> origin/master
								estSbireOcre(NEWL,NEWH),
								/*On retir la kalista, bien rouge grâce à changementVertRouge */ 
								retract(kalistar(ORGL,ORGH)),
								/* on retire le sbire ocre détecté */ 
								retract(sbireO(NEWL,NEWH)),
								/*on met une kalista verte pour bien montrer qu'elle est sous l'emprise du khan*/ 
								assert(kalistav(NEWL,NEWH)),
								/*On transforme alors les pions adverses pour qu'ils soient également sous l'emprise du khan */
								khanisationOcre(NEWL,NEWH).
								
/*Prise de la kalista ocre par la kalista rouge */ 						
moveKalistaRouge(ORGL,ORGH,NEWL,NEWH):-estPossibleRouge(ORGL,ORGH,NEWL,NEWH), 
								/*On libère le pion resté magenta en ocre*/
								changementMagentaOcre, 
								/*On libère les sbires rouges devenus verts à cause du khan*/ 
								changementVertRouge, 
								/*On regarde s'il y a une kalista ocre sur la case d'arrivée */ 
								estKalistaOcre(NEWL,NEWH),
								/*pareil qu'avant*/ 
								retract(kalistar(ORGL,ORGH)),
								retract(kalistao(NEWL,NEWH)),
								assert(kalistav(NEWL,NEWH)),
								/*pas de khanisation car victoire*/ 
								assert(victoire(1)),nl. 
								
/*Deplacement de la kalista sur une case libre*/ 
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								/*On change toutes les pièces anciennement vertes de l'adversaire en pièces rouges */ 
								changementVertRouge,
								/*On change toutes les pièces anciennement magenta en pièces ocre */ 
								changementMagentaOcre, 
								/*On vérifie que la case d'arrivée est libre */ 
								libre(NEWL,NEWH),
								/*On retire la kalista, bien redevenue ocre grâce à changementMagentaOcre */ 
								retract(kalistao(ORGL,ORGH)),
								/*On pose une kalista magenta à l'arrivée */ 
								assert(kalistam(NEWL,NEWH)),
								/*Toutes les pièces de l'équipe rouge sur le même type de case que la kalista qu'on vient de bouger sont transformées en vert*/ 
								khanisationRouge(NEWL,NEWH).

/*Prise d'un sbire rouge par la kalista ocre */ 
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								/*On change toutes les pièces anciennement vertes de l'adversaire en pièces rouges */
								changementVertRouge, 
								/*On change toutes les pièces anciennement magenta en pièces ocre */ 
								changementMagentaOcre, 
								/*On a un sbire rouge sur la case adverse, on le vérifie ici */ 
								estSbireRouge(NEWL,NEWH),
								/*On retire la kalista, bien redevenue ocre grâce à changementMagentaOcre */ 
								retract(kalistao(ORGL,ORGH)),
								/*On retire le sbire rouge. Précisons que grâce à changementVertRouge, il n'y a plus de sbire vert lors de l'exécution de ce prédicat */ 
								retract(sbireR(NEWL,NEWH)),
<<<<<<< HEAD
								/*On pose une kalista magenta à l'arrivée */ 
								assert(kalistam(NEWL,NEWH)),
								/*Toutes les pièces de l'équipe rouge sur le même type de case que la kalista qu'on vient de bouger sont transformées en vert*/ 
								khanisationRouge(NEWL,NEWH).

/*Prise de la kalista rouge par la kalista ocre */ 								
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), 
								/*On change toutes les pièces anciennement vertes de l'adversaire en pièces rouges */
								changementVertRouge, 
								/*On change toutes les pièces anciennement magenta en pièces ocre */ 
								changementMagentaOcre,
								/*On vérifie qu'une kalista se trouve bien à la case d'arrivée ici */ 
=======
								assert(kalistao(NEWL,NEWH)).
								
moveKalistaOcre(ORGL,ORGH,NEWL,NEWH):-estPossibleOcre(ORGL,ORGH,NEWL,NEWH), /*Prise de la kalista rouge par la kalista ocre */ 
>>>>>>> origin/master
								estKalistaRouge(NEWL,NEWH),
								/*On retire la kalista, bien redevenue ocre grâce à changementMagentaOcre */ 
								retract(kalistao(ORGL,ORGH)),
								/*On retire la kalista rouge. Notons que grâce à changementVertRouge, la kalista n'est jamais verte lors de l'exécution du prédicat*/ 
								retract(kalistar(NEWL,NEWH)),
								/*On met la kalista magenta a l'endroit d'arrivée */ 
								assert(kalistam(NEWL,NEWH)),
								assert(victoire(2)),nl. 
								

choix_moveRouge1(_):-write('colonne du pion Rouge a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),estRouge(A,B),coupPossibleRouge(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),move1(A,B,C,D).
choix_moveRouge1(_):-write('Pas de piece rouge a cet endroit veuillez reessayer'), nl, choix_moveRouge1(_). 


<<<<<<< HEAD
choix_moveRouge(_):-write('colonne du pion Vert a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),estVert(A,B),coupPossibleRouge(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),move(A,B,C,D).
choix_moveRouge(_):-write('Pas de piece verte controlee par le khan a cet endroit veuillez reessayer'), nl, choix_moveRouge(_). 


choix_moveOcre(_):-write('colonne du pion Ocre a deplacer :'),read(A),nl,write('ligne du pion Ocre a deplacer :'),read(B),estMagenta(A,B),coupPossibleOcre(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),move(A,B,C,D).
choix_moveOcre(_):-write('Pas de piece magenta controlee par le khan a cet endroit veuillez reessayer'), nl, choix_moveOcre(_). 
=======
%entre_movement
choix_moveRouge:-nl,aucunMouvementRouge,write('Aucun Mouvement Possible, entrez des coordonnée pour placer un sbire, ou selectionnez un sbire pour le deplacer'),nl,retractall(khan(_,_)),write('colonne du pion Rouge a deplacer ou placer :'),read(A),nl,write('ligne du pion rouge a deplacer ou placer:'),read(B),choix_moveRougeAux(A,B).
choix_moveRouge:-nl,write('colonne du pion Rouge a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveRougeAux(A,B).

choix_moveRougeAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveRouge.
choix_moveRougeAux(A,B):-estOK(A,B),libre(A,B),possibleMovesRougeKhan(M),length(M,L),L==0,place_sbire_rouge(A,B),afficher_plat(_).
choix_moveRougeAux(A,B):-estOK(A,B),not(estRouge(A,B)),write('Case vide ou pion Ocre'),choix_moveRouge.
choix_moveRougeAux(A,B):-nl,estOK(A,B),estRouge(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),choix_moveRougeAux2(A,B,C,D).
choix_moveRougeAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveRougeAux(A,B).
choix_moveRougeAux2(A,B,C,D):-estOK(C,	D),not(estPossible(A,B,C,D)),write('Deplacement impossible'),choix_moveRouge.
choix_moveRougeAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).

choix_moveOcre:-nl,aucunMouvementOcre,write('Aucun Mouvement Possible, entrez des coordonnée pour placer un sbire, ou selectionnez un sbire pour le deplacer'),nl,retractall(khan(_,_)),write('colonne du pion Ocre a deplacer ou placer :'),read(A),nl,write('ligne du pion Ocre a deplacer ou placer:'),read(B),choix_moveRougeAux(A,B).
choix_moveOcre:-nl,write('colonne du pion Ocre a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveOcreAux(A,B).
choix_moveOcreAux(A,B):-not(estOK(A,B)),write('erreur coordonnee'),choix_moveOcre.
choix_moveOcreAux(A,B):-estOK(A,B),libre(A,B),possibleMovesOcreKhan(M),length(M,L),L==0,place_sbire_ocre(A,B),afficher_plat(_).
choix_moveOcreAux(A,B):-estOK(A,B),not(estOcre(A,B)),write('Case vide ou pion Rouge'),choix_moveOcre.
choix_moveOcreAux(A,B):-nl,estOK(A,B),estOcre(A,B),afficherCoupPossible(A,B),nl,write('colonne arrivee :'),read(C),nl,write('ligne arrivee:'),read(D),choix_moveOcreAux2(A,B,C,D).
choix_moveOcreAux2(A,B,C,D):-not(estOK(C,D)),write('erreur coordonnee'),choix_moveOcreAux(A,B).
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),not(estPossible(A,B,C,D)),write('Deplacement impossible'),choix_moveOcre.
choix_moveOcreAux2(A,B,C,D):-estOK(C,D),move(A,B,C,D).
>>>>>>> origin/master

/*Transformation en vert des éléments rouges sur le même type de case que le pion ocre khanisé (donc magenta) qui vient de bouger */ 
khanisationRouge(NEWL,NEWH):-estMagenta(NEWL,NEWH),estCase1(NEWL,NEWH), listePionsRougeCase1(Y), not(empty(Y)), coloriageVert(Y). 
khanisationRouge(NEWL,NEWH):-estMagenta(NEWL,NEWH),estCase2(NEWL,NEWH), listePionsRougeCase2(Y), not(empty(Y)), coloriageVert(Y).
khanisationRouge(NEWL,NEWH):-estMagenta(NEWL,NEWH),estCase3(NEWL,NEWH), listePionsRougeCase3(Y), not(empty(Y)), coloriageVert(Y).
khanisationRouge(NEWL,NEWH):-estMagenta(NEWL,NEWH), findall((A,B),estRouge(A,B),Y), coloriageVert(Y). 

/*Liste des pions rouge en case simple */ 
pionsRougeCase1(X,Y):-estRouge(X,Y),estCase1(X,Y). 
listePionsRougeCase1(Y):-findall((A,B),pionsRougeCase1(A,B),Y).
/*test cas exception prolog en autorisant le déplacement */ 
empty([]). 

<<<<<<< HEAD
/*Liste des pions rouge en case double */ 
pionsRougeCase2(X,Y):-estRouge(X,Y),estCase2(X,Y). 
listePionsRougeCase2(Y):-findall((A,B),pionsRougeCase2(A,B),Y).

/*Liste des pions rouge en case triple */ 
pionsRougeCase3(X,Y):-estRouge(X,Y),estCase3(X,Y). 
listePionsRougeCase3(Y):-findall((A,B),pionsRougeCase3(A,B),Y).
=======
afficherCoupPossible(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
afficherCoupPossible(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
afficherCoupPossible(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.

%Coup Possible pour une piece
coupPossible(L,H,M):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,M),!. %ERREUR SANS !
coupPossible(L,H,M):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,M),!.
coupPossible(L,H,M):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,M),!.
>>>>>>> origin/master

/*Coloriage de la liste passée en paramètre du rouge vers le vert */ 

coloriageVert([]).
coloriageVert([(A,B)|Q]):-estSbireRouge(A,B),retract(sbireR(A,B)),assert(sbireV(A,B)), coloriageVert(Q). 
coloriageVert([(A,B)|Q]):-estKalistaRouge(A,B),retract(kalistar(A,B)),assert(kalistav(A,B)), coloriageVert(Q). 

<<<<<<< HEAD
/*listePionsOcreCaseX renvoie une liste avec les coordonnées de tous les pions sur une case X. coloriageMagenta colorie en magenta tous les pions de la liste passée en paramètre */ 
khanisationOcre(NEWL,NEWH):-estVert(NEWL,NEWH), estCase1(NEWL,NEWH), listePionsOcreCase1(Y), not(empty(Y)), coloriageMagenta(Y). 
khanisationOcre(NEWL,NEWH):-estVert(NEWL,NEWH), estCase2(NEWL,NEWH), listePionsOcreCase2(Y), not(empty(Y)), coloriageMagenta(Y). 
khanisationOcre(NEWL,NEWH):-estVert(NEWL,NEWH), estCase3(NEWL,NEWH), listePionsOcreCase3(Y), not(empty(Y)), coloriageMagenta(Y). 
khanisationOcre(NEWL,NEWH):-estVert(NEWL,NEWH), findall((A,B),estOcre(A,B),Y), coloriageMagenta(Y). 


/*parcours du tableau du jeu et ajout de tous les pions ocre en case simple dans la liste Y  
sbireOcreCase1(X,Y):-estSbireOcre(X,Y),estCase1(X,Y).
reineOcreCase1(X,Y):-estKalistaOcre(X,Y),estCase1(X,Y).
pionsOcreCase1(X,Y):-sbireOcreCase1(X,Y).  */ 

pionsOcreCase1(X,Y):-estOcre(X,Y),estCase1(X,Y). 
listePionsOcreCase1(Y):-findall((A,B),pionsOcreCase1(A,B),Y).

/*Liste des pions (sbires ou kalista) en case double */ 

pionsOcreCase2(X,Y):-estOcre(X,Y),estCase2(X,Y). 
listePionsOcreCase2(Y):-findall((A,B),pionsOcreCase2(A,B),Y).

/*Liste des pions (sbires ou kalista) en case triple */ 
pionsOcreCase3(X,Y):-estOcre(X,Y),estCase3(X,Y).
listePionsOcreCase3(Y):-findall((A,B),pionsOcreCase3(A,B),Y). 

/*Coloriage de tous les éléments de la liste en paramètre du ocre vers magenta */ 
coloriageMagenta([]).
coloriageMagenta([(A,B)|Q]):-estSbireOcre(A,B),retract(sbireO(A,B)),assert(sbireM(A,B)), coloriageMagenta(Q). 
coloriageMagenta([(A,B)|Q]):-estKalistaOcre(A,B),retract(kalistao(A,B)),assert(kalistam(A,B)), coloriageMagenta(Q). 

/* Changement de tous les pions (sbires ou kalista) magenta en ocre */ 
changementMagentaOcre:-listePionsMagenta(Y), coloriageOcre(Y). 

/*Liste des pions de couleur magenta au moment de l'appel du prédicat */ 
pionMagenta(X,Y):-estSbireMagenta(X,Y).
pionMagenta(X,Y):-estKalistaMagenta(X,Y). 

listePionsMagenta(Y):-findall((A,B),pionMagenta(A,B),Y). 

/*Coloriage de tous les éléments de la liste fournie en paramètre en ocre */ 
coloriageOcre([]).
coloriageOcre([(A,B)|Q]):-estSbireMagenta(A,B),retract(sbireM(A,B)),assert(sbireO(A,B)), coloriageOcre(Q). 
coloriageOcre([(A,B)|Q]):-estKalistaMagenta(A,B),retract(kalistam(A,B)),assert(kalistao(A,B)), coloriageOcre(Q). 


/*Changement de toutes les cases coloriées en vert en cases rouge */
changementVertRouge:-listePionsVerts(Y), coloriageRouge(Y). 

/*Liste des pions de couleur verte au moment de l'appel du prédicat */ 
pionVert(X,Y):-estSbireVert(X,Y).
pionVert(X,Y):-estKalistaVerte(X,Y). 

listePionsVerts(Y):-findall((A,B),pionVert(A,B),Y). 

/*Coloriage de tous les éléments de la liste fournie en paramètre en vert */ 
coloriageRouge([]).
coloriageRouge([(A,B)|Q]):-estSbireVert(A,B),retract(sbireV(A,B)),assert(sbireR(A,B)), coloriageRouge(Q). 
coloriageRouge([(A,B)|Q]):-estKalistaVerte(A,B),retract(kalistav(A,B)),assert(kalistar(A,B)), coloriageRouge(Q). 
=======
%fonction pour affichage
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
>>>>>>> origin/master


%lancementJeu

initBoard(_):-viderPlateau,write('Les cases bleu clair correspondent aux cases simples, les cases bleu fonce aux cases doubles, les cases noires correspondent aux cases triples'),nl,
			afficher_plat(_),
			nl,write('placement kalista rouge'),choisir_kalista_rouge(_),
			write('placement sbires rouge'),choix_sbire_rouge(5),
			write('placement kalista ocre'),choisir_kalista_ocre(_),
			write('placement sbires ocre'),choix_sbire_ocre(5),
			premierTourRouge, 
			tourOcre. 

:-dynamic victoire/1. 
victoire(0). 

premierTourRouge:-choix_moveRouge1(_). 

<<<<<<< HEAD
tourRouge:-termine(_),victoireOcre(_),afficher_plat(_),nl,write('Victoire des Ocres').
tourRouge:-afficher_plat(_),choix_moveRouge(_),tourOcre.

tourOcre:-termine(_),victoireRouge(_),afficher_plat(_),nl,write('Victoire des Rouges').
tourOcre:-afficher_plat(_),choix_moveOcre(_),tourRouge.

/* creer fausse partie pour debug initialisée comme au début d'une vraie partie */ 
viderPlateau:-retractall(sbireO(_,_)),retractall(sbireR(_,_)),retractall(kalistar(_,_)),retractall(kalistao(_,_)),retractall(sbireM(_,_)),retractall(kalistam(_,_)),retractall(sbireV(_,_)),retractall(kalistav(_,_)).
=======
tourRouge:-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
tourRouge:-afficher_plat(_),choix_moveRouge,tourOcre.
tourOcre:-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
tourOcre:-afficher_plat(_),choix_moveOcre,tourRouge.

/* creer fausse partie pour debug initialisée comme au début d'une vraie partie */ 
viderPlateau:-retractall(sbireO(_,_)),retractall(khan(_,_)),retractall(sbireR(_,_)),retractall(kalistar(_,_)),retractall(kalistao(_,_)).
>>>>>>> origin/master
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
<<<<<<< HEAD
								premierTourRouge, 
								tourOcre. 
=======
								write('debut de la partie'),
								tourRouge.
>>>>>>> origin/master

main :-initBoard(_).

<<<<<<< HEAD

/*affichage des coups possible pour une pièce, code directement inséré dans tourRouge pour une meilleure gestion des erreurs si on s'est trompé de case   
afficherCoupPossible1(L,H):-estRouge(L,H),coupPossibleRouge(L,H).
afficherCoupPossible1(_,_):-write('Pas de piece rouge a cet endroit veuillez reessayer'), nl. */

afficherCoupPossibleVert(L,H):-estVert(L,H),coupPossibleRouge(L,H).
afficherCoupPossibleVert(_,_):-write('Pas de piece autorisee au deplacement a cet endroit veuillez reessayer'), nl. 

afficherCoupPossibleMagenta(L,H):-estMagenta(L,H),coupPossibleOcre(L,H).
afficherCoupPossibleMagenta(_,_):-write('Pas de piece autorisee au deplacement a cet endroit veuillez reessayer'), nl. 
=======
%trouve tout les rouges
getRouge(M):-findall((A,B),estRouge(A,B),M).
getOcre(M):-findall((A,B),estOcre(A,B),M).

%renvoi tout les coups possible [[(ORG,ORG),(NEW,NEW)],...]

%AVANT Controle KHAN
possibleMovesRougeKhan(B):-getRouge(M),possibleMovesAux(M,A),possibleMoveFormat(A,B),!.
possibleMovesOcreKhan(B):-getOcre(M),possibleMovesAux(M,A),possibleMoveFormat(A,C),!.

%APPRES echappe controle KHAN
possibleMovesPlacePion(M):-caseLibre(M).

possibleMovesRouge(E):-possibleMovesRougeKhan(T),length(T,0),khan(A,B),retractall(khan(_,_)),possibleMovesRougeKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).
possibleMovesOcre(E):-possibleMovesOcreKhan(T),length(T,0),khan(A,B),retractall(khan(_,_)),possibleMovesOcreKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).

%ne peut pas jouer
aucunMouvementRouge:-possibleMovesRouge(B),length(B,Z),Z=:=0.
aucunMouvementOcre:-possibleMovesOcre(B),length(B,Z),Z=:=0.
>>>>>>> origin/master


coupPossibleRouge(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleRougeAux(L,H,[],L1,H1).
coupPossibleRouge(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleRougeAux(L,H,[],L1,H1).
coupPossibleRouge(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleRougeAux(L,H,[],L1,H1).

/*Les X en 4ème paramètre de coupPosssibleRougeAux sont remplacés par _ car singleton (je corrigerai si erreur )*/
coupPossibleRougeAux(L,H,C,_,Y):-estCase1(L,H),Y=:=H+2,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleRougeAux(L,H,C,_,Y):-estCase2(L,H),Y=:=H+3,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleRougeAux(L,H,C,_,Y):-estCase3(L,H),Y=:=H+4,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleRougeAux(L,H,C,X,Y):-estCase1(L,H),X=:=L+2,Y1 is Y+1,X1 is L-1,coupPossibleRougeAux(L,H,C,X1,Y1).
coupPossibleRougeAux(L,H,C,X,Y):-estCase2(L,H),X=:=L+3,Y1 is Y+1,X1 is L-2,coupPossibleRougeAux(L,H,C,X1,Y1).
coupPossibleRougeAux(L,H,C,X,Y):-estCase3(L,H),X=:=L+4,Y1 is Y+1,X1 is L-3,coupPossibleRougeAux(L,H,C,X1,Y1).
coupPossibleRougeAux(L,H,C,X,Y):-X1 is X+1,estPossibleRouge(L,H,X,Y),coupPossibleRougeAux(L,H,[(X,Y)|C],X1,Y).
coupPossibleRougeAux(L,H,C,X,Y):-X1 is X+1,coupPossibleRougeAux(L,H,C,X1,Y).

coupPossibleOcre(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleOcreAux(L,H,[],L1,H1).
coupPossibleOcre(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleOcreAux(L,H,[],L1,H1).
coupPossibleOcre(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleOcreAux(L,H,[],L1,H1).

coupPossibleOcreAux(L,H,C,_,Y):-estCase1(L,H),Y=:=H+2,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleOcreAux(L,H,C,_,Y):-estCase2(L,H),Y=:=H+3,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleOcreAux(L,H,C,_,Y):-estCase3(L,H),Y=:=H+4,write('coups possibles:'),write(C),affichage_coup_possible(_,C,L,H).
coupPossibleOcreAux(L,H,C,X,Y):-estCase1(L,H),X=:=L+2,Y1 is Y+1,X1 is L-1,coupPossibleOcreAux(L,H,C,X1,Y1).
coupPossibleOcreAux(L,H,C,X,Y):-estCase2(L,H),X=:=L+3,Y1 is Y+1,X1 is L-2,coupPossibleOcreAux(L,H,C,X1,Y1).
coupPossibleOcreAux(L,H,C,X,Y):-estCase3(L,H),X=:=L+4,Y1 is Y+1,X1 is L-3,coupPossibleOcreAux(L,H,C,X1,Y1).
coupPossibleOcreAux(L,H,C,X,Y):-X1 is X+1,estPossibleOcre(L,H,X,Y),coupPossibleOcreAux(L,H,[(X,Y)|C],X1,Y).
coupPossibleOcreAux(L,H,C,X,Y):-X1 is X+1,coupPossibleOcreAux(L,H,C,X1,Y).



affichage_coup_possible(_,C,A,B):-nl,afficher_coord(_),plateau(X),afficher_coup_possibleAux(X,1,C,A,B). 
afficher_coup_possibleAux([],_,_,_,_).
afficher_coup_possibleAux([X|L],HAUTEUR,C,A,B):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste_coup_possible(X,1,HAUTEUR,C,A,B),nl,afficher_coup_possibleAux(L,HAUTEUR1,C,A,B).
afficher_liste_coup_possible([],_,_,_,_,_).
afficher_liste_coup_possible([X|L],LARGEUR,HAUTEUR,C,A,B) :- member((LARGEUR,HAUTEUR),C),afficher_pion_coup_possible(X,LARGEUR,HAUTEUR,A,B),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).
afficher_liste_coup_possible([X|L],LARGEUR,HAUTEUR,C,A,B) :- afficher_pion(X,LARGEUR,HAUTEUR),LARGEUR1 is LARGEUR+1, afficher_liste_coup_possible(L,LARGEUR1,HAUTEUR,C,A,B).

<<<<<<< HEAD
testmember(A,B,C):-member((A,B),C).








=======
happn([],_,[]).
happn([K|A],B,[K|C]):-happn(A,B,C).

%pion=1 kalista =5
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
 
%evaluation : possibilité de mouvement +1 , possiblité de mouvement adverse -1 , a gagner +infini, a perdre-infini

evaluation('r'):-victoireRouge.
evaluation('o'):-victoireRouge.	 
evaluation(R):-possibleMovesRouge(A),length(A,B),possibleMovesOcre(C),length(C,D),R is (B-D),!.
evaluationPlacerSbire(0):-aucunMouvementRouge,aucunMouvementOcre.
evaluationPlacerSbire(10):-aucunMouvementRouge.
evaluationPlacerSbire(-10):-aucunMouvementOcre.
evaluationPlacerSbire(0).
%plateau origine
:-dynamic plat_org/5.
:-dynamic plat_1/5.
:-dynamic plat_2/5.
:-dynamic plat_3/5.

%sauvegarde plateau seulemet 4 sauvegarde possible
savePlateau:-not(plat_3(_,_,_,_,_)),plat_2(_,_,_,_,_),retractall(plat_3(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_3(KR,KO,R,O,K)).
savePlateau:-not(plat_2(_,_,_,_,_)),plat_1(_,_,_,_,_),retractall(plat_2(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_2(KR,KO,R,O,K)).
savePlateau:-not(plat_1(_,_,_,_,_)),plat_org(_,_,_,_,_),retractall(plat_1(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_1(KR,KO,R,O,K)).
savePlateau:-not(plat_2(_,_,_,_,_)),retractall(plat_org(_,_,_,_,_)),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_org(KR,KO,R,O,(0,0))).

%retour etat precedent
assertkalistar([(A,B)]):-assert(kalistar(A,B)).
assertkalistao([(A,B)]):-assert(kalistao(A,B)).
assertkhan([]).
assertkhan([(A,B)]):-assert(khan(A,B)).

assertSbireR([]).
assertSbireR([(A,B)|C]):-assert(sbireR(A,B)),assertSbireR(C).
assertSbireO([]).
assertSbireO([(A,B)|C]):-assert(sbireO(A,B)),assertSbireO(C).
%retour etat precedent
undoMove:-plat_3(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_3(_,_,_,_,_)).
undoMove:-plat_2(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_2(_,_,_,_,_)).
undoMove:-plat_1(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_1(_,_,_,_,_)).
undoMove:-plat_org(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_org(_,_,_,_,_)).

%arbre [racine,[fils1...],[fils2...]] // TO DO REFAIRE POUR N ITERATION
createArbreRouge(A):-possibleMovesRouge(B),createArbreAux(B,C),addroot(C,A),!.
createArbreOcre(A):-possibleMovesOcre(B),createArbreAux(B,C),addroot(C,A),!.

createArbreAux([],[]).
createArbreAux([X|B],[[X]|A]):-createArbreAux(B,A).
addroot(A,['root'|A]).	

%NON TERMINE
createArbreRouge2(['root'|B],['root'|[C]]):-createArbreRouge2(B,C). 	
createArbreRouge2([[(A,B),(C,D)]|G],[[[(A,B),(C,D)]|N]|R]):-savePlateau,move(A,B,C,D),possibleMovesOcre(N),createArbreRouge2(G,R),!.

%TODO REFAIRE POUR N ITERATION
evaluationArbre([],[]):-!.
evaluationArbre(['root'|B],[0|[C]]):-evaluationArbre(B,C). 	
evaluationArbre([[[(A,B),(C,D)]]|E],[X|Y]):-savePlateau,move(A,B,C,D),evaluation(X),undoMove,evaluationArbre(E,Y).

evaluationRacine([A|N],B):-evaluation(A,B).
evaluation([(A,B),(C,D)],R):-savePlateau,move(A,B,C,D),evaluation(R),undoMove,!.
%(A,(Fils1,(filsfils1,filsfils2)),fils2)

%HEURISTIQUE METHODE MINMAX
>>>>>>> origin/master
