-- PRIMER EJEMPLO PROCEDIMIENTOS

USE GRUPO3;

DELIMITER //

-- Procedimiento para obtener los vehículos de un conductor por su DNI

CREATE PROCEDURE ObtenerVehiculosPorConductor(IN p_Num_Cliente VARCHAR(10))
BEGIN
    SELECT V.Matricula, V.Id_Tipo_Vehiculo
    FROM G3_vehiculo V
    WHERE V.Num_Cliente = p_Num_Cliente;
END //

DELIMITER ;

-- Ejemplo de uso del procedimiento (obtener vehículos)

CALL ObtenerVehiculosPorConductor('87654321B');



-- SEGUNDO EJEMPLO PROCEDIMIENTOS

USE GRUPO3;

DELIMITER //

-- Procedimiento para actualizar la dirección de un conductor

CREATE PROCEDURE ActualizarDireccionConductor(
    IN p_Num_Cliente VARCHAR(10),
    IN p_Nueva_Direccion INT
)
BEGIN
    UPDATE G3_conductor
    SET Id_Direccion = p_Nueva_Direccion
    WHERE Num_Cliente = p_Num_Cliente;
END //

DELIMITER ;


-- Se verifica la dirección

SELECT * FROM G3_conductor WHERE Num_Cliente = '87654321B';

-- Ejemplo de uso del procedimiento (actualizar dirección)

CALL ActualizarDireccionConductor('87654321B', 5);

-- Se verifica la actualización

SELECT * FROM G3_conductor WHERE Num_Cliente = '87654321B';
