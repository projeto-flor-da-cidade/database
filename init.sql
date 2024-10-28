-- Cria o banco de dados, se ainda não existir
CREATE DATABASE IF NOT EXISTS exemplo_db;
USE exemplo_db;
-- Cria uma tabela para armazenar informações de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insere dados de exemplo na tabela de usuários
INSERT INTO usuarios (nome, email, senha)
VALUES ('Ana Souza', 'ana@example.com', 'senha123'),
    ('João Silva', 'joao@example.com', 'senha456'),
    (
        'Maria Oliveira',
        'maria@example.com',
        'senha789'
    );
-- Cria uma tabela para armazenar informações de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT DEFAULT 0,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insere dados de exemplo na tabela de produtos
INSERT INTO produtos (nome, descricao, preco, quantidade)
VALUES (
        'Camiseta',
        'Camiseta de algodão 100%',
        29.90,
        100
    ),
    (
        'Caneca',
        'Caneca de porcelana personalizada',
        19.90,
        50
    ),
    (
        'Livro',
        'Livro de desenvolvimento pessoal',
        49.90,
        20
    );
-- Cria um usuário de banco de dados específico com permissões limitadas
CREATE USER IF NOT EXISTS 'exemplo_user' @'%' IDENTIFIED BY 'exemplo_pass';
GRANT ALL PRIVILEGES ON exemplo_db.* TO 'exemplo_user' @'%';
FLUSH PRIVILEGES;