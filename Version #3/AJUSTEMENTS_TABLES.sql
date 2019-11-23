
CREATE SEQUENCE public.id_intervalle_age_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.intervalle_age
(
    id_intervalle_age integer NOT NULL DEFAULT nextval('id_intervalle_age_seq'::regclass),
    age_min integer NOT NULL,
    age_max integer NOT NULL,
    tarif numeric(6,2),
    CONSTRAINT intervalle_age_pkey PRIMARY KEY (id_intervalle_age)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.intervalle_age
    OWNER to postgres;

INSERT INTO public.intervalle_age(age_min, age_max, tarif) VALUES (0,17,1500);
INSERT INTO public.intervalle_age(age_min, age_max, tarif) VALUES (18,60,4000);
INSERT INTO public.intervalle_age(age_min, age_max, tarif) VALUES (61,999,3500);

ALTER TABLE public.ticket DROP COLUMN nombre_bagage;
ALTER TABLE public.ticket DROP COLUMN nombre_animal;
ALTER TABLE public.passager DROP COLUMN date_naissance;
ALTER TABLE public.vehicule DROP COLUMN modele;

ALTER TABLE public.ticket ADD COLUMN numero_facture integer;
ALTER TABLE public.ticket ADD COLUMN commentaires varchar;
UPDATE public.ticket SET numero_facture = 0 WHERE True;
UPDATE public.ticket SET commentaires = 'N/A' WHERE True;
ALTER TABLE public.ticket ALTER COLUMN numero_facture SET NOT NULL;
ALTER TABLE public.ticket ALTER COLUMN commentaires SET NOT NULL;

ALTER TABLE public.type_vehicule RENAME COLUMN prix_type_vehicule TO tarif;

ALTER TABLE public.passager ADD COLUMN id_intervalle_age integer;
UPDATE public.passager SET id_intervalle_age = 1 WHERE True;
ALTER TABLE public.passager ALTER COLUMN id_intervalle_age SET NOT NULL;

ALTER TABLE public.vehicule ADD COLUMN poids_eleve boolean;
UPDATE public.vehicule SET poids_eleve = False WHERE True;
ALTER TABLE public.vehicule ALTER COLUMN poids_eleve SET NOT NULL;

ALTER TABLE ONLY public.passager ADD CONSTRAINT intervalle_age_passager_fk FOREIGN KEY (id_intervalle_age) REFERENCES public.intervalle_age(id_intervalle_age) ON UPDATE CASCADE ON DELETE CASCADE;
