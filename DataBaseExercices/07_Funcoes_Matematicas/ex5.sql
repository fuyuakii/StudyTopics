-- Criar ou substituir o banco de dados atividade5
CREATE DATABASE IF NOT EXISTS atividade5;
USE atividade5;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade
CREATE OR REPLACE PROCEDURE atividade(
    IN x1 DECIMAL(3,1),
    IN x2 DECIMAL(3,1),
    IN y1 DECIMAL(3,1),
    IN y2 DECIMAL(3,1),
    OUT dist DECIMAL(5,2)
)
BEGIN
    DECLARE xf DECIMAL(3,1);
    DECLARE yf DECIMAL(3,1);
    DECLARE p1 DECIMAL(3,1);
    DECLARE p2 DECIMAL(3,1);
    DECLARE n DECIMAL(3,1);

    SET xf = x1 - x2;
    SET yf = y1 - y2;
    SET p1 = POWER(xf, 2);
    SET p2 = POWER(yf, 2);
    SET n = p1 + p2;
    SET dist = SQRT(n);

    SELECT @dist AS Distância entre dois pontos;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure atividade com valores específicos para x1, x2, y1 e y2 e exibir a distância entre os pontos
CALL atividade(3.0, 4.0, 5.0, 9.0, @dist);
