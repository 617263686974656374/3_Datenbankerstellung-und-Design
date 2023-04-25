SELECT DISTINCT mitarbeiter.vorname, mitarbeiter.name
FROM mitarbeiter
JOIN sachpraemie ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid;

SELECT mitarbeiter.vorname, mitarbeiter.name, SUM(sachpraemie.preis) AS summe_der_preise
FROM mitarbeiter
JOIN sachpraemie ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid
GROUP BY mitarbeiter.mitarbeiterid;

SELECT mitarbeiter.vorname, mitarbeiter.name
FROM mitarbeiter
WHERE mitarbeiter.steuerklasse NOT IN (
    SELECT steuerklasse.steuerklasseid
    FROM steuerklasse
);


SELECT mitarbeiter.vorname, mitarbeiter.name
FROM mitarbeiter
WHERE NOT EXISTS (
    SELECT 1 FROM steuerklasse
    WHERE mitarbeiter.steuerklasse = steuerklasse.steuerklasseid
);





