create database GestaoVendas;
use GestaoVendas;

CREATE TABLE Cliente (
cliente_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
cpf CHAR(11),
email VARCHAR(100),
telefone VARCHAR(15)
);
CREATE TABLE Produto (
produto_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
preco DECIMAL(10,2),
estoque INT
);
CREATE TABLE Vendedor (
vendedor_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
email VARCHAR(100),
salario DECIMAL(10,2)
);
CREATE TABLE Venda (
venda_id INT PRIMARY KEY auto_increment,
cliente_id INT,
vendedor_id INT,
data_venda DATE,
total DECIMAL(10,2),
FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
FOREIGN KEY (vendedor_id) REFERENCES Vendedor(vendedor_id)
);
CREATE TABLE ItemVenda (
item_id INT PRIMARY KEY auto_increment,
venda_id INT,
produto_id INT,
quantidade INT,
preco_unitario DECIMAL(10,2),
FOREIGN KEY (venda_id) REFERENCES
Venda(venda_id),
FOREIGN KEY (produto_id) REFERENCES
Produto(produto_id)
);


insert into 
	Cliente (nome, cpf, email, telefone)
    values ('Lucas Andrade Silva','12345678909','anasilva@gmail.com','11978253042'),
    ('Mariana Costa Oliveira','23579816409','mariana.oliveira@yahoo.com.br','21996427781'),
	('Felipe Rocha Almeida','38412650730','felipe.almeida@hotmail.com','31985146620'),
    ('Aline Ferreira Souza','71630498227','aline.souza@outlook.com','41992375814'),
    ('Thiago Mendes Lima','89361024501','thiago.lima@gmail.com','51997401936'),
	('João Silva','89361024509','joaosilva@gmail.com','51997401949');

insert into 
	Produto (nome, preco, estoque)
    values ('Furadeira GSB', 299.00, 35),
    ('Furadeira GSR', 429.00, 20),
    ('Esmerilhadeira GWS', 399.00, 25),
    ('Martelete GBH', 999.00, 50),
    ('Vibrador de Concreto', 99.00, 58);
 
insert into 
	Vendedor (nome, email, salario)
    values ('Ana Beatriz Lima', 'ana.lima@empresa.com', 3200.00),
    ('Carlos Eduardo Souza', 'carlos.souza@empresa.com', 3450.00),
	('Fernanda Rocha', 'fernanda.rocha@empresa.com', 3800.00),
	('Rafael Martins','rafael.martins@empresa.com', 3300.00),
	('Juliana Alves', 'juliana.alves@empresa.com', 9000.00);
    
insert into 
	Venda (cliente_id, vendedor_id, data_venda, total)
    values (1, 1, '2025-07-10', 1495),
    (2, 2, '2025-08-12', 429.00),
	(3, 4, '2025-10-14', 399.00),
	(4, 3, '2023-09-15', 999.00),
	(5, 5, '2024-04-16', 897.00),
    (6, 5, '2024-05-02', 99.00);


insert into 
	ItemVenda (venda_id, produto_id, quantidade, preco_unitario)
    values (1, 1, 5, 299.00),
    (2, 3, 1, 429.00),
	(3, 2, 1, 399.00),
	(4, 4, 1, 999.00 ),
	(5, 2, 3, 299.00),
    (6, 5, 1, 99.00);
    
-- Nomes dos Cliente cadastrados --
select *from Cliente;

-- Nome dos Produtos cadastrados -- 
select nome as Nome_Produtos from Produto;

-- Produtos com preço superior a 100--
select nome as Nome_Produto from Produto where preco > 100.00;

-- Quais Clientes estão cadastrados no sistema --
select nome as Nome_Cliente from Cliente;

-- Produtos e Clientes cadastrados --
select Cliente.nome as Nome_Cliente, Produto.nome as Nome_Produto from Cliente inner join Produto on Cliente.cliente_id = Produto.produto_id;

-- Quantos clientes existem na empresa -- 
select count(*) as QTD_Cliente from Cliente;

-- Quantos produtos estão cadastrados na empresa -- 
select count(*) as QTD_Produto from Produto;

-- Pedidos do ano de 2024 -- 
select data_venda as Data_Venda from Venda where data_venda between '2024-01-01' AND '2024-12-31';

-- Valor total das vendas -- 
select count(*) as Total_Venda from Venda;

-- Valor total das vendas feita pelo funcionario 5 -- 
select SUM(total) from Venda where vendedor_id =5;

-- Valor total das vendas feita pelo cliente João Silva -- 
select SUM(total) from Venda where cliente_id =6;

-- Soma dos pedidos vendas --
select (total) as Total_Venda from Venda;

-- Quantos vendedores ganham mais de 3000 -- 
select nome,salario from Vendedor where salario > 3000.00;

-- Quantos produtos custam mais que 100 --
select count(*) as QTD_Produto from Produto where preco > 100.00;

-- Qual a soma dos valores dos pedidos feitos pelo cliente 2 -- 
select SUM(total) from Venda where cliente_id =2;