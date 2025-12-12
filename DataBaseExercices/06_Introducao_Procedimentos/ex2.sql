-- Criar ou substituir o banco de dados atividade2
CREATE DATABASE IF NOT EXISTS atividade2;
USE atividade2;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade2
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

-- Chamar a procedure atividade2 com o valor específico para fahrenheit e exibir os resultados
CALL atividade2(5.0, @celsius);
