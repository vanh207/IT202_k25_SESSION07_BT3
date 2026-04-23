-- TẠI VÌ KHI DÙNG EXISTS SẼ AN TOÀN HƠN SO VỚI CÁCH DÙNG WHERE NOT IN
-- LÝ DO: VÌ GIẢ SỬ NẾU CÓ 1 PAYMENTS TRONG STUDENS CÓ DỮ LIỆU LỖI NULL
-- => KHI MÀ KHÔNG TRONG NOT IN TỨC LÀ KHÁC = NULL ;-;
-- TỪ ĐÓ GÂY RỐI DỮ LIỆU VÀ KẾT QUẢ TRẢ RA LÀ 0 DÙ CÓ CÁC HỌC SINH CÓ TRẢ
-- NHƯNG KHÔNG XUẤT HIỆN Ở PAYMENTS
-- = > NÊN DÙNG NOT EXISTS ĐỂ LẤY ĐƯỢC DỮ LIỆU NHANH CŨNG NHƯ SẼ KHÔNG SỢ BỊ
-- LỖI DỮ LIỆU KHI GẶP NULL VÀ CÁC GIÁ TRỊ KHÁC
-- SỬ DỤNG DỮ LIỆU BÀI TRƯỚC NẾU TÔI CẬP NHẬP LẠI
-- PAYMENTID THỨ 21 MÀ SỬ DỤNG STUDENTID LÀ NULL
UPDATE `payments`
SET `Student_Id` = NULL WHERE `Payment_Id` = 21;

-- QUERY BẰNG NOT IN

SELECT `Student_Id`, `Student_Name`
FROM `students`
WHERE `Student_Id` NOT IN (SELECT `Student_Id` FROM `payments`);


SELECT `Student_Id`, `Student_Name`
FROM `students` S
WHERE NOT EXISTS (SELECT 1 FROM `payments` P WHERE P.`Student_Id` = S.`Student_Id`);