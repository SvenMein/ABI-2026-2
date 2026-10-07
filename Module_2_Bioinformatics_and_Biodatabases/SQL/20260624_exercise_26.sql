-- Rmoving Entries
USE laboratory;
DELETE FROM experiment_employee
WHERE Employee_ID = 5;

DELETE FROM employees
WHERE ID = 5;

DELETE FROM Experiment_Tool
WHERE Tool_ID = 6;

DELETE FROM Tools
WHERE ID = 6;

USE greenhouse;
DELETE FROM gardener_greenhouse
WHERE Greenhouse_ID = 3;

DELETE FROM plant_greenhouse
WHERE Greenhouse_ID = 3;

DELETE FROM greenhouses
WHERE ID = 3;