- **Enunciado**
    
    As instruções para conceder permissões, listar privilégios e realizar operações específicas são as seguintes:
    
    1. **Conceder Permissões:**
        - Para `paulo` no banco de dados `petshop`:
            
            ```sql
            GRANT ALL PRIVILEGES ON petshop.* TO 'paulo'@'localhost';
            
            ```
            
        - Para `bruno` no banco de dados `petshop`:
            
            ```sql
            GRANT INSERT, UPDATE, SELECT ON petshop.animal TO 'bruno'@'localhost';
            GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'bruno'@'localhost';
            GRANT INSERT, SELECT ON petshop.consulta TO 'bruno'@'localhost';
            
            ```
            
        - Para `ana` no banco de dados `petshop`:
            
            ```sql
            GRANT INSERT, UPDATE, SELECT ON petshop.animal TO 'ana'@'localhost';
            GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'ana'@'localhost';
            GRANT INSERT, SELECT ON petshop.consulta TO 'ana'@'localhost';
            
            ```
            
    2. **Listar Privilégios:**
        
        ```sql
        SHOW GRANTS FOR 'ana'@'localhost';
        SHOW GRANTS FOR 'bruno'@'localhost';
        SHOW GRANTS FOR 'paulo'@'localhost';
        
        ```
        
    3. **Realizar Operações:**
        - **Para `ana`@`localhost`:**
            - Inserir um animal:
                
                ```sql
                INSERT INTO petshop.animal (Nome) VALUES ('NomeDoAnimal');
                
                ```
                
            - Listar todos os animais:
                
                ```sql
                SELECT * FROM petshop.animal;
                
                ```
                
            - Remover um animal (supondo que o código do animal a ser removido seja 1):
                
                ```sql
                DELETE FROM petshop.animal WHERE Codigo = 1;
                
                ```
                
        - **Para `bruno`@`localhost`:**
            - Inserir um veterinário:
                
                ```sql
                INSERT INTO petshop.veterinario (CPF, Nome) VALUES ('12345678901', 'NomeDoVeterinario');
                
                ```
                
            - Listar todos os veterinários:
                
                ```sql
                SELECT * FROM petshop.veterinario;
                
                ```
                
            - Alterar uma consulta (supondo que o código da consulta a ser alterada seja 1):
                
                ```sql
                UPDATE petshop.consulta SET Horario = 'NovoHorario' WHERE Codigo = 1;
                
                ```
                
        - **Para `paulo`@`localhost`:**
            - Inserir uma consulta:
                
                ```sql
                INSERT INTO petshop.consulta (Horario, CodigoAnimal, CodigoVeterinario) VALUES ('2023-12-14 12:00:00', 1, 1);
                
                ```
                
            - Listar todas as consultas:
                
                ```sql
                SELECT * FROM petshop.consulta;
                
                ```
                
            - Excluir uma consulta (supondo que o código da consulta a ser excluída seja 1):
                
                ```sql
                DELETE FROM petshop.consulta WHERE Codigo = 1;
                
                ```
                
