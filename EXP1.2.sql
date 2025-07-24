--USE ADBMS_2027;
CREATE TABLE TBL_DEPARTMENT (DEPT_ID INT PRIMARY KEY, DEPT_NAME VARCHAR(30));
CREATE TABLE TBL_COURSE(COURSE_ID INT PRIMARY KEY, COURSE_NAME VARCHAR(30), DEPT_ID INT, FOREIGN KEY (DEPT_ID) REFERENCES TBL_DEPARTMENT(DEPT_ID));

INSERT INTO TBL_DEPARTMENT (DEPT_ID, DEPT_NAME) VALUES
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Civil Engineering'),
(5, 'Mathematics');
INSERT INTO TBL_COURSE (COURSE_ID, COURSE_NAME, DEPT_ID) VALUES
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Operating Systems', 1),
(104, 'Circuits', 2),
(105, 'Digital Logic', 2),
(106, 'Thermodynamics', 3),
(107, 'Fluid Mechanics', 3),
(108, 'Surveying', 4),
(109, 'Calculus', 5),
(110, 'Linear Algebra', 5),
(111, 'Discrete Math', 5);

SELECT DEPT_NAME
FROM TBL_DEPARTMENT
WHERE DEPT_ID IN (
    SELECT DEPT_ID
    FROM TBL_COURSE
    GROUP BY DEPT_ID
    HAVING COUNT(*) > 2
);