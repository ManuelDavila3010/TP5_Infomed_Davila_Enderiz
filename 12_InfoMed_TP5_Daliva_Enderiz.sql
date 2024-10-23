SELECT 
    M.nombre AS nombre_medicamento,
    COUNT(R.id_receta) AS total_prescripciones
FROM 
    Recetas R
JOIN 
    Medicamentos M ON R.id_medicamento = M.id_medicamento
WHERE 
    R.id_medico = 2
GROUP BY 
    M.id_medicamento;
