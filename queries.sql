-- query 1
select ep2.exame.codigo, ep2.amostra.tipo_material, ep2.exame.nome_virus,
ep2.paciente.nome, ep2.exame.data_solicitacao, ep2.exame.data_conclusao
from ep2.exame
join ep2.amostra on ep2.amostra.codigo_exame = ep2.exame.codigo
join ep2.paciente on ep2.paciente.cpf = ep2.amostra.cpf;

-- query 2
select ep2.exame.codigo, ep2.exame.nome_virus, ep2.exame.resultado,
(ep2.exame.data_conclusao - ep2.exame.data_solicitacao) as eficiencia
from ep2.exame
order by eficiencia desc
limit 5;

-- query 3
select
	ep2.tutor.login,
	tipo_perfil,
	tipo_servico
from ep2.possui
join ep2.tutor on ep2.possui.identificacao = ep2.tutor.identificacao
join (
	select
		ep2.perfil.tipo as tipo_perfil,
		ep2.servico.tipo as tipo_servico,
		ep2.permite.codigo_perfil
	from ep2.permite
	join ep2.perfil on ep2.permite.codigo_perfil = ep2.perfil.codigo
	join ep2.servico on ep2.permite.codigo_servico = ep2.servico.codigo
) as juntado on ep2.possui.codigo = juntado.codigo_perfil
order by login asc, tipo_perfil asc, tipo_servico asc;


-- query 4
select
	ep2.servico.tipo,
	count(ep2.servico.tipo) as total_utilizado
from ep2.executa
join ep2.servico on ep2.executa.codigo = ep2.servico.codigo
group by ep2.servico.tipo
order by total_utilizado asc;
