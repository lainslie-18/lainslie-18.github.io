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

/*
List each country name where the population is larger than that of 'Russia'.
 */
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
 */
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > 
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom')  

/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
 */
SELECT name, continent FROM world
WHERE continent IN
(SELECT continent FROM world
WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

/*
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
 */
SELECT name, population FROM world
WHERE population > 
(SELECT population FROM world
WHERE name = 'Canada')
AND population <
(SELECT population FROM world
WHERE name = 'Poland')

/*
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
The format should be Name, Percentage 
 */
SELECT name, CONCAT(ROUND((population /
(SELECT population FROM world
WHERE name = 'Germany') * 100)), '%') AS percentage
FROM world
WHERE continent = 'Europe'

/*
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
 */
SELECT name
FROM world
WHERE GDP > 
ALL(SELECT GDP FROM world
WHERE continent = 'Europe'
AND GDP > 0)

/*
Find the largest country (by area) in each continent, show the continent, the name and the area:
 */
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0)

/*
List each continent and the name of the country that comes first alphabetically.
 */
SELECT continent, name FROM world x
WHERE name <=
ALL(SELECT name FROM world y
WHERE y.continent=x.continent)
ORDER BY continent, name

/*
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
 */
SELECT name, continent, population FROM world x
WHERE 25000000 >=
ALL(SELECT population FROM world y
WHERE y.continent=x.continent
AND population >0)

/*
Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
 */
SELECT name, continent FROM world x
WHERE population >
ALL(SELECT population * 3 FROM world y
WHERE y.continent=x.continent
AND y.name != x.name)

/*
List all the continents - just once each.
 */
 SELECT DISTINCT continent FROM world

 /*
Give the total GDP of Africa
 */
SELECT SUM(GDP) FROM world
WHERE continent = 'Africa'

 /*
How many countries have an area of at least 1000000
 */
SELECT COUNT(name) FROM world
WHERE area >= 1000000


 /*
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
 */
SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

 /*
For each continent show the continent and number of countries.
 */
SELECT continent, COUNT(name) as num_countries
FROM world
GROUP BY continent

 /*
For each continent show the continent and number of countries with populations of at least 10 million.
 */
SELECT continent, COUNT(name) as num_countries
FROM world
WHERE population >= 10000000
GROUP BY continent

 /*
List the continents that have a total population of at least 100 million.
 */
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000