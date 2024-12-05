create database Dbrevisao;
use Dbrevisao;

-- passo 2
create table TbPessoa(
	idPessoa int,
    nome varchar(255) not null,
    primary key(idPessoa)
)engine=InnoDB;

-- passo 3
alter table TbPessoa add column CPF varchar(11) unique;

-- passo 4 Refazer o item anterior sendo que deverá: criar o campo CPF primeiro e depois torna-lo índice único.
alter table TbPessoa drop column CPF;
alter table TbPessoa add column CPF varchar(11);
create unique index cpfunico on TbPessoa(CPF);

-- passo 5 Inserir duas pessoas (id e nome)
insert into TbPessoa (idPessoa, nome) values
(1, "Vini"),
(2, "Matheus");
select * from TbPessoa;

-- passo 6 Alterar os dados e acrescentar um CPF para a primeira pessoa cadastrada.
update TbPessoa set CPF= 11122233344 where idPessoa= 1;
update TbPessoa set CPF= 555677888 where idPessoa= 2;
select * from TbPessoa;

-- passo 7 Alterar o campo idpessoa para ser alto incremento
alter table TbPessoa modify column idPessoa int auto_increment;

-- passo 8 Inserir duas outras pessoas. OBS: testar o auto incremento.
insert into TbPessoa (nome, CPF) values
('Camila', 000111),
('Andre', 222333);
select * from TbPessoa;

-- passo 9 Excluir o registro de id 5.
-- delete from TbPessoa where idPessoa= 5; /* não deu mensagem de erro, mas é devido ao fato que não existe idPessoa= 5, por isso vamos mudar de comando*/
delete from TbPessoa where idPessoa= 4;
select * from TbPessoa

-- passo 10 acrescentar a tabela tbcidade
create table TbCidade(
	idcidade int auto_increment,
    nomecid varchar(255),
    estado char(2)
)engine=InnoDB;

alter table TbCidade modify column idcidade int auto_increment primary key; /* eu tinha colocado a tabela para na hora de passar os valores, colocar o id também, após essa mudança vai automático*/

-- passo 11 Inserir 3 cidades
insert into Tbcidade (nomecid, estado) values
("Varginha", "Mg"),
("Lavras", "Mg"),
("São Paulo", "Sp");

-- passo 12 Uma pessoa reside em uma cidade e em uma cidade residem várias pessoas. Estabelecer tal relacionamento entre tbpessoa e tbcidade. (1:N)
alter table tbpessoa add column idcidmora int;
alter table TbPessoa add foreign key(idcidmora) references Tbcidade(idcidade);

-- passo 13 Inserir uma pessoa que se relacione com a cidade de código cujo valor seja 200
ALTER TABLE TbPessoa ADD COLUMN idCidade INT, ADD CONSTRAINT fk_pessoa_cidade FOREIGN KEY (idCidade) REFERENCES TbCidade(idCidade);
-- Cria uma restrição de chave estrangeira chamada fk_pessoa_cidade na coluna idCidade da tabela TbPessoa. Essa restrição indica que os valores da coluna idCidade em TbPessoa devem existir na coluna idCidade da tabela TbCidade.

insert into TbPessoa (nome, CPF, idCidade) values
("Carlos", 111777, 200);
-- esse comando da errado, pois não existe uma cidade com o id 200

-- passo 14 Relacionar as pessoas já cadastradas com cidades existentes
update TbPessoa set idcidade= 2 where idPessoa= 1;
update TbPessoa set idcidade= 1 where idPessoa= 3;
update TbPessoa set idcidade= 3 where idPessoa= 2;
select * from TbPessoa;

-- passo 15 Excluir a cidade chamada “usar um nome de cidade que você cadastrou” 
delete from TbCidade where idCidade= 1; /* erro */
alter table TbPessoa drop foreign key fk_pessoa_cidade;
alter table TbPessoa drop foreign key tbpessoa_ibfk_1;
alter table TbPessoa add foreign key(idcidmora) references tbcidade(idcidade) on delete cascade on update cascade;
update tbPessoa set idcidade= 2 where idPessoa= 3;
delete from TbCidade where idCidade= 2;
select * from Tbcidade;
select * from TbPessoa;

-- passo extra, vou fazer testes
insert into Tbcidade (nomecid, estado) values
("Varginha", "Mg"),
("Lavras", "Mg")