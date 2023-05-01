Solution-1: Using CROSS JOIN, DATEDIFF & SUB-QUERY (MySQL Query):

SELECT s.Proj_Start_Date, min(e.Proj_End_Date) as Real_Proj_End_Date 
FROM
(SELECT Start_Date as Proj_Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) s,
(SELECT End_Date as Proj_End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) e
WHERE s.Proj_Start_Date < e.Proj_End_Date
GROUP BY s.Proj_Start_Date
ORDER BY DATEDIFF(min(e.Proj_End_Date), s.Proj_Start_Date) ASC, s.Proj_Start_Date ASC;


NOTE: 
Table s will give all the Start_Dates of the project
LOGIC: All the Start_Dates which are not present in column End_Date are the Start_Date of the Project.

Table e will give all the End_Dates of the project
LOGIC: All the End_Dates which are not present in column Start_Date are the End_Date of the Project.

After applying cross_join on table s and e, you will get all possible combinations of Proj_Start_Date & Proj_End_Date. 
(i.e. you will get multiple Proj_End_Dates for each Proj_Start_Date)

But, Well select the min(Proj_End_Date) as a valid/acceptable End_Date of the project and will neglect all other End_Dates
for the given Start_Date of the Project.
Reason: As given in the question, if the tasks End_Dates are consecutive, then only we will consider those tasks in the same project.

We have to apply GROUP BY Proj_Start_Date to get min(Proj_End_Date)

Use DATEDIFF function to calculate the difference between project end_date and project start_date

Apply ORDER BY on above DATEDIFF and Proj_Start_Date.



Solution-2: Using CROSS JOIN, DATEDIFF & SUB-QUERY (MySQL Query):

SELECT s.Proj_Start_Date, min(e.Proj_End_Date) as Real_Proj_End_Date 
FROM (SELECT Start_Date as Proj_Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) s
CROSS JOIN (SELECT End_Date as Proj_End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) e
WHERE s.Proj_Start_Date < e.Proj_End_Date
GROUP BY s.Proj_Start_Date
ORDER BY DATEDIFF(min(e.Proj_End_Date), s.Proj_Start_Date) ASC, s.Proj_Start_Date ASC;


NOTE: 
Table s will give all the Start_Dates of the project
LOGIC: All the Start_Dates which are not present in column End_Date are the Start_Date of the Project.

Table e will give all the End_Dates of the project
LOGIC: All the End_Dates which are not present in column Start_Date are the End_Date of the Project.

After applying cross_join on table s and e, you will get all possible combinations of Proj_Start_Date & Proj_End_Date. 
(i.e. you will get multiple Proj_End_Dates for each Proj_Start_Date)

But, Well select the min(Proj_End_Date) as a valid/acceptable End_Date of the project and will neglect all other End_Dates 
for the given Start_Date of the Project.
Reason: As given in the question, if the tasks End_Dates are consecutive, then only we will consider those tasks in the same project.

We have to apply GROUP BY Proj_Start_Date to get min(Proj_End_Date)

Use DATEDIFF function to calculate the difference between project end_date and project start_date

Apply ORDER BY on above DATEDIFF and Proj_Start_Date.