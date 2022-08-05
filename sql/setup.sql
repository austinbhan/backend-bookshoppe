-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS books_authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;


CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR,
    released INT
);

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob VARCHAR NOT NULL,
    pob VARCHAR NOT NULL
);

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

INSERT INTO authors (
    name,
    dob,
    pob
)
VALUES
('Ursula K LeGuin', '1929-10-21', 'Berkeley, CA'),
('Yasumari Kawabata', '1899-06-11', 'Osaka, Japan'),
('Franz Kafka', '1883-07-03', 'Prague, Czechia'),
('Eun Y Kim', '1990-09-23', 'Seoul, S Korea'),
('Robert T Kiyosaki', '1947-04-08', 'Hilo, Hawaii'),
('Milan Kundera', '1929-04-01', 'Brno, Czechoslovakia')
;

CREATE TABLE books_authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    books_id BIGINT,
    author_id BIGINT,
    FOREIGN KEY (books_id) REFERENCES books(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books_authors (
    books_id, 
    author_id
)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);