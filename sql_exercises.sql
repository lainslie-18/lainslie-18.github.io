# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

select distinct city from station
where city regexp '^[aeiou]' and city regexp'[aeiou]$';

/*
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/

select distinct city from station
where city not regexp '^[aeiou]';

/*
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/

select distinct city from station
where city not regexp '[aeiou]$';

/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/

select distinct city from station
where city not regexp '^[aeiou]' or city not regexp '[aeiou]$';

/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/

select distinct city from station
where city not rlike '^[aeiou]'  and city not rlike '[aeiou]$';

/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

select name from students
where marks > 75
order by substr(name, -3), ID;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/

select name from employee
order by name;

/*
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/

select concat(name,
    (case
        when occupation = 'Actor' then '(A)'
        when occupation = 'Doctor' then '(D)'
        when occupation = 'Professor' then '(P)'
        when occupation = 'Singer' then '(S)'
        end)) as name
from occupations
order by name;

select 'There are a total of', count(occupation), concat(lower(occupation), 's.') as occupation
from occupations
group by occupation
order by count(occupation);

/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
*/

select name from employee
where salary > 2000 and
months < 10;

-- Query a count of the number of cities in CITY having a Population larger than 100,000

select count(name) from city
where population > 100000;


/*
Query the total population of all cities in CITY where District is California.
*/
select sum(population) from city
where district = 'California';

/*
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
*/
select * from city
where countrycode = "USA"
and population > 100000;

/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 Truncate your answer to 4 decimal places.
*/
select round(max(lat_n), 4) from station
where lat_n < 137.2345;

/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 Round your answer to 4 decimal places.
*/
select round(long_w,4) from station 
where lat_n = (select max(lat_n) from station
                where lat_n < 137.2345);

/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 Round your answer to 4 decimal places.
*/
select round(min(lat_n),4) from station
where lat_n > 38.7780;

/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 Round your answer to 4 decimal places.
*/
select round(long_w, 4) from station
where lat_n = (select min(lat_n) from station
                where lat_n > 38.7780);

/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/
select round(max(lat_n) - min(lat_n) + max(long_w) - min(long_w), 4) 
from station;

/*
Change the query shown so that it displays Nobel prizes for 1950.
*/
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

 /*
 Show who won the 1962 prize for Literature.
 */
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

 /*
Show the year and subject that won 'Albert Einstein' his prize.
 */
SELECT yr, subject 
FROM nobel
WHERE winner = 'Albert Einstein'

 /*
Give the name of the 'Peace' winners since the year 2000, including 2000.
 */
SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

 /*
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
 */
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989

 /*
Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
 */
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                    'Woodrow Wilson',
                    'Jimmy Carter', 
                    'Barack Obama')

 /*
Show the winners with first name John
 */
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

/*
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
 */
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics' AND yr = '1980'
OR subject = 'Chemistry' AND yr = '1984'

/*
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
 */
SELECT yr, subject, winner FROM nobel
WHERE yr = '1980' AND subject NOT IN ('Chemistry', 'Medicine')

/*
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
 */
SELECT yr, subject, winner FROM nobel
WHERE subject = 'Medicine' AND yr < 1910
OR subject = 'Literature' and yr >= 2004

/*
Find all details of the prize won by PETER GRÜNBERG
 */
 SELECT * FROM nobel
WHERE winner = 'Peter Grünberg'

 /*
Find all details of the prize won by EUGENE O'NEILL
 */
SELECT * FROM nobel
WHERE winner = 'Eugene O\'Neill'
'
 /*
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
 */
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

 /*
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
 */
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner
