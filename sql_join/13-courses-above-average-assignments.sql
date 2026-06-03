SELECT courses.title AS course_title
FROM courses
INNER JOIN assignments ON assignments.course_id = courses.id
GROUP BY courses.id
HAVING COUNT(assignments.id) > (
    SELECT AVG(total_devoirs)
    FROM (
        SELECT COUNT(*) AS total_devoirs
        FROM assignments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;