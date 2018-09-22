SELECT n, CASE 
            WHEN p IS NULL THEN "Root"
            WHEN n in (SELECT p from bst) THEN " Inner"
            ELSE "Leaf"
            END from bst order by n ASC 
            