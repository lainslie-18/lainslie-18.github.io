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

