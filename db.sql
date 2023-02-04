GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bghegwegewyt26734764';

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

INSERT INTO Users(id, username, password) VALUES (1, 'admin', '386b94a433c9ae0c8e3094ae23fe54d3'); -- - adminitratorxd12654
INSERT INTO Users(id, username, password) VALUES (2, 'sofiacrxd', '3db7a5f856078fef4a7b3e8064f4c190'); -- - dslhc_es_izi
INSERT INTO Users(id, username, password) VALUES (3, 'rocio666', '7b886f412edbadc6062b4b889e6c9d70'); -- - hamburguesa
INSERT INTO Users(id, username, password) VALUES (4, 'mago', '98eb470b2b60482e259d28648895d9e1'); -- - minecraft

INSERT INTO Product(id, name_prod, descripcion, price) VALUES (1, 'Tenis Nike', 'Son unos tennis nike', 100);
INSERT INTO Product(id, name_prod, descripcion, price) VALUES (2, 'Zapatos xyz', 'Son unos zapatos xyz', 200);
INSERT INTO Product(id, name_prod, descripcion, price) VALUES (3, 'Tenis Adidas', 'Son unos tennis Adidas', 100);
INSERT INTO Product(id, name_prod, descripcion, price) VALUES (4, 'Zapatos yxz', 'Son unos tennis yxz', 300);