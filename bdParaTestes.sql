-- ============================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ============================================

CREATE DATABASE loja_teste;

USE loja_teste;


-- ============================================
-- TABELA DE CATEGORIAS
-- ============================================

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);


-- ============================================
-- TABELA DE FUNCIONÁRIOS
-- ============================================

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    telefone VARCHAR(20),
    email VARCHAR(100)
);


-- ============================================
-- TABELA DE CLIENTES 
-- ============================================

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    estado CHAR(2),
    telefone VARCHAR(20),
    email VARCHAR(100)
);


-- ============================================
-- TABELA DE PRODUTOS
-- ============================================

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_id INT,
    preco DECIMAL(10,2),
    estoque INT,

    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
);


-- ============================================
-- TABELA DE VENDAS
-- ============================================

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_venda DATE,

    FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios(id)
);


-- ============================================
-- TABELA DE ITENS DAS VENDAS
-- ============================================

CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),

    FOREIGN KEY (venda_id)
        REFERENCES vendas(id),

    FOREIGN KEY (produto_id)
        REFERENCES produtos(id)
);


-- ============================================
-- INSERINDO CATEGORIAS
-- ============================================

INSERT INTO categorias (nome) VALUES
('Informática'),
('Eletrônicos'),
('Periféricos'),
('Acessórios'),
('Móveis'),
('Celulares'),
('Áudio'),
('Impressão');


-- ============================================
-- INSERINDO FUNCIONÁRIOS
-- ============================================

INSERT INTO funcionarios
(nome, cargo, salario, telefone, email)
VALUES
('João Silva', 'Vendedor', 2500.00, '(12) 99911-2233', 'joao@lojateste.com'),
('Maria Oliveira', 'Vendedora', 2700.00, '(12) 99822-3344', 'maria@lojateste.com'),
('Carlos Santos', 'Gerente', 4200.00, '(12) 99733-4455', 'carlos@lojateste.com'),
('Ana Souza', 'Vendedora', 2600.00, '(12) 99644-5566', 'ana@lojateste.com'),
('Pedro Costa', 'Estoquista', 2300.00, '(12) 99555-6677', 'pedro@lojateste.com'),
('Juliana Lima', 'Vendedora', 2550.00, '(12) 99466-7788', 'juliana@lojateste.com');


-- ============================================
-- INSERINDO CLIENTES
-- ============================================

INSERT INTO clientes
(nome, cidade, estado, telefone, email)
VALUES
('Lucas Almeida', 'Lorena', 'SP', '(12) 99111-1111', 'lucas@email.com'),
('Fernanda Rocha', 'Guaratinguetá', 'SP', '(12) 99222-2222', 'fernanda@email.com'),
('Rafael Martins', 'Pindamonhangaba', 'SP', '(12) 99333-3333', 'rafael@email.com'),
('Camila Ferreira', 'Taubaté', 'SP', '(12) 99444-4444', 'camila@email.com'),
('Bruno Mendes', 'Cruzeiro', 'SP', '(12) 99555-5555', 'bruno@email.com'),
('Patrícia Gomes', 'Cachoeira Paulista', 'SP', '(12) 99666-6666', 'patricia@email.com'),
('Daniel Ribeiro', 'Lorena', 'SP', '(12) 99777-7777', 'daniel@email.com'),
('Mariana Alves', 'São José dos Campos', 'SP', '(12) 99888-8888', 'mariana@email.com'),
('Gustavo Martins', 'Aparecida', 'SP', '(12) 99999-9999', 'gustavo@email.com'),
('Beatriz Castro', 'Guaratinguetá', 'SP', '(12) 99000-0000', 'beatriz@email.com');


-- ============================================
-- INSERINDO PRODUTOS
-- ============================================

INSERT INTO produtos
(nome, categoria_id, preco, estoque)
VALUES
('Teclado', 3, 89.90, 25),
('Mouse', 3, 49.90, 40),
('Monitor 24 polegadas', 1, 899.90, 12),
('Notebook', 1, 3499.90, 8),
('Computador Desktop', 1, 2899.90, 10),
('Impressora', 8, 799.90, 7),
('Cabo HDMI', 4, 29.90, 50),
('Webcam', 1, 159.90, 18),
('Fone de ouvido', 7, 129.90, 30),
('Caixa de som', 7, 199.90, 15),
('Celular', 6, 1899.90, 14),
('Carregador', 4, 79.90, 35),
('Mesa para computador', 5, 599.90, 6),
('Cadeira de escritório', 5, 749.90, 9),
('Pen drive 64GB', 4, 39.90, 45);


-- ============================================
-- INSERINDO VENDAS
-- ============================================

INSERT INTO vendas
(cliente_id, funcionario_id, data_venda)
VALUES
(1, 1, '2026-08-01'),
(2, 2, '2026-08-02'),
(3, 1, '2026-08-03'),
(4, 4, '2026-08-04'),
(5, 2, '2026-08-05'),
(6, 6, '2026-08-06'),
(7, 1, '2026-08-07'),
(8, 4, '2026-08-08'),
(9, 2, '2026-08-09'),
(10, 6, '2026-08-10');


-- ============================================
-- INSERINDO ITENS DAS VENDAS
-- ============================================

INSERT INTO itens_venda
(venda_id, produto_id, quantidade, preco_unitario)
VALUES
(1, 1, 1, 89.90),
(1, 2, 1, 49.90),

(2, 4, 1, 3499.90),

(3, 3, 2, 899.90),
(3, 7, 2, 29.90),

(4, 8, 1, 159.90),
(4, 9, 1, 129.90),

(5, 6, 1, 799.90),
(5, 12, 1, 79.90),

(6, 11, 1, 1899.90),

(7, 5, 1, 2899.90),
(7, 15, 2, 39.90),

(8, 10, 1, 199.90),
(8, 2, 2, 49.90),

(9, 13, 1, 599.90),

(10, 14, 1, 749.90),
(10, 1, 1, 89.90);