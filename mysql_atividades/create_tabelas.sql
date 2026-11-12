use escola_bd;
create table alunos (
id_aluno int auto_increment primary key,
nome varchar(100) not null,
data_nascimento date not null,
rg varchar(15) unique not null,
cpf varchar(15) unique not null,
cidade varchar(20) not null,
data_cadastro timestamp default current_timestamp,
status int (1) not null
);
show tables;

USE agenda_bd;

CREATE TABLE IF NOT EXISTS contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(150),
    cidade VARCHAR(80),
    data_cadastro TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;
select * from contatos;
USE chat_bd;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;


USE portifolio_bd;

CREATE TABLE IF NOT EXISTS profissionais (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    profissao VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    telefone VARCHAR(20),
    biografia TEXT
) ENGINE = InnoDB;

USE loja_bd;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(150),
    telefone VARCHAR(20),
    cidade VARCHAR(80)
) ENGINE = InnoDB;


USE estoque_bd;

CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_produtos_valores
        CHECK (
            preco_custo >= 0
            AND preco_venda >= 0
            AND quantidade >= 0
        )
) ENGINE = InnoDB;

USE portifolio_bd;

CREATE TABLE IF NOT EXISTS profissionais (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    profissao VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    telefone VARCHAR(20),
    biografia TEXT
) ENGINE = InnoDB;