use petshop;
create or replace role administrador;
create or replace role veterinario;
create or replace role atendente;

grant ALL
on petshop.*
to administrador;

grant INSERT, UPDATE, SELECT
on petshop.animal
to veterinario;

grant INSERT, UPDATE, SELECT
on petshop.veterinario
to veterinario;

grant INSERT, SELECT
on petshop.consulta
to veterinario;

grant INSERT, UPDATE, SELECT
on petshop.animal
to atendente;

grant INSERT, UPDATE, SELECT
on petshop.veterinario
to atendente;

grant INSERT, SELECT
on petshop.consulta
to atendente;

grant atendente
to ana@localhost;

grant veterinario
to bruno@localhost;

grant administrador
to paulo@localhost;

exit

mysql -uana -p -hlocalhost --port=3306
12345678
use petshop;
set role atendente;
insert into animal (nome) values ('Gato3');
select * from animal;

exit

mysql -ubruno -p -hlocalhost --port=3306
12345678
use petshop;
set role veterinario;
insert into veterinario (cpf, nome) values (23748920210, 'Carlos');
select * from veterinario;

exit

mysql -upaulo -p -hlocalhost --port=3306
12345678
use petshop;
set role administrador;
insert consulta (horario, codigo_animal, codigo_veterinario) values ('17:30:00', 2, 1);
select * from consulta;

exit

mysql -uroot -p -hlocalhost --port=3306
use petshop;

revoke ALL
on petshop.*
from administrador;

revoke INSERT
on petshop.animal
from veterinario;

revoke INSERT
on petshop.veterinario
from veterinario;

revoke UPDATE
on petshop.animal
from veterinario;

revoke UPDATE
on petshop.veterinario
from veterinario;

revoke SELECT
on petshop.consulta
from veterinario;

exit
mysql -uana -p -hlocalhost --port=3306
12345678
use petshop;
set role atendente;
insert into consulta (horario, codigo_animal, codigo_veterinario) values ('08:30:00', 2, 2);
select * from consulta;

exit
mysql -ubruno -p -hlocalhost --port=3306
12345678
use petshop;
set role veterinario;
insert into animal (nome) values ('Cachorro');
select * from animal;

exit
mysql -upaulo -p -hlocalhost --port=3306
12345678
use petshop;
set role administrador;
insert veterinario (cpf, nome) values (11111111111, 'Cris');
select * from veterinario;
