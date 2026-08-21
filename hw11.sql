/* Создать кастомные функции

Расчет площади круга
Создайте функцию для расчета площади круга, если известен его радиус.
Используйте формулу
Где:

S — площадь круга,
r — радиус круга,
​π≈3.14159, используйте функцию PI(), которая возвращает это число */

DELIMITER $$

CREATE FUNCTION circle_area(r DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE area DECIMAL(10,2);
    SET area = PI() * r * r;
    RETURN area;
END$$

DELIMITER ;

SELECT circle_area(5);



/* 2. Функция для расчета гипотенузы треугольника
Создайте функцию для расчета гипотенузы прямоугольного треугольника, если известны длины его катетов.
Используйте формулу
Где:
c — длина гипотенузы прямоугольного треугольника,
a, b — длины его катетов */

DELIMITER $$

CREATE FUNCTION hypotenuse(a DECIMAL(10,2), b DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE c DECIMAL(10,2);
    SET c = SQRT(a*a + b*b);
    RETURN c;
END$$

DELIMITER ;

SELECT hypotenuse(3, 4);
