SELECT sub.name, sub.grade, sub.marks
FROM (
    SELECT 
            CASE WHEN grade>=8 THEN name  
                      WHEN grade <7 AND grade >1 THEN name= NULL
           END AS name, 
    grade, 
    marks,
    min_mark,
    max_mark
    FROM students, grades
) AS sub
WHERE sub.marks between sub.min_mark AND  sub.max_mark
ORDER BY sub.grade DESC,  sub.name ASC, sub.marks ASC;