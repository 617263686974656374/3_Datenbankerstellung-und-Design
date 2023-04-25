CREATE TABLE mageschenk (
geschenkID SMALLINT PRIMARY KEY,
artikel VARCHAR(200) NOT NULL,
preis DECIMAL(5,2) NOT NULL,
jahrezugehörigkeit SMALLINT NOT NULL
);

ALTER TABLE mageschenk
ADD CONSTRAINT artikel UNIQUE (artikel);

INSERT INTO mageschenk (geschenkID, artikel, preis, jahrezugehörigkeit) VALUES (1, 'Geschenk A', 50.00, 5);
INSERT INTO mageschenk (geschenkID, artikel, preis, jahrezugehörigkeit) VALUES (2, 'Geschenk B', 100.00, 10);

SELECT *
FROM mageschenk;


INSERT INTO mageschenk (geschenkID, artikel, preis, jahrezugehörigkeit) VALUES (3, 'Geschenk A', 50.00, 5);


DROP TABLE mageschenk;

-- Punkt 3:
CREATE TABLE mageschenk (
geschenkID SMALLINT PRIMARY KEY,
artikel VARCHAR(200) UNIQUE NOT NULL,
preis DECIMAL(5,2) NOT NULL DEFAULT 0.00,
jahrezugehörigkeit SMALLINT NOT NULL
);

-- Punkt 4:
ALTER TABLE mageschenk
ADD CONSTRAINT check_jahrezugehörigkeit CHECK (jahrezugehörigkeit IN (5, 10, 15, 20));

INSERT INTO mageschenk (geschenkID, artikel, preis, jahrezugehörigkeit) VALUES (1, 'Geschenk A', 50.00, 5);
INSERT INTO mageschenk (geschenkID, artikel, preis, jahrezugehörigkeit) VALUES (2, 'Geschenk B', 100.00, 10);

-- Der folgende INSERT-Befehl führt zu einer Fehlermeldung, da die jahrezugehoerigkeit '3' nicht erlaubt ist.
INSERT INTO mageschenk (id, artikel, preis, jahrezugehoerigkeit) VALUES (3, 'Geschenk C', 30.00, 3);

-- Die Fehlermeldung wäre etwa: "Check constraint 'check_jahrezugehoerigkeit' is violated", was besagt, dass der Wert '3' für die Spalte jahrezugehoerigkeit nicht erlaubt ist und somit das Einfügen des Datensatzes fehlschlägt.
