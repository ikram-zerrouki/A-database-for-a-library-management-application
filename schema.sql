-- Création des tables
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    borrower_name VARCHAR(100),
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id)
);
-- Table des catégories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Ajout d'une colonne de catégorie à la table des livres
ALTER TABLE books ADD category_id INT;
ALTER TABLE books ADD FOREIGN KEY (category_id) REFERENCES categories(id);

-- Table des utilisateurs
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role ENUM('admin', 'borrower') DEFAULT 'borrower',
    password VARCHAR(255) NOT NULL
);

-- Ajout d'une colonne pour l'emprunteur dans la table des emprunts
ALTER TABLE loans ADD user_id INT;
ALTER TABLE loans ADD FOREIGN KEY (user_id) REFERENCES users(id);

