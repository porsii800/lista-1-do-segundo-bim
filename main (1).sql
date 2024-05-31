use avaliacao_22a;

--  Inserir um Novo Livro
insert into Livros(titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma) values
("As Crônicas de Nárnia", "C.S. Lewis", 1950, true, "Fantasia", "978-0064471190", "HarperCollins", 768, "Inglês");

-- Inserir Múltiplos Livros
insert into Livros(titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma) values
("Cem Anos de Solidão", "Gabriel Garcia Marquez", 1967, true, "Ficção", '978-0241968581', "Penguin Books", 422, "Espanhol"),
("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, true, "Fantasia", '978-0439708180', "Bloomsbury", 309, "Inglês"),
("O Senhor dos Anéis: A Sociedade do Anel", "J.R.R. Tolkien", 1954, true, "Fantasia", '978-0618640157', "HarperCollins", 423, "Inglês");

-- Inserir Livro com Categoria Específica
INSERT INTO Livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma)
VALUES ('A Fascinante História das Civilizações', 'Antony', 2024, true, 'História', '978-0616540157', 'Bloomsbury', 654, 'Português');


-- Atualizar Disponibilidade
UPDATE Livros 
SET disponivel = false
WHERE ano_publicacao < 2000;

-- Atualizar Editora
update Livros
set editora = 'Plume Books'
where titulo = '1984';

-- Atualizar Idioma
update Livros
set idioma = 'Inglês'
where editora = 'Penguin Books';

-- Atualizar Título
update Livros
set titulo = 'Harry Potter e a Pedra Filosofal (Edição Especial)'
where isbn = '978-0439708180';

--  Deletar por Categoria
delete 
from Livros
where categoria = 'Terror';

--  Deletar por Idioma e Ano
delete 
from Livros
where idioma = 'Francês' and ano_publicacao < 1970;

--  Deletar Livro Específico
delete 
from Livros
where titulo = 'As Crônicas de Nárnia';

--  Deletar por Editora
delete 
from Livros
where  editora = 'Penguin Books';

--  Selecionar com WHERE
select *
from Livros
where quantidade_paginas > 500;

--  Selecionar com GROUP BY
SELECT categoria, count(categoria)
FROM Livros
GROUP BY categoria;

--  Selecionar com LIMIT
select titulo
from Livros
order by titulo asc
limit 5;

--  Selecionar com SUM e COUNT
SELECT SUM(quantidade_paginas) AS total_paginas, AVG(quantidade_paginas) AS media_paginas
FROM Livros
WHERE categoria = 'Drama';


-- Selecionar com AVG
SELECT AVG(ano_publicacao)
FROM Livros;

 -- Selecionar com MAX e MIN
select titulo, ano_publicacao
from Livros
where ano_publicacao = (select max(ano_publicacao) from livros);

select titulo, ano_publicacao
from Livros
where ano_publicacao = (select min(ano_publicacao) from livros);

-- Selecionar com ORDER BY
select *
from Livros
order by ano_publicacao desc;

--  Selecionar com UNION
SELECT titulo
FROM Livros
WHERE idioma = 'Inglês'
UNION ALL
SELECT titulo
FROM Livros
WHERE idioma = 'Português';

--  Selecionar Livros de um Autor Específico
select *
from Livros
where autor = "George Orwell"