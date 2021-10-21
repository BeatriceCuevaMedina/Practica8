-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2021 a las 16:17:29
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `publications`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `number` int(11) NOT NULL,
  `balance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`number`, `balance`) VALUES
(12345, 1050.61),
(67890, 140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classics`
--

CREATE TABLE `classics` (
  `author` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `category` varchar(16) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `isbn` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `classics`
--

INSERT INTO `classics` (`author`, `title`, `category`, `year`, `isbn`) VALUES
('Charles Dickens', 'The Old Curiosity Shop', 'Classic Fiction', 1841, '9780099533474'),
('William Shakespeare', 'Romeo and Juliet', 'Play', 1594, '9780192814968'),
('Charles Darwin', 'The Origin of Species', 'Non-Fiction', 1856, '9780517123201'),
('Jane Austen', 'Pride and Prejudice', 'Classic Fiction', 1811, '9780582506206'),
('Mark Twain (Samuel Langhorne Clemens)', 'The Adventures of Tom Sawyer', 'Classic Fiction', 1876, '9781598184891');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classics1`
--

CREATE TABLE `classics1` (
  `author` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `category` varchar(16) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `isbn` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `name` varchar(128) DEFAULT NULL,
  `isbn` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`name`, `isbn`) VALUES
('Joe Bloggs', '9780099533474'),
('Jack Wilson', '9780517123201'),
('Mary Smith', '9780582506206');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre1900`
--

CREATE TABLE `pre1900` (
  `author` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `year` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pre1900`
--

INSERT INTO `pre1900` (`author`, `title`, `type`, `year`) VALUES
('Mark Twain', 'The\r\nAdventures of Tom Sawyer', 'Fiction', 1876),
('Jane Austen', 'Pride and Prejudice', 'Fiction', 1811),
('Charles Darwin', 'The Origin of\r\nSpecies', 'Non- Fiction', 1856),
('Charles Dickens', 'The Old\r\nCuriosity Shop', 'Fiction', 1841),
('William\r\nShakespeare', 'Romeo and Juliet', 'Play', 1594);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`number`);

--
-- Indices de la tabla `classics`
--
ALTER TABLE `classics`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `author` (`author`(20)),
  ADD KEY `title` (`title`(20)),
  ADD KEY `category` (`category`(4)),
  ADD KEY `year` (`year`),
  ADD KEY `author_2` (`author`(20));

--
-- Indices de la tabla `classics1`
--
ALTER TABLE `classics1`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `author` (`author`(20)),
  ADD KEY `title` (`title`(20)),
  ADD KEY `category` (`category`(4)),
  ADD KEY `year` (`year`);
ALTER TABLE `classics1` ADD FULLTEXT KEY `author_2` (`author`,`title`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`isbn`);

--
-- Indices de la tabla `pre1900`
--
ALTER TABLE `pre1900`
  ADD KEY `author` (`author`),
  ADD KEY `author_2` (`author`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
