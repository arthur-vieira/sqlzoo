--1. The example uses a WHERE clause to show the population of 'France'. Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany';

--2. The query shows the name and population density for each country where the area is over 5,000,000 km2. 
--Modify it to show the name and per capita gdp: gdp/population for each country where the area is over 5,000,000 km2

SELECT name, gdp/population FROM world
  WHERE area > 5000000;

--3. Show the name and the population for 'Ireland', 'Iceland' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Ireland', 'Iceland', 'Denmark');

--4. The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
