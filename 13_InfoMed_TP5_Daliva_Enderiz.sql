SELECT 
    P.nombre AS nombre_paciente,
    COUNT(R.id_receta) AS total_recetas
FROM 
    Pacientes P
LEFT JOIN 
    Recetas R ON P.id_paciente = R.id_paciente
GROUP BY 
    P.id_paciente;
