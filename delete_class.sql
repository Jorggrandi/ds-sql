 CREATE DATABASE IF NOT EXISTS clinica;
 USE clinica;
 
 CREATE TABLE pacientes(
	id INT auto_increment primary key,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    peso DECIMAL (3,2),
    altura DECIMAL(3,2), 
    convenio VARCHAR(30)
 );
 
INSERT INTO pacientes(nome,data_nascimento,peso,altura,convenio) 
VALUES ("Jorge", "2008-11-11", 62.2, 1.70, "Paraná Clinicas"),
       ("Tia Ju", "1978-05-23", 60.0, 1.56, "Clinipanson"),
       ("Carlos", "1995-03-18", 78.5, 1.82, "Hospital São Lucas"),
       ("Mariana", "2002-07-09", 55.8, 1.63, "Clínica Vida"),
       ("Rafael", "1988-12-27", 91.3, 1.88, "Hospital Paraná");
       
SELECT * FROM pacientes WHERE convenio = "Clinipanson";
SELECT nome,peso, convenio FROM pacientes WHERE nome = "Rafael";
SELECT * FROM pacientes WHERE nome  LIKE "Ca%";

UPDATE paciente SET peso = 100, convenio = "Clinipanson" WHERE id = 1;
SELECT * FROM pacientes WHERE nome  LIKE "Ca%";

DELETE FROM pacientes;