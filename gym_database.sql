-- Cria a database testes
CREATE DATABASE IF NOT EXISTS testes;

-- Usa a database testes
USE testes;

-- Cria a tabela de planos
CREATE TABLE planos (
    -- ID sequencial e chave primária
    plano_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Nome do plano
    plano_name VARCHAR(50) NOT NULL,

    -- Preço: até 8 dígitos no total, sendo 2 decimais
    plano_price DECIMAL(8,2) NOT NULL,

    -- Duração em dias
    plano_duration INT NOT NULL DEFAULT 180
);

-- Cria a tabela de instrutores
CREATE TABLE instrutores (
    instrutor_id INT AUTO_INCREMENT PRIMARY KEY,
    instrutor_name VARCHAR(50) NOT NULL,
    instrutor_phone VARCHAR(21) NOT NULL,
    instrutor_specs VARCHAR(50) NOT NULL
);

-- Cria a tabela de membros
CREATE TABLE membros (
    membro_id INT AUTO_INCREMENT PRIMARY KEY,
    membro_name VARCHAR(70) NOT NULL,
    membro_cpf VARCHAR(14) NOT NULL UNIQUE,
    membro_tel VARCHAR(20) NOT NULL,
    membro_birthday DATE NOT NULL
);

-- Cria a tabela de matrículas
CREATE TABLE registrations (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,

    membro_id INT NOT NULL,
    plano_id INT NOT NULL,
    instrutor_id INT NOT NULL,

    start_date DATE DEFAULT (CURRENT_DATE),

    -- A coluna status precisa existir antes do CHECK
    status ENUM ('ativo', 'desativo') NOT NULL DEFAULT 'ativo',
    
    -- Chaves estrangeiras
    FOREIGN KEY (membro_id) REFERENCES membros(membro_id),
    FOREIGN KEY (instrutor_id) REFERENCES instrutores(instrutor_id),
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
    );

-- Insere um plano
INSERT INTO planos (
    plano_name,
    plano_price,
    plano_duration
) VALUES (
    'PLANO TOP',
    100.00,
    12
),
 (
    'PLANO PEBA',
    50.00,
    5
),
(
    'PLANO MAIS PEBA',
    30.00,
    1
);

-- Insere um instrutor
INSERT INTO instrutores (
    instrutor_name,
    instrutor_phone,
    instrutor_specs
) VALUES (
    'Jorjão',
    '(41)98458-8841',
    'Pilates'
),
(
    'EGROJ',
    '(41)99708-6628',
    'Bodybulding'
);

-- Insere um membro
INSERT INTO membros (
    membro_name,
    membro_cpf,
    membro_tel,
    membro_birthday
) VALUES (
    'Jorginho',
    '10430744900',
    '(41)98503-0220',
    '2008-11-11'
),
(
    'Jorjotaz',
    '41807097097',
    '(41)98458-8841',
    '2008-11-11'
);

-- Consulta os dados
SELECT * FROM planos, membros, instrutores;

-- Atualiza o telefone do membro
UPDATE membros
SET membro_tel = '(41)99708-6628'
WHERE membro_id = 1;

INSERT INTO registrations (membro_id,plano_id, instrutor_id , status ) VALUES 
(1,1,1,"ativo"), 
(2,1,2, "inativo"), 
(1,2,2, "inativo") ;

SELECT nome, telefone  FROM membros ORDER BY nome ASC;
SELECT  * FROM planos WHERE plano_price < 100;

SELECT COUNT(*) AS matriculas_ativas FROM registrations WHERE status = "ativo";
SELECT membros.membros_name as aluno, registrations.start_date FROM registrations INNER JOIN membros ON registrations.membro_id - membros.membro_id
