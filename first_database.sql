CREATE DATABASE e; 
USE e;

CREATE TABLE teste3(
 id_user INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL
);

INSERT INTO teste3 (nome) VALUES ("Jorjão");
INSERT INTO teste3 (nome) VALUES ("Teste2");

ALTER TABLE teste3
ADD COLUMN telefone VARCHAR(20);

INSERT INTO teste3(nome,telefone) VALUES ("Jorge", "41984588841") NOT NULL;


ALTER TABLE teste3
ADD COLUMN endereco VARCHAR(20);

INSERT INTO teste3(endereco) VALUE ("Tesourinha");

SELECT * FROM teste3;



