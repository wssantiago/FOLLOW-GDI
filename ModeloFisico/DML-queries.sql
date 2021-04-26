-- Group by/Having queries

-- Agrupar, por curso, a quantidade de disciplinas que tem carga horária = 75
SELECT cod_curso, COUNT(*) AS Qtd
FROM Disciplina
WHERE CARGA_HORARIA = 75
GROUP BY cod_curso
ORDER BY Qtd DESC;

-- Agrupar, por CPF do Professor, a quantidade de disciplinas lecionadas após o ano de 2019.
-- Projetar apenas professores com mais de uma disciplina lecionada após 2019.
SELECT CPF_professor, COUNT(*)
FROM Leciona
WHERE dt_inicio > DATE'2019-12-31'
GROUP BY CPF_professor
HAVING COUNT(*) > 1;

-- Inner Join

-- Projetar os Professores e os Códigos das Disciplinas que eles lecionam, 
-- sendo o código do curso dessas disciplinas = 'CC001'
SELECT p.nome AS Professor, l.cod_disciplina as Disciplina
FROM Professor p
INNER JOIN Leciona l
    ON p.CPF = l.CPF_professor
WHERE l.cod_curso = 'CC001';


-- Outer Join

-- Projetar o nome do Professor e seu Coordenador
-- Inclusive quando ele não tem nenhum Coordenador
SELECT p1.nome AS Coordenado, p2.nome AS Coordenador
FROM Professor p1
LEFT OUTER JOIN Professor p2
    ON p1.CPF_coordenador = p2.CPF
;

-- Semi Join


-- Projetar os Temas dos Artigos Científicos publicados, cujo código da plataforma de publicação = '167QP67850RQZ30'
SELECT a.tema as Tema
FROM ArtigoCientifico a
WHERE EXISTS (
    SELECT * FROM Publicado p
    WHERE p.DOI = a.DOI AND p.cod_plataforma = '167QP67850RQZ30'
);

-- Anti Join


-- Projetar os alunos que não tem nenhum artigo científico escrito
SELECT a.nome AS Nome
FROM Aluno a
WHERE a.CPF NOT IN (
    SELECT p.CPF_Aluno FROM Participa p
    WHERE p.DOI_artigo IS NOT NULL
);


-- Subconsulta do tipo escalar

-- Projetar os nomes das Disciplinas com carga horária maior do que a carga horária média
SELECT D.nome AS Nome, D.cod_curso AS CodigoDoCurso
FROM Disciplina D
WHERE D.carga_horaria > (SELECT AVG(D2.carga_horaria)
                         FROM Disciplina D2)
;


-- Subconsulta do tipo linha

-- Projetar os nomes dos alunos que nasceram no mesmo ano e fazem o mesmo curso que o(a) aluno(a) de CPF 500.896.666-30

SELECT A.nome
FROM Aluno A
WHERE (EXTRACT(YEAR FROM A.dt_nascimento), A.cod_curso) = (SELECT EXTRACT(YEAR FROM A2.dt_nascimento), A2.cod_curso
                                                           FROM Aluno A2
                                                           WHERE A2.CPF = '500.896.666-30')
;

-- Subconsulta do tipo tabela

-- Projetar os nomes dos professores que são coordenadores
SELECT P.nome as Nome
FROM Professor P
WHERE P.CPF IN (
    SELECT P2.CPF_coordenador
    FROM Professor P2
    WHERE P2.CPF_coordenador IS NOT NULL
);


-- Operação de Conjunto

-- Projetar o nome de todos alunos e professores cujo nome começa com a letra M

SELECT A.nome, 'Aluno(a)' as AlunoOuProfessor
FROM Aluno A 
WHERE A.nome LIKE 'M%'
UNION 
SELECT P.nome, 'Professor(a)' as AlunoOuProfessor
FROM Professor P 
WHERE P.nome LIKE 'M%'
;