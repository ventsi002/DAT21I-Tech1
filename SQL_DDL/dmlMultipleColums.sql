SELECT year FROM movies;

SELECT * FROM movies WHERE 1 = 1;
SELECT * FROM movies WHERE 2 * 2 = 4;

SELECT * FROM movies ORDER BY year;
SELECT * FROM movies ORDER BY year ASC;
SELECT * FROM movies ORDER BY year DESC;



INSERT INTO movies(title, year) VALUES('Toy story' , 2006);
INSERT INTO movies VALUES('Toy story', 2006);
INSERT INTO movies (title) VALUES ('Toy story');