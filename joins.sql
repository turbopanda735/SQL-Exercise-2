/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name 
FROM products JOIN categories 
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating 
FROM products JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(sales.quantity), employees.EmployeeID, employees.FirstName, employees.LastName
FROM employees JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, SUM(sales.quantity), SUM(products.price)
 FROM products JOIN sales
 ON products.productID = sales.productID
 WHERE products.Name LIKE "%Eagles%"
 ORDER BY products.ProductID;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.reviewer, reviews.rating, reviews.Comment, MIN(reviews.rating)
FROM products JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio%";

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
FROM employees JOIN sales
ON employees.EmployeeID = sales.EmployeeID
JOIN products
ON products.productID = sales.productID;
