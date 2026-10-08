CREATE TABLE Department(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL
);

CREATE TABLE  Faculty(
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(30) NOT NULL
);
CREATE TABLE  Course(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30) NOT NULL,
    FacultyID INT,
    FOREIGN KEY(FacultyID)
    REFERENCES Faculty(FacultyID)
);
CREATE TABLE Student(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Age INT,
    DepartmentID INT,
    FOREIGN KEY(DepartmentID)
    REFERENCES Department(DepartmentID)
);
CREATE TABLE Enrollment(
    StudentID INT,
    CourseID INT,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID)
    REFERENCES Student(StudentID),
    FOREIGN KEY(CourseID)
    REFERENCES Course(CourseID)
);
INSERT  INTO Department
VALUES
(1,'IT'),
(2,'CSE'),
(3,'BCA');
INSERT INTO Faculty
VALUES
(101,'Ravi'),
(102,'Meena'),
(103,'Kumar');
INSERT  INTO Course
VALUES
(201,'DBMS',101),
(202,'Python',102),
(203,'Java',103);
INSERT  INTO Student
VALUES
(1,'Arun',20,1),
(2,'Priya',20,2),
(3,'Anu',19,1);
INSERT INTO Enrollment
VALUES
(1,201),
(2,202),
(3,201);
SELECT
    s.StudentID,
    s.StudentName,
    d.DepartmentName,
    c.CourseName,
    f.FacultyName
FROM Student s
JOIN Department d
    ON s.DepartmentID = d.DepartmentID
JOIN Enrollment e
    ON s.StudentID = e.StudentID
JOIN Course c
    ON e.CourseID = c.CourseID
JOIN Faculty f
    ON c.FacultyID = f.FacultyID;
