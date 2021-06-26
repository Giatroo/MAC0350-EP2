INSERT INTO ep2.exame VALUES
	(0, 'PCR', 'Infecção grave','COVID-19', '2020-11-18', '2020-11-30'),
	(1, 'PCR', 'Infecção grave','COVID-19', '2020-11-19', '2020-11-30'),
	(2, 'Anticorpo', 'Infectado','Mers', '2020-11-19', '2020-11-30'),
	(3, 'Anticorpo', 'Infectado','COVID-19', '2020-11-19', '2020-11-30'),
	(4, 'PCR', 'Positivo','Sars', '2020-11-20', '2020-11-30'),
	(5, 'PCR', 'Infecção grave','Sars', '2020-11-21', '2020-12-01'),
	(6, 'Anticorpo', 'Inconclusivo','Mers', '2020-11-21', '2020-12-01'),
	(7, 'PCR', 'Infecção Leve','Dengue', '2020-11-21', '2020-12-01'),
	(8, 'PCR', 'Positivo','H1N1', '2020-11-22', '2020-12-02'),
	(9, 'Anticorpo', 'Inconclusivo','Sars', '2020-11-23', '2020-12-02'),
	(10, 'Anticorpo', 'Positivo','COVID-19', '2020-11-23', '2020-12-03'),
	(11, 'PCR', 'Negativo','H1N1', '2020-11-23', '2020-12-03');

select * from ep2.exame;

select ep2.exame.resultado, ep2.exame.nome_virus, ep2.virus.material_genetico
from ep2.exame join ep2.virus on ep2.exame.nome_virus = ep2.virus.nome_cientifico;

select *
from ep2.exame join ep2.virus on ep2.exame.nome_virus = ep2.virus.nome_cientifico;
