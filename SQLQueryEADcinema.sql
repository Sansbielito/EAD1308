--Cinemases.
CREATE TABLE Filmes (
    IdFilme INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Genero VARCHAR(50),
    Ano INT
);

CREATE TABLE Sessoes (
    IdSessao INT PRIMARY KEY,
    IdFilme INT,
    Data DATE,
    Hora TIME,
    FOREIGN KEY (IdFilme) REFERENCES Filmes(IdFilme)
);

DROP TABLE Sessoes
DROP TABLE Filmes


INSERT INTO Filmes (IdFilme, Titulo, Genero, Ano) VALUES
(1, 'Jumanji: Próxima fase', 'Ação', 2019),
(2, 'O Poderoso Chefinho', 'Comédia', 2017),
(3, 'O espetacular Homem-Aranha', 'Ação', 2012);


INSERT INTO Sessoes (IdSessao, IdFilme, Data, Hora) VALUES
(1, 1, '2025-09-10', '19:30'),
(2, 1, '2025-08-21', '21:00'),
(3, 2, '2025-08-24', '18:00'),
(4, 3, '2025-09-02', '17:40'),
(5, 3, '2025-09-01', '21:00');

SELECT * 
FROM Filmes
WHERE Genero = 'Ação';
 
SELECT s.*
FROM Sessoes s
JOIN Filmes f ON s.IdFilme = f.IdFilme
WHERE f.Ano > 2020;

SELECT f.Titulo, COUNT(s.IdSessao) AS TotalSessoes
FROM Filmes f
LEFT JOIN Sessoes s ON f.IdFilme = s.IdFilme
GROUP BY f.Titulo;

SELECT f.Titulo, s.Data
FROM Filmes f
JOIN Sessoes s ON f.IdFilme = s.IdFilme
ORDER BY s.Data;
