-- задание 1 (творческое задание) 
--  составьте БД (минимум из 3 таблиц) на произвольную тему  и напишите минимум 10 запросов к этой БД

CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY,
    author_name TEXT,
    birth_date TEXT,
    nationality TEXT
);

CREATE TABLE Genres (
    genre_id INTEGER PRIMARY KEY,
    genre_name TEXT
);

CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    author_id INTEGER,
    genre_id INTEGER,
    publication_year INTEGER,
    isbn TEXT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);


INSERT INTO Books (title, author_id, genre_id, publication_year, isbn) 
VALUES ('1984', 1, 1, 1949, '978-0451524935');

UPDATE Books 
SET publication_year = 1950 
WHERE book_id = 1;

DELETE FROM Books 
WHERE book_id = 1;

SELECT b.title, a.author_name, g.genre_name 
FROM Books b 
JOIN Authors a ON b.author_id = a.author_id 
JOIN Genres g ON b.genre_id = g.genre_id;

SELECT * 
FROM Books 
WHERE publication_year > 2000;

SELECT a.author_name, COUNT(b.book_id) AS book_count 
FROM Authors a 
LEFT JOIN Books b ON a.author_id = b.author_id 
GROUP BY a.author_id;

SELECT * 
FROM Books 
WHERE genre_id = 2;

SELECT AVG(publication_year) AS average_publication_year 
FROM Books;

SELECT * 
FROM Authors 
WHERE strftime('%Y', birth_date) = '1980';

SELECT * 
FROM Books 
WHERE isbn = '978-0451524935';
