-- Criação do banco de dados
CREATE DATABASE Ecommerce;
USE Ecommerce;


-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    primeiroNome VARCHAR(20) NOT NULL,
    nomeMeio VARCHAR(25),
    Sobrenome VARCHAR(20),
    tipoPessoa ENUM('fisica', 'juridica') NOT NULL,
    Identificação VARCHAR(45),
    endereço VARCHAR(45),
    email VARCHAR(45),
    UNIQUE (primeiroNome, nomeMeio, Sobrenome)
);

-- Tabela Pessoa Física
CREATE TABLE PessoaFisica (
    CPF CHAR(11) PRIMARY KEY NOT NULL,
    Cliente_idCliente INT NOT NULL,
    UNIQUE (CPF),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Pessoa Jurídica
CREATE TABLE PessoaJuridica (
    CNPJ CHAR(15) PRIMARY KEY NOT NULL,
    Cliente_idCliente INT NOT NULL,
    UNIQUE (CNPJ),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM('cancelado', 'confirmado', 'em processamento') DEFAULT 'em processamento',
    Cliente_idCliente INT NOT NULL,
    Frete VARCHAR(45),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    Status VARCHAR(45),
    codigoRastreio INT,
    Pedido_idPedido INT NOT NULL,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_idCliente INT NOT NULL,
    Valor INT NOT NULL,
    DataVencimento DATETIME,
    forma ENUM('Cartao', 'Boleto', 'Pix') NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Cartão
CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY AUTO_INCREMENT,
    Número VARCHAR(45),
    DataValidade VARCHAR(45),
    NomePortador VARCHAR(45),
    Pagamento_idPagamento INT NOT NULL,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela Boleto Bancário
CREATE TABLE BoletoBancario (
    idBoletoBancario INT PRIMARY KEY AUTO_INCREMENT,
    CodigoBarras VARCHAR(45),
    Pagamento_idPagamento INT NOT NULL,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela Pix
CREATE TABLE Pix (
    idPix INT PRIMARY KEY AUTO_INCREMENT,
    chavePix VARCHAR(45),
    Banco VARCHAR(45),
    Pagamento_idPagamento INT NOT NULL,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela Produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    categoria ENUM('eletronico', 'vestimenta', 'brinquedos', 'alimentos', 'livros', 'eletrodomésticos' , 'moda' , 'móveis') NOT NULL,
    identificação VARCHAR(45),
    Descrição VARCHAR(45),
    valor VARCHAR(45),
    classificacao_crianca BOOL DEFAULT FALSE,
    avaliação FLOAT
);
ALTER TABLE Produto
	modify column categoria ENUM('eletronico', 'vestimenta', 'brinquedos', 'alimentos', 'livros', 'eletrodomésticos' , 'moda' , 'móveis') NOT NULL;

-- Tabela Relação de produto por pedido
CREATE TABLE RelacaoProdutoPedido (
    Pedido_idPedido INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    Quantidade VARCHAR(45),
    prStatus ENUM('disponivel', 'sem estoque') DEFAULT 'disponivel',
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(45)
);
ALTER TABLE Estoque 
	add column Capacidade INT;

-- Tabela Quantidade
CREATE TABLE Quantidade (
    Produto_idProduto INT NOT NULL,
    Estoque_idEstoque INT NOT NULL,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(45) UNIQUE,
    Local VARCHAR(45),
    contato CHAR(11),
    UNIQUE (CNPJ)
);

-- Tabela Disponibilizando um produto
CREATE TABLE DisponibilizandoProduto (
    Fornecedor_idFornecedor INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Terceiro-vendedor
CREATE TABLE TerceiroVendedor (
    idTerceiroVendedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45) UNIQUE NOT NULL,
    Local VARCHAR(45),
    CNPJ CHAR(15) UNIQUE,
    NomeAbstrato VARCHAR(255)
);


-- Tabela Terceiro-vendedor_has_Produto
CREATE TABLE TerceiroVendedorHasProduto (
    TerceiroVendedor_idTerceiroVendedor INT NOT NULL,
    Produto_idProduto INT NOT NULL,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (TerceiroVendedor_idTerceiroVendedor, Produto_idProduto),
    FOREIGN KEY (TerceiroVendedor_idTerceiroVendedor) REFERENCES TerceiroVendedor(idTerceiroVendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);