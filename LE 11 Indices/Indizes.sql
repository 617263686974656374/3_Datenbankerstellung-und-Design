-- Punkt 1:
CREATE INDEX index_arbeitszeit_mitarbeiter ON arbeitszeit(mitarbeiterid);
SHOW INDEXES FROM arbeitszeit;

-- Punkt 2:
CREATE INDEX index_plzort ON kreditinstitutneu(ort, plz);

INSERT INTO kreditinstitutneu (bankid, bankleitzahl, bezeichnung, plz, ort) VALUES
	(1,200,  'Programmier', 1111, 'Wien'),
    (2,250, 'Technik', 2222, 'Bratislava'),
    (3,100, 'Elektrotechnik', 3333, 'Prague'),
    (4,50, 'Automatisierung', 10789, 'Berlin'),
    (5,60, 'Medien', 10789, 'Berlin');

SELECT * FROM kreditinstitutneu WHERE ort='Berlin' AND plz=10789;
SHOW INDEXES FROM kreditinstitutneu;

DROP INDEX index_arbeitszeit_mitarbeiter ON arbeitszeit;
DROP INDEX index_plzort ON kreditinstitutneu;
