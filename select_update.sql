CREATE DATABASE IF NOT EXISTS escola;
USE escola; 

CREATE TABLE alunos(
	matricula INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(80) NOT NULL, 
    turma VARCHAR(10) NOT NULL
);

INSERT INTO alunos(nome,turma) VALUES ("Jorjão", "3D");
INSERT INTO alunos(nome,turma) VALUES ("Willa", "3D");
INSERT INTO alunos(nome,turma) VALUES ("Dudis", "3D");

SELECT * FROM alunos;

UPDATE alunos SET turma = "4D" WHERE matricula = 1;

SELECT * FROM alunos;



