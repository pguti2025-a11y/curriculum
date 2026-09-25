-- PRIMER EJEMPLO TRIGGER

USE GRUPO3;

DELIMITER //

CREATE TRIGGER comprobar_conductor_antes_insert
BEFORE INSERT ON G3_vehiculo
FOR EACH ROW
BEGIN
    DECLARE existe INT;

    -- Comprobar si el conductor existe
    SELECT COUNT(*) INTO existe
    FROM G3_conductor
    WHERE Num_Cliente = NEW.Num_Cliente;

    -- Si no existe, lanzar error
    IF existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El conductor no existe';
    END IF;
END //

DELIMITER ;

-- Ejemplo de uso del trigger
INSERT INTO G3_vehiculo (Matricula, Num_Cliente, Id_Tipo_Vehiculo) VALUES ('1111AAA', '00000000X', 1);

Mostrará un error "El conductor no existe".

INSERT INTO G3_vehiculo (Matricula, Num_Cliente, Id_Tipo_Vehiculo) VALUES ('2222BBB', '45678383D', 1);

No mostrará el erros si existe ese DNI.

-- SEGUNDO EJEMPLO TRIGGER

USE GRUPO3;

DELIMITER //

CREATE TRIGGER corregir_anio_alta
BEFORE INSERT ON G3_conductor
FOR EACH ROW
BEGIN
    IF NEW.A_Alta = 1900 THEN
        SET NEW.A_Alta = 2000;
    END IF;
END //

DELIMITER ;

-- Ejemplo de uso del trigger.
INSERT INTO G3_conductor (Num_Cliente, Nombre, Apellido1, Apellido2, A_Alta, Id_Direccion) VALUES ('99999999Z', 'Pedro', 'Lopez', 'Diaz', 1900, 1);

Se comprueba...

SELECT Num_Cliente, A_Alta
FROM G3_conductor
WHERE Num_Cliente = '99999999Z';
