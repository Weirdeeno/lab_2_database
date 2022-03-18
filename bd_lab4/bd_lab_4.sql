/*1. Вивести статистику: загальна кількість всіх книг, їх вартість, їх середню вартість, мінімальну і максимальну ціну*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_, 
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_ FROM `books`;

/*2. Вивести загальну кількість всіх книг без урахування книг з непроставленою ціною*/
SELECT COUNT(*) FROM `books` WHERE price is not NULL;

/*3. Вивести статистику (див. 1) для книг новинка / не новинка*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_, 
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_,
    novelty AS isNovelty FROM `books` GROUP BY novelty;

/*4. Вивести статистику (див. 1) для книг за кожним роком видання*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_, 
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_, 
    YEAR(date) AS DATE_ FROM `books` GROUP BY YEAR(date);

/*5. Змінити п.4, виключивши з статистики книги з ціною від 10 до 20*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_,
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_, 
    YEAR(date) AS DATE_ FROM `books` WHERE (price>=10) and (price<=20) GROUP BY YEAR(date);

/*6. Змінити п.4. Відсортувати статистику по спадаючій кількості.*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_,
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_, 
    YEAR(date) AS DATE_ FROM `books` GROUP BY YEAR(date) ORDER BY COUNT_ DESC;

/*7. Вивести загальну кількість кодів книг і кодів книг що не повторюються*/
SELECT COUNT(*),
    COUNT(code),
    COUNT(DISTINCT code) FROM `books`;

/*8. Вивести статистику: загальна кількість і вартість книг по першій букві її назви*/
SELECT COUNT(*),
    COUNT(price),
    left(name,1) AS FIRSTLETTER FROM `books` 
    GROUP BY FIRSTLETTER;

/*9. Змінити п. 8, виключивши з статистики назви що починаються з англ. букви або з цифри.*/
SELECT COUNT(*),
    COUNT(price),
    left(name,1) AS FIRSTLETTER FROM `books` WHERE NOT name LIKE '[A-Z]' AND NOT name LIKE '[0-9]'
    GROUP BY FIRSTLETTER;

/*10. Змінити п. 9 так щоб до складу статистики потрапили дані з роками більшими за 2000.*/
SELECT COUNT(*),
	COUNT(price),
	left(name, 1) AS FIRSTLETTER FROM `books` WHERE YEAR(date) >=2000
    GROUP BY FIRSTLETTER;

/*11. Змінити п. 10. Відсортувати статистику по спадаючій перших букв назви.*/
SELECT COUNT(*),
	COUNT(price),
	left(name, 1) AS FIRSTLETTER FROM `books` WHERE YEAR(date) >=2000
    GROUP by FIRSTLETTER
	ORDER BY FIRSTLETTER DESC;

/*12. Вивести статистику (див. 1) по кожному місяцю кожного року*/
SELECT COUNT(*) AS COUNT_, 
	SUM(price) AS SUM_, 
	AVG(price) AS AVG_, 
	MIN(price) AS MIN_, 
	MAX(price) AS MAX_, 
	MONTH(date) AS MONTH_, 
	YEAR(date) AS YEAR_ FROM `books`
	GROUP BY MONTH_;

/*13. Змінити п. 12 так щоб до складу статистики не увійшли дані з незаповненими датами.*/
SELECT COUNT(*) AS COUNT_, 
	SUM(price) AS SUM_, 
	AVG(price) AS AVG_, 
	MIN(price) AS MIN_, 
	MAX(price) AS MAX_, 
	MONTH(date) AS MONTH_, 
	YEAR(date) AS YEAR_ FROM `books` WHERE date is NOT NULL
	GROUP BY MONTH_;

/*14. Змінити п. 12. Фільтр по спадаючій року і зростанню місяця.*/
SELECT COUNT(*) AS COUNT_, 
	SUM(price) AS SUM_, 
	AVG(price) AS AVG_, 
	MIN(price) AS MIN_, 
	MAX(price) AS MAX_, 
	MONTH(date) AS MONTH_, 
	YEAR(date) AS YEAR_ FROM `books`
	GROUP BY MONTH(date), YEAR(date)
	ORDER BY MONTH(date) DESC, YEAR(date) ASC;

/*15. Вивести статистику для книг новинка / не новинка: загальна ціна, загальна ціна в грн. / Євро / руб. Колонкам запиту дати назви за змістом.*/
SELECT COUNT(*),
    SUM(price) AS SUM_, 
    price*29.51 AS UAH,
    price*0.91 AS EUR, 
    price*105.10 as RUB,
    novelty AS NOVELTY FROM `books` GROUP BY NOVELTY

/*16. Змінити п. 15 так щоб виводилася округлена до цілого числа (дол. / Грн. / Євро / руб.) Ціна.*/
SELECT COUNT(*),
    SUM(price) AS SUM_, 
    ROUND (price*29.51, 0) AS UAH,
    ROUND (price*0.91, 0) AS EUR, 
    ROUND (price*105.10, 0) as RUB,
    novelty AS NOVELTY FROM `books` GROUP BY NOVELTY

/*17. Вивести статистику (див. 1) по видавництвах.*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_, 
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_,
    publisher AS PUBLISHER FROM `books` GROUP BY PUBLISHER;

/*18. Вивести статистику (див. 1) за темами і видавництвами. Фільтр по видавництвам.*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_,
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_, 
    topic, publisher FROM `books` GROUP BY topic, publisher 
    ORDER BY publisher;	

/*19. Вивести статистику (див. 1) за категоріями, темами і видавництвами. Фільтр по видавництвам, темах, категоріям.*/
SELECT COUNT(*) AS COUNT_, 
    SUM(price) AS SUM_, 
    AVG(price) AS AVG_,
    MIN(price) AS MIN_, 
    MAX(price) AS MAX_, 
    category, topic, publisher FROM `books` GROUP BY category, topic, publisher 
    ORDER BY publisher, topic, category;	

/*20. Вивести список видавництв, у яких округлена до цілого ціна однієї сторінки більше 10 копійок.*/
SELECT publisher FROM `books` WHERE ROUND(price/pages)>0.10	

