USE 21_hamowska;

CREATE TABLE Klient
(
    id_klient INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(30) NOT NULL,
    nr_telefonu VARCHAR(11) NOT NULL,
    miejscowosc VARCHAR(50) NOT NULL,
    ulica VARCHAR(50) NOT NULL,
    nr_budynku INT NOT NULL,
    PRIMARY KEY(id_klient)
);
#klucz (id_klient) nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość id_klient automatycznie wzrasta z każdym nowym rekordem
#wszystkie kolumny są NOT NULL, ponieważ bez nich nie byłyby możliwe dalsze akcje dotyczące zamówienia

INSERT INTO `Klient` (`id_klient`, `imie`, `nazwisko`, `nr_telefonu`, `miejscowosc`, `ulica`, `nr_budynku`) VALUES 
(NULL, 'Julia', 'Duch', '786 123 090', 'Kraków', 'Centralna', '52'), 
(NULL, 'Hubert', 'Biliński', '332 145 229', 'Brzesko', 'Różana', '1'), 
(NULL, 'Amelia', 'Kmieć', '834 221 090', 'Tarnów', 'Wałowa', '18'), 
(NULL, 'Łukasz', 'Kaszowski', '666 983 03', 'Kraków', 'Słomiana', '23'), 
(NULL, 'Małgorzata', 'Bielik', '069 420 860', 'Tarnów', 'Marynarki Wojennej', '98'), 
(NULL, 'Robert', 'Zieliński', '198 223 601', 'Kraków', 'Zachodnia', '44');



CREATE TABLE Pizzeria
(
    id_pizzeria INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(50) NOT NULL,
    miejscowosc VARCHAR(40) NOT NULL,
    ulica VARCHAR(40) NOT NULL,
    nr_lokalu INT NOT NULL,
    PRIMARY KEY(id_pizzeria)
);
#klucz (id_pizzeria) nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#wszystkie informacje są niezbędne, dlatego każdy atrybut ma wartość NOT NULL

INSERT INTO `Pizzeria` (`id_pizzeria`, `nazwa`, `miejscowosc`, `ulica`, `nr_lokalu`) VALUES (NULL, 'PizzaHut', 'Kraków', 'Drukarska', '18'), 
(NULL, 'Toni Pepperoni', 'Kraków', 'Miłkowskiego', '17'), 
(NULL, 'Pizzeria Soprano', 'Brzesko', 'Kopernika', '9'), 
(NULL, 'Pizzeria Etna', 'Tarnów', 'Krasińskiego', '12'), 
(NULL, 'Pizzeria Verona', 'Tarnów', 'Akacjowa', '1'), 
(NULL, 'Maxi Pizza', 'Kraków', 'Kapelanka', '15');



CREATE TABLE Element_menu
(
    id_element_menu INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(40) NOT NULL,
    cena_male DECIMAL(5,2),
    cena_srednie DECIMAL(5,2),
    cena_duze DECIMAL(5,2),
    id_pizzeria INT NOT NULL,
    PRIMARY KEY(id_element_menu),
    FOREIGN KEY(id_pizzeria) REFERENCES Pizzeria(id_pizzeria)
);
#klucz (id_element_menu) nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#ceny nie są NOT NULL, ponieważ nie wszystkie produkty muszą mieć każdy rozmiar
#do zapisu cen użyty został typ danych DECIMAL, ponieważ FLOAT może przechowywać wartości o różnej precyzji. Wartością w FLOAT może być zarówno 1.6 jak i 1.6180339887, co mogłoby stanowić problem, np. w przypadku faktur.

INSERT INTO `Element_menu` (`id_element_menu`, `nazwa`, `cena_male`, `cena_srednie`, `cena_duze`, `id_pizzeria`) VALUES 
(NULL, 'Margharita', '20.00', '22.00', '24.00', '6'), 
(NULL, 'Coca Cola', '5.00', '7.00', '10.00', '1'), 
(NULL, 'Grecka', '23.00', '27.00', '29.00', '4'), 
(NULL, 'Lemoniada', '3.00', '4.00', '5.00', '4'),
(NULL, 'Vege', '25.00', '27.50', '29.00', '5'), 
(NULL, 'Woda', '3.00', '4.00', '5.00', '3'), 
(NULL, 'Pepperoni', '24.00', '25.00', '26.50', '2'), 
(NULL, 'Sos czosnkowy', '2.00', '3.00', '4.00', '1'), 
(NULL, 'Sos czosnkowy', '3.00', '4.00', '5.50', '3'), 
(NULL, 'Brokułowa', '23.00', '25.00', '28.00', '5'), 
(NULL, 'Mięsna', '28.00', '30.00', '33.00', '6'), 
(NULL, 'Sok jabłkowy', '4.50', '6.00', '7.50', '2');



CREATE TABLE Skladnik
(
    id_skladnik INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(40) NOT NULL,
    PRIMARY KEY(id_skladnik)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem

INSERT INTO `Skladnik` (`id_skladnik`, `nazwa`) VALUES 
(NULL, 'Szynka'), 
(NULL, 'Kurczak'), 
(NULL, 'Brokuł'),
(NULL, 'Ser'), 
(NULL, 'Sos pomidorowy'), 
(NULL, 'Mozzarella'), 
(NULL, 'Papryka'), 
(NULL, 'Cebula'), 
(NULL, 'Kukurydza'),
(NULL, 'Pomidor'), 
(NULL, 'Szpinak'), 
(NULL, 'Feta'), 
(NULL, 'Oliwki'), 
(NULL, 'Pepperoni'), 
(NULL, 'Boczek'), 
(NULL, 'Szynka parmeńska'), 
(NULL, 'Bazylia'), 
(NULL, 'Pieczarki'), 
(NULL, 'Papryczka ostra');



CREATE TABLE Pizza
(
    id_pizza INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(40) NOT NULL,
    cena_male DECIMAL(5,2),
    cena_srednie DECIMAL(5,2),
    cena_duze DECIMAL(5,2),
    grubosc_ciasta VARCHAR(30) NOT NULL,
    wegetarianska CHAR(3) NOT NULL,
    id_pizzeria INT NOT NULL,
    PRIMARY KEY(id_pizza),
    FOREIGN KEY(id_pizza) REFERENCES Element_menu(id_element_menu),
    FOREIGN KEY(id_pizzeria) REFERENCES Pizzeria(id_pizzeria)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#atrybut wegetarianska zapisywana jest w typie CHAR(3), ponieważ wpisaną tam daną może być jedynie tak lub nie

INSERT INTO `Pizza` (`id_pizza`, `nazwa`, `cena_male`, `cena_srednie`, `cena_duze`, `grubosc_ciasta`, `wegetarianska`, `id_pizzeria`) VALUES 
('1', 'Margharita', '20.00', '22.00', '24.00', 'grube', 'tak', '6'), 
('3', 'Grecka', '23.00', '27.00', '29.00', 'cienkie', 'tak', '4'), 
('5', 'Vege', '25.00', '27.50', '29.00', 'grube', 'tak', '5'),
('7', 'Pepperoni', '24.00', '25.00', '26.50', 'grube', 'nie', '2'),
('10', 'Brokułowa', '23.00', '25.00', '28.00', 'cienkie', 'nie', '5'), 
('11', 'Mięsna', '28.00', '30.00', '33.00', 'cienkie', 'nie', '6');



CREATE TABLE Dodatek 
(
    id_dodatek INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(40) NOT NULL,
    cena_male DECIMAL(5,2),
    cena_srednie DECIMAL(5,2),
    cena_duze DECIMAL(5,2),
    id_pizzeria INT NOT NULL,
    PRIMARY KEY(id_dodatek),
    FOREIGN KEY(id_dodatek) REFERENCES Element_menu(id_element_menu),
    FOREIGN KEY(id_pizzeria) REFERENCES Pizzeria(id_pizzeria)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem

INSERT INTO `Dodatek` (`id_dodatek`, `nazwa`, `cena_male`, `cena_srednie`, `cena_duze`, `id_pizzeria`) VALUES 
('2', 'Coca Cola', '5.00', '7.00', '10.00', '1'), 
('4', 'Lemoniada', '3.00', '4.00', '5.00', '4'), 
('6', 'Woda', '3.00', '4.00', '5.00', '3'), 
('8', 'Sos czoskowy', '2.00', '3.00', '4.00', '1'), 
('9', 'Sos czosnkowy', '3.00', '4.00', '5.50', '3'), 
('12', 'Sok jabłkowy', '4.50', '6.00', '7.50', '2');




CREATE TABLE Pizza_skladnik
(
    id_pizza INT NOT NULL,
    id_skladnik INT NOT NULL,
    PRIMARY KEY(id_pizza, id_skladnik),
    FOREIGN KEY(id_pizza) REFERENCES Pizza(id_pizza),
    FOREIGN KEY(id_skladnik) REFERENCES Skladnik(id_skladnik)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem

INSERT INTO `Pizza_skladnik` (`id_pizza`, `id_skladnik`) VALUES 
('1', '4'), ('1', '5'), ('1', '6'), ('1', '17'), ('3', '5'), ('3', '12'), ('3', '13'), ('3', '10'), ('5', '5'), ('5', '4'), ('5', '18'), ('5', '11'), ('7', '5'), ('7', '14'), ('7', '19'), ('7', '8'), ('10', '3'), ('10', '2'), ('10', '4'), ('10', '1'), ('11', '4'), ('11', '15'), ('11', '16'), ('11', '19');




CREATE TABLE Zamowienie
(
    id_zamowienie INT NOT NULL AUTO_INCREMENT,
    id_klient INT NOT NULL,
    id_pizzeria INT NOT NULL,
    czas_zlozenia DATETIME NOT NULL,
    do_zaplaty INT NOT NULL,
    status_zam VARCHAR(40) NOT NULL,
    czas_dostarczenia DATETIME,
    PRIMARY KEY(id_zamowienie),
    FOREIGN KEY(id_klient) REFERENCES Klient(id_klient),
    FOREIGN KEY(id_pizzeria) REFERENCES Pizzeria(id_pizzeria)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#atrybut czas_dostarczenia jest przechowywany w typie DATETIME, ponieważ potrzebna jest nam zarówno data, jak i godzina

INSERT INTO `Zamowienie` (`id_zamowienie`, `id_klient`, `id_pizzeria`, `czas_zlozenia`, `do_zaplaty`, `status_zam`, `czas_dostarczenia`) VALUES 
(NULL, '6', '1', '2022-04-05 20:49:21', '30.00', 'dostarczone', '2022-04-05 21:20:25'), 
(NULL, '5', '2', '2022-05-28 22:40:25', '57.50', 'w drodze', NULL), 
(NULL, '4', '3', '2022-05-11 18:59:54', '9.00', 'dostarczone', '2022-05-11 19:15:04'), 
(NULL, '3', '4', '2022-04-21 18:32:29', '33.00', 'dostarczone', '2022-04-21 19:02:48'), 
(NULL, '2', '5', '2022-04-25 18:55:02', '105.50', 'dostarczone', '2022-04-25 19:43:12'), 
(NULL, '1', '6', '2022-05-10 21:07:33', '52', 'dostarczone', '2022-05-10 22:01:53');




CREATE TABLE Zamowienie_pizza
(
    id_zamowienie INT NOT NULL,
    id_pizza INT NOT NULL,
    ilosc INT NOT NULL,
    rozmiar VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_zamowienie, id_pizza),
    FOREIGN KEY(id_pizza) REFERENCES Pizza(id_pizza),
    FOREIGN KEY(id_zamowienie) REFERENCES Zamowienie(id_zamowienie)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#atrybuty związku “zawiera” trafiają do tej tabelki

INSERT INTO `Zamowienie_pizza` (`id_zamowienie`, `id_pizza`, `ilosc`, `rozmiar`) VALUES ('2', '7', '2', 'duża'), 
('4', '3', '1', 'mała'),
('5', '5', '3', 'średnia'), 
('5', '10', '1', 'mała'), 
('6', '1', '1', 'średnia'), 
('6', '11', '1', 'średnia');




CREATE TABLE Zamowienie_dodatek
(
    id_zamowienie INT NOT NULL,
    id_dodatek INT NOT NULL,
    ilosc INT NOT NULL,
    rozmiar VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_zamowienie, id_dodatek),
    FOREIGN KEY(id_dodatek) REFERENCES Dodatek(id_dodatek),
    FOREIGN KEY(id_zamowienie) REFERENCES Zamowienie(id_zamowienie)
);
#klucz nie może być pusty, ponieważ na podstawie niego identyfikujemy wiersz
#wartość klucza automatycznie wzrasta z każdym nowym rekordem
#atrybuty relacji zawiera trafiają do tej tabelki

INSERT INTO `Zamowienie_dodatek` (`id_zamowienie`, `id_dodatek`, `ilosc`, `rozmiar`) VALUES 
('1', '2', '3', 'duży'), 
('2', '12', '1', 'mały'), 
('3', '6', '1', 'duży'), 
('3', '9', '1', 'średni'), 
('4', '4', '2', 'duży');
