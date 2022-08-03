-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR,
    released INT
);

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    dob DATE,
    pob VARCHAR
);

INSERT INTO books (
    id,
    title,
    released
)
VALUES 
(1, 'The Lathe of Heaven', 1997),
(2, 'The Sound of the Mountain', 1954),
(3, 'The Metamorphosis', 1915),
(4, 'The Yin and Yang of American Culture', 2001),
(5, 'Rich Dad Poor Dad', 1997),
(6, 'The Unbearable Lightness of Being', 1984)
;

INSERT INTO authors (
    name,
    dob,
    pob
)
VALUES
('Ursula K LeGuin', '1929-10-21', 'Berkeley, CA'),
('Yasumari Kawabata', '1899-06-11', 'Osaka, Japan'),
('Franz Kafka', '1883-07-03', 'Prague, Czechia'),
('Eun Y Kim', '19??-??-??', 'Seoul, S Korea'),
('Robert T Kiyosaki', '1947-04-08', 'Hilo, Hawaii'),
('Milan Kundera', '1929-04-01', 'Brno, Czechoslovakia')
;
