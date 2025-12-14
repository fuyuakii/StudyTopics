CREATE DATABASE IF NOT EXISTS atividade3;
USE atividade3;

CHARSET utf8;
DELIMITER //

CREATE OR REPLACE PROCEDURE atividade(
    IN h FLOAT,
    IN alfa FLOAT,
    OUT c1 FLOAT,
    OUT c2 FLOAT
)
BEGIN
    SET c1 = COS(RADIANS(alfa)) * h;
    SET c2 = SIN(RADIANS(alfa)) * h;

    SELECT @c1 AS Cateto Adjacente, @c2 AS Cateto Oposto;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

CALL atividade(50.0, 30.0, @c1, @c2);
