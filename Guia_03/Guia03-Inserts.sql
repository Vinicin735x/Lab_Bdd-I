/********************** Povoando as tabelas ************************** */


/*Tabela de Cidade  */

INSERT INTO tbcidade (cdcidade, nmcidade, sgestado) VALUES
(1, 'Ipatinga', 'MG'),
(2, 'Coronel Fabriciano', 'MG'),
(3, 'Timóteo', 'MG'),
(4, 'Campinas', 'SP'),
(5, 'Rio de Janeiro', 'RJ'),
(6, 'Campos', 'RJ'),
(7, 'Campos Altos', 'SP'),
(8, 'Belo Horizonte', 'MG'),
(9, 'Cruzeirinho', 'SP'),
(10, 'Porto Seguro', 'BA'),
(11, 'Agua Limpa', 'SP');
select * from tbcidade;

/*   Tabela de Departamento  */

 INSERT  INTO  tbdepartamento (cddepto,  nmdepto ) VALUES 
( 1,   'CTCF' ),
( 2,   'CSI' ),
( 3,   'ARQUITETURA' ),
( 4,   'PEDAGOGIA' ),
( 5,   'ELÉTRICA' ),
( 6,   'JORNALISMO'),
( 7,   'FARMACIA' ),
( 8,   'INFRAESTRUTURA' );



/* Tabela de Funcionários  */



INSERT INTO tbfuncionario (cdfunc, nmfunc, sexo,cdtipofunc, dtnascim, cddepto, valsal,cdcidadenasc, rua, numero, complemento, fone, cdcidademora)
          VALUES 
( 1,'Renata Vieira Dias','F',NULL, '1980/12/12', 1, 1000, 6, 'Rua Copacabana', 20, 'Apto 102', '38224411',1),
( 2,'Mauro Morais de Miranda','M','CO', '1961/12/10', 1, 1000,  2, 'Rua Alexandria', 441, 'Apto 102', '38221123',2),
( 3,'Renata Maria Santos','F','ES', '1980/12/12', 3, 2300,  2, 'Mariana Januária', 1123, 'Apto 301', '383341141',3),
( 4,'Debora Pereira Coura','F','GE', '1977/07/06', 2, 1750,  5, 'Geraldo Inácio',105, 'Apto 213', '38221341',3),
( 5,'Deisymar Botega','F','ES', '1975/03/07', 2, 2500, 3, 'Francisco de Sales',200, 'Apto 102', '38221122',4),
( 6,'Vinicius Silva','M', 'ES','1970/08/09', 3, 2700,  3, 'Ernane Vilela Lima',89, 'Apto 306', '38226711',3),
( 7,'Demetrius','M', 'ES','1964/09/06', 3, 2700,  4, 'Rua Serra Lima', 94, 'Apto 305', '38221451',3),
( 8,'Reinado','M', 'ES','1967/06/07', 4, 2700,  6, 'Ipanema', 231,'Fundos A', '38221451',3),
( 9,'Alexandreta','F', 'ES','1958/06/01', 5, 2700,  3, 'Moreninha', 189, 'Apto 102', '38221341',3),
( 10,'Carlos Henrique','M', 'ES','1958/06/05', 4, 2700,  3,  'Batista Elvecio',100, 'Apto 303', '38221111',3),
( 11,'Anna Paula Santos','F', 'ES','1957/06/21', 5, 2700,  3,  'Pedro Lopes Silva',176, 'Apto 204', '38221111',3),
( 44,'Miguel','m',NULL, '1980/12/12', 1, 1000, 6, 'Rua Copacabana', 20, 'Apto 102', '38224411',1);








/*    Tabela de Projetos   */

 

INSERT  INTO  tbprojeto (cdprojeto,  nmprojeto,  cdfuncgerente) VALUES 
( 1,   'Desenvolvimento  Humano'  ,   '1'  ),
( 2, 'Inforsol'  ,   '3'  ),
( 3,   'Gerenciamento Lab Mineralogia'  ,   '2'  ),
( 4,   'Gerenciamento Lab Zoologia'  ,   '3'  ),
( 5,   'Gerenciamento Biblioteca'  ,  '2'  ),
( 6,   'Gerenciamento Infraestrutura'  ,   '3'  )   ;




/*  Tabela de Projetos do Funcionário  */


INSERT  INTO  tbfuncprojeto (cdfunc,  cdprojeto,  qtdhoras) VALUES
( 1,  1,   20  ), ( 1,  2,   20  ),
( 1,  4,   34  ), ( 1,  3,   15  ),
( 2,  1,   20  ), ( 2,  3,   16  ),
( 3,  2,   20  ), ( 3,  3,   30  ),
( 3,  4,   20  ), ( 4,  2,   20  ),
( 4,  4,   40  ), ( 5,  2,   20  ),
( 5,  4,   23  ), 
( 6,  2,   45  ), ( 6,  3,   36  ),
( 6,  4,   15  ), ( 7,  4,   15  ),
( 8,  4,   15  ), ( 8,  3,   20  ),
( 9,  4,   15  ), ( 9,  2,   15  ),
( 9,  3,   10  );

select * from tbfuncionario;

/* 1-Listar o nome, sexo e data de nascimento
dos funcionários*/
select nmfunc, sexo, dtnascim from tbfuncionario;

/*2-Listar o nome, sexo e data de nascimento dos funcionários do sexo feminino: */
select nmfunc, sexo, dtnascim from tbfuncionario where sexo='f';

/*3-Ordenado*/
select NmFunc, Sexo, DtNascim  
from tbfuncionario 
where sexo ='f' order by nmfunc;

/*4- Listar todos os dados dos funcionários que nasceram na década de 50*/
select * from tbfuncionario where  (DtNascim >='1950-01-01') and (DtNascim <='1959-12-31');

select * from tbfuncionario where extract(Year from DtNascim)>= 1950 and  extract(Year from DtNascim)<=1959;

/*5 Listar todos os dados dos funcionários que nasceram no mês de dezembro:*/
select * from tbfuncionario where extract(month from dtnascim)=12;

/*6-Listar o nome e o dia e o mês de aniversário de todos os funcionários:*/
select nmfunc, day(dtnascim), month(dtnascim) from tbfuncionario;

/* 7-Listar todos os dados dos funcionários que trabalham para o departamento 
de código 1, 2 ou 3*/
select * from tbfuncionario where CdDepto=1 or CdDepto=2 or CdDepto=3;

select D.CdDepto ,nmdepto, count(cdfunc)
 from tbdepartamento D inner join tbfuncionario F
      on D.Cddepto = F.Cddepto
 group by nmdepto
 order by NmDepto;
 
 select D.CdDepto ,nmdepto, round(avg(valsal),2)
 from tbdepartamento D inner join tbfuncionario F
      on D.Cddepto = F.Cddepto
 group by nmdepto
 order by NmDepto;
 
 select D.CdDepto ,nmdepto, count(cdfunc)
 from tbdepartamento D inner join tbfuncionario F
	  on D.Cddepto = F.Cddepto
 group by nmdepto
 having count(cdfunc) >=3
 order by NmDepto;
 
 select P.NmProjeto, sum(qtdhoras)
 from tbprojeto P inner join tbfuncprojeto FP
      on P.CdProjeto = FP.CdProjeto
 group by nmprojeto
 having sum(qtdhoras) >40
 order by NmProjeto;
 
 
 
