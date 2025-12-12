#### 1. Criação de Perfis

- administrador  
- veterinario  
- atendente  

#### 2. Permissões para os Perfis

- **administrador**: `petshop.*` → ALL  
- **veterinario**:  
  - `petshop.animal` → INSERT, UPDATE, SELECT  
  - `petshop.veterinario` → INSERT, UPDATE, SELECT  
  - `petshop.consulta` → INSERT, SELECT  
- **atendente**:  
  - `petshop.animal` → INSERT, UPDATE, SELECT  
  - `petshop.veterinario` → INSERT, UPDATE, SELECT  
  - `petshop.consulta` → INSERT, SELECT  

#### 3. Associação de Usuários aos Perfis

- `ana@localhost` → atendente  
- `bruno@localhost` → veterinario  
- `paulo@localhost` → administrador  

#### 4. Operações com os Usuários

- **ana@localhost**: Inserir um animal e listar todos os animais  
- **bruno@localhost**: Inserir um veterinário e listar todos os veterinários  
- **paulo@localhost**: Inserir uma consulta e listar todas as consultas  

#### 5. Revogação de Permissões

- **administrador**: `petshop.*` → ALL  
- **veterinario**:  
  - `petshop.animal` → INSERT  
  - `petshop.veterinario` → INSERT  
- **atendente**:  
  - `petshop.animal` → UPDATE  
  - `petshop.veterinario` → UPDATE  
  - `petshop.consulta` → SELECT  

#### 6. Operações após revogação

- **ana@localhost**: Inserir uma consulta e listar todas as consultas  
- **bruno@localhost**: Inserir um animal e listar todos os animais  
- **paulo@localhost**: Inserir um veterinário e listar todos os veterinários  

