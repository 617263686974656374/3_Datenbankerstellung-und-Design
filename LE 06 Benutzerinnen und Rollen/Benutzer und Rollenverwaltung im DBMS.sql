-- Schritt 1:
CREATE USER 'jaroslav'@'localhost'
IDENTIFIED BY 'secret';

GRANT SELECT, UPDATE, INSERT
ON uebungsdatenbank.artikel
TO 'jaroslav'@'localhost';

-- Schritt 2:
REVOKE ALL, GRANT OPTION
FROM 'jaroslav'@'localhost';

DROP USER 'jaroslav'@'localhost';

-- Schritt 3:
SELECT current_role();

CREATE ROLE vertrieb;
GRANT SELECT, INSERT, UPDATE
ON uebungsdatenbank.artikel
TO  vertrieb;

CREATE USER 'franz'@'localhost'
IDENTIFIED BY 'secret';

CREATE USER 'maria'@'localhost'
IDENTIFIED BY 'secret';

GRANT vertrieb
TO 'franz'@'localhost', 'maria'@'localhost';

SET DEFAULT ROLE ALL TO 'franz'@'localhost', 'maria'@'localhost';

SHOW GRANTS FOR 'franz'@'localhost' USING vertrieb;