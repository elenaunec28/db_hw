-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника
DROP PROCEDURE get_department_id;

CREATE PROCEDURE get_department_id(IN emp_id INT, OUT dep_id INT)
SELECT department_id INTO dep_id FROM Employees1 WHERE EmployeeID = emp_id;

CALL get_department_id(3, @dep_id);
SELECT @dep_id;

-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.
CREATE PROCEDURE get_employee_age(IN emp_id INT, OUT emp_age INT)
SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) INTO emp_age FROM Employees1 WHERE EmployeeID = emp_id;

CALL get_employee_age(3, @age);
SELECT @age;

-- 3 Создайте хранимую процедуру decrease_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.
CREATE PROCEDURE decrease_salary(INOUT salary DECIMAL(10,2))
SET salary = salary * 0.9;

SET @sal = 50000;
CALL decrease_salary(@sal);
SELECT @sal;