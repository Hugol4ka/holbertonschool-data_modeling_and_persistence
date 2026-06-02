SELECT title AS course_title
FROM courses
INNER JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.id
HAVING COUNT(enrollments.student_id) > (
    SELECT AVG(total_inscription)
    FROM (
        SELECT COUNT(student_id) AS total_inscription
        FROM enrollments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;