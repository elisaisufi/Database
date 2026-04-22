-- Part 3 Distinct Queries

-- Unique programming languages
SELECT DISTINCT programming_language
FROM course;

-- Unique points 
SELECT DISTINCT points
FROM student;

-- Retreive 3 students from 'Intro to Artificial Intelligence', where you order from youngest to oldest
SELECT student_id, student_name
FROM student
ORDER BY birth_date asc
LIMIT 3;

-- Retreive 4 students that have more than 80 points
SELECT student_id, student_name 
FROM student
WHERE points > 80
LIMIT 4;

-- Skip the first 3 courses and show the next 3
SELECT id, course_name, duration
FROM course
LIMIT 3 OFFSET 3;

-- Skip the first 4 students and show the next 3, ordering by points
SELECT student_name, points
FROM student
ORDER BY points DESC
LIMIT 3 OFFSET 3;
