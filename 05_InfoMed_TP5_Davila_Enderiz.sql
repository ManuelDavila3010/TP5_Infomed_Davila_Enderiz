UPDATE pacientes
SET ciudad = 'Buenos Aires'
WHERE similarity(ciudad, 'Buenos Aires') > 0.4;

UPDATE pacientes
SET ciudad = 'Rosario'
WHERE similarity(ciudad, 'Rosario') > 0.4;

UPDATE pacientes
SET ciudad = 'Córdoba'
WHERE similarity(ciudad, 'Córdoba') > 0.3;

UPDATE pacientes
SET ciudad = 'Santa Fe'
WHERE similarity(ciudad, 'Santa Fe') > 0.4;

UPDATE pacientes
SET ciudad = 'Mendoza'
WHERE similarity(ciudad, 'Mendoza') > 0.3;