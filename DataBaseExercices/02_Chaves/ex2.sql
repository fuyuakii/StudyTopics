CREATE DATABASE segundo_trabalho_parcial;
USE segundo_trabalho_parcial;

CREATE TABLE PrincipioAtivo (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Fabricante (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Listagem (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Nome VARCHAR(255) NOT NULL UNIQUE,
    Percentual DECIMAL(5,2) UNSIGNED NOT NULL
);

CREATE TABLE Produto (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Nome VARCHAR(255) NOT NULL UNIQUE,
    CodPrincipioAtivo INT,
    CodFabricante INT,
    CodListagem INT,
    FOREIGN KEY (CodPrincipioAtivo) REFERENCES PrincipioAtivo(Codigo),
    FOREIGN KEY (CodFabricante) REFERENCES Fabricante(Codigo),
    FOREIGN KEY (CodListagem) REFERENCES Listagem(Codigo)
);

CREATE TABLE Apresentacao (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    PrecoUnitario DECIMAL(10,2) UNSIGNED NOT NULL,
    CodProduto INT,
    UNIQUE (CodProduto, Descricao),
    FOREIGN KEY (CodProduto) REFERENCES Produto(Codigo)
);

CREATE TABLE Lote (
    Codigo INT PRIMARY KEY AUTO_INCREMENT UNSIGNED NOT NULL,
    Numero INT NOT NULL UNIQUE,
    DataFabricacao DATE NOT NULL,
    DataValidade DATE NOT NULL,
    Quantidade INT NOT NULL,
    CodApresentacao INT,
    FOREIGN KEY (CodApresentacao) REFERENCES Apresentacao(Codigo)
);

