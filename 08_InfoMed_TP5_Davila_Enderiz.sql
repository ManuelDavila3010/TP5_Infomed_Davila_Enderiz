SELECT ciudad, id_sexo, count(*)
from pacientes
group by ciudad, id_sexo
ORDER BY ciudad, id_sexo;