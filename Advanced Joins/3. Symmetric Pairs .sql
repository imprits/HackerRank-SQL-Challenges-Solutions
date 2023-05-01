Solution-1: USING UNION & CROSS JOIN (MySQL Query):

SELECT X, Y FROM (
SELECT X, Y FROM Functions WHERE X=Y GROUP BY X, Y HAVING COUNT(*)=2
UNION
SELECT f1.X, f1.Y FROM Functions f1, Functions f2 
WHERE f1.X < f1.Y 
AND f1.X=f2.Y 
AND f2.X=f1.Y
)t
ORDER BY X, Y;


NOTE: 
Lets divide the output in 2 parts: 
(a) X=Y  
(b) X<Y

for the (a) X=Y, We should check whether the entry (X,Y) WHERE X=Y is present in the table twice. If it is present 
2 times then we can say the symmetric pair is present and add it in the output.

we can check the count in 2 ways:
1. using HAVING clause (as shown in SOLUTION-1 & SOLUTION-2) OR
2. using CASE WHEN statement in HAVING clause (as shown in SOLUTION-3).

NOTE:
In SOLUTION-3, We have checked the count for X=Y should be >2 (instead of =2), It's because, due to the usage of 
CROSS-JOIN there, if the count for a pair (X1,Y1) is 2 in the original table, after the CROSS-JOIN the count will 
become 4. original count = 3 will become 6 after CROSS-JOIN and so on...
So, checking the count > 2, will be correct major to check if duplicate entry is present in the original table.

for the (b) X<Y, We should check whether the entries are present in the table where X1=Y2 and X2=Y1.
This can be done in 3 ways:
1. using CROSS-JOIN (as shown in SOLUTION-1) OR
2. using EXISTS clause (as shown in SOLUTION-2) OR
3. using CASE WHEN statement in HAVING clause (as shown in SOLUTION-3).


Solution-2: USING UNION & EXISTS (MySQL Query):

SELECT X, Y FROM (
SELECT X, Y FROM Functions WHERE X=Y GROUP BY X, Y HAVING COUNT(*)=2
UNION
SELECT f1.X, f1.Y FROM Functions f1 
WHERE f1.X < f1.Y 
AND EXISTS(SELECT f2.X, f2.Y FROM Functions f2 WHERE f1.X=f2.Y AND f1.Y=f2.X)
)t
ORDER BY X, Y;


NOTE: 
The EXISTS operator is used to test for the existence of any record in a subquery. The EXISTS operator returns
TRUE if the subquery returns one or more records..


Solution-3: USING CROSS JOIN & HAVING CASE WHEN (MySQL Query):

SELECT f1.X, f1.Y
FROM Functions f1, Functions f2
WHERE f1.X <= f1.Y
AND f1.X = f2.Y
AND f2.X = f1.Y
GROUP BY f1.X, f1.Y
HAVING count(CASE WHEN f1.X=f1.Y THEN f1.X END)>2
OR count(CASE WHEN f1.X<f1.Y THEN f1.X END)=1
ORDER BY f1.X, f1.Y;


NOTE: 

In SOLUTION-3, We have checked the count for X=Y should be >2 (instead of =2),
It's because, due to the usage of CROSS-JOIN there, if the count for a pair (X1,Y1) 
is 2 in the original table, after the CROSS-JOIN the count will become 4. original 
count = 3 will become 6 after CROSS-JOIN and so on...