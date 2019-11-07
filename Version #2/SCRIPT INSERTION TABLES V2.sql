--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-07 00:01:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 16585)
-- Name: navire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navire (
    id_navire integer NOT NULL,
    nom character varying,
    nombre_place_pieton integer,
    nombre_place_vehicule integer NOT NULL
);


ALTER TABLE public.navire OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16583)
-- Name: id_navire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_navire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_navire_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 204
-- Name: id_navire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_navire_seq OWNED BY public.navire.id_navire;


--
-- TOC entry 197 (class 1259 OID 16519)
-- Name: passager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passager (
    id_passager integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    date_naissance date NOT NULL,
    id_ticket integer
);


ALTER TABLE public.passager OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16517)
-- Name: id_passager_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_passager_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_passager_seq OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 196
-- Name: id_passager_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_passager_seq OWNED BY public.passager.id_passager;


--
-- TOC entry 203 (class 1259 OID 16574)
-- Name: station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station (
    id_station integer NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.station OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16572)
-- Name: id_station_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_station_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_station_seq OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 202
-- Name: id_station_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_station_seq OWNED BY public.station.id_station;


--
-- TOC entry 209 (class 1259 OID 16615)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    id_trajet integer NOT NULL,
    prix numeric NOT NULL,
    qrcode character varying(7) NOT NULL,
    date_achat date NOT NULL,
    nombre_bagage integer,
    nombre_animal integer,
    telephone numeric,
    mail character varying(250)
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16613)
-- Name: id_ticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_ticket_seq OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 208
-- Name: id_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_ticket_seq OWNED BY public.ticket.id_ticket;


--
-- TOC entry 207 (class 1259 OID 16596)
-- Name: trajet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trajet (
    id_trajet integer NOT NULL,
    id_station_depart integer NOT NULL,
    id_station_arrivee integer NOT NULL,
    id_navire integer NOT NULL,
    date_depart timestamp without time zone,
    date_arrivee timestamp without time zone,
    nom character varying(250),
    annulation boolean
);


ALTER TABLE public.trajet OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16594)
-- Name: id_trajet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_trajet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_trajet_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 206
-- Name: id_trajet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_trajet_seq OWNED BY public.trajet.id_trajet;


--
-- TOC entry 199 (class 1259 OID 16541)
-- Name: type_vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_vehicule (
    id_type_vehicule integer NOT NULL,
    nom character varying NOT NULL,
    prix_type_vehicule numeric NOT NULL
);


ALTER TABLE public.type_vehicule OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16539)
-- Name: id_type_vehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_type_vehicule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_type_vehicule_seq OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 198
-- Name: id_type_vehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_type_vehicule_seq OWNED BY public.type_vehicule.id_type_vehicule;


--
-- TOC entry 201 (class 1259 OID 16552)
-- Name: vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicule (
    id_vehicule integer NOT NULL,
    type_vehicule integer NOT NULL,
    couleur character varying NOT NULL,
    immatriculation character varying NOT NULL,
    modele character varying NOT NULL,
    marque character varying NOT NULL,
    id_ticket integer NOT NULL
);


ALTER TABLE public.vehicule OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16550)
-- Name: id_vehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_vehicule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_vehicule_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 200
-- Name: id_vehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_vehicule_seq OWNED BY public.vehicule.id_vehicule;


--
-- TOC entry 211 (class 1259 OID 16626)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16624)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2724 (class 2604 OID 16588)
-- Name: navire id_navire; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navire ALTER COLUMN id_navire SET DEFAULT nextval('public.id_navire_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 16522)
-- Name: passager id_passager; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passager ALTER COLUMN id_passager SET DEFAULT nextval('public.id_passager_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 16577)
-- Name: station id_station; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station ALTER COLUMN id_station SET DEFAULT nextval('public.id_station_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 16618)
-- Name: ticket id_ticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket ALTER COLUMN id_ticket SET DEFAULT nextval('public.id_ticket_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 16599)
-- Name: trajet id_trajet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trajet ALTER COLUMN id_trajet SET DEFAULT nextval('public.id_trajet_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 16544)
-- Name: type_vehicule id_type_vehicule; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_vehicule ALTER COLUMN id_type_vehicule SET DEFAULT nextval('public.id_type_vehicule_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16629)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 16555)
-- Name: vehicule id_vehicule; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule ALTER COLUMN id_vehicule SET DEFAULT nextval('public.id_vehicule_seq'::regclass);


--
-- TOC entry 2737 (class 2606 OID 16593)
-- Name: navire id_navire; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navire
    ADD CONSTRAINT id_navire PRIMARY KEY (id_navire);


--
-- TOC entry 2729 (class 2606 OID 16527)
-- Name: passager id_passager; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passager
    ADD CONSTRAINT id_passager PRIMARY KEY (id_passager);


--
-- TOC entry 2735 (class 2606 OID 16582)
-- Name: station id_station; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT id_station PRIMARY KEY (id_station);


--
-- TOC entry 2741 (class 2606 OID 16623)
-- Name: ticket id_ticket; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT id_ticket PRIMARY KEY (id_ticket);


--
-- TOC entry 2739 (class 2606 OID 16601)
-- Name: trajet id_trajet; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trajet
    ADD CONSTRAINT id_trajet PRIMARY KEY (id_trajet);


--
-- TOC entry 2731 (class 2606 OID 16549)
-- Name: type_vehicule id_type_vehicule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_vehicule
    ADD CONSTRAINT id_type_vehicule PRIMARY KEY (id_type_vehicule);


--
-- TOC entry 2733 (class 2606 OID 16560)
-- Name: vehicule id_vehicule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT id_vehicule PRIMARY KEY (id_vehicule);


--
-- TOC entry 2743 (class 2606 OID 16636)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2745 (class 2606 OID 16634)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 16704)
-- Name: vehicule id_ticket_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT id_ticket_fk FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2746 (class 2606 OID 16709)
-- Name: passager id_ticket_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passager
    ADD CONSTRAINT id_ticket_fk FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 16695)
-- Name: ticket id_trajet_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT id_trajet_fk FOREIGN KEY (id_trajet) REFERENCES public.trajet(id_trajet) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2751 (class 2606 OID 16672)
-- Name: trajet navire_trajet_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trajet
    ADD CONSTRAINT navire_trajet_fk FOREIGN KEY (id_navire) REFERENCES public.navire(id_navire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2750 (class 2606 OID 16667)
-- Name: trajet station_trajet_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trajet
    ADD CONSTRAINT station_trajet_fk FOREIGN KEY (id_station_arrivee) REFERENCES public.station(id_station) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2749 (class 2606 OID 16662)
-- Name: trajet station_trajet_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trajet
    ADD CONSTRAINT station_trajet_fk2 FOREIGN KEY (id_station_depart) REFERENCES public.station(id_station) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2747 (class 2606 OID 16647)
-- Name: vehicule type_vehicule_vehicule_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT type_vehicule_vehicule_fk FOREIGN KEY (type_vehicule) REFERENCES public.type_vehicule(id_type_vehicule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1718 (class 826 OID 16689)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO admin_user;


-- Completed on 2019-11-07 00:01:35

--
-- PostgreSQL database dump complete
--

