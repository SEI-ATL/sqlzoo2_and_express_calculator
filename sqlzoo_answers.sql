-- 6 JOIN
-- 1.
SELECT matchid, player FROM goal WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012
-- 3.
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'
-- 4.
SELECT team1, team2, player FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%'
-- 5.
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON (teamid=id) WHERE gtime <=10
-- 6.
SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id) WHERE coach = 'Fernando Santos'
-- 7.
SELECT player FROM goal JOIN game ON (id=matchid) WHERE stadium = 'National Stadium, Warsaw'
-- 8.
SELECT DISTINCT(player) FROM goal JOIN game ON (id=matchid) WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER')
-- 9.
SELECT teamname, COUNT(player) FROM eteam JOIN goal ON id=teamid GROUP BY teamname
-- 10.
SELECT stadium, COUNT(stadium) FROM game JOIN goal ON id=matchid GROUP BY stadium
-- 11.
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON (matchid=id) WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate
-- 12.
SELECT matchid, mdate, COUNT(teamid) FROM game JOIN goal ON (matchid=id) WHERE teamid = 'GER' GROUP BY matchid, mdate
-- 13.



-- 7 More JOIN operations
-- 1.
SELECT id, title FROM movie WHERE yr=1962
-- 2.
SELECT yr FROM movie WHERE title = 'Citizen Kane'
-- 3.
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr
-- 4.
SELECT id FROM actor WHERE name = 'Glenn Close'
-- 5.
SELECT id FROM movie WHERE title = 'Casablanca'
-- 6.
SELECT name FROM actor JOIN casting ON (actorid=id) WHERE movieid = 11768
-- 7.
SELECT name FROM actor JOIN casting ON (actor.id=actorid) JOIN movie ON (movie.id=movieid) WHERE title = 'Alien'

-- 8.
SELECT title FROM movie JOIN casting ON (movie.id=movieid) JOIN actor ON (actor.id=actorid) WHERE name = 'Harrison Ford'
-- 9.
SELECT title, name FROM movie JOIN casting ON (movie.id=movieid) JOIN actor ON (actor.id=actorid) WHERE yr = 1962 AND ord = 1
-- 10.
SELECT title FROM movie JOIN casting ON (movie.id=movieid) JOIN actor ON (actor.id=actorid) WHERE name = 'Harrison Ford' AND ord != 1
-- 11.
SELECT yr, COUNT(title) FROM
  movie JOIN casting ON (movie.id=movieid)
        JOIN actor   ON (actorid=actor.id)
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.
SELECT title, name FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
WHERE ord = 1 AND movieid IN
(SELECT movieid FROM casting
JOIN actor ON (actor.id=actorid)
WHERE name='Julie Andrews')
-- 13.
SELECT name FROM actor
JOIN casting ON (actor.id=actorid)
WHERE actorid IN (SELECT actorid FROM casting WHERE ord = 1 GROUP BY actorid HAVING COUNT(actorid) > 15) GROUP BY name
-- 14.

-- 15.


-- 8 Using Null
-- 1.
SELECT name FROM teacher WHERE dept IS NULL
-- 2.
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)
-- 3.
SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 4.
SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher
-- 6.
SELECT COALESCE(teacher.name, 'None'), COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 7.
SELECT COUNT(teacher.name), COUNT(mobile) FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id) GROUP BY dept.name
-- 9.
SELECT teacher.name, CASE WHEN dept=1 THEN 'Sci' WHEN dept=2 THEN 'Sci' ELSE 'Art' END
FROM teacher
-- 10.
SELECT teacher.name, CASE WHEN dept=1 THEN 'Sci' WHEN dept=2 THEN 'Sci' WHEN dept=3 THEN 'Art' Else 'None' END
FROM teacher


-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.
