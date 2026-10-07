-- Filling the tables
USE laboratory;
INSERT INTO Employees VALUES
(0, 'Christoph', 'Knorr', 'c.knorr@research.de', 100, 'Docent', 3600),
(0, 'Nassim', 'El-Masri', 'n.masri@research.de', 205, 'Researcher', 4000),
(0, 'Claudia', 'Malariia', 'c.malaria@research.de', 205, 'Researcher', 4000),
(0, 'Anna', 'Dienstag', 'a.diesntag@researcher.de', 210, 'Group Leader', 5000),
(0, 'Gundolf', 'Stoll', 'g.stoll@research.de', 105, 'CTA', 3000);
SELECT * FROM Employees;

INSERT INTO Tools VALUES
(0, 'Eppendorf Tube', 'Eppendorf', 0.20),
(0, 'Pipette', 'Eppendorf', 25.00),
(0, 'Big Tube', 'Bayer', 1.00),
(0, '20 Well Plate', 'Quary', 1.50),
(0, '60 Well Plate', 'Quary', 4.50),
(0, 'Lab on a Chip', 'Kleo', 50.00);
SELECT * FROM Tools;

INSERT INTO Experiments VALUES
(0, 'DNA-Seq', 240, 'Sequencing'),
(0, 'RNA-Seq', 240, 'Seqeuncing'),
(0, 'Protein-Seq', 300, 'Sequencing'),
(0, 'Protein-Con', 15, 'Concentration Measurement'),
(0, 'DNA-Con', 30, 'Concentration Measurement'),
(0, 'RNA-Con', 30, 'Concentration Measurement'),
SELECT * FROM Experiments;

INSERT INTO Results VALUES
(0, 'Con_UP', 'Concentration increased'),
(0, 'Con_Down', 'Concentration decreased'),
(0, 'No_change', 'Concentration stayed constant'),
(0, 'Full', 'Full sequence could be sequenced'),
(0, 'Partly', 'Only a partial sequence was detected'),
SELECT * FROM Results;

INSERT INTO Experiment_Result VALUES
(4, 3, 'Mutation didn`t change anything');
INSERT INTO Experiment_Result VALUES
(2, 5, 'Muation lead to loss of RNA');
INSERT INTO Experiment_Result VALUES
(1, 4, 'No influence of mutation');
SELECT * FROM Experiment_Result;

INSERT INTO Experiment_Employee VALUES
(4, 5, 'Monday', 6, 90);
INSERT INTO Experiment_Employee VALUES
(1, 2, 'Tuesday', 1, 270);
INSERT INTO Experiment_Employee VALUES
(2, 3, 'Wednesday', 1, 220);
SELECT * FROM Experiment_Employee;

INSERT INTO Experiment_Tool VALUES
(1, 3, 1);
INSERT INTO Experiment_Tool VALUES
(1, 1, 10);
INSERT INTO Experiment_Tool VALUES
(1, 2, 3);
INSERT INTO Experiment_Tool VALUES
(2, 3, 1);
INSERT INTO Experiment_Tool VALUES
(2, 1, 15);
INSERT INTO Experiment_Tool VALUES
(2, 2, 4);
INSERT INTO Experiment_Tool VALUES
(3, 1, 20);
INSERT INTO Experiment_Tool VALUES
(3, 2, 2);
INSERT INTO Experiment_Tool VALUES
(4, 5, 1);
INSERT INTO Experiment_Tool VALUES
(5, 4, 1);
INSERT INTO Experiment_Tool VALUES
(6, 6, 1);
SELECT * FROM Experiment_Tool;

USE greenhouse;
INSERT INTO Greenhouses VALUES
(0, 60, 'Plant Way 1, 10000 Treevile', 12, 25, 45.00);
INSERT INTO Greenhouses VALUES
(0, 120, 'Plant Way 2, 10000 Trevile', 24, 35, 80.00);
INSERT INTO Greenhouses VALUES
(0, 40, 'Flower Lane 123, 10020 Bushwack', 6, 30, 60.00);
INSERT INTO Greenhouses VALUES
(0, 500, 'Bush Road 5, 10010 Flower Village', 200, 32.5, 75.00);
SELECT * FROM Greenhouses;

INSERT INTO Gardeners VALUES
(0, 'Christoph', 'Knorr', 'Plant Way 101, 10000 Treevile', '0539112233', 3600);
INSERT INTO Gardeners VALUES
(0, 'Nassim', 'El-Masri', 'Plant Way 25, 10000 Treeville', '0547987321', 4000);
INSERT INTO Gardeners VALUES
(0, 'Claudia', 'Malaria', 'Flower Lane 13, 10020 Bushwack', '0873648258', 4000);
INSERT INTO Gardeners VALUES
(0, 'Anna', 'Dienstag', 'Bush Road 785, 10010 Flower Village', '0493753159', 5000);
SELECT * FROM Gardeners;

INSERT INTO Plants VALUES
(0, 'PotatoAC', 'Solanum tuberosum', 'mutated', 'A105C');
INSERT INTO Plants VALUES
(0, 'TomatoCG', 'Solanum lycopersicum', 'mutated', 'C325G');
INSERT INTO Plants VALUES
(0, 'PotatoControl', 'Solanum tuberosum', 'wildtype', NULL);
INSERT INTO Plants VALUES
(0, 'TomatoControl', 'Solanum lycopersicum', 'wildtype', NULL);
INSERT INTO Plants VALUES
(0, 'CabbageTY', 'Brassica oleracea', 'mutated', 'T20Y');
INSERT INTO Plants VALUES
(0, 'CabbageControl', 'Brassica oleracea', 'wildtype', NULL);
SELECT * FROM Plants;

INSERT INTO Gardener_Greenhouse VALUES
(1, 3, 2.5);
INSERT INTO Gardener_Greenhouse VALUES
(1, 2, 5.5);
INSERT INTO Gardener_Greenhouse VALUES
(2, 4, 8);
INSERT INTO Gardener_Greenhouse VALUES
(3, 4, 8);
INSERT INTO Gardener_Greenhouse VALUES
(4, 4, 4);
INSERT INTO Gardener_Greenhouse VALUES
(2, 4, 5);
SELECT * FROM Gardener_Greenhouse;

INSERT INTO Plant_Greenhouse VALUES
(1, 1, 20, 1);
INSERT INTO Plant_Greenhouse VALUES
(1, 1, 20, 2);
INSERT INTO Plant_Greenhouse VALUES
(1, 1, 20, 3);
INSERT INTO Plant_Greenhouse VALUES
(2, 1, 20, 1);
INSERT INTO Plant_Greenhouse VALUES
(2, 1, 20, 3);
INSERT INTO Plant_Greenhouse VALUES
(3, 2, 40, 5);
INSERT INTO Plant_Greenhouse VALUES
(3, 2, 40, 6);
INSERT INTO Plant_Greenhouse VALUES
(3, 2, 40, 7);
INSERT INTO Plant_Greenhouse VALUES
(4, 2, 40, 8);
INSERT INTO Plant_Greenhouse VALUES
(4, 2, 40, 9);
INSERT INTO Plant_Greenhouse VALUES
(4, 2, 40, 10);
INSERT INTO Plant_Greenhouse VALUES
(5, 3, 20, 1);
INSERT INTO Plant_Greenhouse VALUES
(5, 3, 20, 2);
INSERT INTO Plant_Greenhouse VALUES
(6, 3, 20, 5);
INSERT INTO Plant_Greenhouse VALUES
(6, 3, 20, 6);
SELECT * FROM Plant_greenhouse;