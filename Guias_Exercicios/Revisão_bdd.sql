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
