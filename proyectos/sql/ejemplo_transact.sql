USE GRUPO3;

DELIMITER //

-- Crear un procedimiento al que hay que meter parámetros
CREATE PROCEDURE InsertarConductorVehiculo(
    IN p_Num_Cliente VARCHAR(10),
    IN p_Nombre VARCHAR(50),
    IN p_Apellido1 VARCHAR(50),
    IN p_Apellido2 VARCHAR(50),
    IN p_A_Alta INT,
    IN p_Id_Direccion INT,
    IN p_Matricula VARCHAR(10),
    IN p_Id_Tipo_Vehiculo INT
)
BEGIN
    -- Se define una variable para ver si hay errores
    DECLARE hay_error INT DEFAULT 0;
    
    -- Se hace control de errores
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET hay_error = 1;
    
    -- Se comienza la transaccion
    START TRANSACTION;
    
    -- Se Inserta el conductor
    INSERT INTO G3_conductor (Num_Cliente, Nombre, Apellido1, Apellido2, A_Alta, Id_Direccion)
    VALUES (p_Num_Cliente, p_Nombre, p_Apellido1, p_Apellido2, p_A_Alta, p_Id_Direccion)
    ON DUPLICATE KEY UPDATE Nombre = p_Nombre, Apellido1 = p_Apellido1, Apellido2 = p_Apellido2, A_Alta = p_A_Alta;
    
    -- Se Inserta el vehículo asociado
    INSERT INTO G3_vehiculo (Matricula, Num_Cliente, Id_Tipo_Vehiculo)
    VALUES (p_Matricula, p_Num_Cliente, p_Id_Tipo_Vehiculo);
    
    -- Se comprueba si hubo errores
    IF hay_error = 1 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END //

DELIMITER ;

-- Ejemplo del procedimiento con datos erróneos (provoca rollback)
CALL InsertarConductorVehiculo('12345678A', 'Juan', 'Pérez', 'Gómez', 2024, 2, '9999XYZ', 999);

-- Ejemplo del procedimiento con datos correctos (se inserta correctamente)
CALL InsertarConductorVehiculo('87654321B', 'Ana', 'López', 'Martínez', 2023, 3, '5555ABC', 1);

-- Verificar los datos insertados
SELECT * FROM G3_conductor WHERE Num_Cliente IN ('12345678A', '87654321B');
SELECT * FROM G3_vehiculo WHERE Matricula IN ('9999XYZ', '5555ABC');
