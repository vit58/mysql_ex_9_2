/*
 * КУРСОВАЯ
 * Взял за основу GeekBrains. Не весь, конечно. Только, то что касается моего курса и его первой четверти.
 * Полагаю я и в этом небольшом кусочке накосячил. Разумеется это промежуточный вариант!
 * Предполагаю наличие ошибок. Но о одной знаю точно см. 124-ю строку скрипта (о Внешн. ключах). 
 * Буду признателен за указание на все ошибки на данном этапе.
 * Заранее благодарен!  
 */

use gb;
show TABLES;

-- Таблица Пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "Идентификатор строки",
first_name VARCHAR(100) NOT null COMMENT "Имя пользователя", 
last_name VARCHAR(100) NOT null COMMENT "Фамилия пользователя",
email VARCHAR(100) NOT null COMMENT "Почта",
phone VARCHAR(100) NOT null COMMENT "Телефон",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";
select  * from users where created_at > update_at;-- Используем фильтр для поиска дат update более ранних чем дата created
update users set update_at = NOW() where created_at > update_at; -- Запрос на ОБНОВЛЕНИЕ
desc users;
SELECT * from users;


-- Таблица Профилей
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
user_id INT UNSIGNED NOT NULL PRIMARY key COMMENT "Ссылка на пользователя",
gender CHAR(1) NOT null COMMENT "Пол",
birthday DATE COMMENT "Дата рождения",
city VARCHAR(130) NOT null COMMENT "Город проживания",
country VARCHAR(130) NOT null COMMENT "Страна проживания",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили";
select  * from profiles where created_at > update_at;-- Используем фильтр для поиска дат update более ранних чем дата created
update profiles set update_at = NOW() where created_at > update_at; -- Запрос на ОБНОВЛЕНИЕ
desc  profiles;
SELECT * from  profiles;
describe  profiles;

-- Создаем Внешний Ключ таблицы profiles
desc profiles;
select * from profiles limit 10;
alter TABLE profiles
ADD CONSTRAINT profiles_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;


-- Таблица Учебный год
DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT UNSIGNED,
  topic VARCHAR(100) NOT null COMMENT "Тема",
  number_quarter INT UNSIGNED COMMENT "Номер четверти",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Учебный год';
SELECT * from sessions;

desc sessions;
INSERT into sessions (user_id, number_quarter, topic)
VALUES
  (1, 1,'Введение в Backend-разработку'),
  (2, 2,'Frontend и Backend интернет-магазина'), 
  (3, 3,'Сетевой чат'),  
  (4, 4,'Командная разработка выпускного проекта');  
 SELECT * from sessions;

-- Создаем Внешний Ключ таблицы sessions
desc sessions;
select * from sessions limit 10;
alter TABLE sessions
ADD CONSTRAINT sessions_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;



-- Таблица 1-я Четверть, Тема 1 (Основы языка Python)
DROP TABLE IF EXISTS first_quarter_topic_one;
CREATE TABLE first_quarter_topic_one (
id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned not null COMMENT "Ссылка на пользователя",
  session_id INT unsigned not null COMMENT "Ссылка на учебный год",
  topic VARCHAR(100) NOT null COMMENT "Тема урока",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-я Четверть, Тема 1 Основы языка Python';
SELECT * from first_quarter_topic_one;

desc first_quarter_topic_one;
INSERT into first_quarter_topic_one (user_id, session_id, topic)
VALUES
 (1, 1, 'Урок 1. Знакомство с Python'),
 (2, 2, 'Урок 2. Встроенные типы и операции с ними'),
 (3, 3, 'Урок 3. Функции'),
 (4, 4, 'Урок 4. Полезные инструменты'),
 (5, 5, 'Урок 5. Работа с файлами'),
 (6, 6, 'Урок 6. Объектно-ориентированное программирование'),
 (7, 7, 'Урок 7. ООП. Продвинутый уровень'),
 (8, 8, 'Урок 8. ООП. Полезные дополнения');  
 SELECT * from first_quarter_topic_one;


-- Создаем Внешние Ключи
desc first_quarter_topic_one;
select * from first_quarter_topic_one limit 10;

alter TABLE first_quarter_topic_one
ADD CONSTRAINT first_quarter_topic_one_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;

-- Этот ключ установился!

/*
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Второй Внешн. ключ (см. ниже) связи четверти 
first_quarter_topic_one и года sessions и не устанавливается. Почему?????
-- И, конечно, он не встает и для остальных тем 1-ой четверти: 
first_quarter_topic_two, first_quarter_topic_three и first_quarter_four, следующие за первой темой
*/




alter TABLE first_quarter_topic_one
ADD CONSTRAINT first_quarter_topic_one_session_id_fk
foreign KEY (session_id) REFERENCES sessions(id)
on delete CASCADE;



/*
desc friendship;
select * from friendship limit 10;
alter TABLE friendship
ADD CONSTRAINT friendship_friend_status_id_fk
foreign KEY (friend_status_id) REFERENCES friendshep_statuses(id)
on delete CASCADE;

*/


-- Таблица 1-я Четверть, Тема 2 (Linux. Рабочая станция)
DROP TABLE IF EXISTS first_quarter_topic_two;
CREATE TABLE first_quarter_topic_two (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "Ссылка на пользователя",
  session_id INT UNSIGNED COMMENT "Ссылка на учебный год",
  topic VARCHAR(100) NOT null COMMENT "Тема урока",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-я Четверть, Тема 2 Linux. Рабочая станция';
SELECT * from first_quarter_topic_two;

desc first_quarter_topic_two;
INSERT into first_quarter_topic_two (user_id, session_id, topic)
VALUES
  (1, 1, 'Урок 1. Введение. Установка ОС'),
 (2, 2, 'Урок 2. Настройка и знакомство с интерфейсом командной строки'),
 (3, 3, 'Урок 3. Пользователи. Управление Пользователями и группами'),
 (4, 4, 'Урок 4. Загрузка ОС и процессы'),
 (5, 5, 'Урок 5. Устройство файловой системы Linux. Понятие Файла и каталога'),
 (6, 6, 'Урок 6. Введение в скрипты bash. Планировщики задач crontab и a'),
 (7, 7, 'Урок 7. Управление пакетами и репозиториями. Основы сетевой безопасности'),
 (8, 8, 'Урок 8. Введение в docker');
 SELECT * from first_quarter_topic_two;

-- Создаем Внешние Ключи
alter TABLE first_quarter_topic_two
ADD CONSTRAINT first_quarter_topic_two_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;


-- Таблица 1-я Четверть, Тема 3 (Основы реляционных баз данных. MySQL) 
DROP TABLE IF EXISTS first_quarter_topic_three;
CREATE TABLE first_quarter_topic_three (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "Ссылка на пользователя",
  session_id INT UNSIGNED COMMENT "Ссылка на учебный год",
  topic VARCHAR(150) NOT null COMMENT "Тема урока",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-я Четверть, Тема 3  Основы реляционных баз данных. MySQL';
SELECT * from first_quarter_topic_three;

desc first_quarter_topic_three;
INSERT into first_quarter_topic_three (user_id, session_id, topic)
VALUES
  (1, 1, 'Урок 1.Вебинар. Установка окружения. DDL - команды'),
 (2, 2, 'Урок 2. Видеоурок. Управление БД. Язык запросов SQL'),
 (3, 3, 'Урок 3. Вебинар. Введение в проектирование БД'),
 (4, 4, 'Урок 4. Вебинар. CRUD-операции'),
 (5, 5, 'Урок 5. Видеоурок. Операторы, фильтрация, сортировка и ограничение. Агрегация данных'),
 (6, 6, 'Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных'),
 (7, 7, 'УУрок 7. Видеоурок. Сложные запросы'),
 (8, 8, 'Урок 8. Вебинар. Сложные запросы'),
 (9, 9, 'Урок 9. Видеоурок. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггеры'),
 (10, 10, 'Урок 10. Вебинар. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггеры'),
 (11, 11, 'Урок 11. Видеоурок. Оптимизация запросов. NoSQL'),
 (12, 12, 'Урок 12. Вебинар. Оптимизация запросов');
 SELECT * from first_quarter_topic_three;

-- Создаем Внешние Ключи
alter TABLE first_quarter_topic_three
ADD CONSTRAINT first_quarter_topic_three_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;




-- Таблица 1-я Четверть, Тема 4 (Алгоритмы и структуры данных на Python. Базовый курс) 
DROP TABLE IF EXISTS first_quarter_topic_four;
CREATE TABLE first_quarter_topic_four (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "Ссылка на пользователя",
  session_id INT UNSIGNED COMMENT "Ссылка на учебный год",
  topic VARCHAR(150) NOT null COMMENT "Тема урока",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-я Четверть, Тема 4  Алгоритмы и структуры данных на Python. Базовый курс';
SELECT * from first_quarter_topic_four;

desc first_quarter_topic_four;
INSERT into first_quarter_topic_four (user_id, session_id, topic)
VALUES
  (1, 1, 'Урок 1. Введение в алгоритмизацию и реализация простых алгоритмов на Python'),
 (2, 2, 'Урок 2. Циклы. Рекурсия. Функции.'),
 (3, 3, 'Урок 3. Массивы. Кортежи. Множества. Списки.'),
 (4, 4, 'Урок 4. Эмпирическая оценка алгоритмов на Python'),
 (5, 5, 'Урок 5. Коллекции. Список. Очередь. Словарь.'),
 (6, 6, 'Урок 6. Работа с динамической памятью'),
 (7, 7, 'УУрок 7. Алгоритмы сортировки'),
 (8, 8, 'Урок 8. Деревья. Хэш-функция');
 SELECT * from first_quarter_topic_four;


-- Создаем Внешние Ключи
alter TABLE first_quarter_topic_four
ADD CONSTRAINT first_quarter_topic_four_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;


/* МОЖНО СДЕЛАТЬ ЕЩЕ ТРИ таблицы (три четверти) но БЕЗ данных - ПОЛНЫЕ КОПИИ ПРЕДЫДУЩЕЙ
 * 
second_quarter_id VARCHAR(100) NOT null COMMENT "Вторая четверть",
  third_quarter_id VARCHAR(100) NOT null COMMENT "Третья четверть",
  fourth_quarter_id
*/


show tables;
-- Таблица сообщений
create table messages (
id INT unsigned not null auto_increment primary key,
from_user_id INT unsigned not null COMMENT "Ссылка на отправителя сообщения",
to_user_id INT unsigned not null COMMENT "Ссылка на получателя сообщения",
body TEXT COMMENT "Текст сообщения",
is_important BOOLEAN COMMENT "Признак важности",
is_delivered BOOLEAN COMMENT "Признак доставки",
create_at DATETIME default CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Сообщения";
desc messages;
SELECT * FROM messages limit 15;

-- Таблица messages Создаем Внешние Ключи
desc messages;
select * from messages;
alter TABLE messages
add CONSTRAINT messages_from_user_id_fk
foreign KEY (from_user_id) REFERENCES users(id)
on delete cascade,
add CONSTRAINT messages_to_user_id_fk
foreign KEY (to_user_id) REFERENCES users(id)
on delete CASCADE;



-- Создаем таблицу "Группы" с РЕАЛЬНЫМИ Имя-Фамилия преподавателей и студентов
DROP TABLE IF EXISTS communities;
create table communities (
id INT unsigned auto_increment primary key COMMENT "Идентификатор строки",
name_teacher VARCHAR(50) COMMENT "Название группы преподавателей",
name_student VARCHAR(50) COMMENT "Название группы преподавателей",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "Время создания строки",
update_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Группы";

SELECT * FROM communities limit 15;
-- Внесем Имя-Фамилия преподавателей
INSERT into communities (name_teacher) 
values
  ('Виктор Щупоченко'),
 ('Александр Васильченко'),
 ('Владислав Колокольчиков'),
 ('Павел Тиняков'),
('Сергей Романов'),
('Альбина Гилязова');

-- Внесем Имя-Фамилия студентов
INSERT into communities (name_student) 
values
  ('Михаил Демин'),
 ('Алексей Ероховец'),
 ('Андрей Синицын'),
 ('Роман Аширов'),
('Владимир Черненко'),
('Владислав Семилетов'),
 ('Артем Оболенский'),
 ('Шахин Авад'),
 ('Александра Науменко'),
 ('Антон Дмитриев'),
('Андрей Мусатов'),
('Екатерина Лобанова'),
 ('Сергей Зонов');

ALTER TABLE communities add name_teacher_id INT unsigned after id;
update communities set name_teacher_id = floor(1 + rand() * 100);
-- select name_teacher_id from communities order by name_teacher_id;
ALTER TABLE communities add name_student_id INT unsigned after name_teacher;
update communities set name_student_id = floor(1 + rand() * 100);
select * from communities where name_teacher_id = name_student_id;
SHOW COLUMNS FROM communities;
desc communities;
SELECT * FROM communities limit 15;


-- Таблица связи пользотелей и групп 
create table communities_users (
communities_id INT unsigned not null COMMENT "Ссылка на группу",
users_id INT unsigned not null COMMENT "Ссылка на пользователя",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "Время создания строки",
primary key (communities_id, users_id) COMMENT "Составной первичный ключ"
) COMMENT "Участники групп, связь между пользователями и группами";
desc communities_users;
SELECT * FROM communities_users;

-- Создаем Внешние Ключи для communities_users
alter TABLE communities_users
ADD CONSTRAINT communities_users_users_id_fk
foreign KEY (users_id) REFERENCES users(id)
on delete CASCADE;

select * from communities_users limit 10;
alter TABLE communities_users
ADD CONSTRAINT communities_users_communities_id_fk
foreign KEY (communities_id) REFERENCES communities(id)
on delete CASCADE;
desc communities_users;

-- Таблица учебных материаллов
DROP TABLE IF EXISTS study_materials;
create table study_materials (
id INT unsigned not null auto_increment primary key COMMENT "Идентификатор строки",
user_id INT unsigned not null COMMENT "Ссылка на пользователя, который загрузил файл",
filename VARCHAR(250) not null COMMENT "Путь к файлу",
size INT not null COMMENT "Размер файла",
metadata JSON COMMENT "Метаданные файла",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "Ссылка на тип контента",
update_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "учебные материаллы";

SELECT * FROM study_materials;
DESC study_materials;

UPDATE study_materials SET user_id = FLOOR(1 + RAND() * 100);

-- СТОЛБЕЦ filename 
-- Где взять расширение? 
-- http://dropbox.com/vk/filename.ext Прописываем путь: имяфайлаИЗтаблицы.случайное расширение

 -- Создаем ВРЕМЕННУЮ таблицу
DROP TABLE IF EXISTS extensions;
CREATE temporary table extensions (name VARCHAR(10));
insert into extensions 
values ('jpeg'), ('png'), ('mp4'), ('mp3'), ('avi'), ('txt'), ('doc'), ('docx'), ('sql'), ('odp'), ('pptx');
select * from extensions;

-- Компануем основной запрос 
update study_materials set filename = concat(
-- Функция concat объеденяет все свои параметры, перечисленные через ЗАПЯТУЮ в ОДНУ строку. Т.е. объеденяет 4 строки (см. следующие ниже) в одну.
'http://dropbox.com/vk/',
filename,
'.',
(select name from extensions order BY RAND() limit 1))-- строка расширения. Сами расширения см. во временной (extensions) таблице
;
SELECT * FROM study_materials;

-- СТОЛБЕЦ metadata
-- Сюда помещае любой объект.
-- Должно получиться что-то вроде: '{"ouner": "Ferst Last"}', т.е. '{"КЛЮЧ": "ЗНАЧЕНИЕ - Имя Фамилия"}'
update study_materials set metadata = CONCAT(
-- update media - запрос на обновление и вставляем (set) для столбца metadata ключ-значение ОДНУ строку из нескольких.
'{"ouner": "',
(select CONCAT(first_name, ' ', last_name)-- Имя и фамилию берем из табл. users 
from users where users.id = study_materials.user_id),
'"}'
);
select * from study_materials limit 20;
desc study_materials; -- Просмотр структуры таблицы
-- Меняем в metadata Type (longtext) на Type (JSON). Т.е. возвращаем, подмененный, КОРРЕКТНЫЙ тип данных.
-- См. 8-ю стр вебинара 4 (1:11:35)
alter table study_materials modify COLUMN metadata JSON; 

-- Создаем Внешние Ключи для study_materials
alter TABLE study_materials
ADD CONSTRAINT study_materials_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;


-- Таблица типов учебных материаллов
show tables;
select * from study_materials_types;
drop table if exists study_materials_types;
CREATE TABLE study_materials_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  study_material_id INT unsigned not null COMMENT "Ссылка на таблицу учебных материаллов (study_materials)",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы учебных материаллов";
select  * from study_materials_types where created_at > updated_at; -- Используем фильтр для поиска дат update более ранних чем дата created
update study_materials_types set updated_at = NOW() where created_at > updated_at; 

UPDATE study_materials_types SET study_material_id = FLOOR(1 + RAND() * 100);

-- Вставляем названия типов study_materials_types
select * from study_materials_types;
desc study_materials_types;
insert into study_materials_types (name) values
('document'),
('presentation'),
('video');

-- Создаем Внешние Ключи для study_materials
alter TABLE study_materials_types
ADD CONSTRAINT study_materials_types_study_material_id_fk
foreign KEY (study_material_id) REFERENCES study_materials(id)
on delete CASCADE;

SELECT * FROM study_materials;
select * from study_materials_types;



