create database Guia01Exercicio02;
use Guia01Exercicio02;

create table tbProjeto(
	cd INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cdAluno INT,
    PRIMARY KEY(cd)
);

create table tbAluno(
	cd INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cdCidade INT,
    PRIMARY KEY(cd)
);

create table tbEscola(
	cd INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY(cd)
);

create table tbDisciplina(
	cd INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY(cd)
);

alter table TbAluno add column DtNascimento date;
alter table TbAluno add column Sexo char;
select * from TbAluno;

create table tbCidade(
	cd INT,
    nome VARCHAR(255),
    siglaEstado VARCHAR(2)
);
-- altere a tabela de Cidade e indique que o campo código é a chave primária
alter table Tbcidade add primary key(cd);

-- Associe as tabelas Aluno a Cidade. Sendo que um aluno mora em uma cidade e uma cidade tem vários alunos.
alter table tbAluno add FOREIGN KEY(cdCidade) references tbCidade(cd);


ALTER TABLE tbProjeto ADD FOREIGN KEY (cdAluno) REFERENCES tbAluno(cd);

