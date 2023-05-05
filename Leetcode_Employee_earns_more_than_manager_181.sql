# In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Employee_2
(
id int, 
name varchar(255), 
salary int, 
managerId int
);

Truncate table Employee_2;

insert into Employee_2 (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee_2 (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee_2 (id, name, salary, managerId) values ('3', 'Sam', '60000', null);
insert into Employee_2 (id, name, salary, managerId) values ('4', 'Max', '90000', null);

select * from employee_2;
/** 
Q. Write an SQL query to find the employees who earn more than their managers.

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
**/
# TYPE 1 :- SOLVED BY JOIN CONDITION :- 
# NOTE :- SEQUENCE QUERY RUNS(BEHIND THE SCENES) :- FROM => JOIN => WHERE => SELECT

SELECT e2.name AS Employee
FROM Employee_2 AS e2
JOIN Employee_2 AS m2
ON e2.managerId = m2.id
WHERE e2.salary > m2.salary;

# TYPE 2:- SOLVED BY LEFT JOIN CONDITION :- 
# NOTE :- SEQUENCE QUERY RUNS(BEHIND THE SCENES) :- FROM => LEFT JOIN => WHERE => SELECT
SELECT e2.name AS Employee
FROM Employee_2 AS e2
LEFT JOIN Employee_2 AS m2
ON e2.managerId = m2.id
WHERE e2.salary > m2.salary;

 