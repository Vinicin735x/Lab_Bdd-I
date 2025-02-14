#Criação do banco
create database NomeDoAluno;
use NomeDoAluno;

create table TbTipoExercicio(
	id INT auto_increment,
    nome varchar(200),
    primary key(id)
);

create table TbExercicio(
	id int auto_increment,
    descricao varchar(255),
    idTipoExercicio INT,
    primary key(id),
    foreign key(idTipoExercicio)references TbTipoExercicio(id)
);

create table TbPessoa(
	id int auto_increment,
    nome varchar(200),
    cpf varchar(14), 
    email varchar(200),
    primary key(id)
);

create table TbTreino(
	id int auto_increment,
    quantidade int not null,
    observacao varchar(2000),
	primary key(id),
    foreign key(idPessoa) references TbPessoa(id),
    foreign key(IdExercicio) references TbExercicio(id)
);
    
    
