-- Punkt 1:
SELECT name, vorname FROM niederlassungbelgien
UNION
SELECT name, vorname FROM niederlassungholland;


-- Punkt 2:
SELECT name, vorname FROM niederlassungholland
UNION ALL
SELECT name, vorname FROM niederlassungbelgien;

-- Punkt 3:
SELECT DISTINCT name, vorname FROM niederlassungholland
UNION
SELECT DISTINCT name, vorname FROM niederlassungbelgien
UNION
SELECT DISTINCT name, vorname FROM niederlassungschweiz;

-- Punkt 4:
SELECT A.name, A.vorname
FROM niederlassungholland AS A
JOIN niederlassungbelgien AS B
ON A.name = B.name AND A.vorname = B.vorname;


-- Punkt 5:
SELECT name, vorname
FROM niederlassungholland
WHERE (name, vorname) NOT IN (
    SELECT name, vorname
    FROM niederlassungbelgien
);


-- Punkt 6:
SELECT DISTINCT name, vorname, status
FROM (
    SELECT name, vorname, status
    FROM niederlassungholland
    WHERE status = 'aktiv'

    UNION ALL

    SELECT name, vorname, status
    FROM niederlassungbelgien
    WHERE status = 'aktiv'
) AS aktiv_mitarbeiter;


-- Punkt 7:
(SELECT name, vorname
FROM niederlassungholland)

UNION

(SELECT name, vorname
FROM niederlassungbelgien)

ORDER BY name;
