-- Criar ou substituir o banco de dados atividade3
CREATE DATABASE IF NOT EXISTS atividade3;
USE atividade3;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade3
CREATE OR REPLACE PROCEDURE atividade3(
    IN anos INT,
    IN meses INT,
    IN dias INT,
    OUT idade INT
)
BEGIN
    SET idade = (anos * 365) + (meses * 30) + dias;
    SELECT @idade AS 'Dias';
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure atividade3 com valores específicos para anos, meses e dias, e exibir os resultados
CALL atividade3(12, 12, 12, @idade);
