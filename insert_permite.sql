INSERT INTO ep2.permite VALUES
    (codigo_perfil, codigo_servico)
    -- User
    (0, 13), -- Visualizar exame 
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

select * from ep2.permite;
