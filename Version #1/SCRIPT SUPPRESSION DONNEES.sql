DELETE FROM public.commande WHERE True;
DELETE FROM public.navire WHERE True;
DELETE FROM public.station WHERE True;
DELETE FROM public.trajet WHERE True;
DELETE FROM public.programmation WHERE True;
DELETE FROM public.acheteur WHERE True;
DELETE FROM public.passager WHERE True;
DELETE FROM public.vehicule WHERE True;
DELETE FROM public.type_vehicule WHERE True;
DELETE FROM public.ticket WHERE True;


ALTER SEQUENCE id_commande_seq RESTART WITH 1;
ALTER SEQUENCE id_navire_seq RESTART WITH 1;
ALTER SEQUENCE id_station_seq RESTART WITH 1;
ALTER SEQUENCE id_trajet_seq RESTART WITH 1;
ALTER SEQUENCE id_programmation_seq RESTART WITH 1;
ALTER SEQUENCE id_acheteur_seq RESTART WITH 1;
ALTER SEQUENCE id_passager_seq RESTART WITH 1;
ALTER SEQUENCE id_vehicule_seq RESTART WITH 1;
ALTER SEQUENCE id_type_vehicule_seq RESTART WITH 1;
ALTER SEQUENCE id_ticket_seq RESTART WITH 1;