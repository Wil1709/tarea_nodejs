-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.38 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_nodejs
CREATE DATABASE IF NOT EXISTS `db_nodejs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_nodejs`;

-- Volcando estructura para tabla db_nodejs.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `carne` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo_electronico` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_tipo_sangre` int DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `id_tipo_sangre_estudiantes_tipos_sangre` (`id_tipo_sangre`),
  CONSTRAINT `id_tipo_sangre_estudiantes_tipos_sangre` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `tipos_sangre` (`id_tipo_sangre`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_nodejs.estudiantes: ~2 rows (aproximadamente)
INSERT INTO `estudiantes` (`id_estudiante`, `carne`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo_electronico`, `id_tipo_sangre`, `fecha_nacimiento`) VALUES
	(1, 'E001', 'Wilmer Noe', 'Contreras Interiano', 'Villa Nueva, Guatemala', '32134243', 'winteriano17@gmail.com', 4, '1995-09-17'),
	(5, 'E002', 'Carlos Jose', 'Estrada Barrios', 'Boca del Monte', '12345678', 'cjeb@gmail.com', 2, '2024-09-05'),
	(7, 'E003', 'Jose Carlos', 'Barrera Contreras', 'Villa Canales', '45678912', 'jcbc@gmail.com', 1, '2024-09-02'),
	(9, 'E005', 'Jose Carlos', 'Barrera Lopez', 'Villa Canales', '45678911', 'jcbl@gmail.com', 1, '1994-09-17');

-- Volcando estructura para tabla db_nodejs.tipos_sangre
CREATE TABLE IF NOT EXISTS `tipos_sangre` (
  `id_tipo_sangre` int NOT NULL AUTO_INCREMENT,
  `sangre` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tipo_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_nodejs.tipos_sangre: ~4 rows (aproximadamente)
INSERT INTO `tipos_sangre` (`id_tipo_sangre`, `sangre`) VALUES
	(1, 'A+'),
	(2, 'O-'),
	(3, 'A-'),
	(4, 'O+');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
