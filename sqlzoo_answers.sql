-- 6 JOIN
-- 1.
SELECT matchid, player
FROM goal 
  WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;
-- 3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'
-- 4.
SELECT team1, team2, player
FROM game JOIN goal on (id=matchid)
WHERE player LIKE 'Mario%';
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid=id
 WHERE gtime<=10
-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON team1=eteam.id
WHERE coach = 'Fernando Santos'
-- 7.
SELECT player
FROM game JOIN goal ON id=matchid
WHERE stadium = 'National Stadium, Warsaw'
-- 8. - Skip this one

-- 9.
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
-- 10.
SELECT stadium, COUNT(player) AS goals
FROM game
JOIN goal ON (id=matchid)
GROUP BY stadium
-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962
-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'
-- 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr
-- 4.
SELECT id
FROM actor
WHERE name LIKE 'Glenn Close'
-- 5.
SELECT id
FROM movie
WHERE title = 'Casablanca'
-- 6.
SELECT name
FROM casting
JOIN actor ON actorid=id
WHERE movieid = 11768
-- 7.
SELECT name
FROM casting
JOIN actor ON actorid=id
WHERE movieid = 10522
-- 8.
SELECT title
FROM movie
  JOIN casting ON id=movieid and actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')
-- 9.

-- 10.

-- 11.

-- 12.

-- 13.

-- 14.

-- 15.


-- 8 Using Null
-- 1.
SELECT name
FROM teacher
WHERE dept IS NULL
-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
-- 3.
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id)
-- 4.
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher
-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
ON teacher.dept = dept.id
-- 7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name
-- 9.
SELECT teacher.name, CASE WHEN dept.id=1
THEN 'Sci'
WHEN dept.id=2
THEN 'Sci'
ELSE 'Art' END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 10.
SELECT teacher.name, CASE WHEN dept.id=1
THEN 'Sci'
WHEN dept.id=2
THEN 'Sci'
WHEN dept.id=3 
THEN 'Art'
ELSE 'None'
END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)


-- 8+ Numeric Examples
-- 1.
SELECT COUNT(name)
FROM stops
-- 2.
SELECT id
FROM stops
WHERE name = 'Craiglockhart'
-- 3.
SELECT id, name
FROM stops JOIN route
ON id=stop
WHERE company = 'LRT' AND num = 4
-- 4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
-- 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149
-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name = 'London Road'
-- 7.
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop =137
-- 8.

