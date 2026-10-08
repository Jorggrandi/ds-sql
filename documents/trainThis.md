🧠 Exercícios de SQL — Do Básico ao JOIN
🟢 Nível 1 — Banco de dados e tabelas
Exercício 1
Crie um banco de dados chamado biblioteca, garantindo que ele não seja recriado caso já exista.

Exercício 2
Selecione o banco de dados biblioteca para realizar os próximos exercícios.

Exercício 3
Crie a tabela livros com os seguintes campos:

id
titulo
autor
ano_publicacao
preco
O identificador deve ser único e gerado automaticamente. O título e o autor devem ser obrigatórios.

Exercício 4
Crie a tabela clientes com os seguintes campos:

id
nome
email
telefone
data_nascimento
O identificador deve ser único e gerado automaticamente. O nome deve ser obrigatório e não podem existir dois clientes com o mesmo e-mail.

🟢 Nível 2 — Inserção de dados
Exercício 5
Cadastre pelo menos 5 livros na biblioteca.

Inclua informações variadas de título, autor, ano de publicação e preço.

Exercício 6
Cadastre pelo menos 5 clientes.

Cada cliente deve possuir nome, e-mail, telefone e data de nascimento.

Exercício 7
Cadastre 3 novos livros de uma única vez.

🟢 Nível 3 — Consulta de dados
Exercício 8
Consulte todos os livros cadastrados.

Exercício 9
Consulte somente o título e o autor de cada livro.

Exercício 10
Consulte somente o nome e o e-mail dos clientes.

Exercício 11
Consulte os títulos dos livros fazendo com que a coluna apresentada tenha o nome livro.

🟡 Nível 4 — Filtros
Exercício 12
Encontre todos os livros publicados depois do ano 2000.

Exercício 13
Encontre todos os livros com preço inferior a 50.

Exercício 14
Encontre todos os livros com preço superior a 30.

Exercício 15
Encontre todos os livros publicados no ano de 1899.

Exercício 16
Encontre todos os livros cujo preço não seja 50.

Exercício 17
Encontre os livros cujo preço esteja acima de 20 e abaixo de 60.

Exercício 18
Encontre os livros publicados em 1899 ou em 2020.

Exercício 19
Resolva novamente o exercício anterior utilizando outra forma de representar a condição.

Exercício 20
Encontre os livros cujo preço esteja entre 30 e 70.

Exercício 21
Encontre todos os livros cujo título comece com a letra O.

Exercício 22
Encontre todos os livros cujo autor tenha Silva em alguma parte do nome.

🟡 Nível 5 — Ordenação
Exercício 23
Liste os livros começando pelo menor preço.

Exercício 24
Liste os livros começando pelo maior preço.

Exercício 25
Liste os clientes em ordem alfabética pelo nome.

Exercício 26
Mostre somente os três livros com os maiores preços.

🟡 Nível 6 — Alteração de dados
Exercício 27
Aumente em R$ 4,00 o preço de um livro específico.

Exercício 28
Altere o telefone de um cliente específico.

Exercício 29
Aumente em R$ 5,00 o preço de todos os livros cadastrados.

🟡 Nível 7 — Exclusão de dados
Exercício 30
Exclua um cliente específico.

Exercício 31
Exclua um livro específico.

Exercício 32
Analise o que aconteceria caso todos os registros da tabela livros fossem excluídos de uma única vez.

Explique o resultado esperado.

🔵 Nível 8 — Chave primária
Exercício 33
Explique, com suas próprias palavras, o que representa uma chave primária em uma tabela.

Exercício 34
Identifique a chave primária da tabela livros e explique sua importância.

Exercício 35
Considere:

id	nome
1	João
2	Maria
3	Pedro
Explique por que permitir dois registros diferentes utilizando o mesmo identificador poderia causar problemas.

🔵 Nível 9 — Chave estrangeira
Exercício 36
Crie uma tabela chamada emprestimos contendo:

id
cliente_id
livro_id
data_emprestimo
O identificador do empréstimo deve ser gerado automaticamente.

Exercício 37
Estabeleça uma relação entre emprestimos e clientes.

Exercício 38
Estabeleça uma relação entre emprestimos e livros.

🔵 Nível 10 — PK + FK
Considere:

Clientes
id	nome
1	João
2	Maria
3	Pedro
Livros
id	titulo
1	Dom Casmurro
2	O Hobbit
3	1984
Empréstimos
id	cliente_id	livro_id
1	1	2
2	2	1
3	1	3
Exercício 39
Explique o significado do registro em que cliente_id é 1 e livro_id é 2.

Exercício 40
Identifique qual cliente está associado ao livro de ID 2.

Exercício 41
Identifique qual livro está associado ao cliente de ID 2.

🟣 Nível 11 — DER
Exercício 42
Identifique as entidades existentes no banco atual.

Exercício 43
Liste os atributos pertencentes a cada entidade:

Cliente
Livro
Empréstimo
Exercício 44
Identifique a chave primária de cada entidade.

Exercício 45
Identifique as chaves estrangeiras existentes.

Exercício 46
Descreva os relacionamentos existentes entre:

Cliente e Empréstimo
Livro e Empréstimo
🟣 Nível 12 — Cardinalidade
Exercício 47
Determine a cardinalidade entre CLIENTE e EMPRÉSTIMO.

Exercício 48
Determine a cardinalidade entre LIVRO e EMPRÉSTIMO.

Exercício 49
Desenhe o DER completo do banco, representando entidades, atributos, chaves e relacionamentos.

🟠 Nível 13 — INNER JOIN
Exercício 50
Liste o nome de cada cliente junto com o título do livro relacionado ao seu empréstimo.

Exercício 51
Liste o cliente, o livro e a data correspondente ao empréstimo.

Exercício 52
Apresente o resultado utilizando os nomes cliente, livro e data.

Exercício 53
Apresente:

identificador do empréstimo;
nome do cliente;
título do livro;
data do empréstimo.
🟠 Nível 14 — LEFT JOIN
Exercício 54
Liste todos os clientes, incluindo aqueles que ainda não possuem nenhum empréstimo.

Exercício 55
Identifique somente os clientes que nunca realizaram um empréstimo.

🟠 Nível 15 — COUNT
Exercício 56
Descubra quantos clientes existem no banco.

Exercício 57
Descubra quantos livros existem no banco.

Exercício 58
Descubra quantos empréstimos existem no banco.

Exercício 59
Descubra quantos empréstimos cada cliente realizou.

🟠 Nível 16 — GROUP BY
Exercício 60
Apresente cada cliente acompanhado da quantidade de empréstimos realizados por ele.

Exercício 61
Apresente cada livro acompanhado da quantidade de vezes que foi emprestado.

🔴 Nível 17 — HAVING
Exercício 62
Liste somente os clientes que realizaram mais de 2 empréstimos.

Exercício 63
Liste somente os livros que foram emprestados mais de uma vez.

🔴 Nível 18 — Funções
Exercício 64
Encontre o menor preço entre os livros cadastrados.

Exercício 65
Encontre o maior preço entre os livros cadastrados.

Exercício 66
Calcule o preço médio dos livros.

Exercício 67
Calcule a soma dos preços de todos os livros.

🔴 Nível 19 — Desafios
Exercício 68
Liste os livros publicados depois de 2000, com preço inferior a 100, organizados do mais barato para o mais caro.

Exercício 69
Liste os clientes que possuem pelo menos um empréstimo, mostrando também a quantidade de empréstimos de cada um.

Exercício 70
Liste somente os clientes que possuem mais de dois empréstimos.

Exercício 71
Identifique o livro que possui a maior quantidade de empréstimos.

Exercício 72
Identifique o cliente que realizou a maior quantidade de empréstimos.

Exercício 73
Liste os clientes que nunca realizaram empréstimos.

🔴 Nível 20 — Projeto final
Uma biblioteca precisa controlar autores, livros, clientes e empréstimos.

Exercício 74 — Modelagem
Antes de escrever SQL, identifique:

Quais são as entidades?
Quais são os atributos de cada entidade?
Qual é a chave primária de cada entidade?
Quais são as chaves estrangeiras?
Qual entidade depende de qual?
Quais são as cardinalidades?
Existe algum relacionamento que exige uma tabela intermediária?
Quais informações devem ser únicas?
Quais informações são obrigatórias?
Exercício 75 — Banco
Crie o banco de dados da biblioteca.

Exercício 76 — Autores
Crie a entidade autores contendo:

id
nome
nacionalidade
Exercício 77 — Livros
Crie a entidade livros contendo:

id
titulo
ano_publicacao
preco
autor_id
Estabeleça corretamente a relação entre livros e autores.

Exercício 78 — Clientes
Crie a entidade clientes contendo:

id
nome
email
telefone
Defina as regras de identificação e unicidade necessárias.

Exercício 79 — Empréstimos
Crie a entidade emprestimos contendo:

id
cliente_id
livro_id
data_emprestimo
Estabeleça corretamente as relações com clientes e livros.

Exercício 80 — DER
Crie o DER completo do projeto.

O modelo deve representar:

AUTORES
   │
   │
   ▼
 LIVROS
   │
   │
   ▼
EMPRESTIMOS
   ▲
   │
CLIENTES
Identifique todas as PKs, FKs e cardinalidades.

Exercício 81 — Cadastro de dados
Cadastre:

pelo menos 3 autores;
pelo menos 5 livros;
pelo menos 5 clientes;
pelo menos 8 empréstimos.
🏆 Projeto final — Consultas
Exercício 82
Liste todos os livros.

Exercício 83
Liste todos os autores.

Exercício 84
Liste todos os clientes.

Exercício 85
Liste os livros publicados depois de 2000.

Exercício 86
Liste os livros com preço inferior a 50.

Exercício 87
Liste os livros do mais caro para o mais barato.

Exercício 88
Mostre cada livro acompanhado do respectivo autor.

Exercício 89
Mostre cada cliente acompanhado dos livros que pegou emprestados.

Exercício 90
Mostre cada cliente acompanhado da quantidade de empréstimos realizados.

Exercício 91
Identifique o cliente que realizou mais empréstimos.

Exercício 92
Identifique o livro que foi emprestado mais vezes.

Exercício 93
Identifique os clientes que nunca fizeram empréstimos.

Exercício 94
Identifique os autores que possuem mais de um livro cadastrado.

Exercício 95
Calcule o preço médio dos livros.

Exercício 96
Identifique o livro mais caro.

Exercício 97
Identifique o livro mais barato.

🧩 Desafio extra — Antes de codificar
Para qualquer novo banco de dados que você encontrar, responda primeiro:

Exercício 98
Quais são as entidades?

Exercício 99
Quais são os atributos de cada entidade?

Exercício 100
Qual é a chave primária de cada entidade?

Exercício 101
Quais são as chaves estrangeiras?

Exercício 102
Qual tabela depende de qual?

Exercício 103
Quais são os relacionamentos existentes?

Exercício 104
Quais relacionamentos são 1:1?

Exercício 105
Quais relacionamentos são 1:N?

Exercício 106
Existem relacionamentos N:N?

Exercício 107
É necessária alguma tabela intermediária?

Exercício 108
Quais campos precisam ser únicos?

Exercício 109
Quais campos obrigatoriamente precisam possuir um valor?

Exercício 110
Desenhe o DER antes de criar as tabelas.

🧠 Desafio de raciocínio
Para cada questão SQL que você resolver daqui para frente, antes de escrever qualquer código, responda mentalmente:

O que está sendo solicitado?
Onde estão os dados necessários?
Preciso consultar uma ou mais tabelas?
Existe algum relacionamento entre elas?
Preciso restringir os resultados?
Preciso agrupar os resultados?
Preciso ordenar?
Preciso limitar a quantidade de resultados?
O resultado precisa apresentar alguma informação calculada?
Qual é a menor consulta possível que resolve o problema?
