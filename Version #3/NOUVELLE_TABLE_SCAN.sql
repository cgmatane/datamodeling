CREATE TABLE scan (
   	id_scan int,
	id_ticket int,
	id_trajet int,
	qr_code varchar(7),
	date_achat varchar(10),
	telephone varchar(10),
	commentaires varchar,
	relation_passagers text,
	relation_vehicule text
	
); -- dédicace à Antoine Richard

INSERT INTO public.scan(
	id_scan, id_ticket, id_trajet, qr_code, date_achat, telephone, commentaires, relation_passagers, relation_vehicule)
	VALUES (1, null, null, '', '', '', '', '{}', '{}');
