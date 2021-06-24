INSERT INTO ep2.amostra VALUES
	(0, 0, '362.061.009-31', '2020-10-10', 'PCR'),
	(1, 0, '362.061.009-31', '2020-10-10', 'Anticorpo'),
	(2, 1, '410.469.301-50', '2020-12-23', 'PCR'),
	(3, 2, '611.463.077-14', '2019-05-03', 'PCR'),
	(4, 3, '184.635.099-44', '2021-03-23', 'PCR'),
	(5, 4, '611.463.077-14', '2019-05-06', 'Anticorpo'),
	(6, 5, '500.068.688-78', '2021-10-27', 'PCR'),
	(7, 6, '826.210.614-11', '2020-02-24', 'Anticorpo'),
	(8, 7, '189.416.953-24', '2020-11-10', 'PCR'),
	(9, 7, '189.416.953-24', '2020-11-11', 'Anticorpo'),
	(10, 8, '821.190.813-19', '2020-07-16', 'Anticorpo'),
	(11, 9, '964.692.851-60', '2020-09-02', 'PCR'),
	(12, 10, '705.613.249-37', '2021-03-07', 'PCR'),
	(13, 10, '705.613.249-37', '2021-03-10', 'Anticorpo'),
	(14, 11, '611.463.077-14', '2021-05-01', 'PCR');

-- delete from ep2.amostra;
select * from ep2.amostra;

select * from ep2.paciente;
select * from ep2.exame;

select ep2.amostra.data_coleta, ep2.amostra.tipo_material,
ep2.paciente.cpf, ep2.paciente.nome,
ep2.exame.resultado, ep2.exame.nome_virus from ep2.amostra
join ep2.paciente on ep2.amostra.cpf = ep2.paciente.cpf
join ep2.exame on ep2.amostra.codigo_exame = ep2.exame.codigo
where ep2.paciente.cpf='611.463.077-14';
