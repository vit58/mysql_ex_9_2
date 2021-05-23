-- ДЗ к уроку 9 (Вебинар (первый из 2-х) Урока 10 с 17 мин)

-- 1.В базе данных shop и sample присутствуют одни и те же таблицы users, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

SELECT * FROM sample.users;-- В табл. два не заполненных столбца (id, name)
SELECT * FROM shop.users;
desc shop.users;-- В табл. пять заполненных столбцов (id, name) и (birthday_at, created_at, updated_at)

/* ТРАНЗАКЦИЯ — группа логически объединённых последовательных операций по работе с данными, 
обрабатываемая или отменяемая ЦЕЛИКОМ.
 */
SELECT name FROM shop.users WHERE id = 1;
SELECT name FROM sample.users WHERE id = 1;
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
  /*
   *Переместить запись id = 1 в таблицу sample.users из таблицы shop.users.
   */
DELETE FROM shop.users WHERE id = 1;
select * from sample.users;-- исходное состояние таблицы сохраняется. 
-- Чтобы изменения вступили в силу, мы должны выполнить команду COMMIT:
COMMIT;

SELECT * FROM sample.users;
SELECT * FROM shop.users;



-- 2.Создайте представление, которое выводит название name товарной
-- позиции из таблицы products и соответствующее название каталога name
-- из таблицы catalogs.

/*
Представления - еще один способ организации данных в языке запросов SQL.
Представление — это запрос на выборку (SELECT), которому присваивается 
уникальное имя и который можно сохранять или удалять из базы данных как обычную хранимую процедуру.
*/

CREATE OR REPLACE VIEW products_catalogs as
/*
 * Для создания представления используется команда CREATE VIEW, после которой мы указываем имя представления products_catalogs. 
 * Затем после ключевого слова AS пишем запрос представления.
 */
SELECT
  p.name AS product,-- вывод названия name товарной позиции из таблицы products
  c.name AS catalogs-- вывод соответствующего названия каталога (name) из таблицы catalogs.
FROM
  products AS p
join-- Объединяем их
  catalogs AS c
ON
  p.catalog_id = c.id;

SELECT * FROM products_catalogs;-- К представлению можем обращаться как к обычной таблице


 
