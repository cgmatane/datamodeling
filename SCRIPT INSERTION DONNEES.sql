INSERT INTO public.navire (nom, nombre_place_pieton, nombre_place_vehicule)
  VALUES ('SS-TEST' , 500 , 180);

INSERT INTO public.navire (nom, nombre_place_pieton, nombre_place_vehicule)
  VALUES ('FA-GAUTHIER' , 500 , 180);


INSERT INTO public.station (nom)
  VALUES ('Matane');

INSERT INTO public.station (nom)
 VALUES ('Baie-Comeau');

INSERT INTO public.station (nom)
  VALUES ('Godbout');

INSERT INTO public.trajet (id_station_depart, id_station_arrivee, id_navire)
  VALUES (2, 3 , 1);

INSERT INTO public.trajet (id_station_depart, id_station_arrivee, id_navire)
  VALUES (3 , 2 , 1);


INSERT INTO public.programmation (id_trajet, date_depart, date_arrivee, nom, annulation)
  VALUES (1, '2019-10-11 15:30:00', '2019-10-12 08:00:00', 'Baie-Comeau Matane', False);

INSERT INTO public.programmation (id_trajet, date_depart, date_arrivee, nom, annulation)
  VALUES (2, '2019-10-14 11:00:00', '2019-10-14 17:00:00', 'Godbout Baie-Comeau', False);


INSERT INTO public.acheteur (telephone, mail)
  VALUES (4187456680, 'troisdeuxun@haha.com');

INSERT INTO public.acheteur (telephone, mail)
  VALUES (4185551982, 'undeuxtrois@haha.com');

INSERT INTO public.passager (nom, prenom, date_naissance, id_acheteur)
  VALUES ('Dufour' , 'Judith' , '1996-05-22', 1);


INSERT INTO public.passager (nom, prenom, date_naissance, id_acheteur)
  VALUES ('Poirier' , 'Guy', '1986-10-10', 2);

INSERT INTO public.passager (nom, prenom, date_naissance, id_acheteur)
  VALUES ('Johnson' , 'Felix', '1999-02-04', 2);


INSERT INTO public.type_vehicule (nom, prix_type_vehicule)
  VALUES ('Voiture', 80);

INSERT INTO public.type_vehicule (nom, prix_type_vehicule)
  VALUES ('Voiture avec remorque', 150);

INSERT INTO public.type_vehicule (nom, prix_type_vehicule)
  VALUES ('Camionette', 100);

INSERT INTO public.type_vehicule (nom, prix_type_vehicule)
  VALUES ('Poids lourd', 130);


INSERT INTO public.vehicule (type_vehicule, couleur, immatriculation, modele, marque)
  VALUES (1, 'Rouge', '752FG', '206', 'Peugeot');

INSERT INTO public.vehicule (type_vehicule, couleur, immatriculation, modele, marque)
  VALUES (2, 'Vert', '933KC', 'Berline', 'Mercedes');


INSERT INTO public.commande (id_vehicule, qrcode, date_achat, nombre_bagage, nombre_animal, id_acheteur)
  VALUES (1, 'AHEIFBG', '2019-10-10' , 0 , 1 , 1);

INSERT INTO public.commande (id_vehicule, qrcode, date_achat, nombre_bagage, nombre_animal, id_acheteur)
  VALUES (2, 'UGJANGT' , '2019-10-12' , 10 , 0 , 2);


INSERT INTO public.ticket(id_programmation, prix, id_commande)
  VALUES(1, 300, 1);

INSERT INTO public.ticket(id_programmation, prix, id_commande)
  VALUES(2, 300, 2);