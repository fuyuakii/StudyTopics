-- Criar ou substituir o banco de dados atividade1
CREATE DATABASE IF NOT EXISTS atividade1;
USE atividade1;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade
CREATE OR REPLACE PROCEDURE atividade(
    OUT volume DECIMAL(5,2),
    OUT area DECIMAL(5,2)
)
BEGIN
    DECLARE raio DECIMAL(5,1);
    DECLARE altura DECIMAL(5,1);
    DECLARE pi DECIMAL(15, 10);

    SET raio = 6.0;
    SET altura = 5.0;
    SET pi = 3.14;

    SET volume = pi * (raio * raio) * altura;
    SET area = pi * (raio * raio);

    SELECT @volume AS Volume do Cilindro, @area AS Área do Cilindro;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure atividade e exibir os resultados
CALL atividade(@volume, @area);
