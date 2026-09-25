CREATE DATABASE Examen_T3_BBDD;
USE Examen_T3_BBDD;

CREATE TABLE alumnos (
    dni VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    telefono VARCHAR(15),
    PRIMARY KEY (dni)
);

CREATE TABLE asignaturas (
    codigo_asignatura VARCHAR(10) NOT NULL,
    nombre_asignatura VARCHAR(100) NOT NULL,
    PRIMARY KEY (codigo_asignatura)
);

CREATE TABLE notas (
    dni VARCHAR(10) NOT NULL,
    codigo_asignatura VARCHAR(10) NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (dni, codigo_asignatura),
    FOREIGN KEY (dni) REFERENCES alumnos(dni),
    FOREIGN KEY (codigo_asignatura) REFERENCES asignaturas(codigo_asignatura)
);
