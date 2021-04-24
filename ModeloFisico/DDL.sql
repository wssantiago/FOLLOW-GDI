REM   Script: DDL-FOLLOW
REM   table creations

CREATE TABLE PlataformaPublicacao( 
    cod_plataforma VARCHAR(15), 
    nome VARCHAR(50), 
    site VARCHAR(100), 
    CONSTRAINT PlataformaPublicacao_pk PRIMARY KEY (cod_plataforma) 
);

CREATE TABLE ArtigoCientifico( 
    DOI VARCHAR(15), 
    dt_escrita DATE, 
    tema VARCHAR(30), 
    CONSTRAINT ArtigoCientifico_pk PRIMARY KEY (DOI) 
);

CREATE TABLE Curso( 
    cod_curso VARCHAR(5),
    nome VARCHAR(30), 
    CONSTRAINT Curso_pk PRIMARY KEY (cod_curso) 
);

CREATE TABLE Disciplina( 
    cod_curso VARCHAR(5), 
    cod_disciplina VARCHAR(10), 
    nome VARCHAR(30), 
    carga_horaria INT,
    CONSTRAINT Disciplina_pk PRIMARY KEY (cod_curso, cod_disciplina), 
    CONSTRAINT carga_horaria_check CHECK (carga_horaria BETWEEN 45 AND 120), 
    CONSTRAINT Disciplina_Curso_fk FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso) 
);

CREATE TABLE Aluno( 
    CPF VARCHAR(14), 
    nome VARCHAR(50), 
    dt_nascimento DATE, 
    end_CEP VARCHAR(9), 
    end_logradouro VARCHAR(100), 
    matricula INT UNIQUE, 
    cod_curso VARCHAR(5) NOT NULL, 
    CONSTRAINT Aluno_pk PRIMARY KEY (CPF), 
    CONSTRAINT Aluno_Curso_fk FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso), 
    CONSTRAINT matricula_check CHECK (matricula BETWEEN 1 AND 10000) 
);

CREATE TABLE Professor( 
    CPF VARCHAR(14), 
    nome VARCHAR(50), 
    dt_nascimento DATE, 
    end_CEP VARCHAR(9), 
    end_logradouro VARCHAR(100), 
    cod_professor INT UNIQUE, 
    CPF_coordenador VARCHAR(14), 
    CONSTRAINT Professor_pk PRIMARY KEY (CPF), 
    CONSTRAINT Coordenado_Coordenador_fk FOREIGN KEY (CPF_coordenador) REFERENCES Professor(CPF), 
    CONSTRAINT cod_professor_check CHECK (cod_professor BETWEEN 1 AND 10000) 
);

CREATE TABLE Telefone( 
    CPF VARCHAR(14), 
    contato VARCHAR(10), 
    CONSTRAINT Telefone_pk PRIMARY KEY (CPF, contato), 
    CONSTRAINT Telefone_Professor_fk FOREIGN KEY (CPF) REFERENCES Professor(CPF) 
);

CREATE TABLE IniciacaoCientifica( 
    cod_IC VARCHAR(5), 
    area_de_atuacao VARCHAR(50), 
    nome_projeto VARCHAR(30), 
    CPF_professor VARCHAR(14) UNIQUE NOT NULL, 
    CONSTRAINT IniciacaoCientifica_pk PRIMARY KEY (cod_IC), 
    CONSTRAINT IniciacaoCientifica_Professor_fk FOREIGN KEY (CPF_professor) REFERENCES Professor(CPF) 
);

CREATE TABLE Participa( 
    CPF_Aluno VARCHAR(14), 
    cod_IC VARCHAR(5), 
    DOI_artigo VARCHAR(15), 
    CONSTRAINT Participa_pk PRIMARY KEY (CPF_Aluno, cod_IC), 
    CONSTRAINT Participa_Aluno_fk FOREIGN KEY (CPF_Aluno) REFERENCES Aluno(CPF), 
    CONSTRAINT Participa_IniciacaoCientifica_fk FOREIGN KEY (cod_IC) REFERENCES IniciacaoCientifica(cod_IC), 
    CONSTRAINT Participa_ArtigoCientifico_fk FOREIGN KEY (DOI_artigo) REFERENCES ArtigoCientifico(DOI) 
);

CREATE TABLE Publicado( 
    DOI VARCHAR(15), 
    cod_plataforma VARCHAR(15), 
    CONSTRAINT Publicado_pk PRIMARY KEY (DOI, cod_plataforma), 
    CONSTRAINT Publicado_ArtigoCientifico_fk FOREIGN KEY (DOI) REFERENCES ArtigoCientifico(DOI), 
    CONSTRAINT Publicado_PlataformaPublicacao_fk FOREIGN KEY (cod_plataforma) REFERENCES PlataformaPublicacao(cod_plataforma) 
);

CREATE TABLE Leciona( 
    CPF_Professor VARCHAR(14), 
    cod_curso VARCHAR(5), 
    cod_disciplina VARCHAR(10), 
    dt_inicio DATE, 
    CONSTRAINT Leciona_pk PRIMARY KEY (CPF_Professor, cod_curso, cod_disciplina, dt_inicio), 
    CONSTRAINT Leciona_Professor_fk FOREIGN KEY (CPF_Professor) REFERENCES Professor(CPF), 
    CONSTRAINT Leciona_Disciplina_fk FOREIGN KEY (cod_curso, cod_disciplina) REFERENCES Disciplina(cod_curso, cod_disciplina) 
);

