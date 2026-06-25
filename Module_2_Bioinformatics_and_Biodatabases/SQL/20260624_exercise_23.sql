-- Adding Constraints
DROP DATABASE IF EXISTS laboratory;
DROP DATABASE IF EXISTS greenhouse;

CREATE DATABASE laboratory;
CREATE DATABASE greenhouse;

USE laboratory;

CREATE TABLE Employees (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Email VARCHAR(255),
    ROOM VARCHAR(3),
    Job VARCHAR(255),
    Salary FLOAT
);

CREATE TABLE Tools (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Tool_Name VARCHAR(255) UNIQUE,
    Manufacturer VARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE Experiments (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Experiment_Name VARCHAR(255),
    Duration INT,
    Experiment_Type VARCHAR(255)
);
    
CREATE TABLE Results (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Result_Name VARCHAR(255),
	Result_Description VARCHAR(255)
    CONSTRAINT Result_Description_Check CHECK (Result_Description 
		IN ('Concentration increased', 'Concentration decreased', 
        'Concentration stayed constant', 'Full sequence could be sequenced', 
        'Only a partial sequence was detected'))
);

CREATE TABLE Experiment_Result (
	Experiment_ID INT,
    Result_ID INT,
    Remark VARCHAR(255),
    PRIMARY KEY (Experiment_ID, Result_ID),
    FOREIGN KEY (Experiment_ID) REFERENCES Experiments(ID),
    FOREIGN KEY (Result_ID) REFERENCES Results(ID)
);
    
CREATE TABLE Experiment_Employee (
	Experiment_ID INT,
    Employee_ID INT,
    Weekday VARCHAR(255),
    Repeats INT,
    Duration FLOAT,
    CONSTRAINT Weekday_Check CHECK (Weekday IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')),
    PRIMARY KEY (Experiment_ID, Employee_ID),
    FOREIGN KEY (Experiment_ID) REFERENCES Experiments(ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(ID)
);
    
CREATE TABLE Experiment_Tool (
	Experiment_ID INT,
    Tool_ID INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (Experiment_ID, Tool_ID),
    FOREIGN KEY (Experiment_ID) REFERENCES Experiments(ID),
    FOREIGN KEY (Tool_ID) REFERENCES Tools(ID)
);

USE greenhouse;
CREATE TABLE Greenhouses (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Size INT,
    Address VARCHAR(255),
    Number_Patches INT,
    Temp DECIMAL(4, 2),
    Humidity DECIMAL(5, 2)    
);

CREATE TABLE Gardeners (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Address VARCHAR(255),
    Telephone VARCHAR(20),
    Salary DECIMAL(8, 2)  
);

CREATE TABLE Plants (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Plant_Name VARCHAR(50),
    Taxonomy VARCHAR(100),
    Plant_Type VARCHAR(255) NOT NULL,
    Mutation VARCHAR(20),
    CONSTRAINT Plant_Type_Check CHECK (Plant_Type IN ('wildtype', 'mutated'))
);

CREATE TABLE Gardener_Greenhouse (
    Gardener_ID INT NOT NULL,
    Greenhouse_ID INT NOT NULL,
    Work_Time FLOAT,
	PRIMARY KEY (Gardener_ID, Greenhouse_ID, Work_Time),
	FOREIGN KEY (Gardener_ID) REFERENCES Gardeners(ID),
    FOREIGN KEY (Greenhouse_ID) REFERENCES Greenhouses(ID),
    CONSTRAINT Workt_Time_Check CHECK (Work_Time <= 8)
);

CREATE TABLE Plant_Greenhouse (
    Plant_ID INT NOT NULL,
    Greenhouse_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Patch INT NOT NULL,
	PRIMARY KEY (Plant_ID, Greenhouse_ID, Patch),
	FOREIGN KEY (Plant_ID) REFERENCES Plants(ID),
    FOREIGN KEY (Greenhouse_ID) REFERENCES Greenhouses(ID)
);