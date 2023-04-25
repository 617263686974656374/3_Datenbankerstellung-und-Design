-- Punkt 1:
ALTER TABLE artikel RENAME TO artikelaktuell;

-- Punkt 2:
ALTER TABLE artikelaktuell RENAME COLUMN bezeichnung_artikel TO bezeichnung;

-- Punkt 3:
ALTER TABLE artikelaktuell MODIFY status VARCHAR(300);

-- Punkt 4:
ALTER TABLE artikelaktuell ADD PRIMARY KEY (artikelid);

-- Punkt 5:
ALTER TABLE artikelinfo DROP PRIMARY KEY;

-- Punkt 6:
ALTER TABLE artikelaktuell MODIFY tiefe DECIMAL NOT NULL;

-- Punkt 7:
ALTER TABLE artikelaktuell MODIFY tiefe DECIMAL NULL;

-- Punkt 8:
ALTER TABLE artikelaktuell ALTER COLUMN preis SET DEFAULT 0.00;

-- Punkt 9:
ALTER TABLE artikelaktuell ALTER COLUMN preis DROP DEFAULT;

-- Punkt 10:
ALTER TABLE artikelaktuell ADD UNIQUE (bezeichnung);

-- Punkt 11:
ALTER TABLE artikelaktuell ADD CONSTRAINT preis_check CHECK (preis < 1000);

-- Punkt 12:
ALTER TABLE artikelaktuell DROP CONSTRAINT preis_check;

-- Punkt 13:
ALTER TABLE artikelaktuell ADD COLUMN kommentar VARCHAR(300);

-- Punkt 14:
ALTER TABLE artikelaktuell DROP COLUMN kommentar;

-- Punkt 15:
ALTER TABLE artikelinfo ADD PRIMARY KEY (artikelid);
ALTER TABLE positionartikel ADD CONSTRAINT fk_positionartikel_artikelinfo FOREIGN KEY (fk_artikelinfo_artikelid) REFERENCES artikelinfo(artikelid);

-- Punkt 16:
ALTER TABLE positionartikel DROP CONSTRAINT fk_positionartikel_artikelinfo;

