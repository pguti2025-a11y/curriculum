-- PRIMER EJEMPLO FUNCIONES

USE GRUPO3;

DELIMITER //

-- Función para contar los vehículos de un conductor
CREATE FUNCTION ContarVehiculos(p_Num_Cliente VARCHAR(10)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM G3_vehiculo WHERE Num_Cliente = p_Num_Cliente;
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso de la función (contar vehículos)
SELECT ContarVehiculos('87654321B') AS TotalVehiculos;



-- SEGUNDO EJEMPLO FUNCIONES

USE GRUPO3;

DELIMITER //

-- Función para obtener el nombre completo de un conductor
CREATE FUNCTION ObtenerNombreCompleto(p_Num_Cliente VARCHAR(10)) RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(150);
    SELECT CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2) INTO nombre_completo 
    FROM G3_conductor 
    WHERE Num_Cliente = p_Num_Cliente;
    RETURN nombre_completo;
END //

DELIMITER ;

-- Ejemplo de uso de la función (obtener nombre completo)
SELECT ObtenerNombreCompleto('87654321B') AS NombreCompleto;
