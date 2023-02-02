drop user 'admin@127.0.0.1';
CREATE USER 'admin@127.0.0.1' IDENTIFIED BY 'bhverbh51363652ev6f2';

FLUSH PRIVILEGES;

CREATE DATABASE store;

use store;

CREATE TABLE Users(
        id INT NOT NULL AUTO_INCREMENT,
        username VARCHAR(50),
        password VARCHAR(50),
        PRIMARY KEY (id)
);

CREATE TABLE Product(
        id INT NOT NULL AUTO_INCREMENT,
        name_prod VARCHAR(50),
        descripcion VARCHAR(100),
        price INT,
        PRIMARY KEY (id)
);
