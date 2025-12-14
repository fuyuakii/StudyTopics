CREATE DATABASE IF NOT EXISTS atividade2;
USE atividade2;

CHARSET utf8;
DELIMITER //

CREATE OR REPLACE PROCEDURE atividade2(
    IN fahrenheit DECIMAL(3,1),
    OUT celsius DECIMAL(3,1)
)
BEGIN
    SET celsius = (5/9) * (fahrenheit - 32);
    SELECT @celsius AS 'Celsius';
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

CALL atividade2(5.0, @celsius);
