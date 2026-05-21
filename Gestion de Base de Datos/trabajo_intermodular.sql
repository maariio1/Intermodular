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


INSERT INTO clientes (nombre, direccion, telefono, contacto) VALUES
('Discoteca Eclipse', 'Calle Luna 45', '911223344', 'María Gómez'),
('Festival NightWave', 'Recinto Ferial', '912334455', 'Pedro Sánchez'),
('Pub La Caverna', 'Av. Sol 12', '913445566', 'Laura Ruiz'),
('Sala Orion', 'Calle Estrella 88', '914556677', 'Carlos Pérez'),
('Discoteca Nebula', 'Paseo del Río 21', '915667788', 'Ana Torres'),
('Festival ElectroSun', 'Parque Central', '916778899', 'Jorge Martín'),
('Pub El Refugio', 'Calle Norte 5', '917889900', 'Lucía Ramos'),
('Sala Titan', 'Av. Libertad 33', '918990011', 'Miguel Castro'),
('Discoteca Prisma', 'Calle Color 19', '919100122', 'Elena Gómez'),
('Festival UrbanBeat', 'Zona Industrial 4', '910111213', 'Raúl Fernández');


INSERT INTO servicios (id_cliente, fecha, tipo_servicio, estado) VALUES
(1, '2026-05-10', 'Control de acceso', 'Programado'),
(2, '2026-06-01', 'Vigilancia', 'Programado'),
(3, '2026-04-20', 'Control de acceso', 'Completado'),
(4, '2026-04-22', 'Vigilancia', 'Completado'),
(5, '2026-05-15', 'Control de acceso', 'Programado'),
(6, '2026-07-01', 'Vigilancia', 'Programado'),
(7, '2026-04-18', 'Control de acceso', 'Completado'),
(8, '2026-05-25', 'Vigilancia', 'Programado'),
(9, '2026-06-10', 'Control de acceso', 'Programado'),
(10, '2026-08-01', 'Vigilancia', 'Programado');


INSERT INTO turnos (id_empleado, id_servicio, hora_inicio, hora_fin) VALUES
(1, 1, '2026-05-10 22:00', '2026-05-11 06:00'),
(2, 2, '2026-06-01 18:00', '2026-06-02 02:00'),
(3, 3, '2026-04-20 20:00', '2026-04-21 04:00'),
(4, 4, '2026-04-22 21:00', '2026-04-23 05:00'),
(5, 5, '2026-05-15 22:00', '2026-05-16 06:00'),
(6, 6, '2026-07-01 18:00', '2026-07-02 02:00'),
(7, 7, '2026-04-18 22:00', '2026-04-19 06:00'),
(8, 8, '2026-05-25 20:00', '2026-05-26 04:00'),
(9, 9, '2026-06-10 22:00', '2026-06-11 06:00'),
(10, 10, '2026-08-01 18:00', '2026-08-02 02:00');


INSERT INTO incidencias (id_servicio, id_empleado, fecha_hora, descripcion, gravedad) VALUES
(1, 1, '2026-05-10 23:30', 'Intento de acceso con DNI falso', 'Alta'),
(2, 2, '2026-06-01 20:15', 'Persona en estado ebrio causando molestias', 'Media'),
(3, 3, '2026-04-20 22:10', 'Discusión entre clientes', 'Baja'),
(4, 4, '2026-04-22 23:45', 'Robo de cartera reportado', 'Alta'),
(5, 5, '2026-05-15 23:00', 'Intento de colarse por salida de emergencia', 'Alta'),
(6, 6, '2026-07-01 19:30', 'Cliente agresivo expulsado', 'Alta'),
(7, 7, '2026-04-18 23:20', 'Objeto sospechoso encontrado', 'Alta'),
(8, 8, '2026-05-25 21:40', 'Problema con entrada VIP', 'Media'),
(9, 9, '2026-06-10 23:10', 'Cliente sin identificación válida', 'Baja'),
(10, 10, '2026-08-01 19:50', 'Pelea entre dos asistentes', 'Alta');


INSERT INTO equipos (tipo, numero_serie, estado, id_empleado) VALUES
('Tablet', 'TBX1001', 'Operativo', 1),
('Walkie', 'WK2001', 'Operativo', 2),
('Cámara IP', 'CAM3001', 'Operativo', NULL),
('Tablet', 'TBX1002', 'En reparación', 4),
('Walkie', 'WK2002', 'Operativo', 5),
('Cámara IP', 'CAM3002', 'Operativo', NULL),
('Tablet', 'TBX1003', 'Operativo', 7),
('Walkie', 'WK2003', 'Dañado', 8),
('Cámara IP', 'CAM3003', 'Operativo', NULL),
('Tablet', 'TBX1004', 'Operativo', 10);


INSERT INTO accesos (id_servicio, fecha_hora, resultado, motivo) VALUES
(1, '2026-05-10 22:15', 'Permitido', NULL),
(1, '2026-05-10 22:20', 'Denegado', 'Documento no válido'),
(3, '2026-04-20 21:50', 'Permitido', NULL),
(3, '2026-04-20 22:05', 'Denegado', 'Menor de edad'),
(5, '2026-05-15 22:30', 'Permitido', NULL),
(5, '2026-05-15 22:45', 'Denegado', 'Comportamiento sospechoso'),
(7, '2026-04-18 22:10', 'Permitido', NULL),
(7, '2026-04-18 22:25', 'Denegado', 'Entrada no autorizada'),
(9, '2026-06-10 22:40', 'Permitido', NULL),
(9, '2026-06-10 22:55', 'Denegado', 'No presenta identificación');


-------------------------------------------------

Ver todos los empleados con su rol

SELECT id_empleado, nombre, rol, activo
FROM empleados;



Para ver todos los servicios con su cliente

SELECT s.id_servicio, c.nombre AS cliente, s.fecha, s.tipo_servicio, s.estado
FROM servicios s
JOIN clientes c ON s.id_cliente = c.id_cliente;


Ver incidencias con nombre del empleado y cliente

SELECT i.id_incidencia, e.nombre AS empleado, c.nombre AS cliente,
       i.fecha_hora, i.descripcion, i.gravedad
FROM incidencias i
JOIN empleados e ON i.id_empleado = e.id_empleado
JOIN servicios s ON i.id_servicio = s.id_servicio
JOIN clientes c ON s.id_cliente = c.id_cliente;


Ver accesos permitidos y denegados por servicio

SELECT a.id_acceso, c.nombre AS cliente, a.fecha_hora, a.resultado, a.motivo
FROM accesos a
JOIN servicios s ON a.id_servicio = s.id_servicio
JOIN clientes c ON s.id_cliente = c.id_cliente;


Ver equipos asignados a cada empleado

SELECT e.nombre AS empleado, eq.tipo, eq.numero_serie, eq.estado
FROM equipos eq
LEFT JOIN empleados e ON eq.id_empleado = e.id_empleado;