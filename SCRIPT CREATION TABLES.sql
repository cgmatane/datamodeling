DROP SEQUENCE IF EXISTS id_ticket_seq;
DROP SEQUENCE IF EXISTS id_programmation_seq;
DROP SEQUENCE IF EXISTS id_trajet_seq;
DROP SEQUENCE IF EXISTS id_navire_seq;
DROP SEQUENCE IF EXISTS id_station_seq;
DROP SEQUENCE IF EXISTS id_commande_seq;
DROP SEQUENCE IF EXISTS id_vehicule_seq;
DROP SEQUENCE IF EXISTS id_type_vehicule_seq;
DROP SEQUENCE IF EXISTS id_acheteur_seq;
DROP SEQUENCE IF EXISTS id_passager_seq;

DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS programmation;
DROP TABLE IF EXISTS trajet;
DROP TABLE IF EXISTS navire;
DROP TABLE IF EXISTS station;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS vehicule;
DROP TABLE IF EXISTS type_vehicule;
DROP TABLE IF EXISTS acheteur;
DROP TABLE IF EXISTS passager;

CREATE SEQUENCE public.id_passager_seq;

CREATE TABLE public.passager (
    id_passager INTEGER NOT NULL DEFAULT nextval('public.id_passager_seq'),
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    CONSTRAINT id_passager PRIMARY KEY (id_passager)
);


ALTER SEQUENCE public.id_passager_seq OWNED BY public.passager.id_passager;

CREATE SEQUENCE public.id_acheteur_seq;

CREATE TABLE public.acheteur (
    id_acheteur INTEGER NOT NULL DEFAULT nextval('public.id_acheteur_seq'),
    telephone NUMERIC,
    mail VARCHAR,
    id_passager INTEGER NOT NULL,
    CONSTRAINT id_acheteur PRIMARY KEY (id_acheteur)
);


ALTER SEQUENCE public.id_acheteur_seq OWNED BY public.acheteur.id_acheteur;

CREATE SEQUENCE public.id_type_vehicule_seq;

CREATE TABLE public.type_vehicule (
    id_type_vehicule INTEGER NOT NULL DEFAULT nextval('public.id_type_vehicule_seq'),
    nom VARCHAR NOT NULL,
    prix_type_vehicule NUMERIC NOT NULL,
    CONSTRAINT id_type_vehicule PRIMARY KEY (id_type_vehicule)
);


ALTER SEQUENCE public.id_type_vehicule_seq OWNED BY public.type_vehicule.id_type_vehicule;

CREATE SEQUENCE public.id_vehicule_seq;

CREATE TABLE public.vehicule (
    id_vehicule INTEGER NOT NULL DEFAULT nextval('public.id_vehicule_seq'),
    type_vehicule INTEGER NOT NULL,
    couleur VARCHAR NOT NULL,
    immatriculation VARCHAR NOT NULL,
    modele VARCHAR NOT NULL,
    marque VARCHAR NOT NULL,
    CONSTRAINT id_vehicule PRIMARY KEY (id_vehicule)
);


ALTER SEQUENCE public.id_vehicule_seq OWNED BY public.vehicule.id_vehicule;

CREATE SEQUENCE public.id_commande_seq;

CREATE TABLE public.commande (
    id_commande INTEGER NOT NULL DEFAULT nextval('public.id_commande_seq'),
    id_vehicule INTEGER NOT NULL,
    qrcode VARCHAR NOT NULL,
    date_achat DATE NOT NULL,
    nombre_bagage INTEGER NOT NULL,
    nombre_animal INTEGER NOT NULL,
    id_acheteur INTEGER NOT NULL,
    CONSTRAINT id_commande PRIMARY KEY (id_commande)
);


ALTER SEQUENCE public.id_commande_seq OWNED BY public.commande.id_commande;

CREATE SEQUENCE public.id_station_seq;

CREATE TABLE public.station (
    id_station INTEGER NOT NULL DEFAULT nextval('public.id_station_seq'),
    nom VARCHAR NOT NULL,
    CONSTRAINT id_station PRIMARY KEY (id_station)
);


ALTER SEQUENCE public.id_station_seq OWNED BY public.station.id_station;

CREATE SEQUENCE public.id_navire_seq;

CREATE TABLE public.navire (
    id_navire INTEGER NOT NULL DEFAULT nextval('public.id_navire_seq'),
    nom VARCHAR NOT NULL,
    nombre_place_pieton INTEGER NOT NULL,
    nombre_place_vehicule INTEGER NOT NULL,
    CONSTRAINT id_navire PRIMARY KEY (id_navire)
);


ALTER SEQUENCE public.id_navire_seq OWNED BY public.navire.id_navire;

CREATE SEQUENCE public.id_trajet_seq;

CREATE TABLE public.trajet (
    id_trajet INTEGER NOT NULL DEFAULT nextval('public.id_trajet_seq'),
    id_station_depart INTEGER NOT NULL,
    id_station_arrivee INTEGER NOT NULL,
    id_navire INTEGER NOT NULL,
    CONSTRAINT id_trajet PRIMARY KEY (id_trajet)
);


ALTER SEQUENCE public.id_trajet_seq OWNED BY public.trajet.id_trajet;

CREATE SEQUENCE public.id_programmation_seq;

CREATE TABLE public.programmation (
    id_programmation INTEGER NOT NULL DEFAULT nextval('public.id_programmation_seq'),
    id_trajet INTEGER NOT NULL,
    date_arrivee DATE NOT NULL,
    date_arrivee_1 DATE NOT NULL,
    nom VARCHAR NOT NULL,
    annulation BOOLEAN NOT NULL,
    CONSTRAINT id_programmation PRIMARY KEY (id_programmation)
);


ALTER SEQUENCE public.id_programmation_seq OWNED BY public.programmation.id_programmation;

CREATE SEQUENCE public.id_ticket_seq;

CREATE TABLE public.ticket (
    id_ticket INTEGER NOT NULL DEFAULT nextval('public.id_ticket_seq'),
    id_programmation INTEGER NOT NULL,
    prix NUMERIC NOT NULL,
    id_commande INTEGER NOT NULL,
    CONSTRAINT id_ticket PRIMARY KEY (id_ticket)
);


ALTER SEQUENCE public.id_ticket_seq OWNED BY public.ticket.id_ticket;

ALTER TABLE public.acheteur ADD CONSTRAINT passager_acheteur_fk
FOREIGN KEY (id_passager)
REFERENCES public.passager (id_passager)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT acheteur_commande_fk
FOREIGN KEY (id_acheteur)
REFERENCES public.acheteur (id_acheteur)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.vehicule ADD CONSTRAINT type_vehicule_vehicule_fk
FOREIGN KEY (type_vehicule)
REFERENCES public.type_vehicule (id_type_vehicule)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT vehicule_commande_fk
FOREIGN KEY (id_vehicule)
REFERENCES public.vehicule (id_vehicule)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT commande_ticket_fk
FOREIGN KEY (id_commande)
REFERENCES public.commande (id_commande)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.trajet ADD CONSTRAINT station_trajet_fk2
FOREIGN KEY (id_station_depart)
REFERENCES public.station (id_station)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.trajet ADD CONSTRAINT station_trajet_fk
FOREIGN KEY (id_station_arrivee)
REFERENCES public.station (id_station)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.trajet ADD CONSTRAINT navire_trajet_fk
FOREIGN KEY (id_navire)
REFERENCES public.navire (id_navire)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.programmation ADD CONSTRAINT trajet_programmation_fk
FOREIGN KEY (id_trajet)
REFERENCES public.trajet (id_trajet)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT programmation_ticket_fk
FOREIGN KEY (id_programmation)
REFERENCES public.programmation (id_programmation)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;