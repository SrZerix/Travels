-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para Viajes
CREATE DATABASE IF NOT EXISTS `viajes` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Viajes`;

-- Volcando estructura para tabla Viajes.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `clave` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla Viajes.cliente: ~0 rows (aproximadamente)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idViaje` int(11) NOT NULL,
  `idTarjeta` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `importeCompra` double NOT NULL,
  `numViajeros` int(11) NOT NULL,
  `localizador` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localizador` (`localizador`),
  KEY `viajeCompra` (`idViaje`),
  KEY `tarjetaCompra` (`idTarjeta`),
  CONSTRAINT `tarjetaCompra` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjeta` (`id`),
  CONSTRAINT `viajeCompra` FOREIGN KEY (`idViaje`) REFERENCES `viajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.compra: ~0 rows (aproximadamente)
DELETE FROM `compra`;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.comprabackup
CREATE TABLE IF NOT EXISTS `comprabackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idViaje` int(11) NOT NULL,
  `idTarjeta` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `importeCompra` double NOT NULL DEFAULT 0,
  `numViajeros` int(11) NOT NULL,
  `localizador` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `fechaBaja` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localizador` (`localizador`),
  KEY `tarjetaCompraBackup` (`idTarjeta`),
  KEY `viajeCompraBackup` (`idViaje`),
  CONSTRAINT `tarjetaCompraBackup` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjetabackup` (`id`),
  CONSTRAINT `viajeCompraBackup` FOREIGN KEY (`idViaje`) REFERENCES `viajesbackup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.comprabackup: ~0 rows (aproximadamente)
DELETE FROM `comprabackup`;
/*!40000 ALTER TABLE `comprabackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprabackup` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.estacion
CREATE TABLE IF NOT EXISTS `estacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccion` varchar(75) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `localidad` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.estacion: ~4 rows (aproximadamente)
DELETE FROM `estacion`;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` (`id`, `nombre`, `direccion`, `localidad`) VALUES
	(1, 'Llanos', 'San Cristobal Nº20', 'Albacete'),
	(2, 'Jucar', 'Vistas Nº45', 'Valencia'),
	(3, 'Mirador', 'Odisea Nº10', 'Cuenca'),
	(4, 'Rocales', 'Munera Nº23', 'Toledo');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.horarios
CREATE TABLE IF NOT EXISTS `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRuta` int(11) NOT NULL,
  `horaSalida` time NOT NULL,
  `horaLLegada` time NOT NULL,
  `tipo` enum('Semana','Finde') COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRutaHorario` (`idRuta`),
  CONSTRAINT `idRutaHorario` FOREIGN KEY (`idRuta`) REFERENCES `ruta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.horarios: ~5 rows (aproximadamente)
DELETE FROM `horarios`;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` (`id`, `idRuta`, `horaSalida`, `horaLLegada`, `tipo`) VALUES
	(1, 1, '11:45:00', '13:45:00', 'Semana'),
	(2, 1, '17:30:00', '19:30:00', 'Semana'),
	(3, 1, '10:00:00', '12:00:00', 'Finde'),
	(4, 4, '10:00:00', '12:00:00', 'Semana'),
	(5, 4, '15:30:00', '17:30:00', 'Semana');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.ocupacion
CREATE TABLE IF NOT EXISTS `ocupacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idViajero` int(11) NOT NULL,
  `numAsiento` int(11) NOT NULL,
  `importe` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCompra_idViajero_numAsiento` (`idCompra`,`idViajero`,`numAsiento`),
  KEY `viajeroOcupacion` (`idViajero`),
  CONSTRAINT `compraOcupacion` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`id`),
  CONSTRAINT `viajeroOcupacion` FOREIGN KEY (`idViajero`) REFERENCES `viajero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.ocupacion: ~0 rows (aproximadamente)
DELETE FROM `ocupacion`;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.ocupacionbackup
CREATE TABLE IF NOT EXISTS `ocupacionbackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idViajero` int(11) NOT NULL,
  `numAsiento` int(11) NOT NULL,
  `importe` double NOT NULL DEFAULT 0,
  `fechaBaja` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idCompra_idViajero_numAsiento` (`idCompra`,`idViajero`,`numAsiento`),
  KEY `viajeroOcupacionBackup` (`idViajero`),
  CONSTRAINT `compraOcupacionBackup` FOREIGN KEY (`idCompra`) REFERENCES `comprabackup` (`id`),
  CONSTRAINT `viajeroOcupacionBackup` FOREIGN KEY (`idViajero`) REFERENCES `viajerobackup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.ocupacionbackup: ~0 rows (aproximadamente)
DELETE FROM `ocupacionbackup`;
/*!40000 ALTER TABLE `ocupacionbackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocupacionbackup` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.parametros
CREATE TABLE IF NOT EXISTS `parametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `empresa` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  `sede` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  `CIF` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.parametros: ~0 rows (aproximadamente)
DELETE FROM `parametros`;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` (`id`, `user`, `password`, `empresa`, `sede`, `CIF`) VALUES
	(2, 'root', '8cb2237d0679ca88db6464eac60da96345513964', 'Viajex S.L', 'Valencia, España', 'J3515374A');
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.ruta
CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrigen` int(11) NOT NULL DEFAULT 0,
  `idDestino` int(11) NOT NULL DEFAULT 0,
  `duracion` time NOT NULL DEFAULT '00:00:00',
  `distancia` int(11) NOT NULL DEFAULT 0,
  `precio` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idOrigen_idDestino` (`idOrigen`,`idDestino`),
  KEY `idDestinoRuta` (`idDestino`),
  KEY `idOrigen` (`idOrigen`),
  CONSTRAINT `idDestinoRuta` FOREIGN KEY (`idDestino`) REFERENCES `estacion` (`id`),
  CONSTRAINT `idOrigenRuta` FOREIGN KEY (`idOrigen`) REFERENCES `estacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.ruta: ~9 rows (aproximadamente)
DELETE FROM `ruta`;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` (`id`, `idOrigen`, `idDestino`, `duracion`, `distancia`, `precio`) VALUES
	(1, 1, 2, '02:00:00', 187, 10),
	(2, 1, 3, '01:50:00', 160, 10),
	(3, 1, 4, '02:30:00', 250, 15),
	(4, 2, 1, '02:00:00', 187, 10),
	(5, 2, 3, '02:12:00', 200, 12),
	(6, 2, 4, '03:30:00', 400, 20),
	(7, 3, 2, '02:12:00', 200, 12),
	(8, 3, 1, '01:50:00', 160, 10),
	(9, 3, 4, '01:30:00', 180, 12);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT '',
  `num` varbinary(50) NOT NULL DEFAULT '',
  `caducidad` date NOT NULL,
  `CVV` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `clienteTarjeta` (`idCliente`),
  CONSTRAINT `clienteTarjeta` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla Viajes.tarjeta: ~0 rows (aproximadamente)
DELETE FROM `tarjeta`;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.tarjetabackup
CREATE TABLE IF NOT EXISTS `tarjetabackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT '',
  `num` varbinary(50) NOT NULL DEFAULT '',
  `caducidad` date NOT NULL,
  `CVV` int(11) NOT NULL,
  `fechaBaja` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num` (`num`),
  KEY `clienteTarjetaBackup` (`idCliente`),
  CONSTRAINT `clienteTarjetaBackup` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla Viajes.tarjetabackup: ~0 rows (aproximadamente)
DELETE FROM `tarjetabackup`;
/*!40000 ALTER TABLE `tarjetabackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetabackup` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.viajero
CREATE TABLE IF NOT EXISTS `viajero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.viajero: ~0 rows (aproximadamente)
DELETE FROM `viajero`;
/*!40000 ALTER TABLE `viajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajero` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.viajerobackup
CREATE TABLE IF NOT EXISTS `viajerobackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `apellido` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '',
  `fechaBaja` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.viajerobackup: ~0 rows (aproximadamente)
DELETE FROM `viajerobackup`;
/*!40000 ALTER TABLE `viajerobackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajerobackup` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.viajes
CREATE TABLE IF NOT EXISTS `viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idHorario` int(11) NOT NULL,
  `dia` date NOT NULL,
  `plazas` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idHorarioViaje` (`idHorario`),
  CONSTRAINT `idHorarioViaje` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.viajes: ~5 rows (aproximadamente)
DELETE FROM `viajes`;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` (`id`, `idHorario`, `dia`, `plazas`) VALUES
	(1, 1, '2020-01-31', 6),
	(2, 2, '2020-01-31', 6),
	(3, 3, '2020-01-31', 6),
	(4, 4, '2020-02-03', 6),
	(5, 5, '2020-02-03', 6);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;

-- Volcando estructura para tabla Viajes.viajesbackup
CREATE TABLE IF NOT EXISTS `viajesbackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idHorario` int(11) NOT NULL,
  `dia` date NOT NULL,
  `plazas` int(6) NOT NULL,
  `fechaBaja` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `horariosViajesBackup` (`idHorario`),
  CONSTRAINT `horariosViajesBackup` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla Viajes.viajesbackup: ~0 rows (aproximadamente)
DELETE FROM `viajesbackup`;
/*!40000 ALTER TABLE `viajesbackup` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajesbackup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
