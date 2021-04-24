INSERT INTO Curso 
values ('EC001', 'Engenharia da Computacao')
;

INSERT INTO Curso 
values ('CC001', 'Ciencia da Computacao')
;

INSERT INTO Curso 
values ('SI001', 'Sistemas de Informacao')
;

INSERT INTO Aluno 
values ('130.176.994-04', 'Guilherme Morone Araujo', DATE'2001-02-10', '51002-600', 'Rua Amazing Fraldinha, 602', 9541, 'EC001')
;

INSERT INTO Aluno 
VALUES ('500.896.555-30', 'Josevaldo da Silva Junior', DATE'1995-10-04', '32150-005', 'Avenida Visconde de Sabugosa, 567', 2654, 'EC001')
;

INSERT INTO Aluno 
VALUES ('895.999.754-65', 'Maria Clara Almeida de Oliveira', DATE'2000-07-15', '75649-002', 'Avenida Boa Viagem, 1345', 1738, 'EC001')
;

INSERT INTO Aluno 
VALUES ('500.896.666-30', 'Ana Alice Victoria Dayane dos Santos', DATE'2001-08-22', '99729-001', 'Rua Internacional Sogradesce, 300', 5006, 'SI001')
;

INSERT INTO Aluno 
VALUES ('123.456.789-77', 'John Doe', DATE'2001-03-15', '55555-001', 'Rua Henrique Santos, 30', 8461, 'SI001')
;

INSERT INTO Aluno 
VALUES ('111.222.333-44', 'Williams Felipe Santiago Filho', DATE'2002-03-18', '65423-221', 'Rua Casa Forte, 231', 536, 'CC001')
;

INSERT INTO Professor 
VALUES ('111.111.111-00', 'Elizabeth Harmon', DATE'1980-04-28', '77552-130', 'Rua Chess King, 111', 1, NULL)
;

INSERT INTO Professor 
VALUES ( '225.568.999-03', 'Eduardo Eboy', DATE'1970-05-21', '88899-100', 'Rua Shaman Transformice, 200', 5566, '111.111.111-00')
;

INSERT INTO Professor 
VALUES ('787.560.333-01', 'Lucas Gustavo Albuquerque', DATE'1960-12-30', '53364-008', 'Rua Casa Fraca, 231', 1239, '225.568.999-03')
;

INSERT INTO Professor 
VALUES ('333.888.999-00', 'Maria Antonia Josefa Joana', DATE'1965-06-01', '13054-890', 'Rua Austria Pog, 1755', 3265, '111.111.111-00')
;

INSERT INTO Telefone 
VALUES ('111.111.111-00', '90800-9090')
;

INSERT INTO Telefone 
VALUES ('111.111.111-00', '99988-7777')
;

INSERT INTO Telefone 
VALUES ('225.568.999-03', '95896-7890')
;

INSERT INTO Telefone 
VALUES ('787.560.333-01', '98745-0235')
; 
 
INSERT INTO Telefone 
VALUES ('787.560.333-01', '99666-7888')
;

INSERT INTO Telefone 
VALUES ('333.888.999-00','93123-0001')
;

INSERT INTO PlataformaPublicacao 
VALUES ('167QP67850RQZ30', 'Plataforma para Artigos', 'www.platartigos.com')
;

INSERT INTO PlataformaPublicacao 
VALUES ('325IU99847PQG11', 'Plataforma Sogradesce', 'www.sogrinhartigos.com.br')
;

INSERT INTO PlataformaPublicacao 
VALUES ('180XD65550RTZ15', 'Dale Artigos Cientificos', 'www.platadale.com')
;

INSERT INTO ArtigoCientifico 
VALUES ('xfqt/10000-67QP', DATE'2021-04-10', 'Data Science in Industry')
;

INSERT INTO ArtigoCientifico 
VALUES ('pqrt/66666-88MN', DATE'2019-10-03', 'Publicidade no meio digital')
;

INSERT INTO ArtigoCientifico 
VALUES ('dele/86541-32RG', DATE'2021-02-11', 'Saude em tempos de pandemia')
;

INSERT INTO ArtigoCientifico 
VALUES ('apqr/23654-50XD', DATE'2020-03-25', 'Esportes nas escolas')
;

INSERT INTO ArtigoCientifico 
VALUES ('dale/44557-56XT', DATE'2020-05-07', 'Infraestrutura dos transportes')
;

INSERT INTO Publicado 
VALUES ('xfqt/10000-67QP', '167QP67850RQZ30')
;

INSERT INTO Publicado 
VALUES ('apqr/23654-50XD', '167QP67850RQZ30')
;

INSERT INTO Publicado 
VALUES ('pqrt/66666-88MN', '325IU99847PQG11')
;

INSERT INTO Publicado 
VALUES ('dale/44557-56XT', '180XD65550RTZ15')
;

INSERT INTO Publicado 
VALUES ('dele/86541-32RG', '180XD65550RTZ15')
;

INSERT INTO IniciacaoCientifica 
VALUES ('UI123', 'Computacao', 'Automacao de testes', '111.111.111-00')
;

INSERT INTO IniciacaoCientifica 
VALUES ('XD556', 'Saude', 'Qualidade de vida nas cidades', '787.560.333-01')
;

INSERT INTO IniciacaoCientifica 
VALUES ('PQ224', 'Educacao Fisica', 'Analise de exercicios', '333.888.999-00')
;

INSERT INTO Participa 
VALUES ('130.176.994-04', 'UI123', 'xfqt/10000-67QP')
;

INSERT INTO Participa 
VALUES ('130.176.994-04', 'XD556', NULL)
;

INSERT INTO Participa 
VALUES ('500.896.555-30', 'XD556', 'apqr/23654-50XD')
;

INSERT INTO Participa 
VALUES ('500.896.666-30', 'PQ224', 'pqrt/66666-88MN')
;

INSERT INTO Participa 
VALUES ('500.896.666-30', 'UI123', NULL)
;

INSERT INTO Participa 
VALUES ('111.222.333-44', 'PQ224', NULL)
;

INSERT INTO Participa 
VALUES ('895.999.754-65', 'XD556', 'dele/86541-32RG')
;

INSERT INTO Disciplina 
VALUES ('EC001', 'ECIF648163', 'Introducao a Programacao', 120)
;

INSERT INTO Disciplina 
VALUES('EC001', 'ECIF689071', 'Matematica Discreta', 120)
;

INSERT INTO Disciplina 
VALUES('EC001', 'ECIF419328', 'Calculo 1', 75)
;

INSERT INTO Disciplina 
VALUES('EC001', 'ECIF427251', 'GDI', 75)
;

INSERT INTO Disciplina 
VALUES('CC001', 'CCIF313558', 'Sistemas Inteligentes', 45)
;

INSERT INTO Disciplina 
VALUES('CC001', 'CCIF736376', 'Algoritmos', 75)
;

INSERT INTO Disciplina 
VALUES('CC001', 'CCIF403175', 'Infraestrutura de Software', 75)
;

INSERT INTO Disciplina 
VALUES('CC001', 'CCIF100253', 'Engenharia de Software', 75)
;


INSERT INTO Disciplina 
VALUES('SI001', 'SIIF698158', 'Infraestrutura de Hardware', 75)
;

INSERT INTO Disciplina 
VALUES('SI001', 'SIIF485442', 'GDI', 75)
;

INSERT INTO Disciplina 
VALUES('SI001', 'SIIF415221', 'Introducao a Programacao', 120)
;

INSERT INTO Disciplina 
VALUES('SI001', 'SIIF365904', 'Algebra Linear', 75)
;

INSERT INTO Leciona
VALUES ('111.111.111-00', 'EC001', 'ECIF419328', DATE'2021-01-20')
;

INSERT INTO Leciona
VALUES ('111.111.111-00', 'SI001', 'SIIF365904', DATE'2021-02-03')
;

INSERT INTO Leciona
VALUES ('111.111.111-00', 'EC001', 'ECIF689071', DATE'2020-08-20')
;

INSERT INTO Leciona
VALUES ('225.568.999-03', 'CC001', 'CCIF403175', DATE'2020-02-05')
;

INSERT INTO Leciona
VALUES ('225.568.999-03', 'SI001', 'SIIF698158', DATE'2020-02-02')
;

INSERT INTO Leciona
VALUES ('225.568.999-03', 'SI001', 'SIIF415221', DATE'2019-08-01')
;

INSERT INTO Leciona
VALUES ('787.560.333-01', 'CC001', 'CCIF736376', DATE'2019-02-15')
;

INSERT INTO Leciona
VALUES('787.560.333-01', 'SI001', 'SIIF485442', DATE'2019-03-05')
;

INSERT INTO Leciona
VALUES ('787.560.333-01', 'EC001', 'ECIF648163', DATE'2018-02-06')
;

INSERT INTO Leciona
VALUES ('333.888.999-00', 'EC001', 'ECIF427251', DATE'2018-06-05')
;

INSERT INTO Leciona
VALUES ('333.888.999-00', 'CC001', 'CCIF313558', DATE'2018-08-30')
;

INSERT INTO Leciona
VALUES ('333.888.999-00', 'CC001', 'CCIF100253', DATE'2021-02-01')
;