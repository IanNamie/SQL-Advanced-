/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT Products.Name, Categories.Name
 FROM products
 INNER JOIN categories on categories.CategoryID  = products.CategoryID
 WHERE categories.Name = "Computers";
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 from products 
 INNER JOIN reviews on reviews.ProductID = products.CategoryID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, sum(s.quantity) as Total
FROM sales AS s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name AS 'department names', c.name AS 'category name' FROM departments as d
inner JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'Appliances' or c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, sum(s.quantity) as 'total sold', sum(s.quantity * s.priceperunit) as 'total price'
from products as p
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID =  97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.name, r.reviewer, r.rating, r.comment from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

/*Extra - May be difficult*/
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeID, e.firstname, e.lastname, p.name, sum(s.quantity) as totalsold
from sales as s
inner join employees as e on e.employeeID = s.employeeID
inner join products as p on p.productID = s.productID
group by e.employeeID, p.productID
order by e.firstname;
