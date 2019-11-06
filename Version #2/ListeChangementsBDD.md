## Liste changements sur la BDD de la Billeterie:

..* Fusion de la table "programmation" avec "trajet" (trajet contient maintenant tous les champs qui étaient propre à programmation)

..* Changement de la colonne "id_programmation" dans la table "ticket" pour "id_trajet"

..* Fusion de la table "commande" avec "ticket" (ticket contient maintenant tous les champs qui étaient propre à commande)

..* Suppression de la colonne "id_commande" dans la table "ticket"

..* Fusion de la table "acheteur" avec "passager" (passager contient maintenant tous les champs qui étaient propre à acheteur)

..* Suppression de la colonne "id_acheteur" dans la table "passager"

..* Mise à jour des FK pour les nouveaux champs "id_XX" sur les tables

..* La colonne "id_vehicule" qui était précédemment sur "commande" a étée remplacée par "id_ticket" sur la table "vehicule"

# Tables n'existant plus:
..* programmation
..* commande
..* acheteur