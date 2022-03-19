/*Створення таблиць бази даних. Команди для створення таблиці повинні містити головний ключ, обмеження типу null / not null, default, check,
створення зв'язків з умовами посилальної цілісності*/

/*Створення основної таблиці*/
CREATE TABLE books(
   N INT NOT NULL AUTO_INCREMENT,
   code INT NOT NULL,
   new boolean,
   name VARCHAR(255) NOT NULL,
   price FLOAT NOT NULL,
   id_publishing INT NOT NULL,
   pages INT NOT NULL,
   format VARCHAR(30) NOT NULL,
   datee DATE NOT NULL,
   circulation INT,
   id_topic INT NOT NULL,
   id_category INT NOT NULL,
   PRIMARY KEY(N)
);

/*Створення допоміжних таблиць*/
CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL
);

CREATE TABLE publishing(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL
);

CREATE TABLE topic(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL
);


/*Завантаження даних в таблиці*/
INSERT INTO books(code, new, name, price, id_publishing, pages, format, datee, circulation, id_topic, id_category) VALUES
(5110, 0, 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 1, 400, '70х100/16', '2000-07-24', 5000, 1, 6),
(5141, 0, 'Структури даних та алгоритми', 37.80, 4, 384, '70х100/16', '2000-09-29', 5000, 1, 1),
(5127, 0, 'Автоматизація інженерно-графічних робіт', 11.58, 1, 256, '70х100/16', '2000-06-15', 5000, 1, 1),
(5199,0, 'Залізо IMB 2001', 30.07, 2, 368, '70х100/16', '2000-12-02', 5000, 1, 6),
(3851, 0, 'Захист інформації, та безбека комп\'ютених систем', 26.00, 3, 480, '84х108/16', '1999-02-04', 5000, 1, 6),
(3932, 0, 'Як перетворити персональний комп\'ютер на вимірювальний комплекс', 7.65, 5, 144, '60х88/16', '1999-06-09', 5000, 1, 2),
(4713, 0, 'Plug-ins. Додаткові програми для музичних програм', 11.41, 5, 144, '70х100/16', '2000-02-22', 5000, 1, 2),
(5217, 0, 'Windows ME. Найновіші версії програм', 16.57, 6, 320, '70х100/16', '2000-08-25', 5000, 2, 3),
(4829, 0, 'Windows 2000 Proffesional крок за кроком з CD', 27.25, 7, 320, '70х100/16', '2000-04-28', 5000, 2, 3),
(5170, 0, 'Linux версії', 24.43, 5, 346, '70х100/16', '2000-09-29', 5000, 2, 4),
(860, 0, 'Операційна система UNIX', 3.50, 1, 395, '84х100\16', '1997-05-05' , 5000, 2, 5),
(44, 0, 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 3, 352, '60х84/16', '1996-03-20', 5000, 2, 6),
(5176, 0, 'Windows ME. Супутник користувача', 12.79, 1, 306, '-', '2000-10-10', 5000, 2, 6),
(5462, 0, 'Мова програмування С++. Лекції та вправи', 29.00, 3, 656, '84х108/16', '2000-12-12', 5000, 3, 7),
(4982, 0, 'Мова програмування С. Лекції та вправи', 29.00, 3, 432, '84х108/16', '2000-07-12', 5000, 3, 7),
(4687, 0, 'Ефективне використання C++ .50 рекомендацій щодо покращення ваших програм та проектів', 17.60, 5, 240, '70х100/16', '2000-02-03', 5000, 3, 7);

INSERT INTO category (name) 
VALUES ('Підручники'), 
        ('Інші книги'), 
        ('Windows 2000'), 
        ('Linux'), 
        ('Unix'), 
        ('Інші операційні системи'), 
        ('C&C++');


INSERT INTO publishing (name) 
VALUES ('Видавнича група BHV'), 
        ('МикроАрт'),  
        ('DiaSoft'), 
        ('Вільямс'), 
        ('ДМК'), 
        ('Триумф'),
        ('Эком');

INSERT INTO topic (name)
        VALUES ('Використання ПК в цілому'), 
        ('Операційні системи'), 
        ('Програмування');

/*Створення зовнішніх ключів для полів id_publishing, id_topic, id_category*/
ALTER TABLE books ADD FOREIGN KEY(id_publishing) REFERENCES publishing(id) ON DELETE CASCADE;
ALTER TABLE books ADD FOREIGN KEY(id_topic) REFERENCES topic(id) ON DELETE CASCADE;
ALTER TABLE books ADD FOREIGN KEY(id_category) REFERENCES category(id) ON DELETE CASCADE;

