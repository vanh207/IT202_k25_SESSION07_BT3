-- Điều xảy ra khi sử dụng queyry này:
CREATE TABLE `Courses`(
    `Course_Id` INT PRIMARY KEY AUTO_INCREMENT,
    `Course_Name` VARCHAR(150) NOT NULL
);
CREATE TABLE `Enrollments`(
    `Enrollment_Id` INT PRIMARY KEY AUTO_INCREMENT,
    `Course_Id` INT,
    `Price` BIGINT,
    
    FOREIGN KEY (`Course_Id`)
    REFERENCES `Courses`(`Course_Id`)
    ON DELETE CASCADE
);

INSERT INTO `Courses` (`Course_Name`)
VALUES
('SQL Cơ Bản'),
('SQL Nâng Cao'),
('Python Cơ Bản'),
('Data Analyst'),
('Machine Learning');

INSERT INTO `Enrollments` (`Course_Id`, `Price`)
VALUES
(1, 500000),
(1, 700000),
(2, 800000),
(3, 600000),
(3, 900000);

SELECT * FROM `Courses`
WHERE `Course_Id` NOT IN (SELECT E. `course_id` FROM `Enrollments` E
						  WHERE E.`course_id` IS NOT NULL);

SELECT * FROM `Courses` C
LEFT JOIN `enrollments` E ON E.`Course_Id` = C. `Course_Id`;

UPDATE `enrollments`
SET `Course_Id` = NULL
WHERE `Enrollment_Id` =  5;

--  SỰ CỐ XẢY RA KHI GIẢ SỬ COURSE_ID CỦA ENROLLMENTS ĐÓ KHÔNG CÓ
-- TỨC LÀ NULL => ĐIỀU ĐÓ SẼ DẪN ĐẾN ID != NULL MÀ
-- KHI ID != NULL THÌ SẼ TRẢ VỀ UNKNOW VÀ GIÁ TRỊ LÀ FASLSE
-- LÚC ĐÓ MẶC DÙ CÓ NHỮNG COURSES_ID TRƯỚC ĐÓ CÓ TRONG COURSE NHƯNG KHÔNG CÓ 
-- TRONG ENROLLMENTS THÌ BẢNG TRẢ VỀ VẪN SẼ LÀ 0 DÒNG
-- CÁCH SỬA
-- HÃY THÊM ĐIỀU KIỆN NẾU KHÁC NULL THÌ SẼ CHẠY SUÔN SẺ
-- ĐỂ THẤY DỄ DÀNG HƠN TA DÙNG LEFT JOIN
