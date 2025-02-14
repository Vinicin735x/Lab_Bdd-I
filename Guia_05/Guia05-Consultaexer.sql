-- Q1 - pessoa com cidade onde mora e onde nasceu
select P.nome, C.nome CidadeMora, C2.nome CidadeNasceu from
tbpessoa as P inner join tbcidade C on c.id = P.idcidaderesidencia
inner join tbcidade C2 on C2.id = P.idcidadenascimento
order by P.nome;

-- Cidades que não tem ninguem
select C.nome CidadeReside, P.nome
from TbPessoa P right join TbCidade C
on P.idCidadeResidencia = C.id
where P.nome is null
order by C.nome;

select C.nome from TbCidade C
where C.id not in (select idCidadeResidencia from TbPessoa);

-- Nome da pessoa, nome da empresa e salário
select P.nome, E.nome, PE.salario
from TbPessoa P inner join TbPessoaEmpresa PE
on P.id = PE.idPessoa inner join TbEmpresa E
on PE.idEmpresa = E.id
order by P.nome;

-- Nome da pessoa, nome da empresa e salário, mostrar pessoas sem empresa
select P.nome, E.nome, PE.salario
from TbPessoa P left join TbPessoaEmpresa PE
on P.id = PE.idPessoa left join TbEmpresa E
on PE.idEmpresa = E.id
order by P.nome;

-- Mostre o nome da pessoa, o nome da empresa e as empresas que não tem pessoas
select P.nome, E.nome, PE.salario
from TbPessoa P right join TbPessoaEmpresa PE
on P.id = PE.idPessoa right join TbEmpresa E
on PE.idEmpresa = E.id
order by P.nome;

-- Juntas as duas anteriores
select P.nome, E.nome, PE.salario
from TbPessoa P left join TbPessoaEmpresa PE
on P.id = PE.idPessoa left join TbEmpresa E
on PE.idEmpresa = E.id
UNION
(select P.nome, E.nome, PE.salario
from TbPessoa P right join TbPessoaEmpresa PE
on P.id = PE.idPessoa right join TbEmpresa E
on PE.idEmpresa = E.id
order by P.nome);

-- Mostrar a quantidade de pessoas em cada empresa
select E.nome, count(idPessoa)
from TbEmpresa E inner join TbPessoaEmpresa TE
on E.id = TE.idEmpresa
group by E.nome;

select E.nome, count(idPessoa)
from TbEmpresa E left join TbPessoaEmpresa TE
on E.id = TE.idEmpresa
group by E.nome;

-- Média salarial das empresas
select E.nome, round(avg(salario),2)
from TbEmpresa E inner join TbPessoaEmpresa TE
on E.id = TE.idEmpresa
group by E.nome;

-- Empresas em que a média salarial seja maior que 2k
select E.nome, round(avg(salario),2) MediaSal
from TbEmpresa E inner join TbPessoaEmpresa TE
on E.id = TE.idEmpresa
group by E.nome
having MediaSal > 2000;

-- Exiba as pessoas do sexo feminio que fizeram algum curso cuja nota > 70
select P.nome, sexo, C.nome, nota
from TbPessoa P inner join TbPessoaCurso PC
on P.id = PC.idPessoa inner join TbCurso C
on C.id = PC.idCurso
where sexo = 'F' and nota > 70; 

