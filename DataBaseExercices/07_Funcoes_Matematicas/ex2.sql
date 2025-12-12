-- Criar ou substituir o banco de dados atividade2
CREATE DATABASE IF NOT EXISTS atividade2;
USE atividade2;

-- Definir o conjunto de caracteres e delimitador
CHARSET utf8;
DELIMITER //

-- Criar ou substituir a procedure atividade
CREATE OR REPLACE PROCEDURE atividade(
    IN c1 DECIMAL(3,1),
    IN c2 DECIMAL(3,1),
    OUT c DECIMAL(3,1),
    OUT hipotenusa DECIMAL(5,2)
)
BEGIN
    SET c = (c2 * c2) + (c1 * c1);
    SET hipotenusa = SQRT(c);

    SELECT @hipotenusa AS Hipotenusa;
END//
DELIMITER ;

-- Executar o script atv.sql
SOURCE atv.sql;

-- Chamar a procedure atividade com valores específicos para c1 e c2 e exibir os resultados
CALL atividade(3.0, 4.0, @c, @hipotenusa);
