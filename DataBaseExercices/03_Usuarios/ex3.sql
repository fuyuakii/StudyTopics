CREATE DATABASE IF NOT EXISTS petshop;

USE petshop;

CREATE TABLE Animal (
    Codigo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Veterinario (
    Codigo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Consulta (
    Codigo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Horario DATETIME NOT NULL,
    CodigoAnimal INT UNSIGNED NOT NULL,
    CodigoVeterinario INT UNSIGNED NOT NULL,
    UNIQUE KEY (CodigoAnimal),
    UNIQUE KEY (CodigoVeterinario),
    FOREIGN KEY (CodigoAnimal) REFERENCES Animal(Codigo),
    FOREIGN KEY (CodigoVeterinario) REFERENCES Veterinario(Codigo)
);

CREATE USER 'ana'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'bruno'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'paulo'@'localhost' IDENTIFIED BY '12345678';

GRANT ALL PRIVILEGES ON petshop.* TO 'ana'@'localhost';
GRANT ALL PRIVILEGES ON petshop.* TO 'bruno'@'localhost';
GRANT ALL PRIVILEGES ON petshop.* TO 'paulo'@'localhost';

SELECT user, host FROM mysql.user WHERE user IN ('ana', 'bruno', 'paulo') AND host='localhost';
