CREATE VIEW edad_paciente AS
SELECT
	id_paciente,
    nombre,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento)) AS edad
	FROM pacientes