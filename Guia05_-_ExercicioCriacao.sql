CREATE DATABASE Guia05Exercicio;

USE Guia05Exercicio;	

CREATE TABLE TbCidade(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
	siglaEstado CHAR(2),
	PRIMARY KEY (id)
)ENGINE=innodb;

INSERT INTO TbCidade (id, nome, siglaEstado) VALUES (1, 'Ipatinga', 'MG'),
                                                    (2, 'Coronel Fabriciano', 'MG'),
                                                    (3, 'Timóteo', 'MG'),
                                                    (4, 'Campinas', 'SP'),
                                                    (5, 'Rio de Janeiro', 'RJ'),
                                                    (6, 'Campos', 'RJ'),
                                                    (7, 'Campos Altos', 'SP'),
                                                    (8, 'Belo Horizonte', 'MG'),
                                                    (9, 'São Paulo', 'SP'),
                                                    (10, 'Porto Seguro', 'BA'),
                                                    (11, 'Agua Limpa', 'SP');

CREATE TABLE TbCurso(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
	PRIMARY KEY (id)
)ENGINE=innodb;

INSERT INTO TbCurso(id, nome) VALUES (1, 'Técnico em Desenvolvimento de Sistemas'),
                                     (2, 'Técnico em Edificações'),
                                     (3, 'Técnico em Química'),
                                     (4, 'Técnico em Metalurgia'),
                                     (5, 'Engenharia de Computação'),
                                     (6, 'Engenharia Metalúrgica');

CREATE TABLE TbEmpresa(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	idCidade INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(idCidade) REFERENCES TbCidade(id)
);

INSERT INTO TbEmpresa(id, nome, idCidade) VALUES(1, "Google", 8),
										        (2, "IBM", 5),
										        (3, "Usiminas", 1),
										        (4, "Microsoft", 9),
										        (5, "Aperam", 3);

CREATE TABLE TbPessoa(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
	dataNascimento DATE,
	idCidadeNascimento INT,
	idCidadeResidencia INT,
	sexo CHAR(1),
	cpf VARCHAR(11),
	PRIMARY KEY (id),
	FOREIGN KEY (idCidadeNascimento) REFERENCES TbCidade(id),
	FOREIGN KEY (idCidadeResidencia) REFERENCES TbCidade(id)
)ENGINE=innodb;

INSERT INTO TbPessoa (id, nome, dataNascimento, idCidadeNascimento, idCidadeResidencia, sexo, cpf) VALUES (1, 'Astrogildo', '1999-02-09', 1, 2, 'm', '12345678910'),
                                                                                                          (2, 'Crodoardo', '1989-02-09', 3, 4, 'm', '12345678919'),
                                                                                                          (3, 'Astrogilda', '1979-08-8', 1, 2, 'f', '12345678918'),
                                                                                                          (4, 'AnaBela Silva Sousa', '1995-05-7', 5, 6, 'f', '12345678917'),
                                                                                                          (5, 'Crisoldo Silva Sousa', '2000-05-7', 5, 6, 'm', '12345678916'),
                                                                                                          (6, 'Crizelia Silva Sousa', '2000-05-7', 3, 3, 'f', '12345678915'),
                                                                                                          (7, 'Gumercindo', '1999-02-09', 1, 2, 'm', '12345678914'),
                                                                                                          (8, 'Merlosia', '1979-08-8', 1, 2, 'f', '12345678912'),
                                                                                                          (9, 'Lindofildo Maria Sousa', '2000-05-7', 5, 6, 'm', '12345678911');

CREATE TABLE TbPessoaCurso(
	id INT NOT NULL AUTO_INCREMENT,
	idPessoa INT, 
	idCurso INT,
	nota INT, 
	PRIMARY KEY (id),
	FOREIGN KEY (idPessoa) REFERENCES TbPessoa(id),
	FOREIGN KEY (idCurso) REFERENCES TbCurso(id)
)ENGINE=innodb;

INSERT INTO TbPessoaCurso(id, idPessoa, idCurso, nota) VALUES (1, 1, 5, 80),
                                                              (2, 1, 1, 100),
                                                              (3, 1, 2, 90),
                                                              (4, 1, 5, 95),
                                                              (5, 2, 1, 100),
                                                              (6, 3, 1, 84),
                                                              (7, 4, 1, 100),
                                                              (8, 9, 1, 50),
                                                              (9, 4, 2, 70),
                                                              (10, 4, 5, 89);

Create table TbPessoaEmpresa(
	id INT NOT NULL AUTO_INCREMENT,
	idPessoa INT, 
	idEmpresa INT,
	salario NUMERIC(9,2), 
	PRIMARY KEY (id),
	FOREIGN KEY (idPessoa) REFERENCES TbPessoa(id),
	FOREIGN KEY (idEmpresa) REFERENCES TbEmpresa(id)
)ENGINE=innodb;

INSERT INTO TbPessoaEmpresa (id, idPessoa, idEmpresa, salario) VALUES (1, 5, 1, 1000.00),
                                                                      (2, 7, 1, 2000.00),
                                                                      (3, 8, 2, 1500.00),
                                                                      (4, 6, 2, 1800.00),
                                                                      (5, 9, 3, 1500.00),
                                                                      (6, 1, 3, 3500.00),
                                                                      (8, 5, 2, 1700.00),
                                                                      (9, 7, 3, 1555.25),
                                                                      (10, 8, 4, 2502.00),
                                                                      (11, 9, 1, 1987.00);


