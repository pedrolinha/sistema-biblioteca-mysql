 /*
 * PROJETO: Sistema de Controle de Empréstimos e Gerência de Biblioteca
 * 
 * AUTOR: Pedro Henrique Moravieski
 * REPOSITÓRIO: https://github.com/pedromoravieski-codes/sistema-biblioteca-mysql
 * DATA DE CRIAÇÃO: 20-07-2026
 * VERSÃO: 0.0.1
 * 
 * LICENÇA: MIT License
 * Copyright (c) 2026 Pedro Henrique Moravieski
 * 
 */

-- Criação e uso do banco biblioteca
CREATE DATABASE IF NOT EXISTS dbbiblioteca;
USE dbbiblioteca;

-- Criação tabela Autor
CREATE TABLE tbautor 
(
	id_autor INT NOT NULL AUTO_INCREMENT,
	nome_autor VARCHAR(50),
	biografia VARCHAR(200),
	PRIMARY KEY (id_autor)
);

-- Criação tabela Categoria
CREATE TABLE tbcategoria
(
	id_categoria INT NOT NULL AUTO_INCREMENT,
	nome_categoria VARCHAR(50),
	PRIMARY KEY (id_categoria)
);

-- Criação tabela Livro
CREATE TABLE tblivro
(
	id_livro INT NOT NULL AUTO_INCREMENT,
	nome_livro VARCHAR(50),
	id_categoria INT,
	id_autor INT,
	
	PRIMARY KEY (id_livro),
	CONSTRAINT fk_livro_categoria FOREIGN KEY (id_categoria) REFERENCES tbcategoria(id_categoria),
	CONSTRAINT fk_livro_autor FOREIGN KEY (id_autor) REFERENCES tbautor(id_autor)
);

-- Criação tabela Usuário
CREATE TABLE tbusuario
(
	id_usuario INT NOT NULL AUTO_INCREMENT,
	nome_usuario VARCHAR(50),
	cpf_usuario CHAR(11),
	telefone_usuario CHAR(11),
	PRIMARY KEY (id_usuario)
);

-- Criação tabela Empréstimo
CREATE TABLE tbemprestimo
(
	id_emprestimo INT NOT NULL AUTO_INCREMENT,
	id_usuario INT,
	id_livro INT,
	data_emprestimo DATE,
	data_devolucao_prevista DATE,
	data_devolucao_efetiva DATE,
	
	CONSTRAINT pk_emprestimo PRIMARY KEY (id_emprestimo, id_usuario, id_livro),
	CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES tbusuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro) REFERENCES tblivro(id_livro) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Popular o banco

-- Autores
INSERT INTO tbautor (nome_autor, biografia) VALUES 
('J.K. Rowling', 'Escritora britânica, famosa pela série Harry Potter.'),
('George Orwell', 'Escritor e jornalista inglês, autor de grandes distopias.'),
('Machado de Assis', 'Um dos maiores nomes da literatura brasileira e fundador da ABL.'),
('J.R.R. Tolkien', 'Filólogo e professor universitário britânico, autor de O Senhor dos Anéis.'),
('Stephen King', 'Escritor americano reconhecido como o mestre do terror e suspense contemporâneo.'),
('Agatha Christie', 'Escritora britânica conhecida como a Rainha do Crime devido aos seus romances policiais.'),
('Clarice Lispector', 'Escritora e jornalista ucraniana naturalizada brasileira, uma das maiores figuras da nossa literatura.'),
('Gabriel García Márquez', 'Escritor colombiano, prêmio Nobel de Literatura, mestre do realismo fantástico.'),
('Isaac Asimov', 'Escritor e biochemico americano, um dos pais da ficção científica moderna.'),
('Rick Riordan', 'Escritor norte-americano, famoso pela série de livros Percy Jackson.'),
('Dan Brown', 'Autor norte-americano de thrillers e ficção de mistério, conhecido pelo Código Da Vinci.'),
('Jane Austen', 'Escritora inglesa do século XVIII, famosa por Orgulho e Preconseito.'),
('Arthur Conan Doyle', 'Médico e escritor britânico, criador do famoso detetive Sherlock Holmes.'),
('Lewis Carroll', 'Pseudónimo de Charles Lutwidge Dodgson, autor de Alice no País das Maravilhas.'),
('Sun Tzu', 'Filósofo e estrategista militar chinês, autor de A Arte da Guerra.');

-- Categorias
INSERT INTO tbcategoria (nome_categoria) VALUES 
('Fantasia'),
('Ficção Distópica'),
('Literatura Clássica'),
('Ficção Científica'),
('Terror / Suspense'),
('Romance Policial'),
('Romance'),
('Aventura'),
('História / Filosofia'),
('Infanto-Juvenil');

-- Livros
INSERT INTO tblivro (nome_livro, id_categoria, id_autor) VALUES 
('Harry Potter e a Pedra Filosofal', 1, 1),
('1984', 2, 2),
('Dom Casmurro', 3, 3),
('O Hobbit', 1, 4),
('O Senhor dos Anéis: A Sociedade do Anel', 1, 4),
('It: A Coisa', 5, 5),
('O Iluminado', 5, 5),
('E Não Sobrou Nenhum', 6, 6),
('O Assassinato no Expresso do Oriente', 6, 6),
('A Hora da Estrela', 3, 7),
('Cem Anos de Solidão', 3, 8),
('Eu, Robô', 4, 9),
('Fundação', 4, 9),
('O Ladrão de Raios', 10, 10),
('O Mar de Monstros', 10, 10),
('O Código Da Vinci', 6, 11),
('Anjos e Demônios', 6, 11),
('Orgulho e Preconceito', 7, 12),
('Um Estudo em Vermelho', 6, 13),
('As Aventuras de Sherlock Holmes', 6, 13),
('Alice no País das Maravilhas', 10, 14),
('A Arte da Guerra', 9, 15),
('Harry Potter e a Câmara Secreta', 1, 1);

-- Usuários
INSERT INTO tbusuario (nome_usuario, cpf_usuario, telefone_usuario) VALUES 
('Ana Silva', '12345678901', '41999998888'),
('Carlos Souza', '98765432100', '11988887777'),
('Mariana Costa', '23456789012', '21977776666'),
('Pedro Henrique', '34567890123', '31966665555'),
('Juliana Lima', '45678901234', '11955554444'),
('Lucas Oliveira', '56789012345', '81944443333'),
('Beatriz Ribeiro', '67890123456', '71933332222'),
('Fernando Alencar', '78901234567', '51922221111'),
('Camila Mendes', '89012345678', '48911110000'),
('Rodrigo Santos', '11122233344', '19900009999'),
('Amanda Rocha', '22233344455', '85988889999'),
('Ricardo Ramos', '33344455566', '62977778888');

-- Empréstimos
INSERT INTO tbemprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao_prevista, data_devolucao_efetiva) VALUES 
(1, 1, '2026-05-15', '2026-05-22', '2026-05-20'),
(2, 2, '2026-06-01', '2026-06-08', NULL),
(3, 4, '2026-04-10', '2026-04-17', '2026-04-15'),
(4, 5, '2026-04-12', '2026-04-19', '2026-04-19'),
(5, 6, '2026-05-01', '2026-05-08', '2026-05-07'),
(6, 8, '2026-05-03', '2026-05-10', '2026-05-10'),
(7, 14, '2026-05-05', '2026-05-12', '2026-05-11'),
(8, 10, '2026-04-01', '2026-04-08', '2026-04-20'),
(9, 12, '2026-05-01', '2026-05-08', '2026-05-15'),
(3, 23, '2026-05-10', '2026-05-17', '2026-05-25'),
(10, 16, '2026-05-28', '2026-06-04', NULL),
(11, 18, '2026-05-30', '2026-06-06', NULL),
(12, 22, '2026-06-01', '2026-06-08', NULL),
(3, 1, '2026-06-02', '2026-06-09', NULL),
(4, 7, '2026-05-01', '2026-05-08', NULL),
(5, 9, '2026-05-10', '2026-05-17', NULL),
(6, 11, '2026-05-12', '2026-05-19', NULL),
(7, 4, '2026-05-20', '2026-05-27', '2026-05-26'),
(8, 4, '2026-05-28', '2026-06-04', NULL),
(9, 6, '2026-05-15', '2026-05-22', '2026-05-22'),
(10, 6, '2026-05-24', '2026-06-01', '2026-05-30');

-- Criação das Views

-- Views Operacionais

CREATE VIEW vw_historico_emprestimos AS
SELECT U.nome_usuario, L.nome_livro, E.data_emprestimo, E.data_devolucao_efetiva
FROM tbemprestimo E
INNER JOIN tbusuario U ON U.id_usuario = E.id_usuario
INNER JOIN tblivro L ON L.id_livro = E.id_livro;
    
SELECT * FROM vw_historico_emprestimos;

CREATE VIEW vw_livros_disponiveis AS
SELECT DISTINCT L.nome_livro AS "Livro", C.nome_categoria AS "Categoria", A.nome_autor AS "Autor"
FROM tblivro L
INNER JOIN tbcategoria C ON L.id_categoria = C.id_categoria
INNER JOIN tbautor A ON L.id_autor = A.id_autor
INNER JOIN tbemprestimo E ON L.id_livro = E.id_livro
WHERE E.data_devolucao_efetiva IS NOT NULL;

SELECT * FROM vw_livros_disponiveis;

-- Views Gerenciais

CREATE VIEW vw_livros_nunca_emprestados AS
SELECT L.nome_livro AS "Livros nunca emprestados"
FROM tblivro L
WHERE NOT EXISTS (
    SELECT 1
    FROM tbemprestimo E
    WHERE E.id_livro = L.id_livro
);
    
SELECT * FROM vw_livros_nunca_emprestados;

CREATE VIEW vw_usuarios_categoria_menos_lida AS
SELECT DISTINCT U.nome_usuario AS "Nome do Usuario", C.nome_categoria AS "Nome da Categoria"
FROM tbusuario U
INNER JOIN tbemprestimo E ON E.id_usuario = U.id_usuario
INNER JOIN tblivro L ON L.id_livro = E.id_livro
INNER JOIN tbcategoria C ON C.id_categoria = L.id_categoria
WHERE L.id_categoria IN (
    SELECT L.id_categoria
    FROM tblivro L
    INNER JOIN tbemprestimo E ON E.id_livro = L.id_livro
    GROUP BY L.id_categoria
    HAVING COUNT(*) <= ALL (
        SELECT COUNT(*)
        FROM tblivro L
        INNER JOIN tbemprestimo E ON E.id_livro = L.id_livro
        GROUP BY L.id_categoria
    )
);
    
SELECT * FROM vw_usuarios_categoria_menos_lida;

CREATE VIEW vw_emprestimos_realizados AS
SELECT U.nome_usuario AS "Nome", L.nome_livro AS "Livro", E.data_emprestimo AS "Data do empréstimo"
FROM tbemprestimo E
INNER JOIN tbusuario U ON E.id_usuario = U.id_usuario
INNER JOIN tblivro L ON E.id_livro = L.id_livro
WHERE E.data_devolucao_efetiva IS NULL;

SELECT * FROM vw_emprestimos_realizados;

CREATE VIEW vw_bloqueio_emprestimos AS 
SELECT U.nome_usuario AS "Nome", E.data_emprestimo AS "Data do último empréstimo"
FROM tbusuario U
INNER JOIN tbemprestimo E ON U.id_usuario = E.id_usuario
WHERE DATEDIFF(CURDATE(), data_emprestimo) >= 15
AND E.data_devolucao_efetiva IS NULL;

SELECT * FROM vw_bloqueio_emprestimos;

CREATE VIEW vw_risco_abandono_conta AS
SELECT U.nome_usuario AS "Nome (30 dias sem emprestar)", E.data_emprestimo AS "Data do último empréstimo"
FROM tbusuario U
INNER JOIN tbemprestimo E ON U.id_usuario = E.id_usuario
WHERE DATEDIFF(CURDATE(), data_emprestimo) >= 30
AND E.data_devolucao_efetiva IS NOT NULL;

SELECT * FROM vw_risco_abandono_conta;

-- Views Estatísticas

CREATE VIEW vw_tempo_medio AS
SELECT L.nome_livro, AVG(DATEDIFF(data_devolucao_efetiva, data_emprestimo)) AS media_leitura
FROM tbemprestimo E
INNER JOIN tblivro L ON E.id_livro = L.id_livro
WHERE E.data_devolucao_efetiva IS NOT NULL
GROUP BY L.id_livro, L.nome_livro;

SELECT * FROM vw_tempo_medio;

CREATE VIEW vw_autores_mais_lidos AS
SELECT a.nome_autor, COUNT(e.id_emprestimo) AS total_emprestimos
FROM tbautor a
JOIN tblivro l ON a.id_autor = l.id_autor
JOIN tbemprestimo e ON l.id_livro = e.id_livro
GROUP BY a.id_autor, a.nome_autor;

SELECT * FROM vw_autores_mais_lidos ORDER BY total_emprestimos DESC;

-- Views de Segurança

CREATE VIEW vw_cpftel_seguros AS
SELECT id_usuario, nome_usuario, '***.***.***-**' AS "CPF", '(**) *****-****' AS "Telefone"
FROM tbusuario;

SELECT * FROM vw_cpftel_seguros;

CREATE VIEW vw_status_estoque_privado AS
SELECT L.nome_livro AS "Livro", 'Indisponível (Emprestado)' AS "Status"
FROM tblivro L
WHERE L.id_livro IN (
    SELECT id_livro 
    FROM tbemprestimo 
    WHERE data_devolucao_efetiva IS NULL
);

SELECT * FROM vw_status_estoque_privado;
