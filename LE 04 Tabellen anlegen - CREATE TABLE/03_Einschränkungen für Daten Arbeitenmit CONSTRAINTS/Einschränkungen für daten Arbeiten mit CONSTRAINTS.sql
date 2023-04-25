-- Punkt 1:
CREATE TABLE produktionsmaschinen (
maschinenID INT,
variante INT,
bezeichnung VARCHAR(200),
PRIMARY KEY (maschinenID, variante)
);

INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung) VALUES (1, 1, 'Maschine A - Variante 1');
INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung) VALUES (1, 2, 'Maschine A - Variante 2');
INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung) VALUES (2, 1, 'Maschine B - Variante 1');
INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung) VALUES (2, 2, 'Maschine B - Variante 2');

SELECT *
FROM produktionsmaschinen;

-- Punkt 2:
DROP TABLE produktionsmaschinen;

CREATE TABLE produktionsmaschinen (
    globalID INT NOT NULL AUTO_INCREMENT,
    maschinenID INT NOT NULL,
    variante INT NOT NULL,
    bezeichnung VARCHAR(200) NOT NULL,
    PRIMARY KEY (globalID),
    UNIQUE (maschinenID, variante)
);

INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung) VALUES 
    (2, 1, 'Maschine 2, Variante 1'),
    (2, 2, 'Maschine 2, Variante 2'),
    (3, 1, 'Maschine 3, Variante 1'),
    (3, 2, 'Maschine 3, Variante 2');

SELECT *
FROM produktionsmaschinen;

-- Punkt 3:
DROP TABLE produktionsmaschinen;

CREATE TABLE produktionsmaschinen (
    globalID INT NOT NULL AUTO_INCREMENT,
    maschinenID INT NOT NULL,
    variante INT NOT NULL,
    bezeichnung VARCHAR(50) NOT NULL,
    laufzeit INT NOT NULL,
    maxlaufzeit INT NOT NULL,
    PRIMARY KEY (globalID),
    UNIQUE (maschinenID, variante),
    CHECK (laufzeit < maxlaufzeit)
);

INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung, laufzeit, maxlaufzeit) VALUES 
    (4, 1, 'Maschine 4, Variante 1', 2, 5),
    (4, 2, 'Maschine 4, Variante 2', 3, 6);
    


SELECT *
FROM produktionsmaschinen;

INSERT INTO produktionsmaschinen (maschinenID, variante, bezeichnung, laufzeit, maxlaufzeit) VALUES 
    (4, 1, 'Maschine 4, Variante 1', 2, 6);




