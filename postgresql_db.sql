CREATE TABLE Students (Student_ID SERIAL PRIMARY KEY, Full_Name TEXT, Age INTEGER, Address TEXT);
INSERT INTO Students (Full_Name, Age, Address) VALUES ('XXXXX' ,0,' ');

CREATE TABLE Coaches ( Coach_ID SERIAL PRIMARY KEY, Full_Name TEXT);
INSERT INTO Coaches (Full_Name) VALUES ('XXXXX');

CREATE TABLE Laptops ( Laptop_ID SERIAL PRIMARY KEY, NLaptop INTEGER);
INSERT INTO Laptops (NLaptop) VALUES (1);

CREATE TYPE weekday AS ENUM ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

CREATE TABLE Classes(Class_ID SERIAL PRIMARY KEY, Class_Name TEXT, Class_Type VARCHAR(100), Coach_ID INTEGER, Weekday weekday, Start_Time TIME, Duration_Minutes INTEGER );

ALTER TABLE Classes
ADD CONSTRAINT fk_Coaches
FOREIGN KEY (Coach_ID)
REFERENCES Coaches (Coach_ID)
ON UPDATE CASCADE;

INSERT INTO Classes (Class_Name, Class_Type, Coach_ID, Weekday, Start_Time, Duration_Minutes)
VALUES ('XXXXXX', 'Class', 9, 'Tuesday', '16:00:00', 50);
