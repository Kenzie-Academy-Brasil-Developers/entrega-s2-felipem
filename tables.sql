-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas
  
-- Tabela clientes

CREATE TABLE IF NOT EXISTS clientes(
  id BIGSERIAL CONSTRAINT pk_clientes PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  lealdade INTEGER NOT NULL
);

-- Tabela endereços

CREATE TABLE IF NOT EXISTS endereços(
  id BIGSERIAL CONSTRAINT pk_enderecos PRIMARY KEY,
  cep VARCHAR(9) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero INTEGER NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  complemento VARCHAR(100),
  cliente_id INTEGER NOT NULL,
  CONSTRAINT fk_end_end FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);

-- Tabela pedidos

CREATE TABLE IF NOT EXISTS pedidos(
  id BIGSERIAL CONSTRAINT pk_pedidos PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  cliente_id INTEGER NOT NULL,
  CONSTRAINT fk_end_ped FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);

-- Tabela produtos

CREATE TABLE IF NOT EXISTS produtos(
  id BIGSERIAL CONSTRAINT pk_produtos PRIMARY KEY,
  nome VARCHAR(100) UNIQUE NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  preço FLOAT(8) NOT NULL,
  pts_de_lealdade INTEGER NOT NULL
);

-- Tabela produtos_pedidos

CREATE TABLE IF NOT EXISTS produtos_pedidos(
  id BIGSERIAL CONSTRAINT pk_produtos_pedidos PRIMARY KEY,
  pedido_id INTEGER NOT NULL,
  CONSTRAINT fk_end_pedido FOREIGN KEY(pedido_id) REFERENCES pedidos(id),
  produto_id INTEGER NOT NULL,
  CONSTRAINT fk_end_produto FOREIGN KEY(produto_id) REFERENCES produtos(id)
);
