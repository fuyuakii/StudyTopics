-- Criar ou substituir o banco de dados atividade4
CREATE DATABASE IF NOT EXISTS atividade4;
USE atividade4;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade
CREATE OR REPLACE PROCEDURE atividade(
    IN n INT
)
BEGIN
    SELECT RAND(n) AS Número Aleatório;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure atividade com o valor específico para n e exibir o número aleatório gerado
CALL atividade(2);
