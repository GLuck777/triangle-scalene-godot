*Projet Triangle Scalene*

Intro 
Environnement 2D pour le jeu, vu sur le dessus de l'ensemble du plateau de jeu (vu de nos cartes et des cartes adverses)

-->[Camera Position sur angle joueur1]
vu recto des cartes du joueur1 , vu verso des cartes du joueur2
**Au même moment**
-->[Camera Position sur angle joueur2 (avec autre écran)]
vu recto des cartes du joueur2 , vu verso des cartes du joueur1

################################################################

--[FENETRE] qui affiche le Tour actuel des joueurs--

** Après choix de l'ensemble des joueurs (choix de cartes remplis) ** 
 -->[Deplacement de la camera vers la zone de confrontation]
1. les deux cartes choisies se dirige vers la zone de confrontation pour l'affrontement
2. Affontement des deux cartes des joueurs (fenetre modale pop-up du "Versus") puis
3. Resultat apres 3s de délai selon le joueur gagnant:
    - [joueur1] : 
        Fenetre modale pop-up "Joueur1 à gagné la manche!"
        changement de camera vers la zone de gagne j1
        les deux cartes se dirigent vers la zone de gagne j1 et se range à la suite des autres 
        Retour sur la camera angle joueur1
        Retour sur la camera angle joueur2
    - [joueur2] : 
        Fenetre modale pop-up "Joueur2 à gagné la manche!"
        changement de camera vers la zone de gagne j2
        les deux cartes se dirigent vers la zone de gagne j2 et se range à la suite des autres 
        Retour sur la camera angle joueur1
        Retour sur la camera angle joueur2
    - [EGALITE] : 
        Fenetre modale pop-up "Egalité !"
        [Effectcartej1] : 
            Fenetre modale pop-up "le joueur1 active son effet de cartes!"
            [Exil] : En cas d'égalité, envoi la carte dans le graveyard 
            Postion camera vers graveyard, (effet special)
            [CarteBONUS] : 
            En cas d'égalité, Récupère la carte Bonus pour le joueur1
            Postion camera vers la zone de carte BONUS, (effet special)
            [Cheval_de_troie] :
            [Grande_Revolution] :
            [Revolution_Industriel] : 
            [Réinitialisation] : 
        [Effectcartej2] : 
            Fenetre modale pop-up "le joueur2 active son effet de cartes!"
            [Exil] : En cas d'égalité, envoi la carte dans le graveyard 
            Postion camera vers graveyard, (effet special)
            [CarteBONUS] : 
            En cas d'égalité, Récupère la carte Bonus pour le joueur1
            Postion camera vers la zone de carte BONUS, (effet special)
            [Cheval_de_troie] :
            [Grande_Revolution] :
            [Revolution_Industriel] : 
            [Réinitialisation] :
        [Pas_d'effets] :
            (Effet special) cartes se déplacent sur le coté de la zone confontation en attendant le prochaine confrontation

        Retour sur la camera angle joueur1
        Retour sur la camera angle joueur2
BOUCLE jusqu'à ce que les deux joueurs n'aient plus aucunes cartes en main 
<Cas_zone_confrontation_non_vide> : Janken (jeu du pierre feuille ciseaux) pour remporter les cartes de la zone
