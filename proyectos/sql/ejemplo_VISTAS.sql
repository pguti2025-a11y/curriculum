-- PRIMER EJEMPLO VISTAS

USE GRUPO3;

CREATE VIEW Vista_Conductores AS
SELECT
    Num_Cliente,
    Nombre,
    Apellido1,
    Apellido2
FROM G3_conductor;

-- Ejemplo de uso de la vista
SELECT * FROM Vista_Conductores;


-- SEGUNDO EJEMPLO VISTAS

USE GRUPO3;

CREATE VIEW Vista_Conductores_Direccion AS
SELECT
    c.Num_Cliente,
    c.Nombre,
    c.Apellido1,
    c.Apellido2,
    c.A_Alta,
    d.Id_Direccion,
    d.Tipo_via,
    d.Calle,
    d.Numero,
    d.Escalera,
    d.Piso,
    d.Puerta,
    cp.Codigo_Postal,
    cp.Localidad,
    cp.Provincia,
    cp.Pais
FROM G3_conductor c
JOIN G3_direccion d
    ON c.Id_Direccion = d.Id_Direccion
JOIN G3_codigo_postal cp
    ON d.Codigo_Postal = cp.Codigo_Postal;

-- Ejemplo de uso de la vista.
SELECT * FROM Vista_Conductores_Direccion;
