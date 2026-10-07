-- Updating the tables
USE laboratory;
UPDATE employees
SET Salary = 3250
WHERE ID = 5;
SELECT * FROM employees;

UPDATE tools
SET Manufacturer = 'HelloResearch', price = 0.90
WHERE ID = 3;
SELECT * FROM tools;

UPDATE experiments
SET Duration = 210
WHERE ID = 1;
SELECT * FROM experiments;

UPDATE experiment_employee
SET Repeats = 12, Duration = 180
WHERE Experiment_ID = 4 AND Employee_ID = 5;
SELECT * FROM experiment_employee;

USE greenhouse;
UPDATE gardeners
SET Salary = 4800
WHERE ID = 4;
SELECT * FROM gardeners;

UPDATE greenhouses
SET Size = 450, Number_Patches = 180, Humidity = 72.5, Temp = 33
WHERE ID = 4;
SELECT * FROM greenhouses;

UPDATE Plants
SET Mutation = 'C500G'
WHERE ID = 2;
SELECT * FROM Plants;