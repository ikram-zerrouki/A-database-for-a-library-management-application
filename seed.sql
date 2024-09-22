-- Insertion des auteurs
INSERT INTO authors (name) VALUES ('J.K. Rowling');
INSERT INTO authors (name) VALUES ('George R.R. Martin');

-- Insertion des livres
INSERT INTO books (title, author_id, publication_year) VALUES ('Harry Potter and the Sorcerer\'s Stone', 1, 1997);
INSERT INTO books (title, author_id, publication_year) VALUES ('A Game of Thrones', 2, 1996);

-- Insertion des emprunts
INSERT INTO loans (book_id, borrower_name, loan_date, return_date) VALUES (1, 'Alice Smith', '2024-01-15', '2024-02-15');
INSERT INTO loans (book_id, borrower_name, loan_date, return_date) VALUES (2, 'Bob Johnson', '2024-02-01', NULL);
-- Insertion des catégories
INSERT INTO categories (name) VALUES ('Fantasy');
INSERT INTO categories (name) VALUES ('Science Fiction');

-- Mise à jour des livres avec leurs catégories
UPDATE books SET category_id = 1 WHERE id = 1; -- Harry Potter
UPDATE books SET category_id = 2 WHERE id = 2; -- A Game of Thrones;
