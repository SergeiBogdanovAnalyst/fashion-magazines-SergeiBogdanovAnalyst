-- This part selects the customer name from the customers table and aliases it as Customer in the result set
SELECT customers.customer_name AS Customer, 

-- This part calculates the total amount due for each customer and formats it as a currency string
    PRINTF('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS 'Amount Due'

-- Specifies that the query starts from the orders table
FROM orders

-- This joins the orders table with the customers table based on the customer_id column, which is a foreign key in the orders table linking to the primary key in the customers table.
JOIN customers ON orders.customer_id = customers.customer_id

-- This joins the orders table with the subscriptions table based on the subscription_id column, which is a foreign key in the orders table linking to the primary key in the subscriptions table.
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id

-- Filters the results to include only the orders that have an order_status of 'unpaid' and that correspond to subscriptions described as 'Fashion Magazine'.
WHERE orders.order_status = 'unpaid' AND subscriptions.description = 'Fashion Magazine'

-- This means that the SUM function will aggregate the total amount due for each customer, allowing the query to return one row per customer.
GROUP BY customers.customer_name;