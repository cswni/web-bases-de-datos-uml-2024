-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para proyectos
DROP DATABASE IF EXISTS `proyectos`;
CREATE DATABASE IF NOT EXISTS `proyectos` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `proyectos`;

-- Volcando estructura para tabla proyectos.actividades
DROP TABLE IF EXISTS `actividades`;
CREATE TABLE IF NOT EXISTS `actividades` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT '0',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `presupuesto` float NOT NULL DEFAULT 0,
  `descripcion` text NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_actividades_proyectos` (`proyecto_id`),
  CONSTRAINT `FK_actividades_proyectos` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.actividades: ~0 rows (aproximadamente)
DELETE FROM `actividades`;

-- Volcando estructura para tabla proyectos.actividad_miembro
DROP TABLE IF EXISTS `actividad_miembro`;
CREATE TABLE IF NOT EXISTS `actividad_miembro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividades_id` int(11) NOT NULL DEFAULT 0,
  `miembro_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_actividad_miembro_actividades` (`actividades_id`),
  KEY `FK_actividad_miembro_miembro` (`miembro_id`),
  CONSTRAINT `FK_actividad_miembro_actividades` FOREIGN KEY (`actividades_id`) REFERENCES `actividades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_actividad_miembro_miembro` FOREIGN KEY (`miembro_id`) REFERENCES `miembro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.actividad_miembro: ~0 rows (aproximadamente)
DELETE FROM `actividad_miembro`;

-- Volcando estructura para tabla proyectos.miembro
DROP TABLE IF EXISTS `miembro`;
CREATE TABLE IF NOT EXISTS `miembro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rol` int(2) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `celular` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.miembro: ~0 rows (aproximadamente)
DELETE FROM `miembro`;

-- Volcando estructura para tabla proyectos.proyectos
DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT '0',
  `presupuesto` float DEFAULT 0,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.proyectos: ~0 rows (aproximadamente)
DELETE FROM `proyectos`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
