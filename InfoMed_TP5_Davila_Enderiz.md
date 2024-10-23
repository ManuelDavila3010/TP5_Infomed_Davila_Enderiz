# Parte 1

## ¿Qué tipo de base de datos es? Clasificarla según estructura y función.

Según la clasificación de estructura la base de datos es relacional dado que la información almacenada es en forma de tablas y organizadas 
por relaciones entre distintas entidades como pacientes, médicos, recetas, etc. Por otro lado según la clasificación por función esta base 
de datos es transicional u operacional dado que se busca manejar y proporcionar los datos de la manera más eficiente y segura posible para 
las operaciones diarias de un centro médico.

## Armar el diagrama entidad-relación de la base de datos dada.

<img src="Imágenes/parte_1_2.png" width="1000" style="height:auto;">

## Armar el Modelo relacional de la base de datos dada.

<img src="Imágenes/parte_1_3.png" width="1000" style="height:auto;">

## ¿Considera que la base de datos está normalizada? En caso que no lo esté, ¿cómo podría hacerlo? Nota: no debe normalizar la base de datos, solo explicar como lo haría.

La normalización de una base de datos consiste en organizar la base de datos de acuerdo con una serie de reglas para eliminar redundancias 
y asegurar la consistencia de datos. En base  a los diagramas presentados en los puntos anteriores se puede observar que cada tabla presenta 
una clave primaria única y todas las demás columnas no clave dependen de esa clave primaria. Se puede ver que no hay dependencias transitivas 
visibles. Por estas razones consideramos que no se requiere ningún tipo de normalización adicional.

# Parte 2

## Ejercicio 1

```sql
CREATE INDEX idx_ciudad
ON pacientes(ciudad)
```
<img src="Imágenes/Ejercicio_01.png" width="250" style="height:auto;">

## Ejercicio 2

```sql
CREATE VIEW edad_paciente AS
SELECT
    id_paciente,
    nombre,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento)) AS edad
    FROM pacientes
```
<img src="Imágenes/Ejercicio_02.png" width="700" style="height:auto;">

## Ejercicio 3

```sql
UPDATE pacientes
SET numero = 500, calle = 'Calle Corrientes'
WHERE nombre = 'Luciana Gómez'
```
<img src="Imágenes/Ejercicio_03.png" width="700" style="height:auto;">

## Ejercicio 4

```sql
SELECT nombre, matricula
FROM medicos
WHERE especialidad_id = 4
```
<img src="Imágenes/Ejercicio_04.png" width="700" style="height:auto;">

## Ejercicio 5

```sql
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
```
<img src="Imágenes/Ejercicio_05.png" width="700" style="height:auto;">

## Ejercicio 6

```sql
SELECT nombre, calle, numero
From pacientes
WHERE ciudad = 'Buenos Aires'
```
<img src="Imágenes/Ejercicio_06.png" width="700" style="height:auto;">

## Ejercicio 7

```sql
SELECT ciudad, count(*)
from pacientes
group by ciudad
```
<img src="Imágenes/Ejercicio_07.png" width="700" style="height:auto;">

## Ejercicio 8

```sql
SELECT ciudad, id_sexo, count(*)
from pacientes
group by ciudad, id_sexo
ORDER BY ciudad, id_sexo;
```
<img src="Imágenes/Ejercicio_08.png" width="700" style="height:auto;">

## Ejercicio 9

```sql
SELECT recetas.id_medico, medicos.nombre, count(recetas)
from recetas
inner join medicos
on recetas.id_medico = medicos.id_medico
group by recetas.id_medico, medicos.nombre;
```
<img src="Imágenes/Ejercicio_09.png" width="700" style="height:auto;">

## Ejercicio 10

```sql
SELECT id_consulta, fecha, id_medico
from consultas
where extract(year from fecha) = 2024
	and extract(month from fecha) = 8
	and id_medico = 3
group by id_consulta;
```
<img src="Imágenes/Ejercicio_10.png" width="700" style="height:auto;">

## Ejercicio 11

```sql
SELECT 
    P.nombre AS nombre_paciente,
    C.fecha,
    C.diagnostico
FROM 
    Consultas C
JOIN 
    Pacientes P ON C.id_paciente = P.id_paciente
WHERE 
    C.fecha >= '2024-08-01' AND C.fecha < '2024-09-01';
```
<img src="Imágenes/Ejercicio_11.png" width="700" style="height:auto;">

## Ejercicio 12

```sql
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
```
<img src="Imágenes/Ejercicio_12.png" width="700" style="height:auto;">

## Ejercicio 13

```sql
SELECT 
    P.nombre AS nombre_paciente,
    COUNT(R.id_receta) AS total_recetas
FROM 
    Pacientes P
LEFT JOIN 
    Recetas R ON P.id_paciente = R.id_paciente
GROUP BY 
    P.id_paciente;
```
<img src="Imágenes/Ejercicio_13.png" width="700" style="height:auto;">

## Ejercicio 14

```sql
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
```
<img src="Imágenes/Ejercicio_14.png" width="700" style="height:auto;">

## Ejercicio 15

```sql
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
```
<img src="Imágenes/Ejercicio_15.png" width="700" style="height:auto;">

## Ejercicio 16

```sql
SELECT 
    M.nombre AS nombre_medico,
    P.nombre AS nombre_paciente,
    COUNT(C.id_consulta) AS total_consultas
FROM 
    Medicos M
JOIN 
    Consultas C ON M.id_medico = C.id_medico
JOIN 
    Pacientes P ON C.id_paciente = P.id_paciente
GROUP BY 
    M.id_medico, P.id_paciente
ORDER BY 
    M.nombre, P.nombre;
```
<img src="Imágenes/Ejercicio_16.png" width="700" style="height:auto;">

## Ejercicio 17

```sql
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
```
<img src="Imágenes/Ejercicio_17.png" width="700" style="height:auto;">

## Ejercicio 18

```sql
SELECT 
    M.nombre AS nombre_medico,
    COUNT(DISTINCT C.id_paciente) AS total_pacientes
FROM 
    Medicos M
JOIN 
    Consultas C ON M.id_medico = C.id_medico
GROUP BY 
    M.id_medico
ORDER BY 
    total_pacientes DESC;
```
<img src="Imágenes/Ejercicio_18.png" width="700" style="height:auto;">
