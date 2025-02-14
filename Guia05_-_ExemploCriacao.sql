/*Criar banco de dados*/
CREATE DATABASE guia05exemplo;

USE guia05exemplo;	

CREATE TABLE tbcargo(
	id INT AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE tbcidade(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	siglaestado VARCHAR(2) NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE tbdepartamento(
	id INT AUTO_INCREMENT NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	idfuncionarioCoordenador INT,
	PRIMARY KEY (id)
)ENGINE=innodb;

CREATE TABLE tbfuncionario (
  id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  dataNascimento DATE NOT NULL,
  salario DECIMAL(9,2) NOT NULL,
  idcidadenascimento INT NOT NULL,  
  idcidaderesidencia INT NOT NULL,
  idcargo INT NOT NULL,
  iddepartamento INT NOT NULL,  
  PRIMARY KEY(id)
)ENGINE=innodb;

ALTER TABLE tbfuncionario ADD CONSTRAINT FK_tbfuncionario_tbcidadeNascimento FOREIGN KEY(idcidadenascimento) REFERENCES tbcidade(id);
ALTER TABLE tbfuncionario ADD CONSTRAINT FK_tbfuncionario_tbcidadeResidencia FOREIGN KEY(idcidaderesidencia) REFERENCES tbcidade(id);
ALTER TABLE tbfuncionario ADD CONSTRAINT FK_tbfuncionario_tbdepartamento FOREIGN KEY(iddepartamento) REFERENCES tbdepartamento(id);
ALTER TABLE tbfuncionario ADD CONSTRAINT FK_tbfuncionario_tbcargo FOREIGN KEY(idcargo) REFERENCES tbcargo(id);

ALTER TABLE tbdepartamento ADD CONSTRAINT FK_Departamento_tbfuncionario FOREIGN KEY (idfuncionarioCoordenador) REFERENCES tbfuncionario(id);

CREATE TABLE tbprojeto(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,    
	idfuncionarioresponsavel INT NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

ALTER TABLE tbprojeto ADD CONSTRAINT FK_tbprojeto_tbfuncionario FOREIGN KEY (idfuncionarioresponsavel) REFERENCES tbfuncionario(id);

CREATE TABLE tbprojetofuncionario(
    id INT AUTO_INCREMENT NOT NULL,
	quantidadehoras INT NOT NULL,
	idprojeto INT NOT NULL,    
	idfuncionario INT NOT NULL,
	PRIMARY KEY (id)
)ENGINE=innodb;

ALTER TABLE tbprojetofuncionario ADD CONSTRAINT FK_tbprojetofuncionario_tbfuncionario FOREIGN KEY (idfuncionario) REFERENCES tbfuncionario(id);
ALTER TABLE tbprojetofuncionario ADD CONSTRAINT FK_tbprojetofuncionario_tbprojeto FOREIGN KEY (idprojeto) REFERENCES tbprojeto(id);

CREATE UNIQUE INDEX  UN_tbfuncionarioProjeto On tbprojetofuncionario(idprojeto, idfuncionario); 

/* Povoar tabelas*/                                              
INSERT INTO tbcidade (id, nome, siglaestado) VALUES (1, 'Ipatinga', 'MG'),
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

INSERT  INTO  tbdepartamento (id, descricao) VALUES (1, 'Administrativo'),
 												 (2, 'Financeiro'),
												 (3, 'Recursos Humanos'),
												 (4, 'Comercial');

INSERT INTO tbcargo(id, descricao) VALUES (1, 'Gerente'),
								 (2, 'Auxiliar Administrativo'),
								 (3, 'Supervisor'),
                                 (4, 'Diretor'),
								 (5, 'Estagiário');
                                 
INSERT INTO tbfuncionario (id, nome, sexo, dataNascimento, salario, idcidadenascimento, idcidaderesidencia, idcargo, iddepartamento) VALUES ( 1, 'Renata Vieira', 'F', '1980/12/12', 1000, 1, 1, 1, 2),
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
                                                                                                                                   ( 12, 'Maria das Graças', 'F', '1995/02/10', 1700, 2, 1, 2, 4),
                                                                                                                                   ( 13, 'Paulo José', 'M', '1985/05/05', 2200, 3, 2, 3, 2);

UPDATE tbdepartamento SET idfuncionarioCoordenador = 3 WHERE id = 1;
UPDATE tbdepartamento SET idfuncionarioCoordenador = 4 WHERE id = 2;
UPDATE tbdepartamento SET idfuncionarioCoordenador = 9 WHERE id = 3;
UPDATE tbdepartamento SET idfuncionarioCoordenador = 7 WHERE id = 4;

INSERT  INTO  tbprojeto (id, nome, idfuncionarioresponsavel) VALUES (1, 'Indústria 4.0','1'),
															        (2, 'Empresa cidadã', '3'),
															        (3, 'Ginástica laboral', '2'),
															        (4, 'Novo Portal da empresa', '3'),
															        (5, 'Horta Comunitária', '2'),
															        (6, 'Acolhimento Institucional', '3');

INSERT  INTO tbprojetofuncionario(quantidadehoras, idfuncionario, idprojeto) VALUES (10,  1, 2), 
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
    