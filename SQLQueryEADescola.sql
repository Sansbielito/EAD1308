--escolases.
create table Alunos (
AlunoId INT primary key,
Nome varchar(100),
DataNascimento Date);

create table Notas (
NotaId INT primary key,
AlunoId int,
Disciplina varchar(100),
Nota int);

DROP TABLE Alunos 
DROP TABLE Notas 

INSERT INTO Notas (NotaId, AlunoId, Disciplina, Nota) VALUES
(1, 1, 'Matemática', 8),
(2, 1, 'Português', 7),
(3, 1, 'História', 9);

INSERT INTO Notas (NotaId, AlunoId, Disciplina, Nota) VALUES
(4, 2, 'Matemática', 6),
(5, 2, 'Português', 8);


INSERT INTO Notas (NotaId, AlunoId, Disciplina, Nota) VALUES
(6, 3, 'Matemática', 5),
(7, 3, 'Português', 6),
(8, 3, 'História', 7);

INSERT INTO Notas (NotaId, AlunoId, Disciplina, Nota) VALUES
(9, 4, 'Matemática', 9),
(10, 4, 'Português', 10),
(11, 4, 'História', 8);

INSERT INTO Alunos (AlunoId, Nome, DataNascimento) VALUES
(1, 'Carlos Souza', '2005-03-15'),
(2, 'Mariana Lima', '2006-07-22'),
(3, 'João Pereira', '2004-11-10'),
(4, 'Ana Oliveira', '2005-01-30'),
(5, 'Lucas Martins', '2006-05-05');


-- Mostrar todos os alunos e suas notas
SELECT a.Nome, n.Disciplina, n.Nota
FROM Alunos a
LEFT JOIN Notas n ON a.AlunoId = n.AlunoId;

-- Mostrar a média das notas por disciplina
SELECT Disciplina, AVG(Nota) AS Media
FROM Notas
GROUP BY Disciplina;

-- Mostrar apenas os alunos com média acima de 7
SELECT a.Nome, AVG(n.Nota) AS Media
FROM Alunos a
JOIN Notas n ON a.AlunoId = n.AlunoId
GROUP BY a.Nome
HAVING AVG(n.Nota) > 7;

-- Listar os alunos sem nenhuma nota cadastrada
SELECT a.Nome
FROM Alunos a
LEFT JOIN Notas n ON a.AlunoId = n.AlunoId
WHERE n.Nota IS NULL;


