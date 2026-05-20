CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    rol VARCHAR(50),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    contacto VARCHAR(100)
);

CREATE TABLE servicios (
    id_servicio SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    fecha DATE NOT NULL,
    tipo_servicio VARCHAR(50),
    estado VARCHAR(20)
);

CREATE TABLE turnos (
    id_turno SERIAL PRIMARY KEY,
    id_empleado INT REFERENCES empleados(id_empleado),
    id_servicio INT REFERENCES servicios(id_servicio),
    hora_inicio TIMESTAMP NOT NULL,
    hora_fin TIMESTAMP NOT NULL
);

CREATE TABLE incidencias (
    id_incidencia SERIAL PRIMARY KEY,
    id_servicio INT REFERENCES servicios(id_servicio),
    id_empleado INT REFERENCES empleados(id_empleado),
    fecha_hora TIMESTAMP NOT NULL,
    descripcion TEXT,
    gravedad VARCHAR(20)
);

CREATE TABLE equipos (
    id_equipo SERIAL PRIMARY KEY,
    tipo VARCHAR(50),
    numero_serie VARCHAR(50) UNIQUE,
    estado VARCHAR(20),
    id_empleado INT REFERENCES empleados(id_empleado)
);

CREATE TABLE accesos (
    id_acceso SERIAL PRIMARY KEY,
    id_servicio INT REFERENCES servicios(id_servicio),
    fecha_hora TIMESTAMP NOT NULL,
    resultado VARCHAR(20),
    motivo TEXT
);

-------------------------------------------------

INSERT INTO empleados (nombre, dni, telefono, rol, activo) VALUES
('Carlos Ruiz', '12345678A', '600111222', 'Controlador', TRUE),
('Ana López', '87654321B', '600333444', 'Vigilante', TRUE),
('Javier Torres', '11223344C', '600555666', 'Coordinador', TRUE),
('Lucía Martín', '99887766D', '600777888', 'Controladora', TRUE),
('Pedro Sánchez', '44556677E', '600999000', 'Vigilante', TRUE),
('Sofía Ramos', '22334455F', '611222333', 'Administrativa', TRUE),
('Miguel Castro', '33445566G', '622333444', 'Controlador', TRUE),
('Elena Gómez', '55667788H', '633444555', 'Vigilante', TRUE),
('Raúl Fernández', '66778899I', '644555666', 'Controlador', TRUE),
('María Delgado', '77889900J', '655666777', 'Coordinadora', TRUE);