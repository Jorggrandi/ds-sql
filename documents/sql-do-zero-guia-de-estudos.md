# SQL do Zero — Guia de Estudos

## 1. O que é SQL?

### Conceito

SQL significa **Structured Query Language** (Linguagem de Consulta Estruturada).

É uma linguagem utilizada para trabalhar com bancos de dados relacionais.

Com SQL podemos:

- criar bancos de dados;
- criar tabelas;
- inserir informações;
- consultar informações;
- alterar informações;
- excluir informações;
- relacionar tabelas;
- filtrar resultados;
- ordenar resultados;
- fazer cálculos e agrupamentos.

### Exemplo

Imagine um sistema de uma escola.

Podemos ter:

- ALUNOS
- CURSOS
- PROFESSORES
- MATRÍCULAS

SQL permite fazer coisas como:

```sql
SELECT *
FROM alunos;
```

Isso significa:

> "Mostre todos os alunos."

---

## 2. O que é um banco de dados?

### Conceito

Um banco de dados é um lugar organizado para armazenar informações.

Imagine um armário:

```text
Banco de dados
│
├── Gaveta de alunos
├── Gaveta de professores
├── Gaveta de cursos
└── Gaveta de matrículas
```

No banco de dados, essas "gavetas" são as **tabelas**.

### Exemplo

```text
Banco: escola

    ├── alunos
    ├── professores
    ├── cursos
    └── matriculas
```

---

## 3. O que é uma tabela?

### Conceito

Uma tabela armazena informações sobre determinado assunto.

Ela é formada por:

- **colunas** → definem quais informações serão armazenadas;
- **linhas** → representam os registros.

### Exemplo

Tabela `alunos`:

| id | nome  | idade |
|----|-------|-------|
| 1  | João  | 18    |
| 2  | Maria | 20    |
| 3  | Pedro | 19    |

Nesse exemplo:

- `id`, `nome` e `idade` são **colunas**;
- cada aluno é uma **linha/registro**.

---

## 4. Criando um banco de dados

### Conceito

Antes de criar tabelas, podemos criar o banco onde elas ficarão.

### Como fazer

```sql
CREATE DATABASE escola;
```

### O que faz?

Cria um banco chamado `escola`.

### Como funciona?

O SGBD cria uma estrutura onde posteriormente poderemos colocar nossas tabelas.

---

## 5. IF NOT EXISTS

Podemos evitar um erro caso o banco já exista.

```sql
CREATE DATABASE IF NOT EXISTS escola;
```

### Como funciona?

O banco verifica:

```text
O banco "escola" existe?
       │
   ┌───┴───┐
  SIM     NÃO
   │        │
não cria   cria
```

---

## 6. Selecionando um banco

Depois de criar o banco, precisamos escolher em qual banco vamos trabalhar.

### Como fazer

```sql
USE escola;
```

### O que faz?

Define `escola` como o banco atualmente selecionado.

Depois disso, quando fizermos:

```sql
CREATE TABLE alunos (...);
```

a tabela será criada dentro de `escola`.

---

## 7. Criando uma tabela

### Conceito

Para armazenar informações precisamos criar tabelas.

### Como fazer

```sql
CREATE TABLE alunos (
    id INT,
    nome VARCHAR(100),
    idade INT
);
```

### O que isso significa?

Estamos criando uma tabela chamada `alunos` com três colunas:

```text
id      → número inteiro
nome    → texto
idade   → número inteiro
```

---

## 8. Tipos de dados

Toda coluna precisa ter um tipo de dado.

O tipo informa ao banco que tipo de informação aquela coluna pode armazenar.

Alguns tipos comuns:

| Tipo       | Utilização         |
|------------|--------------------|
| `INT`      | números inteiros   |
| `DECIMAL`  | números decimais   |
| `VARCHAR`  | textos             |
| `TEXT`     | textos maiores     |
| `DATE`     | datas              |
| `DATETIME` | data e hora        |
| `BOOLEAN`  | verdadeiro/falso   |

---

## 9. INT

### Conceito

`INT` armazena números inteiros.

### Exemplo

```sql
idade INT
```

Pode armazenar:

```text
10
18
25
100
```

Não é apropriado para:

```text
10.5
20.75
```

Para números com casas decimais podemos usar `DECIMAL`.

---

## 10. VARCHAR

### Conceito

`VARCHAR` armazena texto.

### Exemplo

```sql
nome VARCHAR(100)
```

O `100` representa o limite de caracteres.

Podemos armazenar:

```text
João
Maria
Pedro Silva
```

---

## 11. DECIMAL

### Conceito

`DECIMAL` é utilizado para números com casas decimais.

É muito usado para valores financeiros.

### Exemplo

```sql
preco DECIMAL(10,2)
```

O `10` representa o total de dígitos e o `2` representa as casas decimais.

Exemplos:

```text
10.00
25.50
100.99
```

---

## 12. DATE

### Conceito

`DATE` armazena datas.

### Exemplo

```sql
data_nascimento DATE
```

Uma data pode ser:

```text
2005-08-20
```

O formato utilizado é:

```text
AAAA-MM-DD
```

---

## 13. PRIMARY KEY

### Conceito

A chave primária identifica **unicamente** cada registro de uma tabela.

### Exemplo

```sql
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);
```

Podemos ter:

| id | nome  |
|----|-------|
| 1  | João  |
| 2  | Maria |
| 3  | Pedro |

O `id` identifica cada aluno.

Não podemos ter:

| id | nome  |
|----|-------|
| 1  | João  |
| 1  | Maria |

porque o `id` precisa ser único.

---

## 14. AUTO_INCREMENT

### Conceito

`AUTO_INCREMENT` faz o banco gerar automaticamente números sequenciais.

### Exemplo

```sql
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);
```

Agora podemos inserir:

```sql
INSERT INTO alunos (nome)
VALUES ('João');
```

O banco gera:

```text
id = 1
```

Depois:

```sql
INSERT INTO alunos (nome)
VALUES ('Maria');
```

Gera:

```text
id = 2
```

E assim por diante.

---

## 15. NOT NULL

### Conceito

`NOT NULL` impede que uma coluna fique sem valor.

### Exemplo

```sql
nome VARCHAR(100) NOT NULL
```

Isso significa:

> Todo registro precisa possuir um nome.

Não seria permitido:

```sql
INSERT INTO alunos (nome)
VALUES (NULL);
```

---

## 16. DEFAULT

### Conceito

`DEFAULT` define um valor padrão.

### Exemplo

```sql
status VARCHAR(20) DEFAULT 'ativo'
```

Se não informarmos o status:

```sql
INSERT INTO alunos (nome)
VALUES ('João');
```

O banco poderá preencher automaticamente:

```text
status = ativo
```

---

## 17. UNIQUE

### Conceito

`UNIQUE` impede valores repetidos.

### Exemplo

```sql
email VARCHAR(150) UNIQUE
```

Se já existir:

```text
joao@email.com
```

não poderemos cadastrar outro registro com o mesmo email.

É muito útil para informações que precisam ser únicas, como:

- email;
- CPF;
- código de produto;
- número de matrícula.

---

## 18. Inserindo dados com INSERT

### Conceito

`INSERT` adiciona registros em uma tabela.

### Como fazer

```sql
INSERT INTO alunos (nome, idade)
VALUES ('João', 18);
```

### O que acontece?

O banco cria uma nova linha:

| id | nome | idade |
|----|------|-------|
| 1  | João | 18    |

---

## 19. Inserindo vários registros

Podemos inserir vários registros de uma vez.

```sql
INSERT INTO alunos (nome, idade)
VALUES
    ('João', 18),
    ('Maria', 20),
    ('Pedro', 19);
```

Resultado:

| id | nome  | idade |
|----|-------|-------|
| 1  | João  | 18    |
| 2  | Maria | 20    |
| 3  | Pedro | 19    |

---

## 20. Consultando dados com SELECT

### Conceito

`SELECT` serve para consultar informações.

### Como fazer

```sql
SELECT *
FROM alunos;
```

### O que significa?

`*` significa:

> Todas as colunas.

Então o banco retorna todos os dados da tabela.

---

## 21. Selecionando colunas específicas

Não precisamos buscar todas as colunas.

```sql
SELECT nome, idade
FROM alunos;
```

Resultado:

| nome  | idade |
|-------|-------|
| João  | 18    |
| Maria | 20    |
| Pedro | 19    |

---

## 22. WHERE

### Conceito

`WHERE` serve para filtrar registros.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE idade >= 18;
```

O banco procura somente os alunos cuja idade seja maior ou igual a 18.

---

## 23. Operadores de comparação

Podemos utilizar:

```text
=     igual
<>    diferente
>     maior
<     menor
>=    maior ou igual
<=    menor ou igual
```

### Exemplos

```sql
WHERE idade = 18

WHERE idade > 18

WHERE idade < 18

WHERE idade >= 18

WHERE idade <> 18
```

---

## 24. AND

### Conceito

`AND` significa:

> As duas condições precisam ser verdadeiras.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE idade >= 18
AND idade <= 25;
```

Estamos procurando alunos:

```text
idade >= 18
       E
idade <= 25
```

---

## 25. OR

### Conceito

`OR` significa:

> Pelo menos uma das condições precisa ser verdadeira.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE idade = 18
OR idade = 20;
```

Retorna alunos com idade 18 ou 20.

---

## 26. NOT

### Conceito

`NOT` nega uma condição.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE NOT idade = 18;
```

Isso busca alunos cuja idade **não** seja 18.

---

## 27. ORDER BY

### Conceito

`ORDER BY` organiza os resultados.

### Crescente

```sql
SELECT *
FROM alunos
ORDER BY idade ASC;
```

`ASC` significa crescente.

### Decrescente

```sql
SELECT *
FROM alunos
ORDER BY idade DESC;
```

`DESC` significa decrescente.

---

## 28. LIMIT

### Conceito

`LIMIT` limita a quantidade de resultados retornados.

### Exemplo

```sql
SELECT *
FROM alunos
LIMIT 5;
```

Retorna no máximo 5 registros.

---

## 29. LIKE

### Conceito

`LIKE` permite procurar textos que seguem determinado padrão.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE nome LIKE 'Jo%';
```

O `%` significa:

> Qualquer quantidade de caracteres.

Então pode encontrar:

```text
João
Jorge
Jonathan
José
```

---

## 30. % e _

No `LIKE`, existem dois curingas muito importantes.

### `%`

Representa qualquer quantidade de caracteres.

```sql
LIKE 'Jo%'
```

Pode encontrar:

```text
João
Jorge
José
```

### `_`

Representa exatamente um caractere.

```sql
LIKE 'Jo_o'
```

Pode encontrar algo como:

```text
João
Jojo
```

dependendo dos dados.

---

## 31. IS NULL

### Conceito

Para verificar se uma coluna possui `NULL`, usamos `IS NULL`.

### Exemplo

```sql
SELECT *
FROM alunos
WHERE telefone IS NULL;
```

Isso busca alunos que não possuem telefone cadastrado.

---

## 32. IS NOT NULL

Faz o contrário.

```sql
SELECT *
FROM alunos
WHERE telefone IS NOT NULL;
```

Retorna somente alunos que possuem telefone.

---

## 33. Alterando dados com UPDATE

### Conceito

`UPDATE` modifica registros existentes.

### Exemplo

```sql
UPDATE alunos
SET idade = 19
WHERE id = 1;
```

Isso altera a idade do aluno cujo `id` é 1.

---

## 34. Cuidado com UPDATE

Observe:

```sql
UPDATE alunos
SET idade = 19;
```

Não existe `WHERE`.

> ⚠️ Isso pode alterar **todos** os alunos.

Por isso, normalmente usamos:

```sql
UPDATE alunos
SET idade = 19
WHERE id = 1;
```

---

## 35. Excluindo dados com DELETE

### Conceito

`DELETE` remove registros.

### Exemplo

```sql
DELETE FROM alunos
WHERE id = 1;
```

Remove o aluno cujo ID é 1.

---

## 36. Cuidado com DELETE

Nunca esqueça do `WHERE` quando quiser excluir apenas determinados registros.

```sql
DELETE FROM alunos;
```

> ⚠️ Isso remove **todos** os registros da tabela.

---

## 37. ALTER TABLE

### Conceito

`ALTER TABLE` modifica a estrutura de uma tabela existente.

Podemos:

- adicionar colunas;
- modificar colunas;
- remover colunas;
- adicionar restrições.

### Exemplo

Adicionar uma coluna:

```sql
ALTER TABLE alunos
ADD email VARCHAR(150);
```

Agora a tabela possui:

```text
id
nome
idade
email
```

---

## 38. Removendo uma coluna

Podemos usar:

```sql
ALTER TABLE alunos
DROP COLUMN email;
```

Isso remove a coluna `email`.

> ⚠️ **Cuidado:** os dados armazenados nessa coluna também serão removidos.

---

## 39. Relacionamento entre tabelas

### Conceito

Um banco relacional normalmente possui várias tabelas relacionadas.

Imagine:

- ALUNOS
- CURSOS
- MATRÍCULAS

Um aluno pode fazer um curso.

Podemos representar:

```text
ALUNO
  ↓
MATRÍCULA
  ↓
CURSO
```

A tabela de matrícula pode guardar os IDs das outras tabelas.

---

## 40. FOREIGN KEY

### Conceito

Uma chave estrangeira cria uma ligação entre tabelas.

### Exemplo

Tabela `alunos`:

```sql
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);
```

Tabela `cursos`:

```sql
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);
```

Tabela `matriculas`:

```sql
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,

    FOREIGN KEY (aluno_id)
        REFERENCES alunos(id),

    FOREIGN KEY (curso_id)
        REFERENCES cursos(id)
);
```

---

## 41. Como funciona uma FOREIGN KEY

Imagine:

**Alunos**

| id | nome  |
|----|-------|
| 1  | João  |
| 2  | Maria |

**Cursos**

| id | nome   |
|----|--------|
| 1  | SQL    |
| 2  | Python |

**Matrículas**

| id | aluno_id | curso_id |
|----|----------|----------|
| 1  | 1        | 1        |
| 2  | 2        | 2        |

A primeira matrícula significa:

```text
aluno_id = 1
     ↓
João

curso_id = 1
     ↓
SQL
```

Portanto:

> João está matriculado no curso SQL.

---

## 42. INNER JOIN

### Conceito

`INNER JOIN` combina informações relacionadas de duas ou mais tabelas.

### Exemplo

```sql
SELECT
    alunos.nome,
    cursos.nome
FROM matriculas

INNER JOIN alunos
    ON matriculas.aluno_id = alunos.id

INNER JOIN cursos
    ON matriculas.curso_id = cursos.id;
```

Resultado:

| aluno | curso  |
|-------|--------|
| João  | SQL    |
| Maria | Python |

---

## 43. Como entender o JOIN

A parte mais importante é:

```sql
ON matriculas.aluno_id = alunos.id
```

Estamos dizendo:

> Pegue o ID do aluno que está na matrícula e encontre o mesmo ID na tabela de alunos.

Visualmente:

```text
matriculas.aluno_id
        │
        │ igual
        ▼
     alunos.id
```

Depois:

```text
matriculas.curso_id
        │
        │ igual
        ▼
     cursos.id
```

---

## 44. LEFT JOIN

### Conceito

`LEFT JOIN` retorna todos os registros da tabela da esquerda, mesmo que não exista correspondência na tabela da direita.

### Exemplo

```sql
SELECT
    alunos.nome,
    matriculas.id
FROM alunos

LEFT JOIN matriculas
    ON alunos.id = matriculas.aluno_id;
```

Isso pode mostrar alunos que ainda não possuem matrícula.

---

## 45. RIGHT JOIN

Funciona de maneira semelhante ao `LEFT JOIN`, mas prioriza a tabela da direita.

```sql
SELECT
    alunos.nome,
    matriculas.id
FROM alunos

RIGHT JOIN matriculas
    ON alunos.id = matriculas.aluno_id;
```

Na prática, muitos desenvolvedores preferem reorganizar as tabelas e utilizar `LEFT JOIN`, pois costuma ser mais fácil de ler.

---

## 46. COUNT

### Conceito

`COUNT` conta registros.

### Exemplo

```sql
SELECT COUNT(*) AS quantidade
FROM alunos;
```

Resultado:

| quantidade |
|------------|
| 3          |

---

## 47. SUM

### Conceito

`SUM` soma valores.

Imagine:

| produto | preco |
|---------|-------|
| A       | 10    |
| B       | 20    |
| C       | 30    |

Podemos fazer:

```sql
SELECT SUM(preco) AS total
FROM produtos;
```

Resultado:

```text
60
```

---

## 48. AVG

### Conceito

`AVG` calcula uma média.

```sql
SELECT AVG(preco) AS media
FROM produtos;
```

Se os preços forem:

```text
10
20
30
```

a média será:

```text
20
```

---

## 49. MIN

Retorna o menor valor.

```sql
SELECT MIN(preco)
FROM produtos;
```

---

## 50. MAX

Retorna o maior valor.

```sql
SELECT MAX(preco)
FROM produtos;
```

---

## 51. GROUP BY

### Conceito

`GROUP BY` agrupa registros que possuem determinado valor em comum.

Imagine:

| categoria   | produto  |
|-------------|----------|
| Eletrônicos | Celular  |
| Eletrônicos | Notebook |
| Roupas      | Camisa   |
| Roupas      | Calça    |

Podemos contar produtos por categoria:

```sql
SELECT
    categoria,
    COUNT(*) AS quantidade
FROM produtos
GROUP BY categoria;
```

Resultado:

| categoria   | quantidade |
|-------------|------------|
| Eletrônicos | 2          |
| Roupas      | 2          |

---

## 52. HAVING

### Conceito

`HAVING` filtra **grupos**.

É parecido com `WHERE`, mas é utilizado depois do agrupamento.

### Exemplo

```sql
SELECT
    categoria,
    COUNT(*) AS quantidade
FROM produtos
GROUP BY categoria
HAVING COUNT(*) > 1;
```

Estamos dizendo:

> Mostre apenas categorias que possuem mais de um produto.

---

## 53. Diferença entre WHERE e HAVING

Uma maneira simples de lembrar:

```text
WHERE
↓
filtra registros

GROUP BY
↓
agrupa registros

HAVING
↓
filtra grupos
```

Exemplo:

```sql
SELECT
    categoria,
    COUNT(*)
FROM produtos
WHERE preco > 10
GROUP BY categoria
HAVING COUNT(*) > 2;
```

A ordem lógica é:

```text
1. WHERE
2. GROUP BY
3. HAVING
4. SELECT
```

---

## 54. DISTINCT

### Conceito

`DISTINCT` remove valores repetidos do resultado.

Imagine:

| cidade    |
|-----------|
| Curitiba  |
| Curitiba  |
| São Paulo |
| Curitiba  |
| São Paulo |

Podemos fazer:

```sql
SELECT DISTINCT cidade
FROM clientes;
```

Resultado:

| cidade    |
|-----------|
| Curitiba  |
| São Paulo |

---

## 55. IN

### Conceito

`IN` verifica se um valor pertence a uma lista.

Em vez de:

```sql
WHERE cidade = 'Curitiba'
OR cidade = 'São Paulo'
OR cidade = 'Londrina'
```

podemos escrever:

```sql
WHERE cidade IN (
    'Curitiba',
    'São Paulo',
    'Londrina'
);
```

É mais simples de ler.

---

## 56. BETWEEN

### Conceito

`BETWEEN` verifica se um valor está dentro de um intervalo.

### Exemplo

```sql
SELECT *
FROM produtos
WHERE preco BETWEEN 50 AND 100;
```

Procura produtos entre 50 e 100.

---

## 57. CASE

### Conceito

`CASE` permite criar condições dentro do `SELECT`.

### Exemplo

```sql
SELECT
    nome,
    idade,
    CASE
        WHEN idade < 18 THEN 'Menor de idade'
        ELSE 'Maior de idade'
    END AS classificacao
FROM alunos;
```

Resultado:

| nome  | idade | classificacao  |
|-------|-------|----------------|
| João  | 17    | Menor de idade |
| Maria | 20    | Maior de idade |

---

## 58. Alias de tabela

Podemos dar apelidos para tabelas.

Em vez de:

```sql
SELECT alunos.nome
FROM alunos;
```

podemos fazer:

```sql
SELECT a.nome
FROM alunos AS a;
```

Agora:

```text
a
```

representa:

```text
alunos
```

Isso é muito útil em JOINs.

---

## 59. JOIN usando aliases

```sql
SELECT
    a.nome AS aluno,
    c.nome AS curso
FROM matriculas AS m

INNER JOIN alunos AS a
    ON m.aluno_id = a.id

INNER JOIN cursos AS c
    ON m.curso_id = c.id;
```

Isso deixa consultas grandes muito mais fáceis de ler.

---

## 60. A ordem de uma consulta SQL

Uma consulta comum pode ser escrita assim:

```sql
SELECT
    coluna
FROM tabela
WHERE condição
GROUP BY coluna
HAVING condição
ORDER BY coluna
LIMIT quantidade;
```

Por exemplo:

```sql
SELECT
    cidade,
    COUNT(*) AS quantidade
FROM clientes
WHERE idade >= 18
GROUP BY cidade
HAVING COUNT(*) > 5
ORDER BY quantidade DESC
LIMIT 10;
```

---

## 61. Como pensar em SQL

Quando receber um problema, tente transformá-lo em perguntas.

Por exemplo:

> "Quero saber quais clientes têm mais de 18 anos."

Pense:

```text
Quais dados quero mostrar?
↓
clientes

Qual condição?
↓
idade >= 18
```

Então:

```sql
SELECT *
FROM clientes
WHERE idade >= 18;
```

Outro exemplo:

> "Quero saber quantos clientes existem em cada cidade."

Pense:

```text
Quero contar
↓
COUNT

Quero separar por cidade
↓
GROUP BY cidade
```

Então:

```sql
SELECT
    cidade,
    COUNT(*) AS quantidade
FROM clientes
GROUP BY cidade;
```

---

## 62. O que você deve aprender primeiro

Não tente aprender tudo de uma vez.

Uma boa sequência é:

```text
1. O que é banco de dados
        ↓
2. Tabelas e colunas
        ↓
3. Tipos de dados
        ↓
4. PRIMARY KEY
        ↓
5. INSERT
        ↓
6. SELECT
        ↓
7. WHERE
        ↓
8. ORDER BY
        ↓
9. UPDATE
        ↓
10. DELETE
        ↓
11. FOREIGN KEY
        ↓
12. JOIN
        ↓
13. COUNT / SUM / AVG / MIN / MAX
        ↓
14. GROUP BY
        ↓
15. HAVING
```

---

## 63. Resumo para decorar

```text
CREATE
→ cria

INSERT
→ adiciona

SELECT
→ consulta

UPDATE
→ altera

DELETE
→ remove

WHERE
→ filtra

ORDER BY
→ ordena

GROUP BY
→ agrupa

HAVING
→ filtra grupos

JOIN
→ relaciona tabelas

COUNT
→ conta

SUM
→ soma

AVG
→ média

MIN
→ menor

MAX
→ maior

PRIMARY KEY
→ identifica

FOREIGN KEY
→ relaciona

UNIQUE
→ impede repetição

NOT NULL
→ não permite vazio

DEFAULT
→ valor padrão
```

---

## 64. A ideia central do SQL

No final, quase tudo começa com uma pergunta.

Por exemplo:

> "Quero todos os produtos."

```sql
SELECT *
FROM produtos;
```

> "Quero produtos acima de R$100."

```sql
SELECT *
FROM produtos
WHERE preco > 100;
```

> "Quero os produtos do mais caro para o mais barato."

```sql
SELECT *
FROM produtos
ORDER BY preco DESC;
```

> "Quero saber quantos produtos existem."

```sql
SELECT COUNT(*)
FROM produtos;
```

> "Quero saber quantos produtos existem por categoria."

```sql
SELECT
    categoria,
    COUNT(*)
FROM produtos
GROUP BY categoria;
```

> "Quero juntar produtos com suas categorias."

```sql
SELECT
    produtos.nome,
    categorias.nome
FROM produtos
INNER JOIN categorias
    ON produtos.categoria_id = categorias.id;
```

A lógica é sempre transformar uma pergunta em uma sequência de operações SQL.

---

## 65. Regra de ouro

Ao estudar SQL, tente sempre entender:

```text
O QUE eu quero?
        ↓
DE ONDE vêm os dados?
        ↓
PRECISO FILTRAR?
        ↓
PRECISO AGRUPAR?
        ↓
PRECISO RELACIONAR TABELAS?
        ↓
COMO quero ordenar o resultado?
```

Depois transforme isso em:

```text
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

Essa forma de pensar é muito mais importante do que simplesmente decorar comandos.
