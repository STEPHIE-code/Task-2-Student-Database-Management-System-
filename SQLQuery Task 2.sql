--1. Database Setup
CREATE DATABASE student_database;

CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT-- CHECK (Grade IN ('A', 'B', 'C', 'D'))
);

--2. Data Entry
INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, 
Address, Date_of_birth, Gender, Major, GPA, Grade) VALUES
(1, 'Megala', 'English', 'Megala@example.com', 78872457, 'Thuraipakkam, chennai', '1991-01-01', 'Female', 'B.A English', 5, 'B'),
(2, 'Arun', 'Physics', 'Arun@example.com', 23865758, 'Kaatupakkam,chennai', '1992-02-02', 'Male', 'BA Physics', 8, 'A'),
(3, 'Karthik', 'Biology', 'Karthik@example.com', 75697454, 'Anna nagar', '1993-03-03', 'Male', 'Botany', 2, 'C'),
(4, 'Jaden', 'Biology', 'Jaden@example.com', 7569784, 'Vadapalani', '1994-04-05', 'Male', 'Botany', 7, 'A'),
(5, 'Jeni', 'Engineering', 'Jeni@example.com', 8476594, 'ashok nagar', '2000-07-03', 'Female', 'Space Engineering', 6, 'B'),
(6, 'dev', 'French', 'Dev@example.com', 63548749, 'thomas street', '1999-04-06', 'Male', 'M.A French', 3, 'C'),
(7, 'jessy', 'Space', 'Jessy@example.com', 84065987, 'Kambar street', '2002-05-10', 'Female', 'Space Science', 4, 'B'),
(8, 'Edwin', 'Tamil', 'Edwin@example.com', 84685987, 'Baker street', '2001-06-09', 'Male', 'B.A Tamil', 9, 'A'),
(9, 'Seta', 'English', 'Seta@example.com', 6465345354, 'Cosmo Street', '2007-01-05', 'Female', 'B.A English', 2, 'C'),
(10, 'Wilson', 'English', 'jack@example.com', 7635898789, 'Ocean gate', '1998-05-02', 'Male', 'B.A English', 5, 'B');

--3. Student Information Retrieval
SELECT * FROM student_table
ORDER BY GPA DESC;

--4. Query for Male Students
SELECT * FROM student_table
WHERE cast(Gender as varchar) = 'Male';

--5. Query for Students with GPA less than 5.0
SELECT * FROM student_table
WHERE GPA < 5.0;

--6. Update Student Email and Grade
UPDATE student_table
SET email_id = 'Update@example.com', Grade = 'A', GPA = '10'
WHERE Student_id = 1;
Select * FROM student_table

--7. Query for Student name and age with Grade "B"
SELECT Stu_name, Grade, Date_of_birth, 
       DATEDIFF(year, Date_of_birth, GETDATE()) - 
       CASE WHEN DATEADD(year, DATEDIFF(year, Date_of_birth, GETDATE()), Date_of_birth) > GETDATE() THEN 1 ELSE 0 END AS Age
FROM student_table
WHERE cast(Grade as varchar) = 'B';

--8. Grouping and Calculation

select cast(Department as varchar)Department,cast(Gender as varchar)Gender,cast(AVG(GPA) as int) Avg_GPA from student_table
group by cast(Department as varchar) ,cast(Gender as varchar)


--9. Table Renaming

exec sp_rename 'student_table','student_information'
Select * FROM student_information


--10. Retrieve Student with Highest GPA
SELECT Stu_name, GPA FROM student_information
WHERE GPA = (SELECT MAX(GPA) FROM student_information);

