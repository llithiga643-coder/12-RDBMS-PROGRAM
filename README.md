CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID)
    REFERENCES Faculty(FacultyID)
);

CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
    REFERENCES Department(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Enrollment (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID)
    REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
    REFERENCES Course(CourseID)
);

INSERT IGNORE INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'Computer Science');

INSERT IGNORE INTO Faculty (FacultyID, FacultyName)
VALUES (1, 'Divya');

INSERT IGNORE INTO Course (CourseID, CourseName, FacultyID)
VALUES (1, 'Database Systems', 1);

INSERT IGNORE INTO Student (StudentID, StudentName, DepartmentID)
VALUES (1, 'Alex Smith', 1);

INSERT IGNORE INTO Enrollment (StudentID, CourseID)
VALUES (1, 1);

SELECT s.StudentName, d.DepartmentName, c.CourseName, f.FacultyName
FROM Enrollment e
JOIN Student s ON s.StudentID = e.StudentID
JOIN Department d ON d.DepartmentID = s.DepartmentID
JOIN Course c ON c.CourseID = e.CourseID
JOIN Faculty f ON f.FacultyID = c.FacultyID;
