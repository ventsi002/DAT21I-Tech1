
DELETE FROM movies WHERE title = 'Spider man';
SELECT * FROM movies;
INSERT INTO movies VALUES ('Spider man');

DELETE FROM movies WHERE title = 'Spider man' LIMIT 1;

UPDATE movies
SET title = 'Spider man 2'
WHERE title = 'Spider man';

ALTER TABLE movies
MODIFY year YEAR;