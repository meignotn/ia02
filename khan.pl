
  /* IA02 jeu de khan */
  
 -
 +%Plateau de jeu les chiffre representent les type de case
  plateau([	[2,3,1,2,2,3],
  			[2,1,3,1,3,1],
  			[1,3,2,3,1,2],
  			[3,1,2,1,3,2],
  			[2,3,1,3,1,3],
  			[2,1,3,2,2,1]]).
  
 +%les Sbire et Kalista
  %kalista rouge
  :-dynamic kalistar/2.
  %sbires rouge
 @@ -20,12 +21,12 @@
  :-dynamic khan/2.
  
  
 -%coupPossibles
 -:-dynamic cp1/4.
 +
  %fin de partie
  termine:-not(kalistao(_,_)).
  termine:-not(kalistar(_,_)).
  
 +%victoire
  victoireRouge:-termine,kalistar(_,_).
  victoireOcre:-termine,kalistao(_,_).
  
 @@ -40,38 +41,15 @@
  format_afficher_liste(LARGEUR,HAUTEUR):-estCase2(LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], ' ',[world]),afficher_pion(2,LARGEUR,HAUTEUR),ansi_format([bg(blue),fg(white)], ' ',[world]).
  format_afficher_liste(LARGEUR,HAUTEUR):-estCase3(LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], ' ',[world]),afficher_pion(3,LARGEUR,HAUTEUR),ansi_format([bg(black),fg(white)], ' ',[world]).
  
 -%FonctionTestPion.
 -estSbire(L,H):-estSbireRouge(L,H).
 -estSbire(L,H):-estSbireOcre(L,H).
 -estKalista(L,H):-estKalistaRouge(L,H).
 -estKalista(L,H):-estKalistaOcre(L,H).
 -estSbireRouge(L,H):-sbireR(L,H).
 -estSbireOcre(L,H):-sbireO(L,H).
 -estKalistaRouge(L,H):-kalistar(L,H). 
 -estKalistaOcre(L,H):-kalistao(L,H). 
 -estRouge(L,H):-estSbireRouge(L,H).
 -estRouge(L,H):-estKalistaRouge(L,H).
 -estOcre(L,H):-estSbireOcre(L,H).
 -estOcre(L,H):-estKalistaOcre(L,H).
 +afficher_coord_aux(7):-nl.
 +afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
 +afficher_coord(_):-write('  '),afficher_coord_aux(1).
  
 -%TestCase
 -estCase1(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase1Aux(X,LARGEUR,HAUTEUR).
 -estCase1Aux([X|_],LARGEUR,1):-estCase1Aux2(X,LARGEUR).
 -estCase1Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase1Aux(Q,LARGEUR,HAUTEUR1).
 -estCase1Aux2([X|_],1):-X=:=1.
 -estCase1Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase1Aux2(Q,LARGEUR1).
 +afficher_plateau([],_).
 +afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).
  
 -estCase2(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase2Aux(X,LARGEUR,HAUTEUR).
 -estCase2Aux([X|_],LARGEUR,1):-estCase2Aux2(X,LARGEUR).
 -estCase2Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase2Aux(Q,LARGEUR,HAUTEUR1).
 -estCase2Aux2([X|_],1):-X=:=2.
 -estCase2Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase2Aux2(Q,LARGEUR1).
 +afficher_plat(_):-nl,plateau(X2),afficher_coord(_),afficher_plateau(X2,1),!.
  
 -estCase3(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase3Aux(X,LARGEUR,HAUTEUR).
 -estCase3Aux([X|_],LARGEUR,1):-estCase3Aux2(X,LARGEUR).
 -estCase3Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase3Aux(Q,LARGEUR,HAUTEUR1).
 -estCase3Aux2([X|_],1):-X=:=3.
 -estCase3Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase3Aux2(Q,LARGEUR1).
  
  /*affichage des case du plateaux cyan=1 bleu =2 noir =3*/
  afficher_pion(X,L,H):-X =:= 1,estSbireRouge(L,H),ansi_format([bold,bg(cyan),fg(red)], 'x',[world]),!.
 @@ -89,7 +67,7 @@
  afficher_pion(X,L,H):-X =:= 3,estKalistaRouge(L,H),ansi_format([bold,bg(black),fg(red)], 'K',[world]),!.
  afficher_pion(X,L,H):-X =:= 3,estKalistaOcre(L,H),ansi_format([bold,bg(black),fg(white)], 'K',[world]),!.
  afficher_pion(X,_,_):-X =:= 3,ansi_format([bg(black),fg(white)], ' ',[world]),!.
 -%test
 +
  /*affichage des case du plateau pour un deplacement possible cyan=1 bleu =2 noir =3 vert=prise jaune=case libre*/
  afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),libre(L,H),ansi_format([bold,bg(cyan),fg(yellow)], 'x',[world]),!.
  afficher_pion_coup_possible(X,L,H,A,B):-X =:= 1,estSbireRouge(A,B),occupe(L,H),ansi_format([bold,bg(cyan),fg(magenta)], 'x',[world]),!.
 @@ -116,15 +94,38 @@
  afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),libre(L,H),ansi_format([bold,bg(black),fg(yellow)], 'K',[world]),!.
  afficher_pion_coup_possible(X,L,H,A,B):-X =:= 3,estKalistaOcre(A,B),occupe(L,H),ansi_format([bold,bg(black),fg(magenta)], 'K',[world]),!.
  
 +%FonctionTestPion.
 +estSbire(L,H):-estSbireRouge(L,H).
 +estSbire(L,H):-estSbireOcre(L,H).
 +estKalista(L,H):-estKalistaRouge(L,H).
 +estKalista(L,H):-estKalistaOcre(L,H).
 +estSbireRouge(L,H):-sbireR(L,H).
 +estSbireOcre(L,H):-sbireO(L,H).
 +estKalistaRouge(L,H):-kalistar(L,H). 
 +estKalistaOcre(L,H):-kalistao(L,H). 
 +estRouge(L,H):-estSbireRouge(L,H).
 +estRouge(L,H):-estKalistaRouge(L,H).
 +estOcre(L,H):-estSbireOcre(L,H).
 +estOcre(L,H):-estKalistaOcre(L,H).
  
 -afficher_coord_aux(7):-nl.
 -afficher_coord_aux(X):-write(' '),write(X),X1 is X+1,write(' '),afficher_coord_aux(X1).
 -afficher_coord(_):-write('  '),afficher_coord_aux(1).
 +%TestCase
 +estCase1(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase1Aux(X,LARGEUR,HAUTEUR).
 +estCase1Aux([X|_],LARGEUR,1):-estCase1Aux2(X,LARGEUR).
 +estCase1Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase1Aux(Q,LARGEUR,HAUTEUR1).
 +estCase1Aux2([X|_],1):-X=:=1.
 +estCase1Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase1Aux2(Q,LARGEUR1).
  
 -afficher_plateau([],_).
 -afficher_plateau([X|L],HAUTEUR):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste(X,1,HAUTEUR),nl,afficher_plateau(L,HAUTEUR1).
 +estCase2(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase2Aux(X,LARGEUR,HAUTEUR).
 +estCase2Aux([X|_],LARGEUR,1):-estCase2Aux2(X,LARGEUR).
 +estCase2Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase2Aux(Q,LARGEUR,HAUTEUR1).
 +estCase2Aux2([X|_],1):-X=:=2.
 +estCase2Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase2Aux2(Q,LARGEUR1).
  
 -afficher_plat(_):-nl,plateau(X2),afficher_coord(_),afficher_plateau(X2,1),!.
 +estCase3(LARGEUR,HAUTEUR):-estOK(LARGEUR,HAUTEUR),plateau(X),estCase3Aux(X,LARGEUR,HAUTEUR).
 +estCase3Aux([X|_],LARGEUR,1):-estCase3Aux2(X,LARGEUR).
 +estCase3Aux([_|Q],LARGEUR,HAUTEUR):-HAUTEUR1 is HAUTEUR-1,estCase3Aux(Q,LARGEUR,HAUTEUR1).
 +estCase3Aux2([X|_],1):-X=:=3.
 +estCase3Aux2([_|Q],LARGEUR):-LARGEUR1 is LARGEUR-1,estCase3Aux2(Q,LARGEUR1).
  
  %ChoixDesPieces 
  choix_sbire_rouge(0):-afficher_plat(_).
 @@ -142,7 +143,6 @@
  place_sbire_ocre_S(A,B):-B<3,libre(A,B),assert(sbireO(A,B)),!.
  place_sbire_ocre(A,B):-findall((A,B),sbireO(A,B),M),length(M,R),R<5,assert(sbireO(A,B)),retractall(khan(_,_)),assert(khan(A,B)),nl.
  
 -
  choisir_kalista_rouge(_):-write('Kalista rouge: colonne:'),read(A),write('Kalista rouge: ligne:'),read(B),place_kalista_rouge(A,B).
  place_kalista_rouge(_,B):-B<5,write('placement impossible'),nl,choisir_kalista_rouge(_),!.
  place_kalista_rouge(A,B):-B>4,libre(A,B),assert(kalistar(A,B)),write('kalista placee'),nl,!.
 @@ -168,13 +168,13 @@
  caseLibreAux(A,B,[(A,B)|M]):-libre(A,B),A1 is A+1,caseLibreAux(A1,B,M).
  caseLibreAux(A,B,[(A,B)|M]):-A1 is A+1,caseLibreAux(A1,B,M).
  
 -
 +%utilise pour les deplacement permet de verifier le respect du khan
  respecteKhan(A,B):-estCase1(A,B),khan(C,D),estCase1(C,D).
  respecteKhan(A,B):-estCase2(A,B),khan(C,D),estCase2(C,D).
  respecteKhan(A,B):-estCase3(A,B),khan(C,D),estCase3(C,D).
  respecteKhan(_,_):-not(khan(_,_)).
 -%mouvementPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 
  
 +%estPossible orgl->largeur du pion d origine , orh -> hauteur origine , newL -> nouvelle largeur 
  estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estRouge(ORGL,ORGH),respecteKhan(ORGL,ORGH),estPossibleRouge(ORGL,ORGH,NEWL,NEWH).
  estPossible(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estOcre(ORGL,ORGH),respecteKhan(ORGL,ORGH),estPossibleOcre(ORGL,ORGH,NEWL,NEWH).
  
 @@ -205,7 +205,6 @@
  cheminPossible(ORGL,ORGH,NEWL,NEWH,3):-ORGH1 is ORGH+1,libre(ORGL,ORGH1),cheminPossible(ORGL,ORGH1,NEWL,NEWH,ORGL,ORGH,2).
  
  %mouvement 
 -
  move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireRouge(ORGL,ORGH),moveSbireRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
  move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estSbireOcre(ORGL,ORGH),moveSbireOcre(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
  move(ORGL,ORGH,NEWL,NEWH):-estOK(ORGL,ORGH),estOK(NEWL,NEWH),estKalistaRouge(ORGL,ORGH),moveKalistaRouge(ORGL,ORGH,NEWL,NEWH),retractall(khan(_,_)),assert(khan(NEWL,NEWH)),!.
 @@ -285,7 +284,7 @@
  
  
  
 -%entre_movement
 +%choix_muvement
  choix_moveRouge:-nl,aucunMouvementRouge,write('Aucun Mouvement Possible en respectant le Khan , entrez des coordonnée pour placer un sbire, ou selectionnez un sbire pour le deplacer'),nl,retractall(khan(_,_)),write('colonne du pion Rouge a deplacer ou placer :'),read(A),nl,write('ligne du pion rouge a deplacer ou placer:'),read(B),choix_moveRougeAux(A,B).
  choix_moveRouge:-nl,write('colonne du pion Rouge a deplacer :'),read(A),nl,write('ligne du pion rouge a deplacer :'),read(B),choix_moveRougeAux(A,B).
  
 @@ -312,7 +311,6 @@
  
  
  /*affichage des coups possible pour une pièce */ 
 -
  afficherCoupPossible(L,H):-estCase1(L,H),L1 is L-1,H1 is H-1,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
  afficherCoupPossible(L,H):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
  afficherCoupPossible(L,H):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,A),affichage_coup_possible(_,A,L,H),!.
 @@ -322,7 +320,6 @@
  coupPossible(L,H,M):-estCase2(L,H),L1 is L-2,H1 is H-2,coupPossibleAux(L,H,L1,H1,M),!.
  coupPossible(L,H,M):-estCase3(L,H),L1 is L-3,H1 is H-3,coupPossibleAux(L,H,L1,H1,M),!.
  
 -
  coupPossibleAux(L,H,_,Y,[]):-estCase1(L,H),Y=:=H+2.
  coupPossibleAux(L,H,X,Y,A):-estCase1(L,H),X=:=L+2,Y1 is Y+1,X1 is L-1,coupPossibleAux(L,H,X1,Y1,A).
  coupPossibleAux(L,H,_,Y,[]):-estCase2(L,H),Y=:=H+3.
 @@ -332,7 +329,7 @@
  coupPossibleAux(L,H,X,Y,[(X,Y)|A]):-X1 is X+1,estPossible(L,H,X,Y),coupPossibleAux(L,H,X1,Y,A).
  coupPossibleAux(L,H,X,Y,A):-X1 is X+1,coupPossibleAux(L,H,X1,Y,A).
  
 -%fonction pour affichage
 +%fonction pour affichage des coup possible
  affichage_coup_possible(_,C,A,B):-nl,afficher_coord(_),plateau(X),afficher_coup_possibleAux(X,1,C,A,B).
  afficher_coup_possibleAux([],_,_,_,_).
  afficher_coup_possibleAux([X|L],HAUTEUR,C,A,B):-write(HAUTEUR),write(' '),HAUTEUR1 is HAUTEUR+1,afficher_liste_coup_possible(X,1,HAUTEUR,C,A,B),nl,afficher_coup_possibleAux(L,HAUTEUR1,C,A,B).
 @@ -348,7 +345,6 @@
  
  
  %lancementJeu
 -
  initBoard(_):-viderPlateau,write('Les cases bleu clair correspondent aux cases simples, les cases bleu fonce aux cases doubles, les cases noires correspondent aux cases triples'),nl,
  			afficher_plat(_),
  			nl,write('Joueur Rouge 1 pour IA 0 pour Humain :'),
 @@ -363,18 +359,19 @@
  			write('debut de la partie'),
  			jeu(A,B,C,D). 
  
 -
 +%choix difficulté
  difficulte(B):-read(A),difficulteAux(A,B).
  difficulteAux(1,1).
  difficulteAux(2,2).
  difficulteAux(_,A):-difficulte(A).
  
 +%lancementJeu
  jeu(0,0,_,_):-tourRouge(0,0,0,0).
  jeu(0,1,_,A):-tourRouge(0,1,0,A).
  jeu(1,0,A,_):-tourRougeIA(1,0,A,_).
  jeu(1,1,A,B):-tourRougeIA(1,1,A,B).
  
 -
 +%choix des IA ou non
  choixJ1(B):-read(A),choixAuxJ1(A,B).
  choixAuxJ1(1,1).
  choixAuxJ1(0,0).
 @@ -384,6 +381,7 @@
  choixAuxJ2(0,0).
  choixAuxJ2(_,A):-choixJ2(A).
  
 +%placement des Piece en fonction des Joueurs
  placement(1,1):-assert(sbireR(2,5)),
  								assert(sbireR(3,5)),
  								assert(sbireR(4,6)),
 @@ -443,15 +441,12 @@
  								write('debut de la partie'),
  								tourRouge.
  
 -main :-initBoard(_).
 -
 -
  
  %trouve tout les rouges
  getRouge(M):-findall((A,B),estRouge(A,B),M).
  getOcre(M):-findall((A,B),estOcre(A,B),M).
  
 -%renvoi tout les coups possible [[(ORG,ORG),(NEW,NEW)],...]
 +
  
  %AVANT Controle KHAN
  possibleMovesRougeKhan(B):-getRouge(M),possibleMovesAux(M,A),possibleMoveFormat(A,B),!.
 @@ -460,13 +455,14 @@
  %APPRES echappe controle KHAN
  possibleMovesPlacePion(M):-caseLibre(M).
  
 +%renvoi tout les coups possible [[(ORG,ORG),(NEW,NEW)],...]
  possibleMovesRouge(E):-aucunMouvementRouge,khan(A,B),retractall(khan(_,_)),possibleMovesRougeKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).
  possibleMovesRouge(E):-possibleMovesRougeKhan(E).
  
  possibleMovesOcre(E):-aucunMouvementOcre,khan(A,B),retractall(khan(_,_)),possibleMovesOcreKhan(C),possibleMovesPlacePion(D),assert(khan(A,B)),append(C,D,E).
  possibleMovesOcre(E):-possibleMovesOcreKhan(E).
  
 -%ne peut pas jouer
 +%ne peut pas jouer en respectant le khan
  aucunMouvementRouge:-possibleMovesRougeKhan(B),length(B,Z),Z=:=0.
  aucunMouvementOcre:-possibleMovesOcreKhan(B),length(B,Z),Z=:=0.
  
 @@ -483,10 +479,7 @@
  possibleMoveFormat([[]|C],R):-possibleMoveFormat(C,R).
  possibleMoveFormat([[A|B]|C],[A|R]):-possibleMoveFormat([B|C],R).
  
 -happn([],_,[]).
 -happn([K|A],B,[K|C]):-happn(A,B,C).
 -
 -%pion=1 kalista =5
 +%etait utilisé avec une ancienne fonction d'evaluation non retenue
  nombrePrisePossibleRouge(M):-getRouge(A),nombrePrisePossibleRougeAux(A,M),!.
  nombrePrisePossibleRougeAux([],0).
  nombrePrisePossibleRougeAux([(A,B)|M],R):-coupPossible(A,B,C),nombrePrisePossibleRougeListeCoupPossible(C,X),nombrePrisePossibleRougeAux(M,K),R is X+K.
 @@ -505,7 +498,7 @@
  
  nombrePrisePossibleOcreListeCoupPossible([_|B],X):-nombrePrisePossibleOcreListeCoupPossible(B,X).
   
 -%evaluation : possibilité de mouvement +1 , possiblité de mouvement adverse -1 , a gagner +infini, a perdre-infini
 +%evaluation : possibilité de mouvement +1 , possiblité de mouvement adverse -1 , a gagner +infini, a perdre-infini -1 et 1000 sont les bornes inf/sup
  
  evaluationRouge(-1):-victoireRouge.
  evaluationRouge(1000):-victoireOcre.	 
 @@ -517,19 +510,20 @@
  evaluationPlacerSbire(10):-aucunMouvementRouge.
  evaluationPlacerSbire(-10):-aucunMouvementOcre.
  evaluationPlacerSbire(0).
 -%plateau origine
 +
 +%plateau origine permet la sauvegarde du plateau
  :-dynamic plat_org/5.
  :-dynamic plat_1/5.
  :-dynamic plat_2/5.
  :-dynamic plat_3/5.
  
 -%sauvegarde plateau seulemet 4 sauvegarde possible // TODO si pas de khan sauvegarde impossible
 +%sauvegarde plateau seulement 4 sauvegarde possible // TODO si pas de khan sauvegarde impossible
  savePlateau:-not(plat_3(_,_,_,_,_)),plat_2(_,_,_,_,_),retractall(plat_3(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_3(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
  savePlateau:-not(plat_2(_,_,_,_,_)),plat_1(_,_,_,_,_),retractall(plat_2(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_2(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
  savePlateau:-not(plat_1(_,_,_,_,_)),plat_org(_,_,_,_,_),retractall(plat_1(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),assert(plat_1(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
  savePlateau:-not(plat_org(_,_,_,_,_)),findall((P,M),khan(P,M),K),findall((A,B),sbireR(A,B),R),findall((C,D),sbireO(C,D),O),findall((E,F),kalistar(E,F),KR),findall((G,H),kalistao(G,H),KO),	assert(plat_org(KR,KO,R,O,K)),save(X),retractall(save(_)),X1 is X+1,assert(save(X1)).
  
 -%retour etat precedent
 +%retour etat precedent utilse pour revenir a l'etat precedent
  assertkalistar([(A,B)]):-assert(kalistar(A,B)).
  assertkalistar([]).
  
 @@ -544,6 +538,7 @@
  assertSbireR([(A,B)|C]):-assert(sbireR(A,B)),assertSbireR(C).
  assertSbireO([]).
  assertSbireO([(A,B)|C]):-assert(sbireO(A,B)),assertSbireO(C).
 +
  %retour etat precedent
  undoMove:-plat_3(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_3(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).
  undoMove:-plat_2(A,B,C,D,E),viderPlateau,assertkhan(E),assertkalistar(A),assertkalistao(B),assertSbireR(C),assertSbireO(D),retractall(plat_2(_,_,_,_,_)),save(X),retractall(save(_)),X1 is X-1,assert(save(X1)).
 @@ -556,6 +551,7 @@
  creerListeDeListe([],[]).
  creerListeDeListe([X|Q],[[X]|A]):-creerListeDeListe(Q,A).
  
 +%PERMET De creer l'arbre des coup possible de K a N  
  creerArbreProfRouge(A,K,K,A):-!.
  creerArbreProfRouge([[(A,B),(C,D)]],K,N,[[(A,B),(C,D)]|E]):-possibleMovesRouge(H),creerListeDeListe(H,M),iterationRouge(M,K,N,E).
  creerArbreProfRouge([(A,B)],K,N,[(A,B)|E]):-possibleMovesRouge(H),creerListeDeListe(H,M),iterationRouge(M,K,N,E).
 @@ -580,6 +576,7 @@
  iterationOcreAux([[(A,B),(C,D)]],A1,_,G):-termine,creerArbreProfRouge([[(A,B),(C,D)]],A1,A1,G).
  iterationOcreAux([[(A,B),(C,D)]],A1,N,G):-creerArbreProfRouge([[(A,B),(C,D)]],A1,N,G).
  
 +%permet de creer l'arbre d'evaluation
  creerArbreEvalRouge([],[]).
  creerArbreEvalRouge(K,['root'|N]):-isroot(K),creerArbreEvalRougeAux(K,N).
  creerArbreEvalRouge(K,[-1|N]):-afils(K),creerArbreEvalRougeAux(K,N).
 @@ -640,16 +637,16 @@
    Index is Index1+1.
  
  
 -
 +%renvoi la derniere remonté de l'arbre d'evaluation
  getMove([-1|X],CPT,B):-0 is CPT mod 2,getMoveIt(X,CPT,A),min(A,B).
  getMove([-1|X],CPT,B):-1 is CPT mod 2,getMoveIt(X,CPT,A),max(A,B).
  getMove(['root'|X],CPT,A):-getMoveIt(X,CPT,A).
 -
  getMove([A],_,A).
  
  getMoveIt([],_,[]).
  getMoveIt([X|Q],CPT,[A|R]):-CPT1 is CPT+1,getMove(X,CPT1,A),getMoveIt(Q,CPT,R).
  
 +%renvoi le meilleur coup possible DIF represente la profondeur de recherche , elle doit etre inferieur a 4 car on ne peut pas sauvegarder plus de 4 etat du plateau
  bestMoveRouge(DIF,MOVE):-nl,write('creation arbre de jeu'),creerArbreProfRouge('root',0,DIF,A),nl,write('creation arbre value'),creerArbreEvalRouge(A,B),write('recherche du meilleur coup'),nl,getMove(B,0,R),min(R,M),indexOf(R,M,T),T1 is T+1,nth0(T1,A,P),write('meilleur Coup Trouve'),bestMoveFormat(P,MOVE).
  bestMoveOcre(DIF,MOVE):-nl,write('creation arbre de jeu'),creerArbreProfOcre('root',0,DIF,A),nl,write('creation arbre value'),creerArbreEvalOcre(A,B),write('recherche du meilleur coup'),nl,getMove(B,0,R),min(R,M),indexOf(R,M,T),T1 is T+1,nth0(T1,A,P),write('meilleur Coup Trouve'),bestMoveFormat(P,MOVE).
  
 @@ -661,6 +658,7 @@
  doMoveOcre([ (A, B), (C, D)]):-move(A,B,C,D).
  doMoveOcre((A, B)):-place_sbire_ocre(A,B).
  
 +%action de jeu
  tourRougeIA(1,1,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
  tourRougeIA(1,1,DIFR,DIFO):-bestMoveRouge(DIFR,MOVE),doMoveRouge(MOVE),afficher_plat(_),tourOcreIA(1,1,DIFR,DIFO).
  tourRougeIA(1,0,_,_):-termine,victoireOcre,afficher_plat(_),nl,write('Victoire des Ocres').
 @@ -679,4 +677,4 @@
  tourOcre(0,0,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
  tourOcre(0,0,_,_):-afficher_plat(_),choix_moveOcre,tourRouge.
  tourOcre(1,0,_,_):-termine,victoireRouge,afficher_plat(_),nl,write('Victoire des Rouges').
 -tourOcre(1,0,DIF,_):-afficher_plat(_),choix_moveOcre,tourRougeIA(1,0,DIF,_).
 +tourOcre(1,0,DIF,_):-afficher_plat(_),choix_moveOcre,tourRougeIA(1,0,DIF,_). 
