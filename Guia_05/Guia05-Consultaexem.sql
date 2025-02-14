# Média salarial Geral
select avg(salario) as Media_geral from tbfuncionario;

#A relação dos funcionários que recebem acima da média geral da empresa. 
select * from tbfuncionario
where salario > (select avg(salario) 
from tbfuncionario);

/*A relação dos funcionários com nome, salário e o cálculo do novo salário*/
select F.nome as Nome, F.salario as Salario, (salario * 1.20) as Novo_Salario
from tbfuncionario as F
where salario <= 2000
UNION 
select F.nome as Nome, F.salario as Salario, (salario * 1.10) as Novo_salario
from tbfuncionario as F
where salario > 2000
order by Novo_Salario Desc;

/* Listar todos os funcionários pertencentes ao departamento Comercial e que tem o total de horas em
projetos maior que o total de horas em projeto de pelo menos um dos funcionários do departamento
“Administrativo”.*/
select F.nome as Nome, sum(quantidadehoras), d.descricao from
tbfuncionario F inner join tbdepartamento D on f.iddepartamento = d.id
inner join tbprojetofuncionario PF on PF.idfuncionario = f.id
where d.descricao = 'Comercial'
group by f.id
having sum(quantidadehoras) > SOME
 ( select sum(quantidadehoras)
from tbfuncionario f inner join tbdepartamento d
 on f.idDepartamento = d.id inner join tbprojetofuncionario pf
 on pf.idFuncionario=f.id
where d.descricao = 'Administrativo'
group by f.id
 );
