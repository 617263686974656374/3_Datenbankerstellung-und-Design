-- Punkt 1:
CREATE VIEW v_urlaub AS
SELECT mitarbeiter.name, mitarbeiter.vorname, mitarbeiter.urlaubstage, mitarbeiter.urlaubgenommen
FROM mitarbeiter;

-- Punkt 2:
CREATE VIEW v_praemie AS
SELECT mitarbeiter.name, mitarbeiter.vorname, sachpraemie.praemie, sachpraemie.grund
FROM mitarbeiter
JOIN sachpraemie ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid;

-- Punkt 3:
CREATE VIEW v_mitarbeiterbonus AS
SELECT mitarbeiter.name, mitarbeiter.vorname, bonus.bonuszahlung
FROM mitarbeiter
JOIN bonus ON mitarbeiter.mitarbeiterid = bonus.mitarbeiterid
ORDER BY bonus.bonuszahlung;

-- Punkt 4:
CREATE VIEW v_mitarbeiterkrankenkasse AS
SELECT mitarbeiter.name, mitarbeiter.vorname, mitarbeiter.krankenversicherung
FROM mitarbeiter
JOIN krankenkasse ON mitarbeiter.mitarbeiterid = krankenkassenid;



-- Punkt 5:
DROP VIEW v_mitarbeiterkrankenkasse;

