-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 19 2022 г., 14:09
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bd_lab_`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `N` int NOT NULL,
  `code` int NOT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `id_publishing` int NOT NULL,
  `pages` int NOT NULL,
  `format` varchar(30) NOT NULL,
  `datee` date NOT NULL,
  `circulation` int DEFAULT NULL,
  `id_topic` int NOT NULL,
  `id_category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`N`, `code`, `new`, `name`, `price`, `id_publishing`, `pages`, `format`, `datee`, `circulation`, `id_topic`, `id_category`) VALUES
(1, 5110, 0, 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 1, 400, '70х100/16', '2000-07-24', 5000, 1, 6),
(2, 5141, 0, 'Структури даних та алгоритми', 37.8, 4, 384, '70х100/16', '2000-09-29', 5000, 1, 1),
(3, 5127, 0, 'Автоматизація інженерно-графічних робіт', 11.58, 1, 256, '70х100/16', '2000-06-15', 5000, 1, 1),
(4, 5199, 0, 'Залізо IMB 2001', 30.07, 2, 368, '70х100/16', '2000-12-02', 5000, 1, 6),
(5, 3851, 0, 'Захист інформації, та безбека комп\'ютених систем', 26, 3, 480, '84х108/16', '1999-02-04', 5000, 1, 6),
(6, 3932, 0, 'Як перетворити персональний комп\'ютер на вимірювальний комплекс', 7.65, 5, 144, '60х88/16', '1999-06-09', 5000, 1, 2),
(7, 4713, 0, 'Plug-ins. Додаткові програми для музичних програм', 11.41, 5, 144, '70х100/16', '2000-02-22', 5000, 1, 2),
(8, 5217, 0, 'Windows ME. Найновіші версії програм', 16.57, 6, 320, '70х100/16', '2000-08-25', 5000, 2, 3),
(9, 4829, 0, 'Windows 2000 Proffesional крок за кроком з CD', 27.25, 7, 320, '70х100/16', '2000-04-28', 5000, 2, 3),
(10, 5170, 0, 'Linux версії', 24.43, 5, 346, '70х100/16', '2000-09-29', 5000, 2, 4),
(11, 860, 0, 'Операційна система UNIX', 3.5, 1, 395, '84х10016', '1997-05-05', 5000, 2, 5),
(12, 44, 0, 'Відповіді на актуальні запитання щодо OS/2 Warp', 5, 3, 352, '60х84/16', '1996-03-20', 5000, 2, 6),
(13, 5176, 0, 'Windows ME. Супутник користувача', 12.79, 1, 306, '-', '2000-10-10', 5000, 2, 6),
(14, 5462, 0, 'Мова програмування С++. Лекції та вправи', 29, 3, 656, '84х108/16', '2000-12-12', 5000, 3, 7),
(15, 4982, 0, 'Мова програмування С. Лекції та вправи', 29, 3, 432, '84х108/16', '2000-07-12', 5000, 3, 7),
(16, 4687, 0, 'Ефективне використання C++ .50 рекомендацій щодо покращення ваших програм та проектів', 17.6, 5, 240, '70х100/16', '2000-02-03', 5000, 3, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Підручники'),
(2, 'Інші книги'),
(3, 'Windows 2000'),
(4, 'Linux'),
(5, 'Unix'),
(6, 'Інші операційні системи'),
(7, 'C&C++');

-- --------------------------------------------------------

--
-- Структура таблицы `publishing`
--

CREATE TABLE `publishing` (
  `id` int NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `publishing`
--

INSERT INTO `publishing` (`id`, `name`) VALUES
(1, 'Видавнича група BHV'),
(2, 'МикроАрт'),
(3, 'DiaSoft'),
(4, 'Вільямс'),
(5, 'ДМК'),
(6, 'Триумф'),
(7, 'Эком');

-- --------------------------------------------------------

--
-- Структура таблицы `topic`
--

CREATE TABLE `topic` (
  `id` int NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `topic`
--

INSERT INTO `topic` (`id`, `name`) VALUES
(1, 'Використання ПК в цілому'),
(2, 'Операційні системи'),
(3, 'Програмування');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`N`),
  ADD KEY `id_publishing` (`id_publishing`),
  ADD KEY `id_topic` (`id_topic`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publishing`
--
ALTER TABLE `publishing`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `N` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `publishing`
--
ALTER TABLE `publishing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_publishing`) REFERENCES `publishing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
