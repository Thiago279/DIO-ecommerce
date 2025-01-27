
# E-commerce Database Project - DIO & Heineken Bootcamp

## Descrição do Projeto

Este projeto foi realizado como parte do bootcamp promovido pela DIO (Digital Innovation One) em parceria com a Heineken. O objetivo foi criar o banco de dados de um cenário de e-commerce a partir do modelo ER desenvolvido anteriormente e populá-lo com dados, também foi necessário desenvolver e executar queries SQL que respondessem a perguntas sobre o banco de dados.

### Descrição do Desafio

A modelagem do banco de dados foi baseada em um cenário de e-commerce, que envolvia clientes (Pessoa Física e Pessoa Jurídica), pedidos, produtos, fornecedores, pagamentos, entre outros. O desafio consistia na replicação do modelo ER do banco de dados e na aplicação de refinamentos adicionais para atender aos requisitos do e-commerce, como:

- **Clientes PJ e PF** – Uma conta pode ser Pessoa Jurídica ou Física, mas não pode ter as duas informações.
- **Pagamentos** – O sistema pode ter mais de uma forma de pagamento.
- **Entrega** – A entrega possui status e código de rastreio.

Além disso, foram necessárias consultas SQL complexas utilizando cláusulas como `SELECT`, `WHERE`, `ORDER BY`, `HAVING`, junções entre tabelas e agregações.

## Objetivo

O objetivo principal foi criar o banco de dados conforme a modelagem, popular os dados e responder a uma série de perguntas usando queries SQL.


## Consultas Criadas / Perguntas Respondidas

Aqui estão algumas das consultas SQL que foram criadas para responder às perguntas do desafio:

### 1. Qual o nome inteiro e o email dos clientes?

```sql
SELECT 
    CONCAT(primeiroNome, ' ', nomeMeio, ' ', Sobrenome) AS nome, 
    email 
FROM Cliente;
```

### 2. Qual o nome e sobrenome dos clientes do tipo pessoa jurídica?

```sql
SELECT primeiroNome, Sobrenome, tipoPessoa 
FROM Cliente
WHERE tipoPessoa = 'juridica';
```

### 3. Qual o valor total dos produtos em cada pedido (quantidade * valor unitário)?

```sql
SELECT 
    r.Pedido_idPedido AS Pedido, 
    r.Produto_idProduto AS Produto, 
    r.Quantidade, 
    p.valor AS Valor_Unitario,
    r.Quantidade * p.valor AS Valor_Total
FROM RelacaoProdutoPedido r
INNER JOIN Produto p 
    ON r.Produto_idProduto = p.idProduto;
```

### 4. Ordenação dos produtos por maior avaliação

```sql
SELECT Descrição, categoria, valor, avaliação 
FROM Produto
ORDER BY avaliação DESC;
```

### 5. Quais pedidos têm valor total maior ou igual a 100?

```sql
SELECT 
    r.Pedido_idPedido AS Pedido, 
    SUM(r.Quantidade * p.valor) AS Valor_Total
FROM RelacaoProdutoPedido r
INNER JOIN Produto p 
    ON r.Produto_idProduto = p.idProduto
GROUP BY r.Pedido_idPedido
HAVING SUM(r.Quantidade * p.valor) >= 100;
```

### 6. Forma de pagamento por pedido

```sql
SELECT 
    p.idPedido AS Pedido,
    pa.forma AS Tipo_Pagamento
FROM Pedido p
INNER JOIN Pagamento pa
    ON p.Cliente_idCliente = pa.Cliente_idCliente;
```

### 7. Quantos pedidos foram feitos por cada cliente?

```sql
SELECT 
    c.idCliente, 
    c.primeiroNome, 
    COUNT(p.idPedido) AS Numero_de_Pedidos
FROM Cliente c
LEFT JOIN Pedido p 
    ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.primeiroNome;
```

### 8. Relação de fornecedor e produto

```sql
SELECT 
    f.RazaoSocial AS Fornecedor, 
    p.Descrição AS Produto
FROM Fornecedor f
INNER JOIN DisponibilizandoProduto dp 
    ON f.idFornecedor = dp.Fornecedor_idFornecedor
INNER JOIN Produto p 
    ON dp.Produto_idProduto = p.idProduto;
```

### 9. Quantos produtos cada fornecedor disponibiliza?

```sql
SELECT 
    f.RazaoSocial AS Fornecedor, 
    COUNT(dp.Produto_idProduto) AS Total_Produtos
FROM Fornecedor f
INNER JOIN DisponibilizandoProduto dp 
    ON f.idFornecedor = dp.Fornecedor_idFornecedor
GROUP BY f.RazaoSocial
ORDER BY COUNT(dp.Produto_idProduto) DESC;
```

### 10. Quais produtos foram entregues e qual o código de rastreio associado à entrega?

```sql
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
```

## Tecnologias Utilizadas

- **Banco de Dados:** MySQL
- **Ferramenta para Criação e População do Banco de Dados:** MySQL Workbench
- **Linguagem SQL:** Para criação de queries e manipulação do banco de dados.

## Instruções para Rodar o Projeto

1. Faça o clone deste repositório em sua máquina local.
2. Importe o arquivo SQL de criação do banco de dados no MySQL Workbench.
3. Execute os scripts de inserção para popular as tabelas.
4. Execute as queries para obter os resultados das perguntas propostas no desafio.

## Conclusão

Este projeto foi uma excelente oportunidade de aplicar o conhecimento em modelagem de banco de dados e SQL. Com ele, foi possível criar um banco de dados robusto para um cenário de e-commerce e desenvolver consultas SQL que respondessem a várias perguntas do negócio, como análise de vendas, estoque e fornecedores.
