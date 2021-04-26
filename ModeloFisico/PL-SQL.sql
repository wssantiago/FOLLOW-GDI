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
/

-- Printar o nome, o código da disciplina e o código do curso que o professor com CPF = CPFdoProfessor leciona
CREATE OR REPLACE PROCEDURE professoresEDisciplina(CPFdoProfessor Professor.CPF%TYPE) IS
    CURSOR cur_Professor IS
        SELECT D.nome, D.cod_disciplina, D.cod_curso
        FROM Disciplina D
        WHERE (D.cod_disciplina, D.cod_curso) IN (
            SELECT L.cod_disciplina, L.cod_curso
            FROM Leciona L
            WHERE L.CPF_Professor = CPFdoProfessor
        );
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome e códigos das disciplinas lecionadas pelo professor cujo CPF = ' || CPFdoProfessor || ':');
        FOR reg_cursor IN cur_Professor LOOP
            DBMS_OUTPUT.PUT_LINE('Nome: ' || reg_cursor.nome || ', cod_disciplina: ' || reg_cursor.cod_disciplina || ', cod_curso: ' || reg_cursor.cod_curso);
        END LOOP;

    END;
/

-- Conta a quantidade de pessoas cujo nome começa com a letra dada
CREATE OR REPLACE FUNCTION contaPessoas(letraAluno CHAR, letraProf CHAR) RETURN INT IS
    contaAluno INT;
    contaProfessor INT;

    BEGIN
        SELECT COUNT(*) INTO contaAluno
        FROM Aluno
        WHERE nome LIKE CONCAT(letraAluno, '%');
        
        SELECT COUNT(*) INTO contaProfessor
        FROM Professor
        WHERE nome LIKE CONCAT(letraProf, '%');

        RETURN contaAluno + contaProfessor;
    END;
/

-- Retorna a quantidade de artigos que a plataforma dada publicou
CREATE OR REPLACE FUNCTION qtdArtigosPlataforma(codigoPlataforma PlataformaPublicacao.cod_plataforma%TYPE) RETURN INT IS
    qtd INT;

    BEGIN
        SELECT COUNT(*) INTO qtd
        FROM Publicado P
        WHERE P.cod_plataforma = codigoPlataforma;

        RETURN qtd;
    END;
/
-- Gatilho que imprime o nome antigo e o novo do aluno ao ser modificado,
-- o antigo nome ao ser deletado e o novo nome ao ser inserido.
CREATE OR REPLACE TRIGGER gatilhoAluno
AFTER DELETE OR INSERT OR UPDATE OF nome ON Aluno
FOR EACH ROW
    BEGIN
        IF UPDATING THEN
            DBMS_OUTPUT.PUT_LINE('Atualizando...');
            DBMS_OUTPUT.PUT_LINE('Nome antigo: ' || :OLD.nome || ', Nome novo: ' || :NEW.nome);
        ELSIF INSERTING THEN
            DBMS_OUTPUT.PUT_LINE('Inserindo...');
            DBMS_OUTPUT.PUT_LINE('Nome: ' || :NEW.nome);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Deletando...');
            DBMS_OUTPUT.PUT_LINE('Nome deletado: ' || :OLD.nome);
        END IF;
    END;
/