--lolja de songs
CREATE TABLE Albuns (
    IdAlbum INT PRIMARY KEY,
    Nome VARCHAR(100),
    Artista VARCHAR(100),
    AnoLancamento INT
);

CREATE TABLE Musicas (
    IdMusica INT PRIMARY KEY,
    IdAlbum INT,
    Titulo VARCHAR(100),
    DuracaoSegundos INT,
    FOREIGN KEY (IdAlbum) REFERENCES Albuns(IdAlbum)
);


INSERT INTO Albuns (IdAlbum, Nome, Artista, AnoLancamento) VALUES
(1, 'Thriller', 'Michael Jackson', 1982),
(2, 'Back in Black', 'AC/DC', 1980),
(3, 'Abbey Road', 'The Beatles', 1969),
(4, 'Nevermind', 'Nirvana', 1991),
(5, 'Divide', 'Ed Sheeran', 2017);

INSERT INTO Musicas (IdMusica, IdAlbum, Titulo, DuracaoSegundos) VALUES
-- Thriller
(1, 1, 'Wanna Be Startin Somethin', 362),
(2, 1, 'Thriller', 358),
(3, 1, 'Beat It', 258),

-- Back in Black
(4, 2, 'Hells Bells', 312),
(5, 2, 'Shoot to Thrill', 317),
(6, 2, 'Back in Black', 255),

-- Abbey Road
(7, 3, 'Come Together', 259),
(8, 3, 'Something', 182),
(9, 3, 'Here Comes the Sun', 185),

-- Nevermind
(10, 4, 'Smells Like Teen Spirit', 301),
(11, 4, 'Come as You Are', 219),
(12, 4, 'Lithium', 257),

-- Divide
(13, 5, 'Shape of You', 234),
(14, 5, 'Perfect', 263),
(15, 5, 'Galway Girl', 170);

SELECT m.Titulo
FROM Musicas m
JOIN Albuns a ON m.IdAlbum = a.IdAlbum
WHERE a.Nome = 'Thriller';

SELECT a.Artista, COUNT(m.IdMusica) AS TotalMusicas
FROM Albuns a
JOIN Musicas m ON a.IdAlbum = m.IdAlbum
GROUP BY a.Artista;

SELECT TOP 1 a.Nome, SUM(m.DuracaoSegundos) AS DuracaoTotal
FROM Albuns a
JOIN Musicas m ON a.IdAlbum = m.IdAlbum
GROUP BY a.Nome
ORDER BY DuracaoTotal DESC;

SELECT Titulo, DuracaoSegundos
FROM Musicas
WHERE DuracaoSegundos > 300;