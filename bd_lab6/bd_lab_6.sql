/*1. Вивести значення наступних колонок: назва книги, ціна, назва видавництва. Використовувати внутрішнє з'єднання, застосовуючи where.*/
SELECT
    books.name,
    books.price,
    publishing.name AS publisher_name
FROM
    books,
    publishing
WHERE
    books.id_publishing = publishing.id;


/*2. Вивести значення наступних колонок: назва книги, назва категорії. Використовувати внутрішнє з'єднання, застосовуючи inner join.*/
SELECT
    books.name,
    publishing.name AS publisher_name
FROM books
INNER JOIN publishing ON books.id_publishing = publishing.id;


/*3. Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат*/
SELECT
    books.name,
    books.price,
    publishing.name AS publisher_name,
    books.format AS FORMAT
FROM
    books
JOIN publishing ON books.id_publishing = publishing.id;


/*4. Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.*/
SELECT
    books.name,
    publishing.name AS publisher_name,
    topic.name AS theme,
    category.name AS category
FROM
    books
JOIN publishing ON books.id_publishing = publishing.id
JOIN topic ON books.id_topic = topic.id
JOIN category ON books.id_category = category.id
ORDER BY
    books.id_topic ASC,
    category.name ASC;


/*5. Вивести книги видавництва 'BHV', видані після 2000 р*/
SELECT * FROM books
WHERE id_publishing = 1 AND YEAR(datee) > 2000;


/*6. Вивести загальну кількість сторінок по кожній назві категорії. Фільтр по спадаючій кількості сторінок.*/
SELECT
    category.name AS category,
    SUM(pages) AS pages_count
FROM books
JOIN category ON books.id_category = category.id
GROUP BY category
ORDER BY pages_count DESC;


/*7. Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.*/
SELECT AVG(price)
FROM books
WHERE books.id_topic = 1 AND books.id_category = 4;


/*8. Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи where.*/
SELECT
    books.*,
    publishing.name AS publisher_name,
    category.name AS book_category,
    topic.name AS book_topic
FROM
    books,
    publishing,
    category,
    topic
WHERE
    books.id_publishing = publishing.id AND books.id_category = category.id AND books.id_topic = topic.id;


/*9. Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи inner join.*/
SELECT
    books.*,
    publishing.name AS publisher_name,
    category.name AS book_category,
    topic.name AS book_topic
FROM books
INNER JOIN publishing ON books.id_publishing = publishing.id
INNER JOIN category ON books.id_category = category.id
INNER JOIN topic ON books.id_topic = category.id;


/*10. Вивести всі дані універсального відношення. Використовувати зовнішнє з'єднання, застосовуючи left join / rigth join.*/
SELECT
    books.*,
    publishing.name AS publisher_name,
    category.name AS book_category,
    topic.name AS book_topic
FROM books
LEFT JOIN publishing ON books.id_publishing = publishing.id
LEFT JOIN category ON books.id_category = category.id
LEFT JOIN topic ON books.id_topic = category.id;
SELECT
    books.*,
    publishing.name AS publisher_name,
    category.name AS book_category,
    topic.name AS book_topic
FROM books
RIGHT JOIN publishing ON books.id_publishing = publishing.id
RIGHT JOIN category ON books.id_category = category.id
RIGHT JOIN topic ON books.id_topic = category.id;


/*11. Вивести пари книг, що мають однакову кількість сторінок. Використовувати само об’єднання і аліаси (self join).*/
SELECT A.name AS name1, B.name AS name2, A.pages
FROM books A, books B
WHERE A.N <> B.N
AND A.pages = B.pages
ORDER BY A.pages;


/*12. Вивести тріади книг, що мають однакову ціну. Використовувати самооб'єднання і аліаси (self join).*/
SELECT A.name AS name1, B.name AS name2, C.name AS name3, A.price
FROM books A, books B, books C
WHERE A.N <> B.N <> C.N
AND A.price = B.price = C.price
ORDER BY A.price;


/*13. Вивести всі книги категорії 'C ++'. Використовувати підзапити (subquery).*/
SELECT *
FROM books
WHERE id_category =(SELECT id FROM category WHERE category.name = 'C&C++');


/*14. Вивести книги видавництва 'BHV', видані після 2000 р Використовувати підзапити (subquery).*/
SELECT *
FROM books
WHERE id_category =(SELECT id FROM category WHERE category.name = 'BHV') AND YEAR(datee) > 2000;


/*15. Вивести список видавництв, у яких розмір книг перевищує 400 сторінок. Використовувати пов'язані підзапити (correlated subquery).*/
SELECT *
FROM publishing
WHERE (SELECT MIN(pages) FROM books WHERE books.id_publishing = publishing.id) >= 400;


/*16. Вивести список категорій в яких більше 3-х книг. Використовувати пов'язані підзапити (correlated subquery).*/
SELECT *
FROM category
WHERE(SELECT COUNT(*) FROM books WHERE books.id_category = category.id) > 3


/*17. Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва. Використовувати exists*/
SELECT *
FROM books
WHERE EXISTS(SELECT * FROM publishing WHERE publishing.name = 'BHV' AND books.id_publishing = publishing.id);


/*18. Вивести список книг видавництва 'BHV', якщо в списку немає жодної книги цього видавництва. Використовувати not exists.*/
SELECT *
FROM books
WHERE NOT EXISTS
    (SELECT * FROM publishing WHERE publishing.name = 'BHVг' AND books.id_publishing = publishing.id) 
    AND id_publishing =(SELECT publishing.id FROM publishing WHERE publishing.name = 'BHV');


/*19. Вивести відсортований загальний список назв тем і категорій. Використовувати union.*/
SELECT * FROM topic 
UNION SELECT *
FROM category ORDER BY NAME;


/*20. Вивести відсортований в зворотному порядку загальний список перших слів, назв книг і категорій що не повторюються. Використовувати union.*/
SELECT DISTINCT name FROM (
  (
    SELECT REGEXP_SUBSTR(TRIM(name), '^[^\\s]+') AS name
    FROM books
  )
  UNION ALL
  (
    SELECT REGEXP_SUBSTR(TRIM(name), '^[^\\s]+') AS name
    FROM category
  )
) ORDER BY name DESC