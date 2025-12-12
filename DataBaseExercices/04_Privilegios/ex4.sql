# Conectar como root e conceder permissões aos usuários
mysql -uroot -p -hlocalhost --port=3306 <<EOF
use petshop;

-- Permissões para o usuário 'paulo'
GRANT ALL ON petshop.* TO 'paulo'@'localhost';

-- Permissões para o usuário 'bruno'
GRANT INSERT, UPDATE, SELECT ON petshop.animal TO 'bruno'@'localhost';
GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'bruno'@'localhost';
GRANT INSERT, SELECT, UPDATE ON petshop.consulta TO 'bruno'@'localhost';

-- Permissões para o usuário 'ana'
GRANT INSERT, UPDATE, SELECT, DELETE ON petshop.animal TO 'ana'@'localhost';
GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'ana'@'localhost';
GRANT INSERT, SELECT ON petshop.consulta TO 'ana'@'localhost';

-- Exibir privilégios dos usuários
SHOW GRANTS FOR 'paulo'@'localhost';
SHOW GRANTS FOR 'bruno'@'localhost';
SHOW GRANTS FOR 'ana'@'localhost';

-- Sair da sessão do MySQL
exit
EOF

# Conectar como 'ana' e realizar operações
mysql -uana -p -hlocalhost --port=3306 <<EOF
12345678
use petshop;

-- Inserir animais
INSERT INTO animal (nome) VALUES ('Gato');
INSERT INTO animal (nome) VALUES ('Gato2');

-- Listar animais
SELECT * FROM animal;

-- Excluir animal
DELETE FROM animal WHERE nome = 'Gato';

-- Sair da sessão do MySQL
exit
EOF

# Conectar como 'bruno' e realizar operações
mysql -ubruno -p -hlocalhost --port=3306 <<EOF
12345678
use petshop;

-- Inserir veterinário
INSERT INTO veterinario (cpf, nome) VALUES (12345678901, 'Roberto');

-- Listar veterinários
SELECT * FROM veterinario;

-- Atualizar consulta
UPDATE consulta SET horario = '14:30:00' WHERE codigo = 1;

-- Sair da sessão do MySQL
exit
EOF

# Conectar como 'paulo' e realizar operações
mysql -upaulo -p -hlocalhost --port=3306 <<EOF
12345678
use petshop;

-- Inserir consulta
INSERT INTO consulta (horario, codigo_animal, codigo_veterinario) VALUES ('14:30:00', 2, 1);

-- Listar consultas
SELECT * FROM consulta;

-- Excluir consulta
DELETE FROM consulta WHERE codigo = 1;

-- Listar consultas novamente
SELECT * FROM consulta;

-- Limpar a tela (comando específico do ambiente de console)
system cls;

-- Sair da sessão do MySQL
exit
EOF
