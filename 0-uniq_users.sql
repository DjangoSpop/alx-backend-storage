-- we here create a sql script that creates a table of users that have email
-- and name. The email is unique and the id is auto incremented.
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);