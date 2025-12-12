-- 1. Criar o banco de dados petshop
CREATE DATABASE IF NOT EXISTS petshop;

-- 2. Usar o banco de dados petshop
USE petshop;

-- 3. Criar as tabelas
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

-- 4. Criar os usuários
CREATE USER 'ana'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'bruno'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'paulo'@'localhost' IDENTIFIED BY '12345678';

-- 5. Conceder permissões aos usuários
GRANT ALL PRIVILEGES ON petshop.* TO 'ana'@'localhost';
GRANT ALL PRIVILEGES ON petshop.* TO 'bruno'@'localhost';
GRANT ALL PRIVILEGES ON petshop.* TO 'paulo'@'localhost';

-- 6. Liste os usuários criados
SELECT user, host FROM mysql.user WHERE user IN ('ana', 'bruno', 'paulo') AND host='localhost';
