1. 
SELECT name, continent, population FROM world

2.
SELECT name
FROM world
WHERE population > 200000000

3.
SELECT name, gdp/population
FROM world
WHERE population > 200000000

4.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

5.
SELECT name, population
FROM world
where name = 'France' OR name = 'Germany' OR name = 'Italy'

6.
SELECT name 
FROM world
WHERE name LIKE '%United%'

7.
SELECT name, population, area
FROM world
WHERE population > 250000000 OR area > 3000000

8.
SELECT name, population, area 
FROM world
WHERE (area < 3000000 AND population > 250000000) OR (area > 3000000 AND population < 250000000)

9. 
SELECT name, ROUND(population/1000000, 2) AS population, ROUND(gdp/1000000000, 2) AS gdp
FROM world
WHERE continent = 'South America'

10.
SELECT name, ROUND(gdp/population/1000, 0) * 1000
FROM world
WHERE gdp >= 1000000000000

11.
SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital)

12.
SELECT name, capital
FROM world
WHERE  LEFT(name,1) = LEFT(capital,1) AND name <> capital


13.
SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND  name LIKE '%u%' 
AND name NOT LIKE '% %'


-- select from Noble
1.
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

2.
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine') 

3.
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

4.
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

5.
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')



-- SELECT IN SELECT

1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2.
SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')