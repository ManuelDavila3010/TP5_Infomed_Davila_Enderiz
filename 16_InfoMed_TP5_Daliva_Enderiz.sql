SELECT 
    M.nombre AS nombre_medico,
    P.nombre AS nombre_paciente,
    COUNT(C.id_consulta) AS total_consultas
FROM 
    Medicos M
JOIN 
    Consultas C ON M.id_medico = C.id_medico
JOIN 
    Pacientes P ON C.id_paciente = P.id_paciente
GROUP BY 
    M.id_medico, P.id_paciente
ORDER BY 
    M.nombre, P.nombre;
