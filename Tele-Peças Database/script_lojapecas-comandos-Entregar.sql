-- -----------------------------------------------------
-- INSERINDOS DADOS NO BANCO: lojapecas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `pessoas` - INSERT
-- -----------------------------------------------------

insert into pessoas (nome,fone,email,complemento) 
	values ('Leonardo','4899998888','leonardo@leonardo.com','N/A'),
			('Anderson','48988887777','anderson@anderson.com','N/A'),
			('Gustavo','48996667744','gustavo@gustavo.com','N/A'),
			('Wendel','48991113355','wendel@wendel.com','N/A'),
			('Chrystian','48992444477','chrystian@chrystian.com','N/A'),
			('Roberto','48991177355','roberto@pecas.com','N/A'),
			('Jose Augusto','48992444477','compras51@carrospecas.com','N/A'),
			('Jose Maria','48992444477','compras44@carrospecas.com','N/A'),
			('Roberta Miranda','48992444477','compra44@carrospecas.com','N/A'),
			('Rino Romei','48992444477','compra45@carrospecas.com','N/A'); 

select * from pessoas;

-- -----------------------------------------------------
-- Table `pessoaFisica` - INSERT 
-- -----------------------------------------------------

insert into pessoaFisica (cpf,rg,nascimento,nacionalidade,sexo,profissao,pessoas_id)
	values ('370.680.729-76','44.778.841-3','1993-09-12','Brasileiro','Masculino','Vendedor',1),
		   ('328.667.439-70','11.885.763-0','1992-01-19','Brasileiro','Masculino','Vendedor',2),
		   ('771.481.419-58','38.064.219-0','1990-08-09','Brasileiro','Feminino','Estudante',3),
		   ('823.282.359-30','47.857.990-1','1999-10-30','Brasileiro','Feminino','Gerente de TI',4),
		   ('281.820.829-78','49.236.003-0','1978-02-20','Brasileiro','Masculino','Compras',5);

select * from pessoaFisica;

-- -----------------------------------------------------
-- Table `pessoaJuridica` - INSERT
-- -----------------------------------------------------

insert into pessoaJuridica (cnpj,ie,dataFundacao,fantasia,ramoAtividade,pessoas_id)
	values ('26858240000115','274185636','2000-09-12','´Peças Auto Ltda','Peças',6),
		   ('14841542000100','433766859','2005-09-12','Funilaria Ltda','Oficina',7),
		   ('19986407000168','687886503','2001-01-12','Acessorios Ramos Ltda','Acessorios Auto',8),
		   ('00790725000120','812446178','2003-05-02','Joaquim Pecas Ltda','Peças',9),
		   ('21633901000190','607090413','1990-12-12','Chevy Motos Ltda','Revenda',10);

select * from pessoaJuridica;

-- -----------------------------------------------------
-- Table `funcionarios` - INSERT
-- -----------------------------------------------------

insert into funcionarios (matricula,funcao,setor,salario,desde,pessoasfisica_id) 
	values ('123456','Vendedor','Vendas',1800.00,'2022-09-02',1),
		('456789','Vendedor','Vendas',1800.00,'2022-08-01',2),
		('987654','Comprador','Compras',2300.45,'2022-07-22',3),
		('654123','Comprador','Compras',2300.00,'2022-06-23',4),
		('467913','Repositor','Estoque',1500.99,'2022-05-19',5);

select * from funcionarios;

-- -----------------------------------------------------
-- Table `clientes` - INSERT
-- -----------------------------------------------------

insert into clientes (canal,desde,ultimaCompra,pessoaJuridica_id,pessoaFisica_id) 
	values	('Balcão','2020-09-02','2022-09-12',null,1),
			('Tele peças','2020-09-02','2022-09-23',null,2),
			('Tele peças','2020-09-02','2022-09-12',null,3),
			('Balcão','2020-09-02','2022-09-12',null,4),
			('Balcão','2021-09-02','2022-09-14',null,5),
            ('Balcão','2020-09-02','2022-09-12',1,null),
			('Tele peças','2020-09-02','2022-09-23',2,null),
			('Tele peças','2020-09-02','2022-09-12',3,null),
			('Balcão','2020-09-02','2022-09-12',4,null),
			('Balcão','2021-09-02','2022-09-14',5,null);

select * from clientes;

-- -----------------------------------------------------
-- Table `produtos` - INSERT
-- -----------------------------------------------------

insert into produtos (partNumber,descricao,ncm,valorCompra,valorVenda,classificacaoDesconto) 
	values ('40052116000R','Corpo de Borboleta',8728,202.14,300.00,'Z1'),
			('4029216000R','Sensor de Nivel',8877,50.12,150.00,'Z2'),
			('5222116000R','Valvula Termostatica',6544,400.14,599.00,'Z3'),
			('85211569844R','Sensor de Temperatura',8766,22.16,55.00,'Z2'),
			('93483909000R','Interruptor da Pressao do Oleo',9090,40.17,70.00,'Z3');

select * from produtos;

-- -----------------------------------------------------
-- Table `enderecos` - INSERT 
-- -----------------------------------------------------

insert into enderecos (logradouro,numero,bairro,cidade,estado,pais,cep) 
	values  ('Rua Beija Flor',55,'Colonial','São Bento do Sul','Santa Catarina','Brasil','89288235'),
			('Rua Marechal Floriano Peixoto',66,'Centro','Blumenau','Santa Catarina','Brasil','89010906'),
            ('Travessa Marcionilo',878,'Serraria','São José','Santa Catarina','Brasil','88115005'),
            ('Rua Martin Pofahl',102,'Itoupava Central','Blumenau','Santa Catarina','Brasil','89062070'),
            ('Rua Dauri Oening',75,'Três Rios do Sul','Jaraguá do Sul','Santa Catarina','Brasil','89254205');
            
select * from enderecos;

-- -----------------------------------------------------
-- Table `pessoas_has_enderecos` - INSERT
-- -----------------------------------------------------

insert into pessoas_has_enderecos (pessoas_id,endereceos_id)
	values (1,2),
		   (4,3),
		   (3,4),
           (2,5),
           (6,1);
           
select * from pessoas_has_enderecos;

-- -----------------------------------------------------
-- Table `impostos` - INSERT 
-- -----------------------------------------------------

insert into impostos (codigo,tipo,percentual)
	values (6202,'Devolução de compra para comercialização',2.9),
		(5102 ,'Venda de mercadoria adquidira de terceiros',5.4),
		(5109,'Venda de produção do estabelecimento',5.4),
		(5102,'Venda de mercadoria adquidira de terceiros',5.4),
		(6202,'Devolução de compra para comercialização',2.9);

select * from impostos;

-- -----------------------------------------------------
-- Table `minhaEmpresas` - INSERT
-- -----------------------------------------------------

insert into minhaEmpresas (inicioAtividades,pessoaJuridica_id)
	values ('2000-09-12',1);

select * from minhaEmpresas;

-- -----------------------------------------------------
-- Table `orcamentos` - INSERT
-- -----------------------------------------------------

insert into orcamentos (numControle,emissao,canal,vendedor,quant,observacoes,produtos_id,funcionarios_id,clientes_id)
	values (0293829032298,now(),'Balcão','Leonardo',2,'Cliente tem urgência',1,1,1),
			(91298091822,now(),'Balcão','Leornardo',4,'Cliente tem urgência',3,1,1),
			(12121212981,now(),'Balcão','Leonardo',5,'Cliente tem urgência',4,1,1),
			(0192891201829,now(),'Balcão','Anderson',1,'Cliente tem urgência',2,2,1),
			(1209128091281,now(),'Balcão','Anderson',3,'Cliente tem urgência',5,2,1);

select * from orcamentos;

-- -----------------------------------------------------
-- Table `fornecedores` - INSERT
-- -----------------------------------------------------

insert into fornecedores (marca,pessoaJuridica_id)
	values ('Ford',1),
			('Ford',1),
			('Ford',1),
			('Renault',1),
			('Renault',1);

select * from fornecedores;

-- -----------------------------------------------------
-- Table `notasFiscais` - INSERT
-- -----------------------------------------------------

insert into notasFiscais (numNota,serieNota,chaveAcesso,tipoNota,natureza,protocolo,formaPagamento,dadosAdicionais,impostos_id) 
	values (0000005.88,001,489489489,'NFE','Venda',now(),'A vista','Essa nota foi enviada por e-mail.',2),
			(0000005.10,001,489489489,'NFE','Venda',now(),'Pix','Essa nota foi enviada por e-mail.',1),
            (00000105.22,001,489489489,'NFE','Venda',now(),'A vista','Essa nota foi enviada por e-mail.',1),
            (00000015.818,001,489489489,'NFE','Venda',now(),'Crédito','Essa nota foi enviada por e-mail.',1),
            (00001005.881,001,489489489,'NFE','Devolução',now(),'Estorno a vista','Essa nota foi enviada por e-mail.',2);

select * from notasFiscais;

-- -----------------------------------------------------
-- Table `compras` - INSERT
-- -----------------------------------------------------

insert into compras (status,observacoes,produtos_id,notasFiscais_id,fornecedores_id)
	values ('Em negociacao','Cliente optou por levar',2,2,1),
			('Aberta','Retirar da loja',4,1,2),
			('Finalizada','Retirar da loja',3,3,2),
			('Finalizada','Retirar da loja',1,2,3),
			('Aberta','Cliente optou por levar',5,5,2);
    
select * from compras;

-- -----------------------------------------------------
-- Table `vendas` - INSERT
-- -----------------------------------------------------

insert into vendas (status,observacoes,clientes_id,produtos_id,notasFiscais_id)
	values ('Aberta','Cliente optou por levar',4,4,4),
			('Aberta','Cliente optou por levar',4,5,4);

select * from vendas;

-- -----------------------------------------------------
-- Table `vendas_has_funcionarios` - INSERT
-- -----------------------------------------------------

insert into vendas_has_funcionarios (vendas_id,funcionarios_id)
	values (1,1),
		   (2,1);

select * from vendas_has_funcionarios;

-- -----------------------------------------------------
-- Table `pessoas` - UPDATE
-- -----------------------------------------------------

update pessoas set fone = 49777881100 where id=1;
update pessoas set fone = 49911002200 where id=2;

-- -----------------------------------------------------
-- Table `funcionarios` - DELETE
-- -----------------------------------------------------
delete from pessoas_has_enderecos where pessoas_id = 1;
delete from pessoas_has_enderecos where pessoas_id = 2;


