--Transporteses
CREATE TABLE Motoristas (
IdMotoristas INT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
CNH VARCHAR(20) NOT NULL
);

CREATE TABLE Viagens (
IdViagems INT PRIMARY KEY,
IdMotoristas INT,
Origem VARCHAR(100),
Destino VARCHAR(100),
DataViagem DATE,
DistanciaKm DECIMAL(10,2),
FOREIGN KEY (IdMotoristas) REFERENCES Motoristas(IdMotoristas)
);

INSERT INTO Motoristas (IdMotoristas, Nome, CNH) VALUES
(1, 'Lucas Pereira', '93627578293'),
(2, 'Fernanda Lima', '93542231898'),
(3, 'Rafael Souza', '26683096327'),
(4, 'Patrícia Gomes', '02935729172');

INSERT INTO Viagens (IdViagems, IdMotoristas, Origem, Destino, DataViagem, DistanciaKm) VALUES
(1, 1, 'São Paulo', 'Belo Horizonte', '2025-08-03', 460.00),
(2, 1, 'Rio de Janeiro', 'São Paulo', '2025-08-08', 450.00),
(3, 2, 'Porto Alegre', 'Curitiba', '2025-08-04', 710.00),
(4, 2, 'Porto Alegre', 'Florianopolis', '2025-08-12', 320.00),
(5, 3, 'Pará', 'Salvador', '2025-08-09', 830.00);

SELECT v.IdViagems, v.Origem, v.Destino, v.DataViagem, v.DistanciaKm
FROM Viagens v
JOIN Motoristas m ON v.IdMotoristas = m.IdMotoristas
WHERE m.Nome = 'Lucas Pereira';

SELECT m.Nome, SUM(v.DistanciaKm) AS TotalKm
FROM Motoristas m
LEFT JOIN Viagens v ON m.IdMotoristas = v.IdMotoristas
GROUP BY m.Nome;

SELECT v.IdViagems, m.Nome, v.Origem, v.Destino, v.DistanciaKm
FROM Viagens v
JOIN Motoristas m ON v.IdMotoristas = m.IdMotoristas
WHERE v.DistanciaKm > 500;

SELECT m.IdMotoristas, m.Nome, m.CNH
FROM Motoristas m
LEFT JOIN Viagens v ON m.IdMotoristas = v.IdMotoristas
WHERE v.IdViagems IS NULL;