-- 1.How many rows are in the names table?
SELECT COUNT(*)
FROM names;
-- answer: 1,957,046 rows


-- 2.How many total registered people appear in the dataset?
SELECT SUM(num_registered)
FROM names;
-- answer: The total registered people in the dataset is 351,653,025 

-- 3.Which name had the most appearances in a single year in the dataset?
SELECT name, num_registered, year
FROM names
ORDER BY num_registered DESC
LIMIT 1;
-- answer: Linda had the most appearances in 1947 with 99,689

-- 4.What range of years are included?
SELECT MIN(year), MAX(year)
FROM names;
--answer: There are 139 years from 1880 - 2018


-- 5.What year has the largest number of registrations?
SELECT *
FROM names
ORDER BY num_registered DESC
LIMIT 1;
-- answer: 1947 had the highest number of registrations with the name Linda.


-- 6.How many different (distinct) names are contained in the dataset?
SELECT DISTINCT name
FROM names;
-- answer: There are 98,400 distinct names 

-- 7.Are there more males or more females registered?
SELECT gender, SUM(num_registered)
FROM names 
GROUP BY gender;
--Answer: Yes there are more males registered with 177,573,793 and females were 174,079,232


-- 8.What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, gender, SUM(num_registered) 
FROM names 
GROUP BY name, gender
ORDER BY SUM DESC;
 -- answer: The most popular male name is James and the most popular female name is Mary  
 
 
-- 9.What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, gender, SUM(num_registered)
FROM names
WHERE year BETWEEN 2000 and 2009
GROUP BY name, gender
ORDER BY SUM DESC;
--answer: In the first decade of the 2000s, The most popular male and female names were Jacob & Emily

--10.Which year had the most variety in names (i.e. had the most distinct names)?
SELECT COUNT(DISTINCT name), year
FROM names
GROUP BY year
ORDER BY count DESC;
--Answer: 2008


-- 11.What is the most popular name for a girl that starts with the letter X?
SELECT name, gender, num_registered
FROM names
WHERE name like 'X%' AND gender = 'F'
ORDER BY num_registered DESC;
--answer: The most popular name for a girl that begins with the letter X is Ximena


-- 12.How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT name
FROM names
WHERE name like 'Q%' AND name NOT LIKE '_u%'
GROUP BY name;
--answer: There are 46 distinct names that begin with Q and the second letter of the name is not u.


/* 13.Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question. */
SELECT SUM(num_registered), name
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name
ORDER BY SUM DESC;
--answer: The most popular spelling is Steven with 128,951 compared to Stephen with 860972

/* 14.What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?*/
SELECT name, COUNT(DISTINCT gender)
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) = 2
ORDER BY name; 

SELECT DISTINCT NAME
FROM names;
--another way to do question 14
WITH NameCounts AS (
  SELECT name, COUNT(DISTINCT gender) AS GenderCount
  FROM names
  GROUP BY name
)

SELECT COUNT(*) AS UnisexNamesCount,
       (COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT name) FROM NameCounts)) AS PercentageUnisex
FROM NameCounts
WHERE GenderCount = 2;


--ANSWER: 10773/98400 = 10.94%

-- 15.How many names have made an appearance in every single year since 1880?
SELECT name, COUNT(DISTINCT year) 
FROM names
GROUP BY name
HAVING COUNT (DISTINCT year) = 139;
--Answer: There are 921 names that have appeared every year since 1880

-- 16.How many names have only appeared in one year?
SELECT name, COUNT(DISTINCT year)
FROM names
GROUP BY name
HAVING COUNT (DISTINCT year) = 1;
--Answer: There are 21,123 names that have appeared only once since 1880

-- 17.How many names only appeared in the 1950s?
SELECT name, COUNT(DISTINCT(name))
FROM names
GROUP BY name
HAVING MAX(year)<=1959 AND MIN(year) >= 1950;
-- Answer: 661

-- 18.How many names made their first appearance in the 2010s?
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 2010

--Answer: 11270

-- 19.Find the names that have not be used in the longest.
SELECT name
FROM names
GROUP BY name
ORDER BY MAX(year);
--answer: Roll & Zilpah 
-- 20.Come up with a question that you would like to answer using this dataset. Then write a query  --to answer this question.