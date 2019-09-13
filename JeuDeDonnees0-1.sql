INSERT INTO public.navire (
       nom
    , nombre_place_pieton
    , nombre_place_vehicule
) VALUES (
      'SS-TEST' 
    , 500 
    , 180 
)

INSERT INTO public.navire (
       nom
    , nombre_place_pieton
    , nombre_place_vehicule
) VALUES (
      'FA-GAUTHIER' 
    , 500 
    , 180 
)

INSERT INTO public.station (
       nom
) VALUES (
     1
)

INSERT INTO public.station (
       nom
) VALUES (
     2
)

INSERT INTO public.station (
       nom
) VALUES (
     3
)
INSERT INTO public.trajet (
      id_station_depart
    , id_station_arrivee
    , id_navire
) VALUES (
      2
    , 3 
    , 1 
)

INSERT INTO public.trajet (
      id_station_depart
    , id_station_arrivee
    , id_navire
) VALUES (
      4 
    , 2 
    , 1 
)

INSERT INTO public.programmation (
    id_trajet
    , date_arrivee
    , date_depart
    , nom
    , annulation
) VALUES (
      1 
    , '2019-10-12' 
    , '2019-10-11' 
    , 'Baie Comeau-Matane' 
    , false 
)

INSERT INTO public.programmation (
    id_trajet
    , date_arrivee
    , date_depart
    , nom
    , annulation
) VALUES (
      2
    , '2019-10-14' 
    , '2019-10-14' 
    , 'Godbout-Baie Comeau' 
    , false 
)

INSERT INTO public.acheteur (
       telephone
    , mail
) VALUES (
        4187456680
    , 'troisdeuxun@haha.com'
)

INSERT INTO public.acheteur (
       telephone
    , mail
) VALUES (
        4185551982
    , 'undeuxtrois@haha.com'
)

INSERT INTO public.passager (
      nom
    , prenom
    , date_naissance
    , id_acheteur
) VALUES (
      'Dufour' 
    , 'Judith' 
    , '1996-05-22' 
    , 1
)

INSERT INTO public.passager (
      nom
    , prenom
    , date_naissance
    , id_acheteur
) VALUES (
      'Poirier' 
    , 'Guy'
    , '1986-10-10' 
    , 1 
)

INSERT INTO public.passager (
      nom
    , prenom
    , date_naissance
    , id_acheteur
) VALUES (
      'Johnson' 
    , 'Felix'
    , '1999-02-04' 
    , 2
)

INSERT INTO public.commande (
      qrcode
    , date_achat
    , nombre_bagage
    , nombre_animal
    , id_acheteur
) VALUES (
      'AHEIFBG'
    , '2019-10-10' 
    , 0 
    , 1 
    , 1 
)

INSERT INTO public.commande (
      qrcode
    , date_achat
    , nombre_bagage
    , nombre_animal
    , id_acheteur
) VALUES (
      'UGJANGT' 
    , '2019-10-12' 
    , 10 
    , 0 
    , 2
)