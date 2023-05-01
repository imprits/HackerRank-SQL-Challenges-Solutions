Solution-1: Using INNER JOIN & SUB-QUERY (MySQL Query):

SELECT t.Name
FROM (
    SELECT s1.ID, s1.Name, p1.Salary, f.Friend_ID, s2.name as friend_name, p2.Salary as friend_salary
    FROM Students s1
    JOIN Packages p1 ON s1.ID = p1.ID
    JOIN Friends f ON s1.ID = f.ID
    JOIN Students s2 ON f.Friend_ID = s2.ID
    JOIN Packages p2 ON f.Friend_ID = p2.ID
    ) t
WHERE t.friend_salary > t.Salary
ORDER BY friend_salary;

NOTE: 

Table s1 will give the ID and Name of the Students.

Table p1 will give Salary of the Student.

Table f will give Friend's ID.

Table s2 will give Friend's Name.

Table p2 will give Friend's Salary.



Solution-2: Using INNER JOIN (MySQL Query):

SELECT s.Name
FROM Students s
JOIN Packages p1 ON s.ID = p1.ID
JOIN Friends f ON s.ID = f.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;

NOTE: 

Table p1 and p2 are used to compare student and friend's salary respectively.