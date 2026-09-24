# cria a database testes
CREATE DATABASE IF NOT EXISTS testes;
# usa a base de testes
USE testes; 

# cria a tabela usuarios
CREATE TABLE planos (
	# cria a coluna de id sequencial para os planos como chave primaria 
	plano_id INT AUTO_INCREMENT PRIMARY KEY,
    # cria a coluna de nome do plano com limite de 50 caracteres e define com que não seja nula
    plano_name VARCHAR(50) NOT NULL,
    # cria a coluna de preço com limite de 8 casas de inteiros e 2 dígitos decimais como não nula
	plano_price DECIMAL (8,2) NOT NULL,  
	# cria a coluna de duração como não nula
	plano_duration INT NOT NULL DEFAULT 180
);

CREATE TABLE instrutores(
	instrutor_id INT AUTO_INCREMENT PRIMARY KEY,
    instrutor_name VARCHAR(50) NOT NULL, 
    instrutor_phone VARCHAR(21) NOT NULL, 
	instrutor_specs VARCHAR(50) NOT NULL 
);

CREATE TABLE membros(
	membro_id INT AUTO_INCREMENT PRIMARY KEY,
    membro_name VARCHAR(70) NOT NULL,
    membro_cpf VARCHAR(14) NOT NULL UNIQUE,
    membro_tel VARCHAR(20) NOT NULL,
    membro_birthday DATE NOT NULL
);

CREATE TABLE registrations(
	id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    membro_id INT NOT NULL,
    plano_id INT NOT NULL,
	instrutor_id INT NOT NULL, 
    start_date DATE DEFAULT (CURRENT_DATE),
	CHECK( status in ("ativo", "desativo")),
    FOREIGN KEY (membro_id) REFERENCES membros(membro_id),
	FOREIGN KEY (instrutor_id) REFERENCES instrutores(instrutor_id),
	FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

INSERT INTO planos( plano_name, plano_price, plano_duration) VALUES ("PLANO TOP", 100.00, 12); 
INSERT INTO instrutores(instrutor_name , instrutor_phone, instrutor_specs) VALUES ("Jorjão", "(41)98458-8841", "Pilates");
INSERT INTO membros(membro_name, membro_cpf, membro_tel, membro_birthday) VALUES ("Jorginho", "10430744900", "(41)984588841", "2008-11-11");

SELECT * FROM planos, membros, instrutores;

UPDATE membros SET membro_tel = "(41)99708-6628" WHERE membro_id = 1;

