Solution-1: USING INNER, LEFT JOIN & HAVING (MySQL Query):

SELECT C.contest_id, C.hacker_id, C.name, SUM(SS.total_submissions), SUM(SS.total_accepted_submissions), SUM(VV.total_views), SUM(VV.total_unique_views)
FROM Contests C
JOIN Colleges Cl ON C.contest_id = Cl.contest_id
JOIN Challenges Ch ON Cl.college_id = Ch.college_id 
LEFT JOIN (SELECT S.challenge_id, SUM(S.total_submissions) as total_submissions, SUM(S.total_accepted_submissions) as total_accepted_submissions FROM Submission_Stats S GROUP BY S.challenge_id) SS
ON Ch.challenge_id=SS.challenge_id
LEFT JOIN (SELECT V.challenge_id, SUM(V.total_views) as total_views, SUM(V.total_unique_views) as total_unique_views FROM View_Stats V GROUP BY V.challenge_id) VV
ON Ch.challenge_id=VV.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING !(SUM(SS.total_submissions)=0 AND SUM(SS.total_accepted_submissions)=0 AND SUM(VV.total_views)=0 AND SUM(VV.total_unique_views)=0)
ORDER BY C.contest_id;


NOTE: 

The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

JOIN and INNER JOIN are the same in SQL. It returns the records that have matching values in both tables.

LEFT JOIN returns all the records from LEFT Table and records with matching values from Right table.



Solution-2: USING INNER, LEFT JOIN & HAVING (MySQL Query):

SELECT C.contest_id, C.hacker_id, C.name, SUM(SS.total_submissions), SUM(SS.total_accepted_submissions), SUM(VV.total_views), SUM(VV.total_unique_views)
FROM Contests C
JOIN Colleges Cl ON C.contest_id = Cl.contest_id
JOIN Challenges Ch ON Cl.college_id = Ch.college_id 
LEFT JOIN (SELECT S.challenge_id, SUM(S.total_submissions) as total_submissions, SUM(S.total_accepted_submissions) as total_accepted_submissions FROM Submission_Stats S GROUP BY S.challenge_id) SS
ON Ch.challenge_id=SS.challenge_id
LEFT JOIN (SELECT V.challenge_id, SUM(V.total_views) as total_views, SUM(V.total_unique_views) as total_unique_views FROM View_Stats V GROUP BY V.challenge_id) VV
ON Ch.challenge_id=VV.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING SUM(SS.total_submissions)+
SUM(SS.total_accepted_submissions)+
SUM(VV.total_views)+
SUM(VV.total_unique_views)>0
ORDER BY C.contest_id;

NOTE: 

The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

JOIN and INNER JOIN are the same in SQL. It returns the records that have matching values in both tables.

LEFT JOIN returns all the records from LEFT Table and records with matching values from Right table.