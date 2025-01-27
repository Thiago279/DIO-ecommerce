

INSERT INTO Cliente (primeiroNome, nomeMeio, Sobrenome, Identificação, endereço, email, tipoPessoa)
VALUES 
('João', 'Carlos', 'Silva', '12345', 'Rua das Flores, 123', 'joao.silva@email.com', 'fisica'),
('Maria', 'Fernanda', 'Oliveira', '67890', 'Avenida Central, 456', 'maria.oliveira@email.com', 'juridica');

INSERT INTO Cliente (primeiroNome, nomeMeio, Sobrenome, Identificação, endereço, email, tipoPessoa) 
VALUES 
('Carlos', 'Eduardo', 'Lima', '54321', 'Rua Verde, 789', 'carlos.lima@email.com', 'fisica'),
('Fernanda', 'Aparecida', 'Costa', '11223', 'Avenida Azul, 123', 'fernanda.costa@email.com', 'juridica'),
('Ana', 'Luiza', 'Pereira', '33445', 'Praça das Américas, 456', 'ana.luiza@email.com', 'fisica');

INSERT INTO PessoaFisica (CPF, Cliente_idCliente)
VALUES 
('12345678901', 1);  -- João é pessoa física


INSERT INTO PessoaJuridica (CNPJ, Cliente_idCliente)
VALUES 
('12345678000199', 2);  -- Maria é pessoa jurídica

INSERT INTO PessoaFisica (CPF, Cliente_idCliente)
VALUES 
('32165498700', 3),  -- Carlos é pessoa física
('98765432110', 5);  -- Ana é pessoa física

INSERT INTO PessoaJuridica (CNPJ, Cliente_idCliente)
VALUES 
('98765432000188', 4);  -- Fernanda é pessoa jurídica

INSERT INTO Pedido (status, Cliente_idCliente, Frete)
VALUES 
('confirmado', 1, 'Grátis'), 
('em processamento', 2, 'Rápido');

INSERT INTO Pedido (status, Cliente_idCliente, Frete) 
VALUES 
('confirmado', 3, 'Expresso'), 
('em processamento', 4, 'Padrão'), 
('confirmado', 5, 'Grátis');

INSERT INTO Entrega (Status, codigoRastreio, Pedido_idPedido)
VALUES 
('entregue', 123456, 1), 
('pendente', 789012, 2);

INSERT INTO Entrega (Status, codigoRastreio, Pedido_idPedido) 
VALUES 
('entregue', 654321, 3), 
('pendente', 987654, 4), 
('em trânsito', 112233, 5);

INSERT INTO Pagamento (Cliente_idCliente, Valor, DataVencimento, forma)
VALUES 
(1, 150, '2025-02-01 10:00:00', 'Cartao'),
(2, 250, '2025-03-01 12:00:00', 'Boleto');

INSERT INTO Pagamento (Cliente_idCliente, Valor, DataVencimento, forma) 
VALUES 
(3, 500, '2025-02-15 10:00:00', 'Pix'), 
(4, 700, '2025-03-10 14:00:00', 'Boleto'), 
(5, 200, '2025-01-25 16:00:00', 'Cartao');

INSERT INTO Cartao (Número, DataValidade, NomePortador, Pagamento_idPagamento)
VALUES 
('1234 5678 9012 3456', '2025-12-31', 'João Silva', 1),
('9876 5432 1098 7654', '2026-11-30', 'Maria Oliveira', 2);

INSERT INTO BoletoBancario (CodigoBarras, Pagamento_idPagamento)
VALUES 
('123456789012', 2);

INSERT INTO Pix (chavePix, Banco, Pagamento_idPagamento)
VALUES 
('chavepix1234', 'Banco do Brasil', 1);

INSERT INTO Cartao (Número, DataValidade, NomePortador, Pagamento_idPagamento) 
VALUES 
('1111 2222 3333 4444', '2027-05-31', 'Ana Pereira', 5);

INSERT INTO BoletoBancario (CodigoBarras, Pagamento_idPagamento) 
VALUES 
('987654321098', 4);

INSERT INTO Pix (chavePix, Banco, Pagamento_idPagamento) 
VALUES 
('pixcarlos123', 'Santander', 3);

INSERT INTO Produto (categoria, identificação, Descrição, valor, classificacao_crianca, avaliação)
VALUES 
('eletronico', 'E001', 'Smartphone', '1500', false, 4.5),
('brinquedos', 'B001', 'Bola', '50', true, 4.0);

INSERT INTO Produto (categoria, identificação, Descrição, valor, classificacao_crianca, avaliação) 
VALUES 
('livros', 'L001', 'Livro Infantil', 30, true, 4.8),
('eletrodomésticos', 'E002', 'Microondas', 500, false, 4.6),
('moda', 'M001', 'Camiseta', 80, false, 4.3),
('móveis', 'MO001', 'Cadeira de Escritório', 400, false, 4.7);

INSERT INTO RelacaoProdutoPedido (Pedido_idPedido, Produto_idProduto, Quantidade)
VALUES 
(1, 1, '1'),
(2, 2, '2');

INSERT INTO RelacaoProdutoPedido (Pedido_idPedido, Produto_idProduto, Quantidade) 
VALUES 
(3, 3, 2),  -- Camiseta (Carlos)
(4, 4, 1),  -- Cadeira (Fernanda)
(5, 2, 1);  -- Microondas (Ana)

INSERT INTO Estoque ( Local, Capacidade)
VALUES 
('Armazém 1', 100),
('Armazém 2', 200);

INSERT INTO Estoque (Local, capacidade) 
VALUES 
('Armazém 3', 300), 
('Armazém 4', 150);

INSERT INTO Quantidade (Produto_idProduto, Estoque_idEstoque, Quantidade) 
VALUES 
(3, 3, 50), 
(4, 4, 30);

INSERT INTO Quantidade (Produto_idProduto, Estoque_idEstoque, Quantidade)
VALUES 
(1, 1, 50),
(2, 2, 150);

INSERT INTO Fornecedor (RazaoSocial, CNPJ, Local, contato)
VALUES 
('Fornecedor A', '12345678000199', 'São Paulo', '11987654321'),
('Fornecedor B', '98765432000188', 'Rio de Janeiro', '21987654321');

INSERT INTO Fornecedor (RazaoSocial, CNPJ, Local, contato) 
VALUES 
('Fornecedor C', '12345678900077', 'Salvador', '71999999999'), 
('Fornecedor D', '98765432100088', 'Fortaleza', '85999999999');

INSERT INTO DisponibilizandoProduto (Fornecedor_idFornecedor, Produto_idProduto) 
VALUES 
(3, 3), 
(4, 4);

INSERT INTO DisponibilizandoProduto (Fornecedor_idFornecedor, Produto_idProduto)
VALUES 
(1, 1),
(2, 2);

INSERT INTO TerceiroVendedor (RazaoSocial, Local, CNPJ, NomeAbstrato)
VALUES 
('Vendedor A', 'São Paulo', '12345678000199',  'Vendedor A Abstrato'),
('Vendedor B', 'Rio de Janeiro', '98765432000188',  'Vendedor B Abstrato');

INSERT INTO TerceiroVendedor (RazaoSocial, Local, CNPJ,  NomeAbstrato) 
VALUES 
('Vendedor C', 'Belo Horizonte', '12345678000222',  'Vendedor C Abstrato'), 
('Vendedor D', 'Curitiba', '98765432000333',  'Vendedor D Abstrato');


INSERT INTO TerceiroVendedorHasProduto (TerceiroVendedor_idTerceiroVendedor, Produto_idProduto, Quantidade) 
VALUES 
(5, 3, 15), 
(6, 4, 10);

INSERT INTO TerceiroVendedorHasProduto (TerceiroVendedor_idTerceiroVendedor, Produto_idProduto, Quantidade)
VALUES 
(1, 1, 10),
(2, 2, 20);


select * from cliente;

    
-- Qual o nome inteiro e o email dos clientes?   
SELECT 
    CONCAT(primeiroNome, ' ', nomeMeio, ' ', Sobrenome) AS nome, 
    email 
FROM Cliente;

-- Qual o nome e sobrenome dos clientes do tipo pessoa jurídica?
SELECT primeiroNome, Sobrenome, tipoPessoa 
FROM Cliente
WHERE tipoPessoa = 'juridica';

-- Qual o valor total dos produtos em cada pedido (quantidade * valor unitário)?
SELECT 
    r.Pedido_idPedido AS Pedido, 
    r.Produto_idProduto AS Produto, 
    r.Quantidade, 
    p.valor AS Valor_Unitario,
    r.Quantidade * p.valor AS Valor_Total
FROM RelacaoProdutoPedido r
INNER JOIN Produto p 
    ON r.Produto_idProduto = p.idProduto;

-- Ordenação dos produtos por maior Avalliação 
SELECT Descrição, categoria, valor, avaliação 
FROM Produto
ORDER BY avaliação DESC;


-- Quais pedidos tem valor total maior ou igual a 100?
SELECT 
    r.Pedido_idPedido AS Pedido, 
    SUM(r.Quantidade * p.valor) AS Valor_Total
FROM RelacaoProdutoPedido r
INNER JOIN Produto p 
    ON r.Produto_idProduto = p.idProduto
GROUP BY r.Pedido_idPedido
HAVING SUM(r.Quantidade * p.valor) >= 100;

-- Forma de pagamento por pedido
SELECT 
    p.idPedido AS Pedido,
    pa.forma AS Tipo_Pagamento
FROM Pedido p
INNER JOIN Pagamento pa
    ON p.Cliente_idCliente = pa.Cliente_idCliente;

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.idCliente, 
    c.primeiroNome, 
    COUNT(p.idPedido) AS Numero_de_Pedidos
FROM Cliente c
LEFT JOIN Pedido p 
    ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.primeiroNome;

-- razão de fornecedor e produto
SELECT 
    f.RazaoSocial AS Fornecedor, 
    p.Descrição AS Produto
FROM Fornecedor f
INNER JOIN DisponibilizandoProduto dp 
    ON f.idFornecedor = dp.Fornecedor_idFornecedor
INNER JOIN Produto p 
    ON dp.Produto_idProduto = p.idProduto;


-- Quantos produtos cada forncedor disponibiliza?
SELECT 
    f.RazaoSocial AS Fornecedor, 
    COUNT(dp.Produto_idProduto) AS Total_Produtos
FROM Fornecedor f
INNER JOIN DisponibilizandoProduto dp 
    ON f.idFornecedor = dp.Fornecedor_idFornecedor
GROUP BY f.RazaoSocial
ORDER BY COUNT(dp.Produto_idProduto) DESC;


-- Quais produtos froam entregues e qual o código de rastreio associado a entrega?
SELECT 
    p.Descrição AS Produto, 
    e.Status AS Status_Entrega, 
    e.codigoRastreio 
FROM RelacaoProdutoPedido r
INNER JOIN Pedido pd 
    ON r.Pedido_idPedido = pd.idPedido
INNER JOIN Entrega e 
    ON pd.idPedido = e.Pedido_idPedido
INNER JOIN Produto p 
    ON r.Produto_idProduto = p.idProduto
WHERE e.Status = 'entregue';