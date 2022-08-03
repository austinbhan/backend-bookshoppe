-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR,
    author VARCHAR
);

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    author BIGINT,
    date_of_birth VARCHAR,
    place_of_birth VARCHAR
);

CREATE TABLE books/authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    book_id BIGINT,
    author_id BIGINT,
    FOREIGN KEY (book_id) REFERENCES books(id)
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books (
    id,
    title,
    author
)
VALUES
(1, 'The Lathe of Heaven', 'Ursula K LeGuin')
(2, 'The Sound of the Mountain', 'Yasumari Kawabata')
(3, 'The Metamorphosis', 'Franz Kafka')
(4, 'The Yin and Yang of American Culture', 'Eun Y Kim')
(5, 'Rich Dad Poor Dad', 'Eun Y Kim')
(6, 'The Unbearable Lightness of Being', 'Milan Kundera')
;

INSERT INTO authors (
    id,
    author,
    date_of_birth,
    place_of_birth
)
VALUES
(1, 'Ursula K LeGuin', '10/21/1929', 'Berkeley, CA')
(2, 'Yasumari Kawabata', '6/11/1899', 'Osaka, Japan')
(3, 'Franz Kafka', '7/3/1883', 'Prague, Czechia')
(4, 'Eun Y Kim', '??/??/19??', 'Seoul, South Korea')
(5, 'Robert T Kiyosaki', '4/8/1947', 'Hilo, Hawaii')
(6, 'Milan Kundera', '4/1/1929', 'Brno, Czechoslovaki')
;

INSERT INTO books/authors (
    book_id,
    author_id
)
VALUES
(1,1)
(2,2)
(2,3)
(3,3)
(3,4)
(4,4)
(5,4)
(6,5)
;