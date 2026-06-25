-- Simple procedures
DELIMITER //
CREATE PROCEDURE pro_01()
BEGIN
	SELECT * FROM organisms;
END //

CREATE PROCEDURE pro_02()
BEGIN
	SELECT * FROM structures
    WHERE Source_ID = 2;
END //

CREATE PROCEDURE pro_03()
BEGIN
	SELECT Identifier, Resolution, Released FROM structural_data;
END //

CREATE PROCEDURE pro_04()
BEGIN
	SELECT * FROM secondary_structure
    WHERE Structure_Name = 'Helix';
END //

CREATE PROCEDURE pro_05()
BEGIN
	SELECT Protein_Name, Protein_Length FROM proteins
    WHERE Protein_Length > 250;
END //

CREATE PROCEDURE pro_06()
BEGIN
	SELECT * FROM kingdoms
    WHERE Kingdom_ID IN (SELECT Kingdom_ID FROM organisms);
END //

CREATE PROCEDURE pro_07()
BEGIN
	SELECT * FROM proteins
    WHERE Protein_ID IN (SELECT Protein_ID FROM structures WHERE Source_ID = 1);
END //
DELIMITER ;

CALL pro_01;
CALL pro_02;
CALL pro_03;
CALL pro_04;
CALL pro_05;
CALL pro_06;
CALL pro_07;