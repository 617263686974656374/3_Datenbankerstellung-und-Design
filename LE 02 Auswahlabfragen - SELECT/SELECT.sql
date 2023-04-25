SELECT 
	name,
    vorname,
    eintrittsdatum,
    austrittsdatum
FROM
	mitarbeiter
WHERE austrittsdatum IS NOT NULL;

SELECT 
	name,
    vorname,
    eintrittsdatum,
    austrittsdatum,
    austrittsgrund
FROM
	mitarbeiter
WHERE austrittsdatum AND austrittsgrund  IS NOT NULL;

SELECT *
FROM mitarbeiter;

SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb' AND austrittsdatum IS NULL;

SELECT *
FROM mitarbeiter
WHERE urlaubgenommen >= 30 AND austrittsdatum IS NULL;

SELECT *
FROM mitarbeiter
WHERE anzahlkinder >= 1 AND austrittsdatum IS NULL;

SELECT *
FROM mitarbeiter
WHERE eintrittsdatum BETWEEN '1990-01-01' AND '2000-01-01' AND austrittsdatum IS NULL;

SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb' AND geschlecht = 'w' AND austrittsdatum IS NULL;

SELECT *
FROM mitarbeiter
WHERE krankenversicherung IN ('MH Plus Bonn', 'IKK gesund plus');

SELECT *
FROM mitarbeiter
WHERE geschlecht = 'w' AND verheiratet = 'nein' AND anzahlkinder > 0 AND austrittsdatum IS NULL;

SELECT *
FROM krankenkasse
LIMIT 10;

SELECT name, vorname, abteilung
FROM mitarbeiter
ORDER BY abteilung, name, vorname;

SELECT name, vorname, abteilung, bonus
FROM mitarbeiter
ORDER BY abteilung, bonus;

SELECT name AS Name, vorname AS Vorname, strasse AS Strasse, hausnummer AS Hausnummer, plz AS Postleitzahl, ort AS Ort
FROM mitarbeiter;

SELECT DISTINCT ort
FROM mitarbeiter;

