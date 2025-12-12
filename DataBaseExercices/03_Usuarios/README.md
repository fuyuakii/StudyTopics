### 1. Banco de Dados

- Criar um banco de dados chamado `petshop`

### 2. Tabelas

#### 2.1 Tabela `Animal`

- Código (UN, PK, AI)  
- Nome (NN, UQ)  

#### 2.2 Tabela `Veterinário`

- Código (UN, PK, AI)  
- CPF (NN, UQ)  
- Nome (NN)  

#### 2.3 Tabela `Consulta`

- Código (UN, PK, AI)  
- Horário (NN)  
- Código do Animal (UN, NN, FK referenciando `Animal`)  
- Código do Veterinário (UN, NN, FK referenciando `Veterinário`)  

### 3. Usuários

- Usuário: `ana@localhost`, Senha: `12345678`  
- Usuário: `bruno@localhost`, Senha: `12345678`  
- Usuário: `paulo@localhost`, Senha: `12345678`  

### 4. Listar Usuários

- Listar os usuários criados

