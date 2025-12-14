CREATE DATABASE IF NOT EXISTS atividade3;
USE atividade3;

CHARSET utf8;
DELIMITER //

CREATE OR REPLACE PROCEDURE atividade3(
    IN anos INT,
    IN meses INT,
    IN dias INT,
    OUT idade INT
)
BEGIN
    SET idade = (anos * 365) + (meses * 30) + dias;
    SELECT @idade AS Dias;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

CALL atividade3(12, 12, 12, @idade);
