-- Modelo físico
-- Alunos:
-- - Lucas Paiolla Forastiere 11221911
-- - Miguel de Mello Carpi    11208502

-- Criação das tabelas
create table usuario (
	login varchar(40),
	nome varchar(40),
	cpf varchar(14),
	senha varchar(40) not null,
	nascimento date,
	instituicao varchar(40),
	endereco varchar(120),
	primary key (login)
);

create table servico (
	codigo int,
	descricao varchar(400),
	tipo varchar(30),
	primary key (codigo)
);

create table perfil (
	codigo int,
	tipo varchar(30),
	primary key(codigo)
);

create table tutor (
	identificacao int not null,
	login varchar(40),
	primary key (identificacao),
	foreign key (login) references usuario(login)
);

create table tutorando (
	identificacao int not null,
	id_tutor int,
	login varchar(40),
	codigo_perfil int,
	codigo_servico int,
	primary key (identificacao),
	foreign key (login) references usuario(login),
	foreign key (id_tutor) references tutor(identificacao),
	foreign key (codigo_perfil) references perfil(codigo),
	foreign key (codigo_servico) references servico(codigo)
);

create table executa (
	login varchar(40),
	codigo_perfil int,
    codigo_servico int,
	horario timestamp not null,
	foreign key (login) references usuario(login),
	foreign key (codigo_perfil) references perfil(codigo),
	foreign key (codigo_servico) references servico(codigo)
);

create table permite (
	codigo_perfil int,
	codigo_servico int,
	foreign key (codigo_perfil) references perfil(codigo),
	foreign key (codigo_servico) references servico(codigo)
);

create table possui (
	identificacao int,
	codigo int,
	foreign key (identificacao) references tutor(identificacao),
	foreign key (codigo) references perfil(codigo)
);

create table virus (
	nome_cientifico varchar(40),
	material_genetico varchar(100),
	primary key (nome_cientifico)
);

create table exame (
	codigo int,
    tipo varchar(40),
	resultado varchar(40),
	nome_virus varchar(40),
    data_solicitacao date,
    data_conclusao date,
	primary key (codigo),
	foreign key (nome_virus) references virus(nome_cientifico)
);

create table paciente (
	cpf varchar(14),
	nome varchar(40),
	endereco varchar(120),
	nascimento date,
	primary key (cpf)
);

create table amostra (
	codigo int,
	codigo_exame int,
	cpf varchar(14),
	data_coleta date,
	tipo_material varchar(30),
	primary key (codigo),
	foreign key (codigo_exame) references exame(codigo),
	foreign key (cpf) references paciente(cpf)
);

create table area_de_pesquisa (
	area varchar(30),
	login varchar(40),
	foreign key (login) references usuario(login)
);

-- Inserção de dados
INSERT INTO virus VALUES
	('COVID-19', 'UGUAGUCAGGAGGAGCGGGCGGCUGGUAUAGAAGGCCAGCACUAGUUAGAUACUCAGUGCAGUAGCCACGGACUGAUUGUUAUUGGGAGUUAUAUCGGAU'),
	('Dengue', 'GGGACCACGGUUUAUCCACAUCCGGUGGAUAACGUGGGCGGAUUAGUCUGUUGUGCGACAGCAACGAUAGAGAUAGUUAACCACAUCAUCGUAUAUGCGG'),
	('H1N1', 'CGCGUUUGCUGACAGUGAAAAGUUAUCCGUAGAAGUAUACGGAAUAGGGCGCGUUAAACCUAUUUGAAUGAUCCCGCGUCACUCUCUCCAUCUCAAUUCU'),
	('Ebola', 'TCGTGCACATTCGGATACATGGGGCATAGTAGGAGGCCAAGCCTCGTAACCCTGTGCGATGAAGTGTTTTGTTTCCAGGTGACGAAGATCCTCGCGTCAG'),
	('Sars', 'GUUCAUGAGAAGAAUUUUAAUAAAAUUGUAUCAGAUCUAUCGGGCGACCUUCGGGCUGGACAUUUCCAUAUCCACCCAGGGAAAACAAUGAAAGACACCC'),
	('Mers', 'UAAAUUGUCCACACUCGUGAAAUAAGCCUGGGUCGGCUGUAGUGAGCUAGGUAAAAGAACGCAUCCGGAAAUGAAUGUAGUUACCCCGAUGUGAGCCAAU'),
	('Zika', 'GGCCAGACAAUCACGAAACCGCAUUCCGCCCGGUUUUAACACGCUAGAAUUGGAAACCUAAGUCGUCCUGAAACUCUAGGAGGGAAGGGUAGUGAUGCCC');

INSERT INTO paciente VALUES
	('705.613.249-37', 'Marcos', 'Rua Perimetral, número 437, São Paulo, Brasil', '1978-10-03'),
	('964.692.851-60', 'Luciano', 'Rua Perimetral, número 865, ap 78, São Paulo, Brasil', '1973-10-28'),
	('821.190.813-19', 'Miguel', 'Rua do Matão, número 939, ap 89, São Paulo, Brasil', '1974-12-02'),
	('189.416.953-24', 'Gabriela', 'Rua do Matão, número 522, ap 13, São Paulo, Brasil', '1953-08-15'),
	('826.210.614-11', 'Elisabeti', 'Rua Perimetral, número 299, São Paulo, Brasil', '1950-10-17'),
	('500.068.688-78', 'Ana', 'Rua Luis Pinto Flaquer, número 276, São Paulo, Brasil', '1966-03-13'),
	('184.635.099-44', 'Gabriela', 'Rua América, número 762, ap 43, São Paulo, Brasil', '1962-03-30'),
	('611.463.077-14', 'Eduardo', 'Rua Dom Pedro, número 557, ap 89, São Paulo, Brasil', '1955-07-18'),
	('410.469.301-50', 'Davi', 'Rua Luis Pinto Flaquer, número 904, ap 60, São Paulo, Brasil', '1992-09-11'),
	('362.061.009-31', 'Caique', 'Rua Luis Pinto Flaquer, número 542, São Paulo, Brasil', '1987-08-17');

INSERT INTO exame VALUES
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

INSERT INTO amostra VALUES
	(0, 0, '362.061.009-31', '2020-11-19', 'Secreção das vias aéreas'),
	(1, 0, '362.061.009-31', '2020-11-20', 'Secreção das vias aéreas'),
	(2, 1, '410.469.301-50', '2020-11-19', 'Secreção das vias aéreas'),
	(3, 2, '611.463.077-14', '2020-11-19', 'Sangue'),
	(4, 3, '184.635.099-44', '2020-11-23', 'Secreção das vias aéreas'),
	(5, 4, '611.463.077-14', '2020-11-22', 'Secreção das vias aéreas'),
	(6, 5, '500.068.688-78', '2020-11-27', 'Secreção das vias aéreas'),
	(7, 6, '826.210.614-11', '2020-11-24', 'Sangue'),
	(8, 7, '189.416.953-24', '2020-11-23', 'Secreção das vias aéreas'),
	(9, 7, '189.416.953-24', '2020-11-24', 'Secreção das vias aéreas'),
	(10, 8, '821.190.813-19', '2020-11-24', 'Secreção das vias aéreas'),
	(11, 9, '964.692.851-60', '2020-11-23', 'Sangue'),
	(12, 10, '705.613.249-37', '2020-11-24', 'Sangue'),
	(13, 10, '705.613.249-37', '2020-11-25', 'Sangue'),
	(14, 11, '611.463.077-14', '2020-11-24', 'Secreção das vias aéreas');

INSERT INTO perfil VALUES
	(0, 'user'),
	(1, 'admin'),
	(2, 'aluno'),
	(3, 'pesquisador'),
	(4, 'funcionario'),
	(5, 'convidado');

INSERT INTO servico VALUES
	( 0, 'Esse serviço tem como função inserir exame',        'Inserir Exame'),
	( 1, 'Esse serviço tem como função inserir paciente',     'Inserir Paciente'),
	( 2, 'Esse serviço tem como função inserir usuário',      'Inserir Usuário'),
	( 3, 'Esse serviço tem como função inserir amostra',      'Inserir Amostra'),
	( 4, 'Esse serviço tem como função inserir perfil',       'Inserir Perfil'),
	( 5, 'Esse serviço tem como função inserir virus',        'Inserir Virus'),
	( 6, 'Esse serviço tem como função inserir tutorando',    'Inserir Tutorando'),
	( 7, 'Esse serviço tem como função remover exame',        'Remover Exame'),
	( 8, 'Esse serviço tem como função remover paciente',     'Remover Paciente'),
	( 9, 'Esse serviço tem como função remover usuário',      'Remover Usuário'),
	(10, 'Esse serviço tem como função remover amostra',      'Remover Amostra'),
	(11, 'Esse serviço tem como função remover perfil',       'Remover Perfil'),
	(12, 'Esse serviço tem como função remover virus',        'Remover Virus'),
	(13, 'Esse serviço tem como função remover tutorando',    'Remover Tutorando'),
	(14, 'Esse serviço tem como função visualizar exame',     'Visualizar Exame'),
	(15, 'Esse serviço tem como função visualizar paciente',  'Visualizar Paciente'),
	(16, 'Esse serviço tem como função visualizar usuário',   'Visualizar Usuário'),
	(17, 'Esse serviço tem como função visualizar amostra',   'Visualizar Amostra'),
	(18, 'Esse serviço tem como função visualizar perfil',    'Visualizar Perfil'),
	(19, 'Esse serviço tem como função visualizar virus',     'Visualizar Virus'),
	(20, 'Esse serviço tem como função visualizar tutorando', 'Visualizar Tutorando'),
	(21, 'Esse serviço tem como função alterar exame',        'Alterar Exame'),
	(22, 'Esse serviço tem como função alterar paciente',     'Alterar Paciente'),
	(23, 'Esse serviço tem como função alterar usuário',      'Alterar Usuário'),
	(24, 'Esse serviço tem como função alterar amostra',      'Alterar Amostra'),
	(25, 'Esse serviço tem como função alterar perfil',       'Alterar Perfil'),
	(26, 'Esse serviço tem como função alterar virus',        'Alterar Virus'),
	(27, 'Esse serviço tem como função alterar tutorando',    'Alterar Tutorando');

INSERT INTO permite VALUES
    -- User
    (0, 14), -- Visualizar exame
    (0, 17), -- Visualizar amostra
    -- Admin
    (1, 0),
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 11),
    (1, 12),
    (1, 13),
    (1, 14),
    (1, 15),
    (1, 16),
    (1, 17),
    (1, 18),
    (1, 19),
    (1, 20),
    (1, 21),
    (1, 22),
    (1, 23),
    (1, 24),
    (1, 25),
    (1, 26),
    (1, 27),
    -- Aluno
    (2, 14),
    (2, 17),
    (2, 19),
    -- Pesquisador
    (3,  6), -- Inserir tutorando
    (3, 13),
    (3, 14),
    (3, 16),
    (3, 17),
    (3, 19),
    (3, 27),
    -- Funcionario
    (4, 0),
    (4, 1),
    (4, 3),
    (4, 5),
    (4, 21),
    (4, 22),
    (4, 24),
    (4, 26);
    -- Convidado
    -- Não tem permissão para nada

INSERT INTO usuario VALUES
	('usuario31', 'Eduardo', '211.740.814-27', 'O8zHuCY4?SyR.', '1957-02-18', 'Unifesp', 'Rua Perimetral, número 952, ap 86, São Paulo, Brasil'),
	('convidado13', 'Lucas', '605.320.257-84', '#kMP9JhdD7Ord', '1998-01-24', 'UFABC', 'Rua América, número 97, ap 38, São Paulo, Brasil'),
	('xX_demon_slayer_42_Xx', 'Eliana', '613.259.769-73', 'fCv?eQH4.P8', '1971-06-24', 'USP', 'Rua Dom Pedro, número 713, São Paulo, Brasil'),
	('junin123', 'Marina', '946.216.688-39', '5fAVI#5C!R%1!l@@u44', '1959-11-11', 'Mackenzie', 'Rua Perimetral, número 269, São Paulo, Brasil'),
	('usuario13', 'Eliana', '287.382.588-57', '#QJJ.SglwDaWcL', '1980-04-25', 'ITA', 'Rua Perimetral, número 840, ap 75, São Paulo, Brasil'),
	('convidado11', 'Camila', '419.623.781-99', 'TjLcFtI.Z78J', '1980-01-19', 'PUC', 'Rua do Matão, número 653, São Paulo, Brasil'),
	('_darksorcer333_', 'Elisabeti', '359.111.660-40', '%b?miokywsVFlYxpi$M', '1973-05-02', 'UFABC', 'Rua Dom Pedro, número 256, ap 54, São Paulo, Brasil'),
	('arch_user_10', 'Eduardo', '873.655.314-30', '5z9I#!rq?bhACTQzX4O', '1985-02-04', 'Unifesp', 'Rua América, número 241, São Paulo, Brasil'),
	('vim_user', 'Eliana', '253.218.271-60', 'e..OLetxUaH', '1977-01-17', 'UNESP', 'Rua do Matão, número 832, São Paulo, Brasil'),
	('emacs_user', 'Marcos', '932.418.754-79', 'MxYJ@G4TnMTqfb!K', '1999-05-05', 'PUC', 'Rua América, número 753, ap 73, São Paulo, Brasil');

INSERT INTO tutor VALUES
	(0, 'usuario31'), 
	(1, 'convidado13'),
	(2, 'xX_demon_slayer_42_Xx'),
	(3, 'junin123'), 
	(4, 'usuario13'),
	(5, 'convidado11');

INSERT INTO possui VALUES
    (0, 1),
    (1, 3),
    (2, 5),
    (3, 3),
    (3, 4),
    (4, 2),
    (4, 4),
    (5, 1);

INSERT INTO tutorando VALUES
  (0, 3, '_darksorcer333_', 4, 0),
  (1, 3, '_darksorcer333_', 4, 1),
  (2, 3, '_darksorcer333_', 4, 21),
  (3, 3, 'arch_user_10', 4, 0),
  (4, 3, 'arch_user_10', 4, 3),
  (5, 3, 'arch_user_10', 4, 1),
  (6, 3, 'arch_user_10', 4, 21),
  (7, 4, 'vim_user', 3, 14),
  (8, 4, 'vim_user', 3, 16),
  (9, 4, 'vim_user', 3, 17),
  (10, 4, 'vim_user', 3, 19),
  (11, 5, 'emacs_user', 1, 0),
  (12, 5, 'emacs_user', 1, 1),
  (13, 5, 'emacs_user', 1, 2),
  (14, 5, 'emacs_user', 1, 3),
  (15, 5, 'emacs_user', 1, 4),
  (16, 5, 'emacs_user', 1, 5);

INSERT INTO area_de_pesquisa VALUES
    ('Biomedicina',   'usuario31'),
    ('Biomedicina',   'convidado13'),
    ('Infectologia',  'xX_demon_slayer_42_Xx'),
    ('Microbiologia', 'junin123'),
    ('Biomedicina',   'usuario13'),
    ('Infectologia',  'convidado11'),
    ('Biomedicina',   '_darksorcer333_'),
    ('Viralogia',     'arch_user_10'),
    ('Infectologia',  'vim_user'),
    ('Infectologia',  'emacs_user');

INSERT INTO executa VALUES
    ('usuario31' ,   1,  0, '2021-03-08 12:05:06'),
    ('convidado13',  3, 14, '2021-03-08 13:08:46'),
    ('usuario31',    1, 24, '2021-03-08 14:00:03'),
    ('junin123',     3, 14, '2021-03-08 14:03:06'),
    ('junin123',     3, 14, '2021-03-08 14:59:59'),
    ('junin123',     3,  6, '2021-03-08 15:05:03'),
    ('junin123',     3,  6, '2021-03-08 15:13:16'),
    ('vim_user',     3, 14, '2021-03-08 15:15:36'),
    ('emacs_user',   1,  4, '2021-03-08 17:45:54'),
    ('vim_user',     3, 14, '2021-03-08 17:52:23'),
    ('emacs_user',   1,  3, '2021-04-08 13:01:34'),
	('arch_user_10', 4,  1, '2021-04-08 15:32:21'),
	('arch_user_10', 4,  3, '2021-04-08 15:35:54');

-- Consultas
-- 1: Liste todos os exames realizados, com seus respectivos tipos, bem como
-- seus usuários com suas respectivas datas de solicitação e de execução.
select exame.codigo, exame.tipo, exame.nome_virus,
paciente.nome, exame.data_solicitacao, exame.data_conclusao
from exame
join amostra on amostra.codigo_exame = exame.codigo
join paciente on paciente.cpf = amostra.cpf;

-- 2: Liste os 5 exames realizados com maior eficiência (diferença entre data
-- de execução e data de solicitação).
select exame.codigo, exame.nome_virus, exame.resultado,
(exame.data_conclusao - exame.data_solicitacao) as eficiencia
from exame
order by eficiencia asc
limit 5;

-- 3: Liste os serviços que podem ser utilizados por usuários tutelados para
-- cada usuário tutor.
select
	tutor.login,
	tipo_perfil,
	tipo_servico
from possui
join tutor on possui.identificacao = tutor.identificacao
join (
	select
		perfil.tipo as tipo_perfil,
		servico.tipo as tipo_servico,
		permite.codigo_perfil
	from permite
	join perfil on permite.codigo_perfil = perfil.codigo
	join servico on permite.codigo_servico = servico.codigo
) as juntado on possui.codigo = juntado.codigo_perfil
order by login asc, tipo_perfil asc, tipo_servico asc;

-- 4: Liste em ordem crescente o total de serviços utilizados agrupados pelos
-- tipos de serviços disponíveis e pelo perfil dos usuários.
select
	perfil.tipo, servico.tipo,
	count(*)
from executa
join servico on executa.codigo_servico = servico.codigo
join perfil on executa.codigo_perfil = perfil.codigo
group by perfil.tipo, servico.tipo
order by count(*) asc;
