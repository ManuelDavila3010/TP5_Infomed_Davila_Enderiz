SELECT id_consulta, fecha, id_medico
from consultas
where extract(year from fecha) = 2024
	and extract(month from fecha) = 8
	and id_medico = 3
group by id_consulta;