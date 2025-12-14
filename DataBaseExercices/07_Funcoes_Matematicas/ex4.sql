CREATE DATABASE IF NOT EXISTS atividade4;
USE atividade4;

CHARSET utf8;
DELIMITER //

CREATE OR REPLACE PROCEDURE atividade(
    IN n INT
)
BEGIN
    SELECT RAND(n) AS Número Aleatório;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

CALL atividade(2);
