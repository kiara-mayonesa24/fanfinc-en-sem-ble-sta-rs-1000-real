-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2026 a las 17:23:36
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
-- Base de datos: `crazyroulette`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripción` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `Nombre`, `Descripción`) VALUES
(0, 'Juego de ritmo', 'El juego de ritmo es un tipo de videojuego de acción musical. Los juegos de este tipo se concentran en el baile o simular la ejecución de instrumentos musicales. Los jugadores deben apretar una serie de botones en momentos precisos correspondiendo a una secuencia indicada por el juego.'),
(1, 'SandBox', 'El juego libre es un estilo de videojuego caracterizado por dar al jugador un alto grado de libertad para ser creativo a la hora de completar tareas hacia un objetivo dentro del juego, o simplemente para jugar sin restricciones.'),
(2, 'RPG', 'RPG significa Role-Playing Game (juego de rol) en videojuegos, donde el jugador controla personajes inmersos en un mundo ficticio, mejorando estadísticas y siguiendo una narrativa. Se basan en la toma de decisiones, desarrollo de personajes y a menudo combates por turnos, con raíces en juegos de mesa. '),
(3, 'Novela visual', 'Una novela visual (visual novel) es un género de videojuego narrativo, originario de Japón, que cuenta una historia mediante texto, imágenes estáticas (tipo anime/manga) y sonido. Se caracteriza por una baja interactividad, donde el jugador lee la trama y toma decisiones clave que ramifican la historia hacia diferentes finales.'),
(4, 'SIM', 'simulador de vida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `fabricante` varchar(80) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `Nombre`, `fabricante`, `año_lanzamiento`) VALUES
(0, 'Google Play Juegos', 'Google', '2012'),
(1, 'Epic Games Store', 'Epic Games', '2018'),
(2, 'Steam', 'Valve Corporation', '2003'),
(3, 'Xbox Cloud Gaming', 'Microsoft', '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `id_juego` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `desarrolladora` varchar(100) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`id_juego`, `titulo`, `desarrolladora`, `año_lanzamiento`, `precio`, `id_genero`) VALUES
(0, 'Roblox', 'Roblox Corporation', '2006', 0.00, 1),
(1, 'Ensemble stars', 'Cacalia Studio', '2015', 0.00, 0),
(2, 'Project Sekai: Colorful Stage!', 'Crypton Future Media y Colorful Palette', '2021', 3467.99, 0),
(3, 'Honkai: star rail', 'HoyoVerse', '2023', 984.00, 2),
(4, 'Genshin Impact', 'HoyoVerse', '2020', 674.00, 2),
(5, 'My horse prince', 'USAYA', '2016', 3784.00, 3),
(6, 'Mystic Messenger', 'Cheritz', '2016', 0.00, 3),
(7, 'Tomodachi Life:living the dream', 'Nintendo SPD', '2026', 9999.99, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego_plataforma`
--

CREATE TABLE `videojuego_plataforma` (
  `id_juego` int(11) NOT NULL,
  `id_plataforma` int(11) NOT NULL,
  `fecha_disponible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `videojuego_plataforma`
--

INSERT INTO `videojuego_plataforma` (`id_juego`, `id_plataforma`, `fecha_disponible`) VALUES
(1, 0, '2020-08-10'),
(0, 1, '2020-06-05'),
(2, 0, '2021-08-25'),
(3, 1, '2021-11-07'),
(4, 1, '2020-12-04'),
(5, 2, '2017-01-11'),
(6, 0, '2016-05-12'),
(7, 1, '2026-04-06'),
(0, 3, '2023-10-11'),
(3, 0, '2021-04-14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id_plataforma`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`id_juego`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD KEY `id_juego` (`id_juego`),
  ADD KEY `id_plataforma` (`id_plataforma`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Filtros para la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD CONSTRAINT `videojuego_plataforma_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `videojuego` (`id_juego`),
  ADD CONSTRAINT `videojuego_plataforma_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
