-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS books;


CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    released INT NOT NULL
);

-- CREATE TABLE authors (
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR NOT NULL,
--     dob DATE NOT NULL,
--     pob VARCHAR NOT NULL
-- );

INSERT INTO books (
    title,
    released
)
VALUES 
('The Lathe of Heaven', 1997),
('The Sound of the Mountain', 1954),
('The Metamorphosis', 1915),
('The Yin and Yang of American Culture', 2001),
('Rich Dad Poor Dad', 1997),
('The Unbearable Lightness of Being', 1984)
;

-- INSERT INTO authors (
--     name,
--     dob,
--     pob
-- )
-- VALUES
-- ('Ursula K LeGuin', '1929-10-21', 'Berkeley, CA'),
-- ('Yasumari Kawabata', '1899-06-11', 'Osaka, Japan'),
-- ('Franz Kafka', '1883-07-03', 'Prague, Czechia'),
-- ('Eun Y Kim', '19??-??-??', 'Seoul, S Korea'),
-- ('Robert T Kiyosaki', '1947-04-08', 'Hilo, Hawaii'),
-- ('Milan Kundera', '1929-04-01', 'Brno, Czechoslovakia')
-- ;
