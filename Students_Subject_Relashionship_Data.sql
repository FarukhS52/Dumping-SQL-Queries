CREATE DATABASE Institute_Data;
use Institute_data;

-- create a table named - Student

CREATE TABLE Student (
    student_id VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    Class INT NOT NULL,
    PRIMARY KEY (student_id)
);
 
 -- create a table named - Subject
 
CREATE TABLE Subject (
    Subject_id VARCHAR(10) NOT NULL,
    Subject_name VARCHAR(15),
    PRIMARY KEY (Subject_id)
);
 
 -- create a table named - Student_subject_relationship
 
CREATE TABLE Student_subject_relationship (
    Student_id VARCHAR(10) NOT NULL,
    Subject_id VARCHAR(15) NOT NULL,
    FOREIGN KEY (Student_id)
        REFERENCES Student (student_id),
    FOREIGN KEY (Subject_id)
        REFERENCES Subject (Subject_id)
);
 
 -- add values into Student tables 
 
INSERT INTO Student VALUES
('Stud_1','Farookh Siddiui',22, 12),
('Stud_2','Ayaz Chaudhary',21,11),
('Stud_3','Mridul Sharma',22,12),
('Stud_4','Ali Siddiqui',13,7),
('Stud_5','Vaibhav Wakde',20,10),
('Stud_6','Vansh Rana',22,11),
('Stud_7','Anshu Gupta',22,11),
('Stud_8','Shorya Chaudhary',23,12), 
('Stud_9','Aryan Sarang',18,10),
('Stud_10','Aadil Hussain',20,11),
('Stud_11','Tarun Shyam',22,12);

-- add values into Subject table

 INSERT INTO Subject VALUES
('Sub_1','English'),
('Sub_2','Hindi'),
('Sub_3','Maths'),
('Sub_4','Science');

-- add values into Student_subject_relationship table

INSERT INTO Student_subject_relationship VALUES
('Stud_1','Sub_1'),
('Stud_1','Sub_2'),
('Stud_1','Sub_4'),
('Stud_2','Sub_2'),
('Stud_2','Sub_3'),
('Stud_2','Sub_4'),
('Stud_3','Sub_1'),
('Stud_3','Sub_2'),
('Stud_3','Sub_3'),
('Stud_3','Sub_4'),
('Stud_4','Sub_3'),
('Stud_5','Sub_3'),
('Stud_5','Sub_4'),
('Stud_6','Sub_4'),
('Stud_7','Sub_1'),
('Stud_7','Sub_2'),
('Stud_8','Sub_1'),
('Stud_8','Sub_3'),
('Stud_8','Sub_4'),
('Stud_9','Sub_1'),
('Stud_9','Sub_2'),
('Stud_9','Sub_3'),
('Stud_9','Sub_4'),
('Stud_10','Sub_2'),
('Stud_10','Sub_3'),
('Stud_10','Sub_4'),
('Stud_11','Sub_3');

-- Query to get all 3 tables combined into 1 table

SELECT 
    *
FROM
    Student AS stud
        JOIN
    student_subject_relationship AS Stud_sub ON stud.student_id = Stud_sub.Student_id
        JOIN
    Subject AS Sub ON Stud_sub.Subject_id = Sub.Subject_id;
 
 -- Query to get the list of students enrolled only in "Science"
 
SELECT 
    s.student_id, s.name
FROM
    student s
        LEFT JOIN
    student_subject_relationship r ON s.student_id = r.student_id
        LEFT JOIN
    Subject su ON r.Subject_id = su.Subject_id
WHERE
    su.Subject_name = 'Science'
        AND r.student_id NOT IN (SELECT 
            ssr.student_id
        FROM
            student_subject_relationship ssr
        WHERE
            ssr.subject_id <> (SELECT 
                    subject_id
                FROM
                    subject
                WHERE
                    subject_name = 'Science'));
                    
                    
-- Query to get the list of students enrolled only in "Maths"

SELECT 
    s.student_id, s.name
FROM
    student s
        LEFT JOIN
    student_subject_relationship r ON s.student_id = r.student_id
        LEFT JOIN
    Subject su ON r.Subject_id = su.Subject_id
WHERE
    su.Subject_name = 'Maths'
        AND r.student_id NOT IN (SELECT 
            ssr.student_id
        FROM
            student_subject_relationship ssr
        WHERE
            ssr.subject_id != (SELECT 
                    subject_id
                FROM
                    subject
                WHERE
                    subject_name = 'Maths'));
                    
                    
 -- Query to get the list of students enrolled only in "Science" and "Maths"

 SELECT 
    s.student_id, s.name
FROM
    student s
        INNER JOIN
    student_subject_relationship r ON s.student_id = r.student_id
        INNER JOIN
    subject su ON r.subject_id = su.subject_id
WHERE
    su.subject_name IN ('Math' , 'Science')
GROUP BY s.student_id , s.name
HAVING COUNT(DISTINCT su.subject_name) = 2;


 -- Query to get the list of students enrolled in all 4 subjectss


SELECT 
    s.student_id, s.name
FROM
    student s
        INNER JOIN
    student_subject_relationship r ON s.student_id = r.student_id
        INNER JOIN
    subject su ON r.subject_id = su.subject_id
GROUP BY s.student_id , s.name
HAVING COUNT(DISTINCT su.subject_name) = 4;

-- view all tables

select * from Student;
select * from Subject;
select * from student_subject_relationship;
 

 
 

