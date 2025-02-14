/*Criar banco de dados*/
CREATE DATABASE Guia04Exemplo;

USE Guia04Exemplo;	

CREATE TABLE TbCargo(
	id INT AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE TbCidade(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	siglaEstado VARCHAR(2) NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE TbDepartamento(
	id INT AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	idFuncionarioCoordenador INT,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE TbFuncionario (
  id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  dataNascimento DATE NOT NULL,
  salario DECIMAL(9,2) NOT NULL,
  idCidadeNascimento INT NOT NULL,  
  idCidadeResidencia INT NOT NULL,
  idCargo INT NOT NULL,
  idDepartamento INT NOT NULL,  
  PRIMARY KEY(id)
)ENGINE=innodb;

ALTER TABLE TbFuncionario ADD CONSTRAINT FK_TbFuncionario_TbCidadeNascimento FOREIGN KEY(idCidadeNascimento) REFERENCES TbCidade(id);
ALTER TABLE TbFuncionario ADD CONSTRAINT FK_TbFuncionario_TbCidadeResidencia FOREIGN KEY(idCidadeResidencia) REFERENCES TbCidade(id);
ALTER TABLE TbFuncionario ADD CONSTRAINT FK_TbFuncionario_TbDepartamento FOREIGN KEY(idDepartamento) REFERENCES TbDepartamento(id);
ALTER TABLE TbFuncionario ADD CONSTRAINT FK_TbFuncionario_TbCargo FOREIGN KEY(idCargo) REFERENCES TbCargo(id);

ALTER TABLE TbDepartamento ADD CONSTRAINT FK_Departamento_TbFuncionario FOREIGN KEY (idFuncionarioCoordenador) REFERENCES TbFuncionario(id);

CREATE TABLE TbProjeto(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,    
	idFuncionarioResponsavel INT NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

ALTER TABLE TbProjeto ADD CONSTRAINT FK_TbProjeto_TbFuncionario FOREIGN KEY (idFuncionarioResponsavel) REFERENCES TbFuncionario(id);

CREATE TABLE TbProjetoFuncionario(
    id INT AUTO_INCREMENT NOT NULL,
	quantidadeHoras INT NOT NULL,
	idProjeto INT NOT NULL,    
	idFuncionario INT NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

ALTER TABLE TbProjetoFuncionario ADD CONSTRAINT FK_TbProjetoFuncionario_TbFuncionario FOREIGN KEY (idFuncionario) REFERENCES TbFuncionario(id);
ALTER TABLE TbProjetoFuncionario ADD CONSTRAINT FK_TbProjetoFuncionario_TbProjeto FOREIGN KEY (idProjeto) REFERENCES TbProjeto(id);

CREATE UNIQUE INDEX  UN_TbFuncionarioProjeto On TbProjetoFuncionario(idProjeto, idFuncionario); 

/* Povoar tabelas*/                                              
INSERT INTO TbCidade (id, nome, siglaEstado) VALUES (1, 'Ipatinga', 'MG'),
											  (2, 'Coronel Fabriciano', 'MG'),
											  (3, 'Timóteo', 'MG'),
											  (4, 'Campinas', 'SP'),
											  (5, 'Rio de Janeiro', 'RJ'),
											  (6, 'Campos', 'RJ'),
											  (7, 'Campos Altos', 'SP'),
											  (8, 'Belo Horizonte', 'MG'),
											  (9, 'Cruzeirinho', 'SP'),
											  (10, 'Porto Seguro', 'BA'),
											  (11, 'Água Limpa', 'SP');

INSERT  INTO  TbDepartamento (id, descricao) VALUES (1, 'Administrativo'),
 												 (2, 'Financeiro'),
												 (3, 'Recursos Humanos'),
												 (4, 'Comercial');

INSERT INTO TbCargo(id, descricao) VALUES (1, 'Gerente'),
								 (2, 'Auxiliar Administrativo'),
								 (3, 'Supervisor'),
                                 (4, 'Diretor'),
								 (5, 'Estagiário');
                                 
INSERT INTO TbFuncionario (id, nome, sexo, dataNascimento, salario, idCidadeNascimento, idCidadeResidencia, idCargo, idDepartamento) VALUES ( 1, 'Renata Vieira', 'F', '1980/12/12', 1000, 1, 1, 1, 2),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 2, 'Mauro Miranda', 'M', '1991/12/10', 1000, 2, 1, 1, 3),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 3, 'Renata Coura', 'F', '1987/12/12', 2300, 11, 3, 4, 1),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 4, 'Debora Pereira', 'F', '1997/07/06', 1750, 10, 8, 4, 2),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 5, 'Thais Botega', 'F', '1995/03/07', 2500, 8, 2, 3, 1),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 6, 'Vinicius Correa', 'M', '2000/08/09', 2700, 3, 1, 2, 1),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 7, 'Andre Silva', 'M', '1999/09/06', 2700, 2, 2, 3, 4),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 8, 'Ronaldo Mendes', 'M', '1998/06/07', 2700, 1, 2, 3, 4),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 9, 'Alex Filho', 'F', '2001/06/01', 2700, 7, 6, 2, 3),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 10, 'Mario Henrique', 'M', '2003/06/05', 1900, 4, 5, 5, 3),
	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   	   ( 11, 'Paulo Santos', 'F', '2002/06/21', 2700, 1, 5, 5, 3),
                                                                                                                                   ( 12, 'Gumercinda Antonieta', 'F', '1980/12/12', 1000, 1, 1, 1, 2);

UPDATE TbDepartamento SET idFuncionarioCoordenador = 3 WHERE id = 1;
UPDATE TbDepartamento SET idFuncionarioCoordenador = 4 WHERE id = 2;
UPDATE TbDepartamento SET idFuncionarioCoordenador = 9 WHERE id = 3;
UPDATE TbDepartamento SET idFuncionarioCoordenador = 7 WHERE id = 4;

INSERT  INTO  TbProjeto (id, nome, idFuncionarioResponsavel) VALUES (1, 'Indústria 4.0','1'),
															        (2, 'Empresa cidadã', '3'),
															        (3, 'Ginástica laboral', '2'),
															        (4, 'Novo Portal da empresa', '3'),
															        (5, 'Horta Comunitária', '2'),
															        (6, 'Acolhimento Institucional', '3');

INSERT  INTO TbProjetoFuncionario(quantidadeHoras, idFuncionario, idProjeto) VALUES (10,  1, 2), 
																					   (25,  2, 1), 

																					   (11,  3, 3), 
																					   (17,  4, 4), 
																					   (25,  5, 5), 
																					   (21,  6, 6), 
																					   (11,  7, 4), 
																					   (35,  8, 5), 
																					   (13,  9, 1), 
																					   (16,  10, 2), 
																					   (26,  11, 3), 
																					   (39,  1, 3), 
																					   (10,  2, 3), 
																					   (25,  4, 3), 
																					   (12,  5, 6);
                                                                                       
