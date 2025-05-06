-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 06 2025 г., 11:40
-- Версия сервера: 8.0.13
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `RobA1234_hotel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Booking`
--

CREATE TABLE `Booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `booking_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Booking`
--

INSERT INTO `Booking` (`id`, `client_id`, `room_id`, `check_in_date`, `check_out_date`, `booking_date`, `status`, `total_price`, `payment_status`) VALUES
(1, 1, 3, '2023-06-01', '2023-06-10', '2023-05-20', 'подтверждена', '45000', 'оплачено'),
(2, 2, 1, '2023-06-05', '2023-06-07', '2023-05-25', 'подтверждена', '5000', 'оплачено'),
(3, 3, 5, '2023-06-15', '2023-06-20', '2023-06-01', 'подтверждена', '37500', 'частично'),
(4, 4, 2, '2023-07-01', '2023-07-10', '2023-06-15', 'подтверждена', '22500', 'не оплачено'),
(5, 5, 4, '2023-07-15', '2023-07-20', '2023-06-20', 'отменена', '27500', 'не оплачено');

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_date` datetime NOT NULL,
  `check_out_date` datetime NOT NULL,
  `booking_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `passport_date` date NOT NULL,
  `registration_date` date NOT NULL,
  `loyalty_level` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roles_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `roles_name`) VALUES
(1, 'админ'),
(2, 'менеджер');

-- --------------------------------------------------------

--
-- Структура таблицы `Room`
--

CREATE TABLE `Room` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `price_per_night` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Room`
--

INSERT INTO `Room` (`id`, `room_number`, `category`, `floor`, `capacity`, `price_per_night`, `description`, `status`) VALUES
(1, '101', 'стандарт', 1, '2', '2500', 'Стандартный номер с видом во двор', 'доступен'),
(2, '102', 'стандарт', 1, '2', '3000', 'Стандартный номер с видом на горы', 'доступен'),
(3, '201', 'люкс', 2, '2', '5000', 'Номер люкс с видом на город', 'доступен'),
(4, '202', 'люкс', 2, '3', '5500', 'Номер люкс с гостиной зоной', 'на обслуживании'),
(5, '301', 'люкс', 3, '4', '7500', 'Президентский люкс', 'занят');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `price_per_night` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role_id`) VALUES
(1, 'bro', '$2b$12$1y5Nkripuvwn7RyMCgk2cu8UGdrCQ.6ieoeEfDh.AQC4arCVRI2Ei', 1),
(2, 'admin', '$2b$12$44uXmH7AXAPh6.FsQbmkWu9QBLFBH.TvFSpa9Khlr2xYfmVUuldNC', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_client_id_foreign` (`client_id`);

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_client_id` (`client_id`),
  ADD KEY `booking_room_id` (`room_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Booking`
--
ALTER TABLE `Booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Room`
--
ALTER TABLE `Room`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
