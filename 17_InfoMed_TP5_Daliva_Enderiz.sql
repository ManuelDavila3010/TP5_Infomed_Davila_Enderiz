SELECT 
    M.nombre AS nombre_medicamento,
    COUNT(R.id_receta) AS total_recetas,
    Med.nombre AS nombre_medico,
    P.nombre AS nombre_paciente
FROM 
    Recetas R
JOIN 
    Medicamentos M ON R.id_medicamento = M.id_medicamento
JOIN 
    Medicos Med ON R.id_medico = Med.id_medico
JOIN 
    Pacientes P ON R.id_paciente = P.id_paciente
GROUP BY 
    M.id_medicamento, Med.id_medico, P.id_paciente
ORDER BY 
    total_recetas DESC;
