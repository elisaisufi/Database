-- Krijoni nje connection dhe nje databaze internship
CREATE DATABASE internship;

-- Krijoni nje tabele me emrin kursi me fusha: id, emri kursit, kohezgjatja, create date, update date.
CREATE TABLE course (
                        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        course_name VARCHAR(100) NOT NULL,
                        duration INT,
                        create_date DATE,
                        update_date DATE
);

INSERT INTO course (course_name, duration, create_date, update_date)
VALUES
    ('Intro to Artificial Intelligence', 3, '2021-01-15', '2022-01-10'),
    ('Database Management Systems', 4, '2023-03-20', '2024-03-18'),
    ('Object Oriented Programming', 3, '2023-05-10', '2024-05-15'),
    ('Web Development', 3, '2023-07-01', '2024-07-05'),
    ('Statistical Modeling', 5, '2023-09-12', '2024-09-20'),
    ('Calculus I', 6, '2022-01-10', '2022-01-12'),
    ('Computer Architecture', 9, '2024-03-25', '2025-03-28'),
    ('Data Structures', 5, '2024-06-18', '2025-06-20'),
    ('Engineering Economics', 5, '2024-09-05', '2025-09-07'),
    ('English', 6, '2026-02-01', '2026-02-03');

-- Modifikoni strukturen e tabeles shtoni fushen programming language
ALTER TABLE course
    ADD programming_language VARCHAR(100);

-- Beni update te dhenat ekzisutese dhe plotesoni fushen e re.
UPDATE course
SET programming_language = 'Python'
WHERE course_name = 'Intro to Artificial Intelligence';

UPDATE course
SET programming_language = 'SQL'
WHERE course_name = 'Database Management Systems';

UPDATE course
SET programming_language = 'Java'
WHERE course_name = 'Object Oriented Programming';

UPDATE course
SET programming_language = 'JavaScript'
WHERE course_name = 'Web Development';

UPDATE course
SET programming_language = 'Python'
WHERE course_name = 'Statistical Modeling';

UPDATE course
SET programming_language = 'None'
WHERE course_name = 'Calculus I';

UPDATE course
SET programming_language = 'C'
WHERE course_name = 'Computer Architecture';

UPDATE course
SET programming_language = 'Java'
WHERE course_name = 'Data Structures';

UPDATE course
SET programming_language = 'None'
WHERE course_name = 'Engineering Economics';

UPDATE course
SET programming_language = 'None'
WHERE course_name = 'English';

-- Fshini nje nga kurset.
DELETE FROM course
WHERE course_name = 'English';

-- Shtoni nje tabele student m fushat: id, emri, email, birth date, phone number, pike dhe
-- foreign key id e tabeles internship.

CREATE TABLE student (
                         student_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         email VARCHAR(100),
                         birth_date DATE,
                         phone_number VARCHAR(20),
                         points INT,
                         course_id INT REFERENCES course(id)
);

-- Mbusheni tabelen me te dhena
INSERT INTO student (name, email, birth_date, phone_number, points, course_id)
VALUES
    ('Elisa Isufi', 'elisa@gmail.com', '2006-01-01', '0691234567', 97, 1),
    ('Ardit Kola', 'ardit@gmail.com', '2001-11-21', '0681234567', 75, 2),
    ('Sara Hoxha', 'sara@gmail.com', '2003-02-14', '0692233445', 88, 3),
    ('Jon Meta', 'jon@gmail.com', '2000-07-30', '0679876543', 82, 4),
    ('Aldi Nika', 'aldi@gmail.com', '2002-09-18', '0687654321', 95, 5),
    ('Bora Leka', 'bora@gmail.com', '2001-03-25', '0693344556', 70, 6),
    ('Dion Ruci', 'dion@gmail.com', '2002-12-05', '0671122334', 78, 7),
    ('Era Duka', 'era@gmail.com', '2003-06-11', '0695566778', 85, 8),
    ('Mira Gjoni', 'mira@gmail.com', '2001-01-28', '0694433221', 65, 9),
    ('Lira Hasa', 'lira@gmail.com', '2002-04-12', '0691112233', 91, 1),
    ('Kevin Bala', 'kevin@gmail.com', '2000-10-05', '0682223344', 73, 2),
    ('Anisa Dervishi', 'anisa@gmail.com', '2003-08-19', '0673334455', 84, 3),
    ('Dorian Koci', 'dorian@gmail.com', '2001-12-22', '0694445566', 79, 4),
    ('Nora Shkalla', 'nora@gmail.com', '2002-02-28', '0685556677', 96, 5),
    ('Ergi Lala', 'ergi@gmail.com', '2000-06-15', '0676667788', 68, 6),
    ('Megi Cani', 'megi@gmail.com', '2003-09-09', '0697778899', 87, 7),
    ('Blendi Paja', 'blendi@gmail.com', '2001-05-03', '0688889900', 90, 8),
    ('Ina Rexha', 'ina@gmail.com', '2002-11-11', '0679990011', 76, 9),
    ('Arlind Gega', 'arlind@gmail.com', '2000-01-20', '0690001122', 83, 1);

-- Riemertoni nje nga kolonat.
ALTER TABLE student
    RENAME COLUMN name TO student_name;

--  Listoni te gjithe kurset
SELECT * FROM course;

-- Listoni te gjithe studentet qe emri iu fillon me A
SELECT * FROM student
WHERE student_name LIKE 'A%';

--  Listoni kurset qe kane ndodhur mes vitit 2023- 2025.
SELECT * FROM course
WHERE create_date BETWEEN '2023-01-01' AND '2025-12-31';

-- Listoni studentet qe jane me te medhenj se 25 vjec
SELECT * FROM student
WHERE birth_date <= '2001-04-15';

-- PART 2 Aggregate Functions

-- 1. Numeroni (funksioni count) sa kurse permbajne germen 'J' ne emer
SELECT COUNT(*) as CourseNames_Including_J
FROM course
WHERE course_name LIKE '%J%';

-- 2. Nxirrni studentin qe ka maksimumin e pikeve.
SELECT student_name, points
FROM student
WHERE points = (SELECT MAX(points) FROM student);

-- 3. Shtoni nje tabele tjeter qe ta lidhni me foreign key te menaxhoni nje lidhje shume me shume midis 2 tabelave
CREATE TABLE enrollment (
                            student_id INT,
                            course_id INT,
                            PRIMARY KEY (student_id, course_id),
                            FOREIGN KEY (student_id) REFERENCES student(student_id),
                            FOREIGN KEY (course_id) REFERENCES course(id)
);

INSERT INTO enrollment (student_id, course_id)
VALUES
    (1,1), (1,2), (1,3), (1,4),
    (2,2), (2,3), (2,5),
    (3,1), (3,4), (3,6),
    (4,2), (4,7),
    (5,3), (5,4), (5,5), (5,8),
    (6,1), (6,9),
    (7,2), (7,6), (7,8),
    (8,1), (8,2), (8,3), (8,7),
    (9,4), (9,5);

-- 4. Listoni kurset qe kane me shume se 3 studente
SELECT course.id, course.course_name, COUNT(enrollment.student_id) AS Number_Of_Students
FROM course
         INNER JOIN enrollment ON course.id = enrollment.course_id
GROUP BY course.id, course.course_name
HAVING COUNT(enrollment.student_id) > 3;

-- 5. Listoni emer studenti dhe emer kursi per cdo student
SELECT student.student_name, course.course_name
FROM student
         INNER JOIN enrollment ON student.student_id = enrollment.student_id
         INNER JOIN course ON enrollment.course_id = course.id;
