CREATE OR REPLACE SCHEMA primeiro_trabalho_parcial;
USE primeiro_trabalho_parcial;
CREATE OR REPLACE TABLE principio_ativo (
    codigo SMALLINT,
    nome VARCHAR(100)
);
CREATE OR REPLACE TABLE fabricante (
    codigo SMALLINT,
    nome VARCHAR(100)
);
CREATE OR REPLACE TABLE listagem (
    codigo SMALLINT,
    nome VARCHAR(100),
    percentual FLOAT
);
CREATE OR REPLACE TABLE produto (
    codigo SMALLINT,
    nome VARCHAR(100),
    codigo_principio_ativo SMALLINT,
    codigo_do_fabricante SMALLINT,
    codigo_da_listagem SMALLINT
);
CREATE OR REPLACE TABLE apresentacao (
    codigo SMALLINT,
    descricao VARCHAR(100),
    preco_unitario DECIMAL(8,2),
    codigo_do_produto SMALLINT
);
CREATE OR REPLACE TABLE lote (
    codigo SMALLINT,
    numero SMALLINT,
    data_de_fabricacao DATE,
    data_de_validade DATE,
    quantidade SMALLINT,
    codigo_de_apresentacao SMALLINT
);

