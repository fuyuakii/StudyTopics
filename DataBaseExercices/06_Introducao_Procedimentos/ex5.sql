CREATE DATABASE IF NOT EXISTS atividade5;
USE atividade5;

CHARSET utf8;
DELIMITER //

CREATE OR REPLACE PROCEDURE atividade5(
    IN metros DECIMAL(5,1),
    OUT decimetro DECIMAL(6,1),
    OUT centimetro DECIMAL(6,1),
    OUT milimetro DECIMAL(6,1)
)
BEGIN
    SET decimetro = metros * 10;
    SET centimetro = metros * 100;
    SET milimetro = metros * 1000;

    SELECT @decimetro AS Decímetros, @centimetro AS Centímetros, @milimetro AS Milímetros;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

CALL atividade5(5.0, @decimetro, @centimetro, @milimetro);
