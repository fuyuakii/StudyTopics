-- Criar ou substituir o banco de dados atividade1
CREATE DATABASE IF NOT EXISTS atividade1;
USE atividade1;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure Atividade1
CREATE OR REPLACE PROCEDURE Atividade1(
    IN base DECIMAL(3,1),
    IN altura DECIMAL(3,1),
    OUT area DECIMAL(3,1),
    OUT perimetro DECIMAL(3,1)
)
BEGIN
    SET area = base * altura;
    SET perimetro = (2 * base) + (2 * altura);
    SELECT @area AS 'Área do Retângulo', @perimetro AS 'Perímetro do Retângulo';
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure Atividade1 com parâmetros específicos
CALL Atividade1(5.0, 3.0, @area, @perimetro);
