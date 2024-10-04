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

-- Ajout d'une colonne pour suivre les retards
ALTER TABLE loans ADD is_late BOOLEAN DEFAULT FALSE;

-- Créer une procédure stockée pour vérifier les retards
DELIMITER //
CREATE PROCEDURE check_late_loans()
BEGIN
    UPDATE loans
    SET is_late = TRUE
    WHERE return_date IS NULL AND loan_date < CURDATE() - INTERVAL 30 DAY;
END //
DELIMITER ;

-- Table des notifications
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message VARCHAR(255),
    notification_date DATE,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Créer une procédure stockée pour générer des notifications de retard
DELIMITER //
CREATE PROCEDURE generate_late_notifications()
BEGIN
    INSERT INTO notifications (user_id, message, notification_date)
    SELECT user_id, CONCAT('Le livre emprunté est en retard : ', title), CURDATE()
    FROM loans
    JOIN books ON loans.book_id = books.id
    WHERE loans.is_late = TRUE;
END //
DELIMITER ;

