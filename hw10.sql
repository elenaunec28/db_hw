-- 1 Для каждого product_id выведите inventory_id, а также предыдущий и последующей inventory_id по убыванию quantity
SELECT
    product_id,
    inventory_id,
    quantity,
    LAG(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS prev_inv_id,
    LEAD(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity DESC) AS next_inv_id
FROM order_details;

-- 2 Выведите максимальный и минимальный unit_price для каждого order_id с помощью функции FIRST VALUE.  Вывести order_id и полученные значения
SELECT DISTINCT
    order_id,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price DESC) AS max_price,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS min_price
FROM order_details;

-- 3 Выведите order_id и столбец с разницей между  unit_price для каждого заказа и минимальным unit_price в рамках одного заказа. Задачу решить двумя способами - с помощью First VAlue и MIN
-- FIRST_VALUE
SELECT
    order_id,
    unit_price,
    unit_price - FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) AS price_diff
FROM order_details;

-- MIN
SELECT
    order_id,
    unit_price,
    unit_price - MIN(unit_price) OVER (PARTITION BY order_id) AS price_diff
FROM order_details;

-- 4 Присвойте ранг каждой строке используя RANK по убыванию quantity
SELECT 
    order_id,
    unit_price - min(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) up_diff_min_cur,
    quantity,
    dense_rank() over(ORDER BY quantity desc) rnk
FROM order_details; 

-- 5  Из предыдущего запроса выберите только строки с рангом до 10 включительно
WITH t AS(
SELECT 
    order_id,
    unit_price - min(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price ASC) up_diff_min_cur,
    quantity,
    dense_rank() over(ORDER BY quantity desc) rnk
FROM order_details) 
SELECT * FROM t 
WHERE rnk <= 10;