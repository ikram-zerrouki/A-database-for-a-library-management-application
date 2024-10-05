# Gestion de Bibliothèque

Ce projet est une base de données pour une application de gestion de bibliothèque. Il comprend des tables pour les livres, les auteurs et les emprunts.

## Nouvelles Fonctionnalités

- **Catégories de Livres** : Ajout de la gestion des catégories pour les livres.
- **Utilisateurs** : Gestion des utilisateurs avec des rôles d'administrateur et d'emprunteur.
- **Retards** : Ajout de la fonctionnalité pour identifier les emprunts en retard.

-- Appel de la procédure pour mettre à jour les retards
CALL check_late_loans();

-- Appeler la procédure pour générer des notifications
CALL generate_late_notifications();

-- Appeler la procédure pour mettre à jour les pénalités
CALL calculate_penalties();



