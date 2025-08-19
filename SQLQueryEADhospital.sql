--Hospatal
CREATE TABLE Pacientes (
    IdPaciente INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE
);

CREATE TABLE Consultas (
    IdConsulta INT PRIMARY KEY,
    IdPaciente INT,
    DataConsulta DATE,
    Medico VARCHAR(100),
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente)
);

INSERT INTO Pacientes (IdPaciente, Nome, DataNascimento) VALUES
(1, 'Emanuel Souza', '1980-05-12'),
(2, 'Soares Lima', '1990-08-25'),
(3, 'Pedro Pereira', '1975-02-10'),
(4, 'Orivaldo de Oliveira', '2000-11-05');

INSERT INTO Consultas (IdConsulta, IdPaciente, DataConsulta, Medico) VALUES
(1, 1, '2025-08-10', 'Dr. Silva'),
(2, 2, '2025-08-11', 'Dr. Silva'),
(3, 3, '2025-08-11', 'Dra. Maria'),
(4, 1, '2025-08-12', 'Dr. Silva');

SELECT DISTINCT p.Nome
FROM Pacientes p
JOIN Consultas c ON p.IdPaciente = c.IdPaciente
WHERE c.Medico = 'Dr. Silva';
 
SELECT DataConsulta, COUNT(*) AS TotalConsultas
FROM Consultas
GROUP BY DataConsulta
ORDER BY DataConsulta;

SELECT p.Nome
FROM Pacientes p
LEFT JOIN Consultas c ON p.IdPaciente = c.IdPaciente
WHERE c.IdConsulta IS NULL;

SELECT TOP 1 Nome, DataNascimento
FROM Pacientes
ORDER BY DataNascimento ASC;