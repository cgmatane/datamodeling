-- FUNCTION: public."insererTrajets"()

-- DROP FUNCTION public."insererTrajets"();

CREATE OR REPLACE FUNCTION public."insererTrajets"(
	)
    RETURNS void
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	beginDate TIMESTAMP WITHOUT TIME ZONE := '2019-11-11';
	endDate TIMESTAMP WITHOUT TIME ZONE := '2019-12-20';
	nRows INTEGER  := 10000;
	
	randomDate TIMESTAMP WITHOUT TIME ZONE;
	randomPourcentage DOUBLE PRECISION;
	navireId INTEGER;
	stationDepartId INTEGER;
	stationArriveeId INTEGER;
	i INTEGER;

BEGIN
	FOR i in 1..nRows LOOP
		navireId := (SELECT id_navire FROM public.navire OFFSET floor(random()*(SELECT COUNT(*) FROM public.navire)) LIMIT 1);
		stationDepartId := (SELECT id_station FROM public.station OFFSET floor(random()*(SELECT COUNT(*) FROM public.station)) LIMIT 1);
		stationArriveeId := (SELECT id_station FROM public.station OFFSET floor(random()*(SELECT COUNT(*) FROM public.station)) LIMIT 1);
		randomDate := beginDate + (endDate - beginDate) * random();
		INSERT INTO public.trajet(id_station_depart, id_station_arrivee, id_navire, date_depart, date_arrivee, nom, annulation) VALUES(stationDepartId, stationArriveeId, navireId, randomDate, randomDate, 'nom trajet', False);	
	END LOOP;
END; $BODY$;

ALTER FUNCTION public."insererTrajets"()
    OWNER TO postgres;
