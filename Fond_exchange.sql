-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Апр 05 2024 г., 11:42
-- Версия сервера: 5.7.39
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Fond exchange`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'ФИО'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Clients`
--

INSERT INTO `Clients` (`id`, `name`) VALUES
(1, 'Иванов Иван Иванович'),
(2, 'Петров Василий Васильевич'),
(3, 'Сидоров Игорь Иванович');

-- --------------------------------------------------------

--
-- Структура таблицы `Client_сheck`
--

CREATE TABLE `Client_сheck` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `id_client` int(11) NOT NULL COMMENT 'ID клиента',
  `summ` float DEFAULT NULL COMMENT 'Сумма',
  `date_and_time` datetime(6) NOT NULL COMMENT 'Дата и время'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Client_сheck`
--

INSERT INTO `Client_сheck` (`id`, `id_client`, `summ`, `date_and_time`) VALUES
(1, 1, 100, '2024-04-02 10:40:49.000000'),
(2, 2, 200.5, '2024-04-03 16:34:32.000000'),
(3, 3, 150, '2024-04-02 15:15:31.000000'),
(4, 2, -100, '2024-04-05 09:19:31.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Deal`
--

CREATE TABLE `Deal` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `id_ticker` int(11) NOT NULL COMMENT 'ID тикера',
  `id_client` int(11) NOT NULL COMMENT 'ID клиента',
  `type` varchar(255) NOT NULL COMMENT 'Тип покупка / продажа',
  `quantity` int(11) NOT NULL COMMENT 'Количество',
  `price` float NOT NULL COMMENT 'Цена',
  `date_and_time` datetime(6) NOT NULL COMMENT 'Дата и время'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Deal`
--

INSERT INTO `Deal` (`id`, `id_ticker`, `id_client`, `type`, `quantity`, `price`, `date_and_time`) VALUES
(1, 1, 1, 'покупка', 1, 10, '2024-04-02 10:40:49.000000'),
(2, 6, 2, 'покупка', 5, 33, '2024-04-03 16:34:32.000000'),
(3, 7, 3, 'покупка', 10, 40, '2024-03-14 17:19:55.000000'),
(4, 2, 2, 'продажа', 2, 24, '2024-02-15 13:10:25.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Tickers`
--

CREATE TABLE `Tickers` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Tickers`
--

INSERT INTO `Tickers` (`id`, `name`) VALUES
(1, 'YNDX'),
(2, 'LKOH'),
(3, 'MTLR'),
(4, 'GAZP'),
(5, 'MOEX'),
(6, 'USD'),
(7, 'EUR');

-- --------------------------------------------------------

--
-- Структура таблицы `Zayavka`
--

CREATE TABLE `Zayavka` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `id_ticker` int(11) NOT NULL COMMENT 'ID тикера',
  `id_client` int(11) NOT NULL COMMENT 'ID клиента',
  `type` varchar(255) NOT NULL COMMENT 'покупка / продажа ',
  `quantity` int(11) NOT NULL COMMENT 'Количество',
  `price` float NOT NULL COMMENT 'Цена',
  `date_and_time` datetime(6) NOT NULL COMMENT 'Дата и время'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Zayavka`
--

INSERT INTO `Zayavka` (`id`, `id_ticker`, `id_client`, `type`, `quantity`, `price`, `date_and_time`) VALUES
(1, 6, 3, 'покупка', 20, 25, '2024-01-10 13:02:03.000000'),
(2, 3, 2, 'продажа', 5, 30, '2024-02-28 11:15:06.000000');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Client_сheck`
--
ALTER TABLE `Client_сheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Индексы таблицы `Deal`
--
ALTER TABLE `Deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_ticker` (`id_ticker`);

--
-- Индексы таблицы `Tickers`
--
ALTER TABLE `Tickers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_ticker` (`id_ticker`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Clients`
--
ALTER TABLE `Clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Client_сheck`
--
ALTER TABLE `Client_сheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Deal`
--
ALTER TABLE `Deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Tickers`
--
ALTER TABLE `Tickers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Client_сheck`
--
ALTER TABLE `Client_сheck`
  ADD CONSTRAINT `client_сheck_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id`);

--
-- Ограничения внешнего ключа таблицы `Deal`
--
ALTER TABLE `Deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id`),
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`id_ticker`) REFERENCES `Tickers` (`id`);

--
-- Ограничения внешнего ключа таблицы `Zayavka`
--
ALTER TABLE `Zayavka`
  ADD CONSTRAINT `zayavka_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id`),
  ADD CONSTRAINT `zayavka_ibfk_2` FOREIGN KEY (`id_ticker`) REFERENCES `Tickers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
