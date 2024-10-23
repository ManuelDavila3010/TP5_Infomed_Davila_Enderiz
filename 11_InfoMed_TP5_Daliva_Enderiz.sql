SELECT 
    P.nombre AS nombre_paciente,
    C.fecha,
    C.diagnostico
FROM 
    Consultas C
JOIN 
    Pacientes P ON C.id_paciente = P.id_paciente
WHERE 
    C.fecha >= '2024-08-01' AND C.fecha < '2024-09-01';
