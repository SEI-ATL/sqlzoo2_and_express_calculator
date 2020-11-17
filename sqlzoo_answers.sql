-- 6 JOIN
-- 1.
SELECT matchid, player 
FROM goal
  WHERE teamid= 'ger'
-- 2.
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012
-- 3.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid AND teamid='ger')
-- 4.
SELECT team1, team2, player 
FROM game
JOIN goal ON (id=matchid AND player LIKE 'Mario%')
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal 
JOIN eteam ON (teamid=id AND gtime<=10)
-- 6.
SELECT mdate, teamname
FROM game
JOIN eteam ON (team1=eteam.id AND coach LIKE '%Santos')
-- 7.
SELECT player
FROM goal
JOIN game ON (id=matchid AND stadium = 'National Stadium, Warsaw')
-- 8. - Skip this one

-- 9.
SELECT teamname, COUNT(player)
FROM eteam
JOIN goal ON id=teamid
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
SELECT id,title,yr
FROM movie
WHERE title LIKE '%star trek%'
ORDER by yr
-- 4.
SELECT id
FROM actor
WHERE name = 'Glenn Close'
-- 5.
SELECT id 
FROM movie
WHERE title = 'casablanca'
-- 6.
SELECT name
FROM actor, casting
WHERE id=actorid AND movieid = (SELECT id FROM movie WHERE title = 'Casablanca')
-- 7.
SELECT name
FROM actor, casting
WHERE id=actorid AND movieid = (SELECT id FROM movie WHERE title = 'alien')
-- 8.
SELECT title
FROM movie
JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'))

-- 9.
SELECT title
FROM movie
JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1)

-- 10.
SELECT title, name
FROM movie JOIN casting ON (id=movieid)
JOIN actor ON (actor.id = actorid)
WHERE ord=1 AND  yr = 1962
-- 11.
SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c 
FROMmovie JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
 GROUP BY yr) AS t)
-- 12.
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')
-- 13.
SELECT name
FROM actor
JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name
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
SELECT name,
COALESCE(mobile, '07986 444 2266')
FROM teacher
-- 6.
SELECT COALESCE(teacher.name, 'NONE'), COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
GROUP BY dept.name
-- 9.
SELECT teacher.name,
CASE WHEN dept.id = 1 THEN 'Sci'
WHEN dept.id = 2 THEN 'Sci'
ELSE 'Art' END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 10.
SELECT teacher.name,
CASE
WHEN dept.id = 1 THEN 'Sci'
WHEN dept.id = 2 THEN 'Sci'
WHEN dept.id = 3 THEN 'Art'
ELSE 'None' END
FROM teacher LEFT JOIN dept ON (dept.id=teacher.dept)


-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

