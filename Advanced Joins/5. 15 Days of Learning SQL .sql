Solution-1: USING SUB-QUERY, DATEDIFF (MySQL Query):

SELECT SUBMISSION_DATE,
       (SELECT Count(DISTINCT hacker_id) as no_of_unique_hacker_id FROM submissions S2
        WHERE  S2.submission_date = S1.submission_date
        AND (SELECT Count(DISTINCT S3.submission_date)
             FROM   submissions S3
             WHERE  S3.hacker_id = S2.hacker_id
             AND S3.submission_date < S1.submission_date
	    ) = Datediff(S1.submission_date, '2016-03-01')
       ) AS NO_OF_UNIQUE_HACKERS,
       (SELECT hacker_id FROM submissions S2
        WHERE  S2.submission_date = S1.submission_date
        GROUP  BY hacker_id
        ORDER  BY Count(submission_id) DESC, hacker_id ASC LIMIT  1
       ) AS MAX_SUB_HACKER_ID,
       (SELECT name FROM hackers
        WHERE  hacker_id = MAX_SUB_HACKER_ID
       ) AS NAME
FROM   (SELECT DISTINCT submission_date FROM submissions) S1
GROUP BY submission_date;


NOTE: 

SUBMISSION_DATE, MAX_SUB_HACKER_ID &  NAME are easy to understand from the above code itself.

The complex part is to get the NO_OF_UNIQUE_HACKERS, If Count(DISTINCT S3.submission_date) is matched
with Datediff(S1.submission_date, '2016-03-01') then we can say, the hacker has made the submission each day.

DISTINCT is used to get the unique records from the given column.

DATEDIFF is used to calculate the difference between 2 dates.