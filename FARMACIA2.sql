# SELECT
select * from clientes;
select * from compras;
select * from fabricante;
select * from medico;
select * from produtos;
select * from produtos_compra;
select * from receitas_medica;
select * from tipos_produtos;

#INSERIR DADOS

-- Tipos_produtos
insert into tipos_produtos (tipo) values ('Remédios');
insert into tipos_produtos (tipo) values ('Cosmético');
insert into tipos_produtos (tipo) values ('Diversos');

-- Fabricantes
insert into fabricante (fabricante) values ('Sanofi');
insert into fabricante (fabricante) values ('Licaps');

-- Médico
insert into medico (nome, crm) values ('José Pinna', '537');
insert into medico (nome, crm) values ('Antônio da Costa', 349);
insert into medico (nome, crm) values ('Daniel Francisco', '483');

-- Clientes
insert into clientes (nome, endereco, telefone, codigo_postal, localidade, cpf) values ('Manuel Tavares', 'Rua São João, 21', '(49)987555333', '685878', 'Guanabara', '002.147.999.33');
insert into clientes (nome, endereco, telefone, codigo_postal, localidade, cpf) values ('Afonso Mbenda', 'Rua Nazaré, 29', '(11)987551444', '315879', 'Wakanda', '025.147.999.88');
insert into clientes (nome, endereco, telefone, codigo_postal, localidade, cpf) values ('Gabriel da Fonseca', 'Rua Lobito, 56', '(26)998258656', '2487954', 'Rainha da Paz', '506.147.999.41');

-- Produtos
insert into produtos (produto, designacao, composicao, preco_venda, id_tipos_produtos, id_fabricante) 
values ('Paracetamol', 'Dor de cabeça e febre', 'bicabornato de manganês', '6.39', 1, 1);
insert into produtos (produto, designacao, composicao, preco_venda, id_tipos_produtos, id_fabricante) 
values ('Prohn', 'Saúde gastrointestinal', 'Bifidobacterium', '37.58', 1, 2);
insert into produtos (produto, designacao, composicao, preco_venda, id_tipos_produtos, id_fabricante) 
values ('Dulcolax', 'Laxante', 'bisacodil', '35', 1, 1);

-- Compras
insert into compras (id_cliente, data) values (2, '2023-12-30 15:35:25');
insert into compras (id_cliente, data) values (3, '2021-02-23 10:17:47');
insert into compras (id_cliente, data) values (1, '2023-11-11 20:35:27');