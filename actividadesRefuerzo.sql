USE empleados;
Use departamento;

-- Actividad 1
SELECT 
	nombre AS Nombre, 
    apellido1 AS 'Primer apellido', 
     (apellido2, 'No especificado') AS 'Segundo Apellido'
FROM empleado;

-- Actividad 2
SELECT DISTINCT (apellido1) AS 'Primer apellido'
FROM empleado;

-- Actividad 3
SELECT *
FROM empleado;

-- Actividad 4
SELECT id_departamento AS 'Departamento'
FROM empleado;

-- Actividad 5
SELECT DISTINCT id_departamento AS 'Departamento'
FROM empleado;

-- Actividad 6
SELECT concat_ws(' ', nombre, apellido1, IFNULL(apellido2,'')) AS 'Nombre Completo'
FROM empleado;

-- Actividad 7
SELECT LOWER(concat_ws(' ', nombre, apellido1, IFNULL(apellido2,''))) AS 'Nombre Completo'
FROM empleado;

-- Actividad 8
SELECT 
	id AS 'Empleado', 
    LEFT(nif, LENGTH(nif) - 1) AS 'Dígitos NIF', -- O PUEDES USAR SUBSTRING (NIF, 1, 8)
    RIGHT(nif, 1) AS 'Letra NIF' -- SUBSTRING(NIF, 9, 1)
FROM empleado;

-- Actividad 9
SELECT 
	nombre AS 'Nombre Departamento', 
    presupuesto AS "Presupuesto",
    gastos AS "Gastos",
    (presupuesto - gastos) AS 'Presupuesto Actual'
FROM departamento;

-- Actividad 10
SELECT 
    nombre AS 'Nombre Departamento', 
    (presupuesto - gastos) AS 'Presupuesto Actual'
FROM departamento
ORDER BY 2;

-- Actividad 11
SELECT 
    nombre AS 'Nombre Departamento'
FROM departamento
ORDER BY nombre DESC;

-- Actividad 12
SELECT 
    apellido1 AS 'Primer Apellido', 
    IFNULL(apellido2, '') AS 'Segundo Apellido', 
    nombre AS 'Nombre'
FROM empleado
ORDER BY 1, 2, 3; -- si es nombre, pellido1, apellido 2 es 2,3,1 IMPORTANTEEEE

-- Actividad 13
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
ORDER BY presupuesto DESC
LIMIT 3;

-- Actividad 14
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
ORDER BY presupuesto
LIMIT 3;

-- Cmbios Realizados
SELECT
	nombre AS 'Nombre Departamento'
	presupuetso AS 'Presupuesto'
FROM departamento
ORDER BY presupuesto DESC
LIMIT 5;

-- Actividad 15
SELECT 
    nombre AS 'Nombre Departamento', 
    gastos AS 'Gasto'
FROM departamento
ORDER BY gastos DESC
LIMIT 2;

-- Actividad 16
SELECT 
    nombre AS 'Nombre Departamento', 
    gastos AS 'Gasto'
FROM departamento
ORDER BY gastos
LIMIT 2;

-- Actividad 17
SELECT * 
FROM empleado
LIMIT 5 OFFSET 2;

-- Actividad 18
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE presupuesto >= 150000;

-- Actividad 19
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE presupuesto >= 100000 AND presupuesto <= 200000;

-- Actividad 20
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE presupuesto NOT BETWEEN 100000 AND 200000;

-- Actividad 21
SELECT 
    nombre AS 'Nombre Departamento', 
    gastos AS 'Gastos', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos > presupuesto;

-- Actividad 22
SELECT 
    nombre AS 'Nombre Departamento', 
    gastos AS 'Gastos', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos < presupuesto;

-- Actividad 23
SELECT 
    nombre AS 'Nombre Departamento', 
    gastos AS 'Gastos', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos = presupuesto;

-- Actividad 24
SELECT * 
FROM empleado
WHERE apellido2 IS NULL;

-- Actividad 25
SELECT * 
FROM empleado
WHERE apellido2 IS NOT NULL;

-- Actividad 26
SELECT * 
FROM empleado
WHERE apellido2 = 'López';

-- Actividad 27
SELECT * 
FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- Actividad 28
SELECT * 
FROM empleado
WHERE apellido2 IN ('Díaz', 'Moreno');

-- Actividad 29
SELECT 
    nombre AS 'Nombre', 
    apellido1 AS 'Primer Apellido', 
    IFNULL(apellido2, 'No especificado') AS 'Segundo Apellido', 
    nif AS 'NIF'
FROM empleado
WHERE id_departamento = 3;

-- Actividad 30
SELECT 
    nombre AS 'Nombre', 
    apellido1 AS 'Primer Apellido', 
    IFNULL(apellido2, 'No especificado') AS 'Segundo Apellido', 
    nif AS 'NIF'
FROM empleado
WHERE id_departamento IN (2, 4, 5);

-- Actividad 31
SELECT 
    SUM(presupuesto) AS 'Suma Total Presupuesto'
FROM departamento;

-- Actividad 32
SELECT 
    ROUND(AVG(presupuesto), 2) AS 'Media Presupuesto'
FROM departamento;

-- Actividad 33
SELECT 
    MIN(presupuesto) AS 'Presupuesto Mínimo'
FROM departamento;

-- Actividad 34
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) 
					 FROM departamento);

-- Actividad 35
SELECT 
    MAX(presupuesto) AS 'Presupuesto Máximo'
FROM departamento;

-- Actividad 36
SELECT 
    nombre AS 'Nombre Departamento', 
    presupuesto AS 'Presupuesto'
FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) 
					 FROM departamento);

-- Actividad 37
SELECT 
    COUNT(*) AS 'Número Total Empleados'
FROM empleado;

-- Actividad 38
SELECT 
    COUNT(*) AS 'Número de Empleados con Segundo Apellido' -- O puedes poner count(apellido2)
FROM empleado
WHERE apellido2 IS NOT NULL;

-- Actividad 39
SELECT 
    d.nombre AS 'Nombre Departamento', 
    COUNT(e.id) AS 'Número de Empleados'
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.id;

-- Actividad 40
SELECT 
    d.nombre AS 'Nombre Departamento', 
    COUNT(e.id) AS 'Número de Empleados'
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
WHERE d.presupuesto > 200000
GROUP BY d.id;
