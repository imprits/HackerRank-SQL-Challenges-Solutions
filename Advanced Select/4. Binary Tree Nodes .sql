# Author: imprits
Solution-1: Using CASE WHEN Statement (MySQL Query):

SELECT N,
CASE
   WHEN P IS NULL THEN 'Root'
   WHEN (SELECT COUNT(*) FROM BST WHERE B.N=P)>0 THEN 'Inner'
   ELSE 'Leaf'
END AS PLACE
FROM BST B
ORDER BY N;

NOTE: 

Parent for Root Node is Null.
Any node which is the parent node of other nodes is an Inner node
All remaining nodes are Leaf nodes. 


Solution-2: Using IF Statement (MySQL Query):

SELECT N,
  IF( P IS NULL, 'Root', 
     IF ((SELECT COUNT(*) FROM BST WHERE B.N = P) > 0, 'Inner', 'Leaf')
    ) AS PLACE
FROM BST B
ORDER BY N;

NOTE: 

Parent for Root Node is Null.
Any node which is the parent node of other nodes is an Inner node
All remaining nodes are Leaf nodes. 