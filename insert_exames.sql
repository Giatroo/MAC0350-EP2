INSERT INTO ep2.exame VALUES
	(0,'Infecção grave','COVID-19'),
	(1,'Infecção grave','COVID-19'),
	(2,'Infectado','Mers'),
	(3,'Infectado','COVID-19'),
	(4,'Positivo','Sars'),
	(5,'Infecção grave','Sars'),
	(6,'Inconclusivo','Mers'),
	(7,'Infecção Leve','Dengue'),
	(8,'Positivo','H1N1'),
	(9,'Inconclusivo','Sars'),
	(10,'Positivo','COVID-19'),
	(11,'Negativo','H1N1');

select * from ep2.exame;

select ep2.exame.resultado, ep2.exame.nome_virus, ep2.virus.material_genetico
from ep2.exame join ep2.virus on ep2.exame.nome_virus = ep2.virus.nome_cientifico;

select *
from ep2.exame join ep2.virus on ep2.exame.nome_virus = ep2.virus.nome_cientifico;
