### 1. Criação do Banco de Dados

- Criar o banco de dados `segundo_trabalho_parcial`

### 2. Criação das Tabelas

#### 2.1 Tabela "Principio Ativo"

- Código (PK, UN, NN, AI)
- Nome (NN, UQ)

#### 2.2 Tabela "Fabricante"

- Código (PK, UN, NN, AI)
- Nome (NN, UQ)

#### 2.3 Tabela "Listagem"

- Código (PK, UN, NN, AI)
- Nome (NN, UQ)
- Percentual (UN, NN)

#### 2.4 Tabela "Produto"

- Código (PK, UN, NN, AI)
- Nome (NN, UQ)
- Código do Princípio Ativo (FK, UN, NN)
- Código do Fabricante (FK, UN, NN)
- Código da Listagem (FK, UN, NN)

#### 2.5 Tabela "Apresentação"

- Código (PK, UN, NN, AI)
- Descrição (NN)
- Preço Unitário (UN, NN)
- Código do Produto (FK, UN, NN)
- UQ (Código do Produto, Descrição)

#### 2.6 Tabela "Lote"

- Código (PK, UN, NN, AI)
- Número (NN, UQ)
- Data de Fabricação (NN)
- Data de Validade (NN)
- Quantidade (NN)
- Código da Apresentação (FK, UN, NN)

