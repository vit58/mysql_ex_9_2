/*
 * ��������
 * ���� �� ������ GeekBrains. �� ����, �������. ������, �� ��� �������� ����� ����� � ��� ������ ��������.
 * ������� � � � ���� ��������� ������� ���������. ���������� ��� ������������� �������!
 * ����������� ������� ������. �� � ����� ���� ����� ��. 124-� ������ ������� (� �����. ������). 
 * ���� ����������� �� �������� �� ��� ������ �� ������ �����.
 * ������� ����������!  
 */

use gb;
show TABLES;

-- ������� �������������
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "������������� ������",
first_name VARCHAR(100) NOT null COMMENT "��� ������������", 
last_name VARCHAR(100) NOT null COMMENT "������� ������������",
email VARCHAR(100) NOT null COMMENT "�����",
phone VARCHAR(100) NOT null COMMENT "�������",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������������";
select  * from users where created_at > update_at;-- ���������� ������ ��� ������ ��� update ����� ������ ��� ���� created
update users set update_at = NOW() where created_at > update_at; -- ������ �� ����������
desc users;
SELECT * from users;


-- ������� ��������
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
user_id INT UNSIGNED NOT NULL PRIMARY key COMMENT "������ �� ������������",
gender CHAR(1) NOT null COMMENT "���",
birthday DATE COMMENT "���� ��������",
city VARCHAR(130) NOT null COMMENT "����� ����������",
country VARCHAR(130) NOT null COMMENT "������ ����������",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "�������";
select  * from profiles where created_at > update_at;-- ���������� ������ ��� ������ ��� update ����� ������ ��� ���� created
update profiles set update_at = NOW() where created_at > update_at; -- ������ �� ����������
desc  profiles;
SELECT * from  profiles;
describe  profiles;

-- ������� ������� ���� ������� profiles
desc profiles;
select * from profiles limit 10;
alter TABLE profiles
ADD CONSTRAINT profiles_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;


-- ������� ������� ���
DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT UNSIGNED,
  topic VARCHAR(100) NOT null COMMENT "����",
  number_quarter INT UNSIGNED COMMENT "����� ��������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '������� ���';
SELECT * from sessions;

desc sessions;
INSERT into sessions (user_id, number_quarter, topic)
VALUES
  (1, 1,'�������� � Backend-����������'),
  (2, 2,'Frontend � Backend ��������-��������'), 
  (3, 3,'������� ���'),  
  (4, 4,'��������� ���������� ���������� �������');  
 SELECT * from sessions;

-- ������� ������� ���� ������� sessions
desc sessions;
select * from sessions limit 10;
alter TABLE sessions
ADD CONSTRAINT sessions_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;



-- ������� 1-� ��������, ���� 1 (������ ����� Python)
DROP TABLE IF EXISTS first_quarter_topic_one;
CREATE TABLE first_quarter_topic_one (
id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned not null COMMENT "������ �� ������������",
  session_id INT unsigned not null COMMENT "������ �� ������� ���",
  topic VARCHAR(100) NOT null COMMENT "���� �����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-� ��������, ���� 1 ������ ����� Python';
SELECT * from first_quarter_topic_one;

desc first_quarter_topic_one;
INSERT into first_quarter_topic_one (user_id, session_id, topic)
VALUES
 (1, 1, '���� 1. ���������� � Python'),
 (2, 2, '���� 2. ���������� ���� � �������� � ����'),
 (3, 3, '���� 3. �������'),
 (4, 4, '���� 4. �������� �����������'),
 (5, 5, '���� 5. ������ � �������'),
 (6, 6, '���� 6. ��������-��������������� ����������������'),
 (7, 7, '���� 7. ���. ����������� �������'),
 (8, 8, '���� 8. ���. �������� ����������');  
 SELECT * from first_quarter_topic_one;


-- ������� ������� �����
desc first_quarter_topic_one;
select * from first_quarter_topic_one limit 10;

alter TABLE first_quarter_topic_one
ADD CONSTRAINT first_quarter_topic_one_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;

-- ���� ���� �����������!

/*
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ������ �����. ���� (��. ����) ����� �������� 
first_quarter_topic_one � ���� sessions � �� ���������������. ������?????
-- �, �������, �� �� ������ � ��� ��������� ��� 1-�� ��������: 
first_quarter_topic_two, first_quarter_topic_three � first_quarter_four, ��������� �� ������ �����
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


-- ������� 1-� ��������, ���� 2 (Linux. ������� �������)
DROP TABLE IF EXISTS first_quarter_topic_two;
CREATE TABLE first_quarter_topic_two (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "������ �� ������������",
  session_id INT UNSIGNED COMMENT "������ �� ������� ���",
  topic VARCHAR(100) NOT null COMMENT "���� �����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-� ��������, ���� 2 Linux. ������� �������';
SELECT * from first_quarter_topic_two;

desc first_quarter_topic_two;
INSERT into first_quarter_topic_two (user_id, session_id, topic)
VALUES
  (1, 1, '���� 1. ��������. ��������� ��'),
 (2, 2, '���� 2. ��������� � ���������� � ����������� ��������� ������'),
 (3, 3, '���� 3. ������������. ���������� �������������� � ��������'),
 (4, 4, '���� 4. �������� �� � ��������'),
 (5, 5, '���� 5. ���������� �������� ������� Linux. ������� ����� � ��������'),
 (6, 6, '���� 6. �������� � ������� bash. ������������ ����� crontab � a'),
 (7, 7, '���� 7. ���������� �������� � �������������. ������ ������� ������������'),
 (8, 8, '���� 8. �������� � docker');
 SELECT * from first_quarter_topic_two;

-- ������� ������� �����
alter TABLE first_quarter_topic_two
ADD CONSTRAINT first_quarter_topic_two_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;


-- ������� 1-� ��������, ���� 3 (������ ����������� ��� ������. MySQL) 
DROP TABLE IF EXISTS first_quarter_topic_three;
CREATE TABLE first_quarter_topic_three (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "������ �� ������������",
  session_id INT UNSIGNED COMMENT "������ �� ������� ���",
  topic VARCHAR(150) NOT null COMMENT "���� �����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-� ��������, ���� 3  ������ ����������� ��� ������. MySQL';
SELECT * from first_quarter_topic_three;

desc first_quarter_topic_three;
INSERT into first_quarter_topic_three (user_id, session_id, topic)
VALUES
  (1, 1, '���� 1.�������. ��������� ���������. DDL - �������'),
 (2, 2, '���� 2. ���������. ���������� ��. ���� �������� SQL'),
 (3, 3, '���� 3. �������. �������� � �������������� ��'),
 (4, 4, '���� 4. �������. CRUD-��������'),
 (5, 5, '���� 5. ���������. ���������, ����������, ���������� � �����������. ��������� ������'),
 (6, 6, '���� 6. �������. ���������, ����������, ���������� � �����������. ��������� ������'),
 (7, 7, '����� 7. ���������. ������� �������'),
 (8, 8, '���� 8. �������. ������� �������'),
 (9, 9, '���� 9. ���������. ����������, ����������, �������������. �����������������. �������� ��������� � �������, ��������'),
 (10, 10, '���� 10. �������. ����������, ����������, �������������. �����������������. �������� ��������� � �������, ��������'),
 (11, 11, '���� 11. ���������. ����������� ��������. NoSQL'),
 (12, 12, '���� 12. �������. ����������� ��������');
 SELECT * from first_quarter_topic_three;

-- ������� ������� �����
alter TABLE first_quarter_topic_three
ADD CONSTRAINT first_quarter_topic_three_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;




-- ������� 1-� ��������, ���� 4 (��������� � ��������� ������ �� Python. ������� ����) 
DROP TABLE IF EXISTS first_quarter_topic_four;
CREATE TABLE first_quarter_topic_four (
  id INT unsigned not null auto_increment PRIMARY KEY,
  user_id INT unsigned COMMENT "������ �� ������������",
  session_id INT UNSIGNED COMMENT "������ �� ������� ���",
  topic VARCHAR(150) NOT null COMMENT "���� �����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = '1-� ��������, ���� 4  ��������� � ��������� ������ �� Python. ������� ����';
SELECT * from first_quarter_topic_four;

desc first_quarter_topic_four;
INSERT into first_quarter_topic_four (user_id, session_id, topic)
VALUES
  (1, 1, '���� 1. �������� � �������������� � ���������� ������� ���������� �� Python'),
 (2, 2, '���� 2. �����. ��������. �������.'),
 (3, 3, '���� 3. �������. �������. ���������. ������.'),
 (4, 4, '���� 4. ������������ ������ ���������� �� Python'),
 (5, 5, '���� 5. ���������. ������. �������. �������.'),
 (6, 6, '���� 6. ������ � ������������ �������'),
 (7, 7, '����� 7. ��������� ����������'),
 (8, 8, '���� 8. �������. ���-�������');
 SELECT * from first_quarter_topic_four;


-- ������� ������� �����
alter TABLE first_quarter_topic_four
ADD CONSTRAINT first_quarter_topic_four_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete cascade;


/* ����� ������� ��� ��� ������� (��� ��������) �� ��� ������ - ������ ����� ����������
 * 
second_quarter_id VARCHAR(100) NOT null COMMENT "������ ��������",
  third_quarter_id VARCHAR(100) NOT null COMMENT "������ ��������",
  fourth_quarter_id
*/


show tables;
-- ������� ���������
create table messages (
id INT unsigned not null auto_increment primary key,
from_user_id INT unsigned not null COMMENT "������ �� ����������� ���������",
to_user_id INT unsigned not null COMMENT "������ �� ���������� ���������",
body TEXT COMMENT "����� ���������",
is_important BOOLEAN COMMENT "������� ��������",
is_delivered BOOLEAN COMMENT "������� ��������",
create_at DATETIME default CURRENT_TIMESTAMP COMMENT "����� �������� ������"
) COMMENT "���������";
desc messages;
SELECT * FROM messages limit 15;

-- ������� messages ������� ������� �����
desc messages;
select * from messages;
alter TABLE messages
add CONSTRAINT messages_from_user_id_fk
foreign KEY (from_user_id) REFERENCES users(id)
on delete cascade,
add CONSTRAINT messages_to_user_id_fk
foreign KEY (to_user_id) REFERENCES users(id)
on delete CASCADE;



-- ������� ������� "������" � ��������� ���-������� �������������� � ���������
DROP TABLE IF EXISTS communities;
create table communities (
id INT unsigned auto_increment primary key COMMENT "������������� ������",
name_teacher VARCHAR(50) COMMENT "�������� ������ ��������������",
name_student VARCHAR(50) COMMENT "�������� ������ ��������������",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "����� �������� ������",
update_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������";

SELECT * FROM communities limit 15;
-- ������ ���-������� ��������������
INSERT into communities (name_teacher) 
values
  ('������ ���������'),
 ('��������� �����������'),
 ('��������� �������������'),
 ('����� �������'),
('������ �������'),
('������� ��������');

-- ������ ���-������� ���������
INSERT into communities (name_student) 
values
  ('������ �����'),
 ('������� ��������'),
 ('������ �������'),
 ('����� ������'),
('�������� ��������'),
('��������� ���������'),
 ('����� ����������'),
 ('����� ����'),
 ('���������� ��������'),
 ('����� ��������'),
('������ �������'),
('��������� ��������'),
 ('������ �����');

ALTER TABLE communities add name_teacher_id INT unsigned after id;
update communities set name_teacher_id = floor(1 + rand() * 100);
-- select name_teacher_id from communities order by name_teacher_id;
ALTER TABLE communities add name_student_id INT unsigned after name_teacher;
update communities set name_student_id = floor(1 + rand() * 100);
select * from communities where name_teacher_id = name_student_id;
SHOW COLUMNS FROM communities;
desc communities;
SELECT * FROM communities limit 15;


-- ������� ����� ����������� � ����� 
create table communities_users (
communities_id INT unsigned not null COMMENT "������ �� ������",
users_id INT unsigned not null COMMENT "������ �� ������������",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "����� �������� ������",
primary key (communities_id, users_id) COMMENT "��������� ��������� ����"
) COMMENT "��������� �����, ����� ����� �������������� � ��������";
desc communities_users;
SELECT * FROM communities_users;

-- ������� ������� ����� ��� communities_users
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

-- ������� ������� �����������
DROP TABLE IF EXISTS study_materials;
create table study_materials (
id INT unsigned not null auto_increment primary key COMMENT "������������� ������",
user_id INT unsigned not null COMMENT "������ �� ������������, ������� �������� ����",
filename VARCHAR(250) not null COMMENT "���� � �����",
size INT not null COMMENT "������ �����",
metadata JSON COMMENT "���������� �����",
created_at DATETIME default CURRENT_TIMESTAMP COMMENT "������ �� ��� ��������",
update_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������� ����������";

SELECT * FROM study_materials;
DESC study_materials;

UPDATE study_materials SET user_id = FLOOR(1 + RAND() * 100);

-- ������� filename 
-- ��� ����� ����������? 
-- http://dropbox.com/vk/filename.ext ����������� ����: �����������������.��������� ����������

 -- ������� ��������� �������
DROP TABLE IF EXISTS extensions;
CREATE temporary table extensions (name VARCHAR(10));
insert into extensions 
values ('jpeg'), ('png'), ('mp4'), ('mp3'), ('avi'), ('txt'), ('doc'), ('docx'), ('sql'), ('odp'), ('pptx');
select * from extensions;

-- ��������� �������� ������ 
update study_materials set filename = concat(
-- ������� concat ���������� ��� ���� ���������, ������������� ����� ������� � ���� ������. �.�. ���������� 4 ������ (��. ��������� ����) � ����.
'http://dropbox.com/vk/',
filename,
'.',
(select name from extensions order BY RAND() limit 1))-- ������ ����������. ���� ���������� ��. �� ��������� (extensions) �������
;
SELECT * FROM study_materials;

-- ������� metadata
-- ���� ������� ����� ������.
-- ������ ���������� ���-�� �����: '{"ouner": "Ferst Last"}', �.�. '{"����": "�������� - ��� �������"}'
update study_materials set metadata = CONCAT(
-- update media - ������ �� ���������� � ��������� (set) ��� ������� metadata ����-�������� ���� ������ �� ����������.
'{"ouner": "',
(select CONCAT(first_name, ' ', last_name)-- ��� � ������� ����� �� ����. users 
from users where users.id = study_materials.user_id),
'"}'
);
select * from study_materials limit 20;
desc study_materials; -- �������� ��������� �������
-- ������ � metadata Type (longtext) �� Type (JSON). �.�. ����������, �����������, ���������� ��� ������.
-- ��. 8-� ��� �������� 4 (1:11:35)
alter table study_materials modify COLUMN metadata JSON; 

-- ������� ������� ����� ��� study_materials
alter TABLE study_materials
ADD CONSTRAINT study_materials_user_id_fk
foreign KEY (user_id) REFERENCES users(id)
on delete CASCADE;


-- ������� ����� ������� �����������
show tables;
select * from study_materials_types;
drop table if exists study_materials_types;
CREATE TABLE study_materials_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  study_material_id INT unsigned not null COMMENT "������ �� ������� ������� ����������� (study_materials)",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "�������� ����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "���� ������� �����������";
select  * from study_materials_types where created_at > updated_at; -- ���������� ������ ��� ������ ��� update ����� ������ ��� ���� created
update study_materials_types set updated_at = NOW() where created_at > updated_at; 

UPDATE study_materials_types SET study_material_id = FLOOR(1 + RAND() * 100);

-- ��������� �������� ����� study_materials_types
select * from study_materials_types;
desc study_materials_types;
insert into study_materials_types (name) values
('document'),
('presentation'),
('video');

-- ������� ������� ����� ��� study_materials
alter TABLE study_materials_types
ADD CONSTRAINT study_materials_types_study_material_id_fk
foreign KEY (study_material_id) REFERENCES study_materials(id)
on delete CASCADE;

SELECT * FROM study_materials;
select * from study_materials_types;



