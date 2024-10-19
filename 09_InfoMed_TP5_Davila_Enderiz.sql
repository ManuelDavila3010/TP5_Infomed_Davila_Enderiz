SELECT recetas.id_medico, medicos.nombre, count(recetas)
from recetas
inner join medicos
on recetas.id_medico = medicos.id_medico
group by recetas.id_medico, medicos.nombre;