create database bd_funcionarios;
use bd_funcionarios;


CREATE TABLE tbcidade(
cdcidade INTEGER  AUTO_INCREMENT ,
nmcidade VARCHAR( 45 ) ,
sgestado VARCHAR( 2 ) ,
PRIMARY KEY ( cdcidade )
)engine=innodb;


CREATE TABLE tbprojeto(
cdprojeto INTEGER  AUTO_INCREMENT ,
cdfuncgerente INTEGER ,
nmprojeto VARCHAR( 100 ) ,
PRIMARY KEY ( cdprojeto )
)engine=innodb;


CREATE TABLE tbdepartamento(
cddepto INTEGER AUTO_INCREMENT ,
cdfuncgerente INTEGER,
nmdepto VARCHAR( 45 ),
PRIMARY KEY ( cddepto )

)engine=innodb;



CREATE TABLE tbfuncionario (
  cdfunc INTEGER AUTO_INCREMENT ,
  cddepto INTEGER ,
  cdcidadeMora INTEGER ,
  cdcidadeNasc INTEGER ,
  nmfunc VARCHAR(45),
  cdtipofunc VARCHAR(2),
  sexo CHAR ,
  dtnascim DATE ,
  valsal NUMERIC ,
  rua varchar(20), 
  numero INTEGER ,
  complemento VARCHAR(10),
  fone VARCHAR(10) ,
  PRIMARY KEY(cdfunc),
  FOREIGN KEY (cdcidadeMora) references tbcidade(cdcidade),
  FOREIGN KEY (cdcidadeNasc) references tbcidade(cdcidade),
  FOREIGN KEY (cddepto) references tbdepartamento(cddepto)
   
)engine=innodb;

Alter table tbdepartamento add FOREIGN KEY (cdfuncgerente) references tbfuncionario(cdfunc);
Alter table tbprojeto add FOREIGN KEY (cdfuncgerente) references tbfuncionario(cdfunc);

CREATE TABLE tbfuncprojeto(
cdfunc INTEGER,
cdprojeto INTEGER,
qtdhoras INTEGER,
PRIMARY KEY ( cdfunc, cdprojeto ) ,
FOREIGN KEY (cdfunc) references tbfuncionario(cdfunc),
FOREIGN KEY (cdprojeto) references tbprojeto(cdprojeto)

)engine=innodb;
