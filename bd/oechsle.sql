-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2024 a las 16:11:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oechsle`
--

USE oechsle;

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_tarjetas2` (`p_dni` CHAR(8)) RETURNS TINYINT(1) DETERMINISTIC BEGIN
    DECLARE tiene_tarjetas BOOLEAN;
    
    SELECT EXISTS (
        SELECT 1 
        FROM tarjeta 
        WHERE DNI_cliente_afiliado = p_dni
    ) INTO tiene_tarjetas;

    RETURN tiene_tarjetas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliado`
--

CREATE TABLE `afiliado` (
  `DNI` char(8) NOT NULL,
  `fecha_afiliacion` date DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `afiliado`
--

INSERT INTO `afiliado` (`DNI`, `fecha_afiliacion`) VALUES
('01234567', '2024-01-10'),
('12345098', '2024-01-11'),
('12345678', '2024-01-01'),
('23456109', '2024-01-12'),
('23456789', '2024-01-02'),
('34567120', '2024-01-13'),
('34567890', '2024-01-03'),
('45678131', '2024-01-14'),
('45678901', '2024-01-04'),
('56789012', '2024-01-05'),
('56789142', '2024-01-15'),
('67890123', '2024-01-06'),
('78901234', '2024-01-07'),
('89012345', '2024-01-08'),
('90123456', '2024-01-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`DNI`) VALUES
('01234567'),
('01234597'),
('11234567'),
('12345098'),
('12345678'),
('22345678'),
('23456109'),
('23456789'),
('33456789'),
('34567120'),
('34567890'),
('44567890'),
('45678131'),
('45678901'),
('55678901'),
('56789012'),
('56789142'),
('67890123'),
('67890153'),
('78901234'),
('78901264'),
('89012345'),
('89012375'),
('90123456'),
('90123486');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_carrito`
--

CREATE TABLE `cliente_carrito` (
  `DNI_cliente` char(8) NOT NULL,
  `codigo_producto` char(20) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `codigo` char(10) NOT NULL,
  `nombre_departamento` varchar(20) DEFAULT NULL,
  `numero_empleados` char(100) DEFAULT NULL,
  `DNI_gerente` char(8) DEFAULT NULL,
  `DNI_jefe` char(8) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`codigo`, `nombre_departamento`, `numero_empleados`, `DNI_gerente`, `DNI_jefe`) VALUES
('001', 'cajas', '4', '33145678', '66789012'),
('002', 'seguridad', '4', '33145678', '77890123'),
('003', 'mantenimiento', '4', '33145678', '99012345'),
('004', 'recursos_humanos', '4', '33145678', '12134567'),
('005', 'atencion_cliente', '4\r\n', '33145678', '15167890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `DNI` char(8) NOT NULL,
  `inicio_contrato` date DEFAULT NULL,
  `fin_contrato` date DEFAULT NULL,
  `hora_comienzo` datetime DEFAULT NULL,
  `hora_fin` datetime DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`DNI`, `inicio_contrato`, `fin_contrato`, `hora_comienzo`, `hora_fin`, `direccion`, `salario`) VALUES
('10123456', '2023-04-01', '2025-03-31', '2023-04-01 08:00:00', '2023-04-01 17:00:00', 'Av. Libertad 678', 2750.25),
('12134567', '2022-06-01', '2026-06-01', '2022-06-01 07:00:00', '2022-06-01 15:00:00', 'Calle Olmo 123', 2600.00),
('13145678', '2022-07-15', '2025-07-14', '2022-07-15 08:30:00', '2022-07-15 16:30:00', 'Av. San Juan 456', 3100.50),
('14156789', '2023-08-01', '2026-07-31', '2023-08-01 09:00:00', '2023-08-01 17:00:00', 'Jr. Pino 789', 2900.00),
('15167890', '2023-09-10', '2025-09-09', '2023-09-10 08:00:00', '2023-09-10 16:00:00', 'Av. Alameda 321', 3050.75),
('16178901', '2023-10-01', '2026-09-30', '2023-10-01 08:45:00', '2023-10-01 17:15:00', 'Calle Sauce 654', 2950.00),
('17189012', '2023-11-01', '2026-10-31', '2023-11-01 08:00:00', '2023-11-01 16:30:00', 'Av. Surco 876', 2850.50),
('18190123', '2023-12-01', '2025-11-30', '2023-12-01 09:00:00', '2023-12-01 17:00:00', 'Jr. Amanecer 987', 2700.00),
('19101234', '2022-01-01', '2026-12-31', '2022-01-01 08:00:00', '2022-01-01 16:00:00', 'Calle Real 741', 3500.00),
('20112345', '2023-01-15', '2027-01-14', '2023-01-15 08:15:00', '2023-01-15 16:45:00', 'Av. Norte 159', 2800.75),
('21123456', '2023-02-01', '2025-01-31', '2023-02-01 07:30:00', '2023-02-01 15:30:00', 'Jr. Central 753', 2900.00),
('22134567', '2023-03-01', '2027-02-28', '2023-03-01 09:00:00', '2023-03-01 17:00:00', 'Av. Las Palmas 951', 3100.25),
('23145678', '2023-04-15', '2026-04-14', '2023-04-15 08:00:00', '2023-04-15 16:00:00', 'Calle Roca 753', 2950.00),
('24156789', '2023-05-01', '2026-04-30', '2023-05-01 08:30:00', '2023-05-01 17:00:00', 'Av. Del Mar 852', 3250.50),
('25167890', '2023-06-01', '2025-05-31', '2023-06-01 08:00:00', '2023-06-01 16:30:00', 'Jr. Vista Alegre 321', 3000.00),
('26178901', '2023-07-01', '2027-06-30', '2023-07-01 08:45:00', '2023-07-01 17:15:00', 'Calle Sol Naciente 159', 2850.25),
('27189012', '2023-08-01', '2026-07-31', '2023-08-01 08:00:00', '2023-08-01 16:45:00', 'Av. Primavera 753', 3100.00),
('28190123', '2023-09-15', '2025-09-14', '2023-09-15 09:00:00', '2023-09-15 17:00:00', 'Jr. Esperanza 456', 2700.50),
('29101234', '2023-10-01', '2026-09-30', '2023-10-01 08:00:00', '2023-10-01 16:00:00', 'Calle Mayor 654', 2900.00),
('30112345', '2023-11-15', '2027-11-14', '2023-11-15 08:30:00', '2023-11-15 16:30:00', 'Av. Mirador 852', 2750.00),
('31123456', '2023-12-01', '2026-11-30', '2023-12-01 08:00:00', '2023-12-01 16:00:00', 'Jr. Luna Llena 753', 2800.25),
('66789012', '2023-01-01', '2025-12-31', '2023-01-01 08:00:00', '2023-01-01 16:00:00', 'Calle 123, Lima', 2500.00),
('77890123', '2023-02-15', '2026-02-14', '2023-02-15 09:00:00', '2023-02-15 17:00:00', 'Av. Los Olivos 456', 3000.50),
('88901234', '2022-05-10', '2025-05-09', '2022-05-10 07:30:00', '2022-05-10 16:30:00', 'Jr. Miraflores 789', 2800.75),
('99012345', '2023-03-20', '2026-03-19', '2023-03-20 08:15:00', '2023-03-20 16:45:00', 'Calle Sol 321', 3200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_telefono`
--

CREATE TABLE `empleado_telefono` (
  `DNI` char(8) NOT NULL,
  `telefono` char(9) NOT NULL
) ;

--
-- Volcado de datos para la tabla `empleado_telefono`
--

INSERT INTO `empleado_telefono` (`DNI`, `telefono`) VALUES
('10123456', '956789012'),
('12134567', '967890123'),
('13145678', '978901234'),
('14156789', '989012345'),
('15167890', '990123456'),
('16178901', '901234567'),
('17189012', '912345678'),
('18190123', '923456789'),
('19101234', '934567890'),
('20112345', '945678901'),
('21123456', '956789012'),
('22134567', '967890123'),
('23145678', '978901234'),
('24156789', '989012345'),
('25167890', '990123456'),
('26178901', '901234567'),
('27189012', '912345678'),
('28190123', '923456789'),
('29101234', '934567890'),
('30112345', '945678901'),
('31123456', '956789012'),
('66789012', '912345678'),
('77890123', '923456789'),
('88901234', '934567890'),
('99012345', '945678901');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`DNI`) VALUES
('33145678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefe`
--

CREATE TABLE `jefe` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `jefe`
--

INSERT INTO `jefe` (`DNI`) VALUES
('12134567'),
('15167890'),
('66789012'),
('77890123'),
('99012345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_reclamaciones`
--

CREATE TABLE `libro_reclamaciones` (
  `codigo_libro` char(10) NOT NULL
) ;

--
-- Volcado de datos para la tabla `libro_reclamaciones`
--

INSERT INTO `libro_reclamaciones` (`codigo_libro`) VALUES
('01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_tiempo`
--

CREATE TABLE `medio_tiempo` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `medio_tiempo`
--

INSERT INTO `medio_tiempo` (`DNI`) VALUES
('10123456'),
('13145678'),
('14156789'),
('16178901'),
('17189012'),
('18190123'),
('19101234'),
('88901234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_afiliado`
--

CREATE TABLE `no_afiliado` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `no_afiliado`
--

INSERT INTO `no_afiliado` (`DNI`) VALUES
('01234597'),
('11234567'),
('22345678'),
('33456789'),
('44567890'),
('55678901'),
('67890153'),
('78901264'),
('89012375'),
('90123486');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_jefe`
--

CREATE TABLE `no_jefe` (
  `DNI` char(8) NOT NULL,
  `codigo_departamento` char(10) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `no_jefe`
--

INSERT INTO `no_jefe` (`DNI`, `codigo_departamento`) VALUES
('18190123', '001'),
('20112345', '001'),
('23145678', '001'),
('27189012', '001'),
('10123456', '002'),
('13145678', '002'),
('30112345', '002'),
('88901234', '002'),
('14156789', '003'),
('16178901', '003'),
('17189012', '003'),
('19101234', '003'),
('21123456', '004'),
('22134567', '004'),
('24156789', '004'),
('25167890', '004'),
('26178901', '005'),
('28190123', '005'),
('29101234', '005'),
('31123456', '005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` char(8) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`DNI`, `primer_nombre`, `primer_apellido`, `segundo_apellido`, `email`) VALUES
('01234567', 'Lucía', 'Ortiz', 'Silva', 'lucia.ortiz@hotmail.com'),
('01234597', 'Antonio', 'Pardo', 'Santos', 'antonio.pardo@outlook.com'),
('10123456', 'Hugo', 'Vargas', 'Rivera', 'hugo.vargas@hotmail.com'),
('11234567', 'Patricia', 'Cabrera', 'Lara', 'patricia.cabrera@gmail.com'),
('12134567', 'Daniela', 'Solís', 'Giménez', 'daniela.solis@yahoo.com'),
('12345098', 'David', 'Reyes', 'Navarro', 'david.reyes@yahoo.com'),
('12345678', 'Juan', 'Pérez', 'Gómez', 'juan.perez@gmail.com'),
('13145678', 'Andrés', 'Ibáñez', 'Cano', 'andres.ibanez@outlook.com'),
('14156789', 'Valeria', 'Guerra', 'Ferrero', 'valeria.guerra@gmail.com'),
('15167890', 'Sergio', 'Duarte', 'Barrios', 'sergio.duarte@hotmail.com'),
('16178901', 'Eva', 'Rojas', 'Sáez', 'eva.rojas@yahoo.com'),
('17189012', 'Rafael', 'Calvo', 'López', 'rafael.calvo@outlook.com'),
('18190123', 'Manuela', 'Pérez', 'Gutiérrez', 'manuela.perez@gmail.com'),
('19101234', 'Oscar', 'Álvarez', 'Jiménez', 'oscar.alvarez@hotmail.com'),
('20112345', 'Alicia', 'Domínguez', 'Rey', 'alicia.dominguez@yahoo.com'),
('21123456', 'Mario', 'Lozano', 'Salas', 'mario.lozano@outlook.com'),
('22134567', 'Rosa', 'Martín', 'Lara', 'rosa.martin@gmail.com'),
('22345678', 'Roberto', 'Campos', 'Cortés', 'roberto.campos@hotmail.com'),
('23145678', 'Tomás', 'Gil', 'Cano', 'tomas.gil@hotmail.com'),
('23456109', 'Isabel', 'Cruz', 'Romero', 'isabel.cruz@outlook.com'),
('23456789', 'María', 'López', 'Martínez', 'maria.lopez@hotmail.com'),
('24156789', 'Gloria', 'Lara', 'Ruiz', 'gloria.lara@yahoo.com'),
('25167890', 'Adrián', 'Suárez', 'Molina', 'adrian.suarez@outlook.com'),
('26178901', 'Verónica', 'Peña', 'Blanco', 'veronica.pena@gmail.com'),
('27189012', 'Ignacio', 'Ruiz', 'Domínguez', 'ignacio.ruiz@hotmail.com'),
('28190123', 'Carolina', 'Torres', 'Aguilar', 'carolina.torres@yahoo.com'),
('29101234', 'Samuel', 'Gómez', 'López', 'samuel.gomez@outlook.com'),
('30112345', 'Helena', 'Rey', 'Martínez', 'helena.rey@gmail.com'),
('31123456', 'Leandro', 'Vega', 'Ortiz', 'leandro.vega@hotmail.com'),
('32134567', 'Amelia', 'Ramos', 'Pérez', 'amelia.ramos@yahoo.com'),
('33145678', 'Esteban', 'Ávila', 'Rojas', 'esteban.avila@outlook.com'),
('33456789', 'Teresa', 'Molina', 'Ibáñez', 'teresa.molina@yahoo.com'),
('34567120', 'Miguel', 'Vega', 'Herrera', 'miguel.vega@gmail.com'),
('34567890', 'Carlos', 'González', 'Fernández', 'carlos.gonzalez@yahoo.com'),
('44567890', 'Javier', 'Navarro', 'León', 'javier.navarro@outlook.com'),
('45678131', 'Paula', 'Ramos', 'Flores', 'paula.ramos@hotmail.com'),
('45678901', 'Ana', 'Hernández', 'Ruiz', 'ana.hernandez@outlook.com'),
('55678901', 'Marta', 'Jiménez', 'Ortiz', 'marta.jimenez@gmail.com'),
('56789012', 'Luis', 'Sánchez', 'Jiménez', 'luis.sanchez@gmail.com'),
('56789142', 'Elena', 'Aguilar', 'Castillo', 'elena.aguilar@yahoo.com'),
('66789012', 'Fernando', 'Méndez', 'Marín', 'fernando.mendez@hotmail.com'),
('67890123', 'Laura', 'Ramírez', 'Díaz', 'laura.ramirez@hotmail.com'),
('67890153', 'Alberto', 'Núñez', 'Guerrero', 'alberto.nunez@outlook.com'),
('77890123', 'Beatriz', 'Blanco', 'Castaño', 'beatriz.blanco@yahoo.com'),
('78901234', 'Pedro', 'Torres', 'Vargas', 'pedro.torres@yahoo.com'),
('78901264', 'Carmen', 'Delgado', 'Peña', 'carmen.delgado@gmail.com'),
('88901234', 'Raúl', 'Serrano', 'Lozano', 'raul.serrano@outlook.com'),
('89012345', 'Sofía', 'Castro', 'Mendoza', 'sofia.castro@outlook.com'),
('89012375', 'José', 'Román', 'Alonso', 'jose.roman@hotmail.com'),
('90123456', 'Diego', 'Morales', 'Rojas', 'diego.morales@gmail.com'),
('90123486', 'Natalia', 'Figueroa', 'Suárez', 'natalia.figueroa@yahoo.com'),
('99012345', 'Clara', 'Gallardo', 'Soto', 'clara.gallardo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` char(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `destino` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `destino`, `marca`, `tipo`) VALUES
('1', 'Audífonos Bluetooth', 159.00, 'Adultos', 'Sony', 'Electrónica'),
('10', 'Play Station 5', 1949.00, 'Gamers', 'Sony', 'Consola'),
('11', 'Play Station 5 Pro', 3479.00, 'Gamers Pro', 'Sony', 'Consola'),
('12', 'Laptop Acer Aspire 5', 2199.00, 'Profesionales', 'Acer', 'Electrónica'),
('13', 'Monitor LG 24\" LED', 799.00, 'Diseñadores', 'LG', 'Electrónica'),
('14', 'Mouse Inalámbrico Logitech', 49.00, 'Oficinistas', 'Logitech', 'Accesorio'),
('15', 'Teclado Mecánico HyperX', 249.00, 'Gamers', 'HyperX', 'Accesorio'),
('16', 'Cámara Fotográfica Nikon D3500', 2999.00, 'Fotógrafos', 'Nikon', 'Fotografía'),
('17', 'TV Samsung 55\" Smart 4K', 2799.00, 'Familias', 'Samsung', 'Electrodoméstico'),
('18', 'Cocina a Gas 4 Hornillas', 749.00, 'Hogares', 'Sole', 'Hogar'),
('19', 'Refrigeradora LG 260L', 1999.00, 'Hogares', 'LG', 'Electrodoméstico'),
('2', 'Tablet Samsung A9', 549.00, 'Estudiantes', 'Samsung', 'Electrónica'),
('20', 'Lavadora Samsung 8kg', 1699.00, 'Hogares', 'Samsung', 'Electrodoméstico'),
('21', 'Auriculares Gamer HyperX', 349.00, 'Gamers', 'HyperX', 'Electrónica'),
('22', 'Smartwatch Huawei GT 2', 999.00, 'Deportistas', 'Huawei', 'Accesorio'),
('23', 'Cargador Rápido Anker', 79.00, 'Viajeros', 'Anker', 'Accesorio'),
('24', 'Kit de Pesas 20kg', 299.00, 'Deportistas', 'GymPro', 'Deporte'),
('25', 'Escritorio de Oficina', 599.00, 'Oficinistas', 'MaderPlast', 'Muebles'),
('3', 'Samsung Galaxy A55 5G', 1339.00, 'Adultos', 'Samsung', 'Celular'),
('4', 'Maleta de Viaje', 459.00, 'Viajeros', 'Samsonite', 'Accesorio'),
('5', 'Ropa de Baño', 49.95, 'Niños', 'Speedo', 'Ropa'),
('6', 'Piscina Estructural Circular', 599.00, 'Familias', 'Bestway', 'Hogar'),
('7', 'Bicicleta 27.5 Nazca', 499.00, 'Deportistas', 'Nazca', 'Deporte'),
('8', 'Zapatillas Reebok', 149.00, 'Deportistas', 'Reebok', 'Calzado'),
('9', 'Zapatillas Adidas', 160.00, 'Jóvenes', 'Adidas', 'Calzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo`
--

CREATE TABLE `reclamo` (
  `DNI_cliente` char(8) NOT NULL,
  `codigo_libro` char(10) NOT NULL,
  `fecha_reclamo` date DEFAULT NULL,
  `mensaje` varchar(1000) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `reclamo`
--

INSERT INTO `reclamo` (`DNI_cliente`, `codigo_libro`, `fecha_reclamo`, `mensaje`) VALUES
('12345678', '01', '2024-05-15', 'La tienda no cumplió con el tiempo de entrega prometido.'),
('23456789', '01', '2024-06-10', 'Recibí un producto en mal estado, necesito un cambio urgente.'),
('34567890', '01', '2024-07-01', 'La calidad del producto no es la esperada, quiero un reembolso.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_reclamaciones`
--

CREATE TABLE `revision_reclamaciones` (
  `DNI_jefe` char(8) NOT NULL,
  `codigo_libro` char(10) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `numero_tarjeta` char(20) NOT NULL,
  `DNI_cliente_afiliado` char(8) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `nombre_titular` varchar(20) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`numero_tarjeta`, `DNI_cliente_afiliado`, `fecha_vencimiento`, `nombre_titular`, `tipo`) VALUES
('4187029347569021', '34567890', '2026-03-01', 'Carlos González', 'debito'),
('4203817962451837', '23456109', '2026-12-01', 'Isabel Cruz', 'credito'),
('4234567903125876', '89012345', '2026-08-01', 'Sofía Castro', 'credito'),
('4367912456804935', '56789012', '2026-05-01', 'Luis Sánchez', 'debito'),
('4503124897051390', '45678901', '2026-04-01', 'Ana Hernández', 'credito'),
('4556123478904531', '12345678', '2026-01-01', 'Juan Pérez', 'debito'),
('4587012953401298', '01234567', '2026-10-01', 'Lucía Ortiz', 'credito'),
('4597621983759348', '34567120', '2027-01-01', 'Miguel Vega', 'debito'),
('4598320176457980', '78901234', '2026-07-01', 'Pedro Torres', 'debito'),
('4768902341904729', '90123456', '2026-09-01', 'Diego Morales', 'debito'),
('4786321457098934', '45678131', '2027-02-01', 'Paula Ramos', 'credito'),
('4872561390845762', '12345098', '2026-11-01', 'David Reyes', 'debito'),
('4901245736904081', '67890123', '2026-06-01', 'Laura Ramírez', 'credito'),
('4923415623910543', '23456789', '2026-02-01', 'María López', 'credito'),
('4930152784015602', '56789142', '2027-03-01', 'Elena Aguilar', 'debito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo_completo`
--

CREATE TABLE `tiempo_completo` (
  `DNI` char(8) NOT NULL
) ;

--
-- Volcado de datos para la tabla `tiempo_completo`
--

INSERT INTO `tiempo_completo` (`DNI`) VALUES
('20112345'),
('21123456'),
('22134567'),
('23145678'),
('24156789'),
('25167890'),
('26178901'),
('27189012'),
('28190123'),
('29101234'),
('30112345'),
('31123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `cliente_carrito`
--
ALTER TABLE `cliente_carrito`
  ADD PRIMARY KEY (`DNI_cliente`,`codigo_producto`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `DNI_gerente` (`DNI_gerente`),
  ADD KEY `DNI_jefe` (`DNI_jefe`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `empleado_telefono`
--
ALTER TABLE `empleado_telefono`
  ADD PRIMARY KEY (`DNI`,`telefono`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `jefe`
--
ALTER TABLE `jefe`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `libro_reclamaciones`
--
ALTER TABLE `libro_reclamaciones`
  ADD PRIMARY KEY (`codigo_libro`);

--
-- Indices de la tabla `medio_tiempo`
--
ALTER TABLE `medio_tiempo`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `no_afiliado`
--
ALTER TABLE `no_afiliado`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `no_jefe`
--
ALTER TABLE `no_jefe`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `codigo_departamento` (`codigo_departamento`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `reclamo`
--
ALTER TABLE `reclamo`
  ADD PRIMARY KEY (`DNI_cliente`,`codigo_libro`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `revision_reclamaciones`
--
ALTER TABLE `revision_reclamaciones`
  ADD PRIMARY KEY (`DNI_jefe`,`codigo_libro`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`numero_tarjeta`),
  ADD KEY `DNI_cliente_afiliado` (`DNI_cliente_afiliado`);

--
-- Indices de la tabla `tiempo_completo`
--
ALTER TABLE `tiempo_completo`
  ADD PRIMARY KEY (`DNI`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afiliado`
--
ALTER TABLE `afiliado`
  ADD CONSTRAINT `afiliado_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `cliente_carrito`
--
ALTER TABLE `cliente_carrito`
  ADD CONSTRAINT `cliente_carrito_ibfk_1` FOREIGN KEY (`DNI_cliente`) REFERENCES `cliente` (`DNI`),
  ADD CONSTRAINT `cliente_carrito_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`DNI_gerente`) REFERENCES `gerente` (`DNI`),
  ADD CONSTRAINT `departamento_ibfk_2` FOREIGN KEY (`DNI_jefe`) REFERENCES `jefe` (`DNI`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `empleado_telefono`
--
ALTER TABLE `empleado_telefono`
  ADD CONSTRAINT `empleado_telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`);

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `jefe`
--
ALTER TABLE `jefe`
  ADD CONSTRAINT `jefe_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`);

--
-- Filtros para la tabla `medio_tiempo`
--
ALTER TABLE `medio_tiempo`
  ADD CONSTRAINT `medio_tiempo_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `no_jefe` (`DNI`);

--
-- Filtros para la tabla `no_afiliado`
--
ALTER TABLE `no_afiliado`
  ADD CONSTRAINT `no_afiliado_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`);

--
-- Filtros para la tabla `no_jefe`
--
ALTER TABLE `no_jefe`
  ADD CONSTRAINT `no_jefe_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `empleado` (`DNI`),
  ADD CONSTRAINT `no_jefe_ibfk_2` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo`);

--
-- Filtros para la tabla `reclamo`
--
ALTER TABLE `reclamo`
  ADD CONSTRAINT `reclamo_ibfk_1` FOREIGN KEY (`DNI_cliente`) REFERENCES `cliente` (`DNI`),
  ADD CONSTRAINT `reclamo_ibfk_2` FOREIGN KEY (`codigo_libro`) REFERENCES `libro_reclamaciones` (`codigo_libro`);

--
-- Filtros para la tabla `revision_reclamaciones`
--
ALTER TABLE `revision_reclamaciones`
  ADD CONSTRAINT `revision_reclamaciones_ibfk_1` FOREIGN KEY (`DNI_jefe`) REFERENCES `jefe` (`DNI`),
  ADD CONSTRAINT `revision_reclamaciones_ibfk_2` FOREIGN KEY (`codigo_libro`) REFERENCES `libro_reclamaciones` (`codigo_libro`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`DNI_cliente_afiliado`) REFERENCES `afiliado` (`DNI`);

--
-- Filtros para la tabla `tiempo_completo`
--
ALTER TABLE `tiempo_completo`
  ADD CONSTRAINT `tiempo_completo_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `no_jefe` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
