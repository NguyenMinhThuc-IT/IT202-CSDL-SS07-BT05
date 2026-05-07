/*
Một Scalar Subquery là truy vấn con trả về:
duy nhất 1 giá trị
Ví dụ:
(SELECT AVG(price) FROM Courses)
Subquery này trả về:
giá trung bình của toàn bộ hệ thống
Điểm quan trọng là khi đặt Scalar Subquery trong mệnh đề SELECT, giá trị đó sẽ được:
tính như một giá trị chung
nhưng vẫn hiển thị trên từng dòng dữ liệu chi tiết
Nhờ vậy:
Query ngoài vẫn giữ nguyên từng khóa học
đồng thời mỗi dòng đều có thể truy cập “thông tin tổng quan toàn hệ thống”
Đây chính là kỹ thuật:
Detail + Aggregate cùng lúc
(vừa xem chi tiết từng dòng, vừa xem số liệu tổng hợp)
Nếu dùng GROUP BY thông thường:
SELECT AVG(price)
FROM Courses;
thì toàn bộ dữ liệu sẽ bị gộp thành:
1 dòng duy nhất
và mất thông tin từng khóa học.
*/

SELECT 
    title,
    price,
    price - (
        SELECT AVG(price)
        FROM Courses
    ) AS Price_Difference
FROM Courses;