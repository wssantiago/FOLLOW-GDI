-- Procedimentos, funções e gatilhos (trigger)

-- Printar o CPF e nome dos alunos que cursam o curso com código = cursoCodigo
CREATE OR REPLACE PROCEDURE alunos(cursoCodigo Aluno.cod_curso%TYPE) IS
    CURSOR cur_alunos IS
        SELECT CPF, nome
        FROM Aluno
        WHERE cod_curso = cursoCodigo;

    BEGIN
        DBMS_OUTPUT.PUT_LINE('CPF e nome dos alunos que cursam ' || cursoCodigo || ':');
        FOR reg_cursor IN cur_alunos LOOP
            DBMS_OUTPUT.PUT_LINE('CPF: ' || reg_cursor.CPF || ', nome: ' || reg_cursor.nome);
        END LOOP;

    END;

-- Printar o nome, o código da disciplina e o código do curso que o professor com CPF = CPFdoProfessor leciona
CREATE OR REPLACE PROCEDURE professoresEDisciplina(CPFdoProfessor Professor.CPF%TYPE) IS
    CURSOR cur_Professor IS
        SELECT D.nome, D.cod_disciplina, D.cod_curso
        FROM Disciplina D, Leciona L
        WHERE D.cod_curso = L.cod_curso AND D.cod_disciplina = L.cod_disciplina AND L.CPF_Professor = CPFdoProfessor;
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome e códigos das disciplinas lecionadas pelo professor cujo CPF = ' || CPFdoProfessor || ':');
        FOR reg_cursor IN cur_Professor LOOP
            DBMS_OUTPUT.PUT_LINE('Nome: ' || reg_cursor.nome || ', cod_disciplina: ' || reg_cursor.cod_disciplina || ', cod_curso: ' || reg_cursor.cod_curso);
        END LOOP;

    END;