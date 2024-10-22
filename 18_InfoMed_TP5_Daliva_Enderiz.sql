SELECT 
    M.nombre AS nombre_medico,
    COUNT(DISTINCT C.id_paciente) AS total_pacientes
FROM 
    Medicos M
JOIN 
    Consultas C ON M.id_medico = C.id_medico
GROUP BY 
    M.id_medico
ORDER BY 
    total_pacientes DESC;

