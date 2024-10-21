SELECT 
    P.nombre AS nombre_paciente,
    C.fecha AS fecha_ultima_consulta,
    C.diagnostico
FROM 
    Pacientes P
JOIN 
    Consultas C ON P.id_paciente = C.id_paciente
WHERE 
    C.fecha = (
        SELECT 
            MAX(fecha) 
        FROM 
            Consultas C2 
        WHERE 
            C2.id_paciente = P.id_paciente
    );
