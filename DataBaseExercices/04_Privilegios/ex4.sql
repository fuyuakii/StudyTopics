# Conectar como root e conceder permissões aos usuários
mysql -uroot -p -hlocalhost --port=3306 <<EOF
use petshop;

GRANT ALL ON petshop.* TO 'paulo'@'localhost';

GRANT INSERT, UPDATE, SELECT ON petshop.animal TO 'bruno'@'localhost';
GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'bruno'@'localhost';
GRANT INSERT, SELECT, UPDATE ON petshop.consulta TO 'bruno'@'localhost';

GRANT INSERT, UPDATE, SELECT, DELETE ON petshop.animal TO 'ana'@'localhost';
GRANT INSERT, UPDATE, SELECT ON petshop.veterinario TO 'ana'@'localhost';
GRANT INSERT, SELECT ON petshop.consulta TO 'ana'@'localhost';

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

INSERT INTO animal (nome) VALUES ('Gato');
INSERT INTO animal (nome) VALUES ('Gato2');

SELECT * FROM animal;

DELETE FROM animal WHERE nome = 'Gato';

-- Sair da sessão do MySQL
exit
EOF

# Conectar como 'bruno' e realizar operações
mysql -ubruno -p -hlocalhost --port=3306 <<EOF
12345678
use petshop;

INSERT INTO veterinario (cpf, nome) VALUES (12345678901, 'Roberto');

SELECT * FROM veterinario;

UPDATE consulta SET horario = '14:30:00' WHERE codigo = 1;

exit
EOF

# Conectar como 'paulo' e realizar operações
mysql -upaulo -p -hlocalhost --port=3306 <<EOF
12345678
use petshop;

INSERT INTO consulta (horario, codigo_animal, codigo_veterinario) VALUES ('14:30:00', 2, 1);

SELECT * FROM consulta;

DELETE FROM consulta WHERE codigo = 1;

SELECT * FROM consulta;

-- Limpar a tela (comando específico do ambiente de console)
system cls;

-- Sair da sessão do MySQL
exit
EOF
