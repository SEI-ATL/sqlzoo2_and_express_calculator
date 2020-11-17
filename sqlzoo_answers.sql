-- 6 JOIN
-- 1.
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER'
-- 2.
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012
-- 3.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON id = matchid
WHERE teamid = 'GER'
-- 4.
SELECT team1, team2, player
FROM game JOIN goal ON id = matchid
WHERE player LIKE 'Mario%'
-- 5.
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid = id
WHERE gtime <= 10
-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos'
-- 7.
SELECT player
FROM goal JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'
-- 8. - Skip this one
-- 9.
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id = teamid
GROUP BY teamname
-- 10.
SELECT stadium, COUNT(player)
FROM game JOIN goal ON id = matchid
GROUP BY stadium
-- 11. - Skip this one
-- 12. - Skip this one
-- 13. - Skip this one

-- 7 More JOIN operations
-- 1.
SELECT id, title
FROM movie
WHERE yr = 1962
-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'
-- 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr
-- 4.
SELECT id
FROM actor
WHERE name = 'Glenn Close'
-- 5.
SELECT id
FROM movie
WHERE title = 'Casablanca'
-- 6.
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movieid =
(SELECT id
FROM movie
WHERE title = 'Casablanca')
-- 7.
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movieid =
(SELECT id
FROM movie
WHERE title = 'Alien')
-- 8.
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
-- 9.
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord <> 1
-- 10.
SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962
AND ord = 1
-- 11.
SELECT yr, COUNT(title)
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
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
FROM teacher
INNER JOIN dept ON teacher.dept = dept.id
-- 3.
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id
-- 4.
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher
-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id
-- 7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM dept
LEFT JOIN teacher ON dept.id = teacher.dept
GROUP BY dept.name
-- 9.
SELECT name,
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
ELSE 'Art'
END
FROM teacher
-- 10.
SELECT name,
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None'
END
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