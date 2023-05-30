-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Sty 2023, 12:41
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `jachtydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jachty`
--

CREATE TABLE `jachty` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(25) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `Typ` char(1) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `Cena` decimal(6,2) NOT NULL,
  `Opis` varchar(2000) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `jachty`
--

INSERT INTO `jachty` (`ID`, `Nazwa`, `Typ`, `Cena`, `Opis`, `image`) VALUES
(1, 'Antila 33', 'b', '499.99', 'Antila 33 to nowoczesny, podążający za obecnymi trendami, luksusowy jacht żaglowy przeznaczony do uprawiania żeglarstwa śródlądowego. Jacht ten jest flagowym modelem stoczni Antila-Yachts z Radomia, jego premiera miała miejsce w 2015 r. Antila 33 to odpowiedź producenta na coraz większe zainteresowanie dużymi, bardzo wygodnymi jachtami klasy premium. Pod względem estetyki, wygody oraz miejsca pod pokładem Antila 33 nie ma sobie równych. Jacht oferuje największe i najwygodniejsze wnętrze ze wszystkich jachtów dostępnych na Mazurach. Żeglowanie Antilą sprawia wielką przyjemność między innymi za sprawą łatwości obsługi, szeroko rozstawionych dwóch kół sterowych i dobrych osiągów nautycznych. Antila 33 to jacht który stworzył nowy standard, jacht który po prostu wyznacza trendy.', 'img/antila_33.JPG'),
(2, 'Tes 32', 'b', '700.00', 'Tes 32 to chyba najbardziej rozpoznawalny jacht na całych Mazurach. Jego charakterystyczny kadłub widać już z daleka. Jest to dotąd największy jacht żaglowy z całej serii stoczni Tes Yacht. Jednostka została zaprojektowana przez znanego konstruktora Tomasza Siwika głownie z naciskiem na komfort i wygodę. Jacht cieszy się niesłabnącym zainteresowaniem zarówno wśród żeglarzy jak i firm czarterowych, mimo tego iż projekt pochodzi z 2002 r. świadczy to na pewno o nieprzemijalności tego modelu. Jeden z Tesów należy nawet do znanej aktorki Doroty Kamińskiej popularnej przede wszystkim z roli w serialu ,,Klan”.\r\n\r\nTes 32 Gryf to jacht bardzo komfortowy. Posiada on 2 zamykane kabiny i obszerna łazienkę z WC stacjonarnym. Kajuta rufowa jest ogromna, bez trudu pomieści nawet 3 osoby. Jacht posiada bogate wyposażenie. Największą zaletą jest na pewno elektrycznie kładziony maszt z którym kładzeniem poradzi sobie nawet jedna osoba. Kolejnym atutem jachtu Tes 32 Gryf jest ogrzewanie Webasto, które zapewni odpowiednią temperaturę w chłodniejsze noce. Z kolei echosonda pozwoli uniknąć wejścia na mieliznę a kompas nada żeglarskiego klimatu.', 'img/Tes_32_gryf.JPG'),
(3, 'Phila 900', 'b', '500.00', 'Phila 900 to śródlądowy jacht żaglowy produkowany przez największą polska stocznie jachtową Delphia-Yachts. Jak podaje producent jest to jacht stworzony wspólnie z jego użytkownikami. Podczas projektowania jachtu zostało zorganizowane specjalne spotkanie na którym projektant wraz z użytkownikami jachtów marki Delphia oraz właścicielami mazurskich firm czarterowych omówił najważniejsze kwestie i koncepcje jachtu idealnego na Mazury. Omówione zostało dokładnie wszystko począwszy od wielkości jachtu i jego nazwy aż do najdrobniejszych szczegółów takich jak np. rodzaj materiału z którego zostanie wykonane wnętrze jednostki – tak właśnie powstał ostateczny projekt jachtu Phila 900. Prototyp jednostki powstał na początku 2014 r., po wyeliminowaniu wszystkich niedoróbek Phila 900 weszła na linię produkcyjną. Jednostka okazała się istnym strzałem w dziesiątkę dlatego stocznia postanowiła sprzedawać ją również w wersji morskiej pod nazwą Delphia 29. Dziś po 6 latach od premiery można powiedzieć, iż jacht Phila 900 to rzeczywiście jacht idealny na Mazury. Jacht Phila 900 jest bardzo uniwersalny nie za duży i nie za mały. Bez większych problemów wpłyniemy nim do większości portów na Mazurach i bez problemu pomieścimy się nawet w 8-10 osób.', 'img/Phila_900.JPG'),
(4, 'Nexus 850', 'b', '800.00', 'Nexus 850 to jacht motorowy wyznaczający nową jakość w segmencie jachtów motorowych. Jednostka jest produkowana w jednej z największych polskich stoczni jachtowych NORTHMAN co na pewno gwarantuje bardzo wysoką jakość wykonania. Jacht zdobył wiele nagród między innymi: Gwóźdź targów Wiatr i Woda, zwycięstwo plebiscytu publiczności w kategorii jacht motorowy miesięcznika Żagle i wiele innych co na pewno podkreśla jego nadzwyczaj wyrafinowany charakter. Nexus 850 Vmax to houseboat w wersji półślizgowej stworzony na bazie Nexusa 850. Jacht został wyposażony w mocny i niezawodny silnik Yamaha 115 KM.', 'img/nexus_850.JPG');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `ID` int(11) NOT NULL,
  `Imie` varchar(25) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `Nazwisko` varchar(25) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `Telefon` varchar(9) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`ID`, `Imie`, `Nazwisko`, `Telefon`) VALUES
(1, 'Franek', 'fff', '325698578'),
(2, 'Aneta', 'AA', '452369859'),
(3, 'Sylwia', 'SS', '458965896'),
(4, 'Zbyszek', 'ZZZ', '478587458');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `ID` int(11) NOT NULL,
  `ID_jachtu` int(11) NOT NULL,
  `ID_klienta` int(11) NOT NULL,
  `Rezerwacja_od` date NOT NULL,
  `Rezerwacja_do` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`ID`, `ID_jachtu`, `ID_klienta`, `Rezerwacja_od`, `Rezerwacja_do`) VALUES
(1, 1, 2, '2023-01-10', '2023-01-20'),
(2, 2, 3, '2023-01-05', '2023-01-13'),
(3, 3, 1, '2023-01-10', '2023-01-14'),
(4, 4, 4, '2023-01-05', '2023-01-24'),
(5, 2, 4, '2023-01-29', '2023-02-03');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `jachty`
--
ALTER TABLE `jachty`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_jachtu` (`ID_jachtu`),
  ADD KEY `ID_klienta` (`ID_klienta`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `jachty`
--
ALTER TABLE `jachty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`ID_jachtu`) REFERENCES `jachty` (`ID`),
  ADD CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`ID_klienta`) REFERENCES `klient` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
