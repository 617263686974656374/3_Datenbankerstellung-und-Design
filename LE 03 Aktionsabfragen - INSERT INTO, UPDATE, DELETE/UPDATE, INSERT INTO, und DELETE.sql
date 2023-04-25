-- Punkt 1:
INSERT INTO qualifikationen (qid, bezeichnung, kuerzel, kategorie)
VALUES (1,'SQL', 'ITE', 'Informatik');

ALTER TABLE qualifikationen DROP COLUMN qid;
ALTER TABLE qualifikationen ADD qid INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- Punkt 2:
INSERT INTO qualifikationen (bezeichnung, kuerzel, kategorie)
VALUES ('Sys-Admin', 'ADA', 'Support');

-- Punkt 3:
INSERT INTO qualifikationen (bezeichnung)
VALUES ('Projektleitung');

SELECT *
FROM qualifikationen;

-- Punkt 4:
UPDATE qualglobal
SET bezeichnung = 'Second Level Helpdesk'
WHERE qid = 2;

UPDATE qualglobal
SET bezeichnung = 'First Level Helpdesk', kuerzel = 'FLH'
WHERE qid = 3;


SELECT * FROM qualglobal WHERE qid = 2 OR qid = 3;

-- Punkt 5:

SELECT table_name
FROM information_schema.columns
WHERE column_name = 'kuerzel' ;



UPDATE qualifikationen
SET kuerzel = 'MSO'
WHERE kuerzel IS NULL;

SELECT * FROM qualifikationen;

-- Punkt 6:
DELETE FROM qualglobalarchiv
WHERE qid = 2;

SELECT * FROM qualglobalarchiv;

-- Punkt 7:
DELETE FROM qualglobalarchiv
WHERE qid IN (5, 8, 7);


SELECT * FROM qualglobalarchiv;

-- Punkt 8:
DELETE FROM qualglobalarchiv;


SELECT * FROM qualglobalarchiv;




