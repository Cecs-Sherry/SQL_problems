
  
-- 1
/*
Read the notes about this table. Observe the result of running a simple SQL command.
*/
SELECT name, continent, population
FROM world;

-- 2
/*
How to use WHERE to filter records.
Show the name for the countries that have a population 
of at least 200 million. 200 million is 200000000, there are eight zeros.
*/
SELECT name
FROM world
WHERE population >= 200000000;

-- Problem 3

SELECT name, gdp / population
FROM world
WHERE population >= 200000000;

-- Problem 4 

SELECT name, population / 1000000
FROM world
WHERE continent = 'South America';

-- Problem 5

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- Problem 6

SELECT name
FROM world
WHERE name LIKE 'United%';

-- Problem 7

SELECT  name, population, area
FROM world
WHERE population > 250000000 OR
      area > 3000000;

-- Problem 8 用XOR更方便

select name,population,area
from world
where area>3000000 xor population>250000000

-- Problem 9 
/*
Show the name and population in millions and the GDP 
in billions for the countries of the continent 'South America'. 
Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions to 2 decimal places.
*/
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2)
FROM world
WHERE  continent = 'South America';

-- Problem 10
/*  round的几种用法不要忘记
ROUND(7253.86, 0)    ->  7254
ROUND(7253.86, 1)    ->  7253.9
ROUND(7253.86,-3)    ->  7000

Show the name and per-capita GDP for those countries with a GDP of at 
least one trillion (1000000000000; that is 12 zeros). 
Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.
*/

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp>=1000000000000

-- Problem 11

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- Problem 12
/* 
1. 用到了LEFT方法， 用于显示字符s前n位 2, 使用了<>表示不相等
LEFT(s,n) allows you to extract n characters from the start of the string s.

   LEFT('Hello world', 4) -> 'Hell'    

Show the name and the capital where the first letters of each match. 
don't include countries where the name and the capital are the same word.
*/

SELECT name, capital
FROM world
WHERE name <> capital AND
      LEFT(name, 1) = LEFT(capital, 1);

-- Problem 13
/*
Find the country that has all the vowels and no spaces in its name.
*/
SELECT name
FROM world
WHERE name LIKE '%a%' AND
      name LIKE '%e%' AND
      name LIKE '%i%' AND
      name LIKE '%o%' AND
      name LIKE '%u%' AND
      name NOT LIKE '% %';
