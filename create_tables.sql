create table ep2.usuario (
	login varchar(40),
	nome varchar(40),
	cpf varchar(14),
	senha varchar(40) not null,
	nascimento date,
	instituicao varchar(40),
	endereco varchar(120),
	primary key (login)
);

create table ep2.servico (
	codigo int,
	descricao varchar(400),
	tipo varchar(30),
	primary key (codigo)
);

create table ep2.perfil (
	codigo int,
	tipo varchar(30),
	primary key(codigo)
);

create table ep2.tutor (
	identificacao int not null,
	login varchar(40),
	primary key (identificacao),
	foreign key (login) references ep2.usuario(login)
);

create table ep2.tutorando (
	identificacao int not null,
	id_tutor int,
	login varchar(40),
	codigo_perfil int,
	codigo_servico int,
	primary key (identificacao),
	foreign key (login) references ep2.usuario(login),
	foreign key (id_tutor) references ep2.tutor(identificacao),
	foreign key (codigo_perfil) references ep2.perfil(codigo),
	foreign key (codigo_servico) references ep2.servico(codigo)
);

create table ep2.executa (
	login varchar(40),
	codigo int,
	horario timestamp not null,
	foreign key (login) references ep2.usuario(login),
	foreign key (codigo) references ep2.servico(codigo)
);

create table ep2.permite (
	codigo_perfil int,
	codigo_servico int,
	foreign key (codigo_perfil) references ep2.perfil(codigo),
	foreign key (codigo_servico) references ep2.servico(codigo)
);

create table ep2.possui (
	identificacao int,
	codigo int,
	foreign key (identificacao) references ep2.tutor(identificacao),
	foreign key (codigo) references ep2.perfil(codigo)
);

create table ep2.virus (
	nome_cientifico varchar(40),
	material_genetico varchar(100),
	primary key (nome_cientifico)
);

create table ep2.exame (
	codigo int,
	resultado varchar(40),
	nome_virus varchar(40),
	primary key (codigo),
	foreign key (nome_virus) references ep2.virus(nome_cientifico)
);

create table ep2.paciente (
	cpf varchar(14),
	nome varchar(40),
	endereco varchar(120),
	nascimento date,
	primary key (cpf)
);

create table ep2.amostra (
	codigo int,
	codigo_exame int,
	cpf varchar(14),
	data_coleta date,
	tipo_material varchar(30),
	primary key (codigo),
	foreign key (codigo_exame) references ep2.exame(codigo),
	foreign key (cpf) references ep2.paciente(cpf)
);

-- atributos multivalorados
create table ep2.area_de_pesquisa (
	area varchar(30),
	login varchar(40),
	foreign key (login) references ep2.usuario(login)
);

create table ep2.resultados_exame (
	resultados varchar(120),
	codigo int,
	foreign key(codigo) references ep2.exame(codigo)
);
