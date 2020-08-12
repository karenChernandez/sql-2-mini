-- CREATE TABLE cohorts(
--   cohort_id SERIAL PRIMARY KEY,
--   name VARCHAR(10),
--   instructor TEXT);

-- INSERT INTO cohorts(name, instructor)
-- VALUES
-- ('WR2', 'Matt Boduly'),
-- ('WR3', 'Bruce Wayne'),
-- ('WR4', 'Andrew Westenskow');


-- SELECT * FROM cohorts;

-- CREATE TABLE students(
--   students_id SERIAL PRIMARY KEY,
--   cohort_id INT REFERENCES cohorts(cohort_id),
--   name TEXT,
--   email VARCHAR(64));

--   INSERT INTO students(cohort_id, name, email)
--   VALUES
--   (1,'Big Bird', 'big@bird.ses'),
--   (1, 'Oscar', 'grouch@trash.ses'),
--   (2, 'Elmo', 'tickleme@creep.ses'),
--   (2, 'Cookie Monster', 'cookie@chip.yum'),
--   (3, 'The Count', 'ahahaha@count.count');

-- SELECT *
-- FROM students
--     JOIN cohorts
--     ON students.cohort_id = cohorts.cohort.id

-- FOREIGN KEYS- NEW TABLE
CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    title TEXT,
    media_type_id INT REFERENCES media_type(media_type_id)
);
INSERT INTO movie(title, media_type_id)
VALUES
('Happy Gilmore', 3);
-- when creating a NEW column you need to specify(INT) and use REFERENCES to refer to the other table
ALTER TABLE movie
ADD COLUMN genre_id INT REFERENCES genre(genre_id);


-- updating the entry in movie to a genre_id
UPDATE movie
SET genre_id = 22
WHERE title ='Happy Gilmore'

-- what do I want to join
SELECT * FROM movie
-- what are we joining
JOIN genre ON  movie.genre_id = genre_id


-- Join the artist and album tables to list out the artist name and album name.
SELECT album.title, artist.name
FROM album
JOIN artist ON artist.artist_id = album.artist_id;


-- Use a sub-select statementto get all tracks from the Track table where the genre_id is either Jazz or Blues.
SELECT * FROM track WHERE genre_id IN(
--instead of hardcoding it like this (2,6) we can make it interactive...
    SELECT genre_id FROM genre
    WHERE name IN ('Jazz', 'Blues')
);


