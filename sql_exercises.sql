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
