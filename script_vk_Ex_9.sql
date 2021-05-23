-- �� � ����� 9 (������� (������ �� 2-�) ����� 10 � 17 ���)

-- 1.� ���� ������ shop � sample ������������ ���� � �� �� ������� users, ������� ���� ������.
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users.
-- ����������� ����������.

SELECT * FROM sample.users;-- � ����. ��� �� ����������� ������� (id, name)
SELECT * FROM shop.users;
desc shop.users;-- � ����. ���� ����������� �������� (id, name) � (birthday_at, created_at, updated_at)

/* ���������� � ������ ��������� ����������� ���������������� �������� �� ������ � �������, 
�������������� ��� ���������� �������.
 */
SELECT name FROM shop.users WHERE id = 1;
SELECT name FROM sample.users WHERE id = 1;
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
  /*
   *����������� ������ id = 1 � ������� sample.users �� ������� shop.users.
   */
DELETE FROM shop.users WHERE id = 1;
select * from sample.users;-- �������� ��������� ������� �����������. 
-- ����� ��������� �������� � ����, �� ������ ��������� ������� COMMIT:
COMMIT;

SELECT * FROM sample.users;
SELECT * FROM shop.users;



-- 2.�������� �������������, ������� ������� �������� name ��������
-- ������� �� ������� products � ��������������� �������� �������� name
-- �� ������� catalogs.

/*
������������� - ��� ���� ������ ����������� ������ � ����� �������� SQL.
������������� � ��� ������ �� ������� (SELECT), �������� ������������� 
���������� ��� � ������� ����� ��������� ��� ������� �� ���� ������ ��� ������� �������� ���������.
*/

CREATE OR REPLACE VIEW products_catalogs as
/*
 * ��� �������� ������������� ������������ ������� CREATE VIEW, ����� ������� �� ��������� ��� ������������� products_catalogs. 
 * ����� ����� ��������� ����� AS ����� ������ �������������.
 */
SELECT
  p.name AS product,-- ����� �������� name �������� ������� �� ������� products
  c.name AS catalogs-- ����� ���������������� �������� �������� (name) �� ������� catalogs.
FROM
  products AS p
join-- ���������� ��
  catalogs AS c
ON
  p.catalog_id = c.id;

SELECT * FROM products_catalogs;-- � ������������� ����� ���������� ��� � ������� �������


 
