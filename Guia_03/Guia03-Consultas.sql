use bd_funcionarios;

select round(avg(valsal),2) 'salário médio', sum(valsal) from tbfuncionario;

select count(*) 'Total Mulheres' from tbfuncionario where sexo = 'f' or sexo = 'F';

select count(cdfunc) 'Total Mulheres' from tbfuncionario where sexo = 'f' or sexo = 'F';

select count(cdtipofunc) 'Total Mulheres' from
tbfuncionario where sexo ='f'; ##dá errado pois tem um campo nulo no cdtipofunc

select f.nmfunc, f.cddepto, d.cddepto,d.nmdepto from
tbfuncionario as f inner join tbdepartamento as d on
f.cddepto=d.cddepto;

select f.nmfunc, d.nmdepto, c.nmcidade from
tbfuncionario as f inner join
tbdepartamento as d
on f.cddepto = d.cddepto inner join tbcidade as c
on f.cdcidadeMora=c.cdcidade;

select nmcidade 'cidade', nmfunc 'funcionário' from tbcidade c
inner join tbfuncionario f on c.cdcidade=f.cdcidadeMora
order by nmcidade desc;

select nmcidade 'cidade', nmfunc 'funcionário'
from tbcidade c left join tbfuncionario f
on c.cdcidade=f.cdcidadeMora
order by nmcidade;

select count(cdfunc)
from tbfuncionario
where sexo = 'f';

select sexo, count(cdfunc)
from tbfuncionario
group by sexo;