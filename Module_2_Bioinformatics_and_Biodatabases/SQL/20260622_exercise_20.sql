-- Procedures with parameters
DELIMITER //
CREATE PROCEDURE pro_08(IN KingdomID INT)
BEGIN
	SELECT * FROM organisms
    WHERE Kingdom_ID = KingdomID;
END //

CREATE PROCEDURE pro_09(IN LowRes INT)
BEGIN
	SELECT * FROM structural_data
    WHERE Resolution > LowRes;
END //

CREATE PROCEDURE pro_10(IN MW INT)
BEGIN
	SELECT * FROM atom_information
    WHERE Mass < MW;
END //

CREATE PROCEDURE pro_11(IN Donors INT, Acceptors INT)
BEGIN
	SELECT * FROM modification_data
    WHERE Hydrogenbond_donors = Donors AND Hydrogenbond_acceptors = Acceptors;
END //

CREATE PROCEDURE pro_12(IN StrucName VARCHAR(255))
BEGIN
	SELECT * FROM secondary_structure
    WHERE Structure_Name = StrucName;
END //

CREATE PROCEDURE pro_13(IN ProtName VARCHAR(255), Length INT)
BEGIN
	SELECT * FROM proteins
    WHERE Protein_Length > Length AND Protein_Name LIKE ProtName;
END //

CREATE PROCEDURE pro_14(IN Res FLOAT, Rfree FLOAT)
BEGIN
	SELECT * FROM proteins
    WHERE Protein_ID IN (SELECT Protein_ID FROM structures WHERE Identifier IN (SELECT Identifier FROM structural_data WHERE Resolution = Res AND R_Free = Rfree));
END //
DELIMITER ;

call pro_08(2);
call pro_09(2);
call pro_10(500);
call pro_11(3, 4);
call pro_12('Helix');
call pro_13('%kinase%', 300);
call pro_14(2.4, 0.32);
