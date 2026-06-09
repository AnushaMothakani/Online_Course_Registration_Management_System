CREATE DATABASE course;
USE course;
CREATE TABLE Course_info(
course_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
course_name VARCHAR(20) NOT NULL,
credits INT CHECK (credits BETWEEN 1 AND 6),
course_fee INT,
duration_week INT CHECK(duration_week BETWEEN 1 AND 52));
DESC course_info;
INSERT INTO course_info(course_name, credits, course_fee,duration_week)
VALUES
("python", 6, 15000,12),
("C", 5, 12000, 10),
("java", 5, 12000, 10),
("C++", 4, 10000, 12);
SELECT * FROM course_info;
CREATE TABLE stud(
stud_id INT PRIMARY KEY UNIQUE,
stud_name VARCHAR(20),
email VARCHAR(100) UNIQUE NOT NULL,
registered_date DATE);
DESC stud;
SELECT * FROM stud;
INSERT INTO stud VALUES
(101, "praveen", "praveen24@gmail.com", '2025-12-23'),
(102, "rani", "queenbee03@gmail.com", '2025-12-25'),
(103, "janaki", "janu1483@gmail.com", '2025-12-22'),
(104, "ananya", "its_me_anu46@gmail.com", '2025-12-26'),
(105, "tanishka", "tanishka35@gmail.com", '2025-12-23');
CREATE TABLE enrollment(
enroll_id INT PRIMARY KEY AUTO_INCREMENT,
stud_id INT NOT NULL,
course_id INT NOT NULL,
enroll_date DATE DEFAULT '2025-12-31',
CONSTRAINT FK_studid FOREIGN KEY (stud_id) REFERENCES stud(stud_id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_courseid FOREIGN KEY (course_id) REFERENCES course_info(course_id)
ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO enrollment (stud_id, course_id)
VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 3);
ALTER TABLE enrollment 
ADD CONSTRAINT unique_enroll UNIQUE (stud_id, course_id);