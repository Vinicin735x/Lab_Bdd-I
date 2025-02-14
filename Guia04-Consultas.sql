# Calcule a soma de todos os salários dos funcionários.
select SUM(salario) as total from tbfuncionario;

# Encontre o maior e o menor salário dos funcionários.
select max(salario) as Maior, min(salario) as Menor 
from tbfuncionario;

#Faça a média salarial dos funcionários por descrição do cargo
select C.descricao as 'Descrição', avg(salario) as Media
from tbfuncionario as F 
inner join tbcargo as C on f.idcargo = c.id
group by C.descricao;

/* Calcule a quantidade total de horas por projeto. 
Exibir o nome projeto e o total de horas.*/
select P.nome as Nome, sum(Pf.quantidadehoras) as Total
from tbProjetofuncionario as PF
inner join tbprojeto as P on pf.idprojeto = p.id
group by P.nome;

# Exibir apenas o código e nome das cidades que não tenham moradores. 
select C.id, C.nome as Cidade from
tbCidade as C left join tbfuncionario F on c.id = f.idCidadeResidencia 
where F.nome is null
group by C.id;

/*Calcular e exibir a quantidade de moradores por cidade. A cidade que não tem moradores deve ser
incluídas nessa relação. */
select C.nome as Cidade, count(F.idCidadeResidencia) as Funcionarios from
tbcidade as C left join tbfuncionario F on c.id = f.idCidadeResidencia 
group by c.nome
order by c.nome;

/*Exibir todos os funcionários (código e nome) e os respectivos projetos (código e nome). O funcionário
que não participa de nenhum projeto deve ser incluído nessa relação.*/
select F.id, F.nome as Funcionario, P.id, P.nome as Projeto from
tbfuncionario as F left join tbprojetofuncionario PF on F.id = PF.idFuncionario 
left join tbProjeto P on PF.idProjeto = P.id
order by F.nome;

SELECT F.id, F.nome as funcionario, P.id, P.nome as projeto
FROM TbFuncionario F left join TbProjetoFuncionario PF on F.id=PF.idFuncionario left join TbProjeto P on
PF.idProjeto=P.id
ORDER BY F.nome, P.nome;











