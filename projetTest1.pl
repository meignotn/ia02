/*test pour voir si Prolog consulte bien le bon fichier, merci à Grégoire pour l'idée */ 
test :- write('pouet_projetTest1'). 

/*Contenu des matrices du programme*/ 
plateau([[' ','|','1','|','2','|','3','|','4','|','5','|','6','|'],['A','|',2,'|',3,'|',1,'|',2,'|',2,'|',3,'|'],['B','|',2,'|',1,'|',3,'|',1,'|',3,'|',1,'|'],['C','|',1,'|',3,'|',2,'|',3,'|',1,'|',2,'|'],['D','|',3,'|',1,'|',2,'|',1,'|',3,'|',2,'|'],['E','|',2,'|',3,'|',1,'|',3,'|',1,'|',3,'|'],['F','|',2,'|',1,'|',3,'|',2,'|',2,'|',1,'|']]).
plateau2([[' '],['|','E1','|','E2','|','E3','|','E4','|','E5','|','E6','|'],['|','F1','|','F2','|','F3','|','F4','|','F5','|','F6','|']]). 

/* Affichage d'une ligne de la matrice */ 
afficheLigne([]). 
afficheLigne([T|Q]) :- write(T),afficheLigne(Q).

/*Affichage d'une matrice*/
afficheMatrice([]). 
afficheMatrice([T|Q]) :- afficheLigne(T),nl,write('-------------'),nl,afficheMatrice(Q). 

/*Refaire un affichage du tableau sans afficher des listes de listes. Un simple affichage de tableau avec des espaces bien dosés suffit. 


Affichage du contenu des plateaux */ 
affichePlateau(_) :- plateau(X),afficheMatrice(X).
affichePlateau2(_) :- plateau2(Y),afficheMatrice(Y). 

/*Test des fonctions write et read*/
helloworld:-write('Quel est ton nom?'),read(Nom),write('Bonjour '),write(Nom). 

/*affichage de K fois la question "position du sbire" - pour tester le remplacement d'une boucle for */ 

boucle(I,K):- I =< K , write('Position du sbire?') ,read(C), nl , Nouveau_I is I+1 , boucle(Nouveau_I,K).
boucle(I,K):- I> K. 

/*Test d'un début de partie inspiré du morpion trouvé sur YouTube : */
go :- write('Plateau du jeu: '), nl,  affichePlateau(plateau), nl, comment_jouer. 

/*On va définir une fonction strt et recopier le tableau comme dans le morpion

go :- write('Plateau du jeu: '), nl,  affichePlateau(plateau), nl, comment_jouer, strt() . */

comment_jouer :- write('Vous etes le Joueur rouge'), nl, write('Le tableau que nous allons afficher correspond aux deux dernières lignes du plateau.'), nl, write('Veuillez positionner votre Kalista et vos sbires sur le plateau en vous repérant avec les numéros du tableau suivant: '), nl, affichePlateau2(plateau2). 

/*Avant de faire un tour de jeu, on met les pions du joueur humain */ 
