-- 1.How many rows are in the names table?
SELECT *
FROM names;
-- answer: 1,957,046 rows


-- 2.How many total registered people appear in the dataset?
SELECT 
SUM(num_registered)
FROM names;
-- answer: The total registered people in the dataset is 351,653,025 


-- 3.Which name had the most appearances in a single year in the dataset?
SELECT *
FROM names
ORDER BY num_registered DESC
LIMIT 1;
-- answer: Linda had the most appearances in a single year


-- 4.What range of years are included?
SELECT DISTINCT year
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
-- SELECT gender, SUM(num_registered) 
-- FROM names 
-- GROUP BY gender;
 
 
-- 9.What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?


-- 10.Which year had the most variety in names (i.e. had the most distinct names)?

-- 11.What is the most popular name for a girl that starts with the letter X?

-- 12.How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

/* 13.Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question. */

/* 14.What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?*/

-- 15.How many names have made an appearance in every single year since 1880?

-- 16.How many names have only appeared in one year?

-- 17.How many names only appeared in the 1950s?

-- 18.How many names made their first appearance in the 2010s?

-- 19.Find the names that have not be used in the longest.

-- 20.Come up with a question that you would like to answer using this dataset. Then write a query  --to answer this question.