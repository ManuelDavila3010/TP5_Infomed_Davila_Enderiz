SELECT 
    M.nombre AS nombre_medicamento,
    COUNT(R.id_receta) AS total_recetas
FROM 
    Recetas R
JOIN 
    Medicamentos M ON R.id_medicamento = M.id_medicamento
GROUP BY 
    M.id_medicamento
ORDER BY 
    total_recetas DESC
LIMIT 1;
