CREATE TABLE programmation (
    id_programmation SERIAL,
    id_trajet integer,
	id_navire integer,
	date_depart TIMESTAMP,
	date_arrivee TIMESTAMP,
	nom varchar(250),
	annulation boolean
);

ALTER TABLE public.trajet
	DROP COLUMN id_navire;
ALTER TABLE public.trajet
	DROP COLUMN date_depart
ALTER TABLE public.trajet
	DROP COLUMN date_arrivee
ALTER TABLE public.trajet
	DROP COLUMN nom
ALTER TABLE public.trajet
	DROP COLUMN annumation