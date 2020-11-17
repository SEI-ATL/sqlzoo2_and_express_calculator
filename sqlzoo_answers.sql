-- 6 JOIN
-- 1.
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012
-- 3.
SELECT o.player, o.teamid, a.stadium, a.mdate
FROM game a
JOIN goal o
ON a.id = o.matchid
WHERE o.teamid = 'GER'
-- 4.
SELECT a.team1, a.team2, o.player
FROM game a
JOIN goal o
ON a.id = o.matchid
WHERE player LIKE 'Mario%'
-- 5.
SELECT o.player, o.teamid, e.coach, o.gtime
FROM goal o
JOIN eteam e
ON o.teamid = e.id
WHERE gtime<=10
-- 6.

-- 7.
SELECT o.player
FROM goal o
JOIN game a
ON o.matchid = a.id
WHERE a.stadium = 'National Stadium, Warsaw'
-- 8. - Skip this one

-- 9.
SELECT e.teamname, COUNT(o.matchid)
FROM eteam e
JOIN goal o
ON e.id = o.teamid
GROUP BY e.teamname 
-- 10.
SELECT a.stadium, COUNT(o.matchid)
FROM game a
JOIN goal o
ON a.id = o.matchid
GROUP BY a.stadium
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
WHERE title LIKE ('Star Trek%')
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
SELECT a.name
FROM actor a
JOIN casting c
ON a.id = c.actorid
WHERE c.movieid = 11768
-- 7.
SELECT a.name
FROM actor a
JOIN casting c
ON a.id = c.actorid
WHERE c.movieid = (SELECT id
FROM movie
WHERE title = 'Alien')
-- 8.
SELECT m.title
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE name = 'Harrison Ford'
-- 9.
SELECT m.title
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE name = 'Harrison Ford'
AND c.ord > 1
-- 10.
SELECT m.title, a.name
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE c.ord = 1
AND m.yr = 1962
-- 11.
SELECT m.yr, COUNT(m.title)
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a .id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.
SELECT m.title, a.name
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE c.ord = '1'
AND c.movieid IN (SELECT c.movieid
FROM casting c
JOIN actor a
ON c.actorid = a.id
WHERE name = 'Julie Andrews')
-- 13.
SELECT a.name
FROM actor a
JOIN casting c
ON a.id = c.actorid
WHERE c.ord = '1'
GROUP BY a.name
HAVING COUNT(c.ord) > 14
-- 14.
SELECT m.title, COUNT(c.actorid)
FROM movie m
JOIN casting c
ON m.id = c.movieid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY COUNT(c.ord) DESC, m.title ASC
-- 15.
SELECT a.name
FROM actor a
JOIN casting c
ON a.id = c.actorid
JOIN movie m
ON c.movieid = m.id
WHERE c.movieid IN (SELECT
c.movieid
FROM casting c
JOIN actor a
ON c.actorid = a.id
WHERE a.name = 'Art Garfunkel')
AND name NOT IN ('Art Garfunkel')

-- 8 Using Null
-- 1.
SELECT name
FROM teacher
WHERE dept IS NULL
-- 2.
SELECT t.name, d.name
FROM teacher t
INNER JOIN dept d
ON t.dept = d.id
-- 3.
SELECT t.name, d.name
FROM teacher t
LEFT JOIN dept d
ON t.dept = d.id
-- 4.
SELECT t.name, d.name
FROM teacher t
RIGHT JOIN dept d
ON t.dept = d.id
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher
-- 6.
SELECT t.name, COALESCE(d.name, 'None')
FROM teacher t
LEFT JOIN dept d
ON t.dept = d.id
-- 7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher
-- 8.
SELECT d.name, COUNT (t.name)
FROM teacher t
RIGHT JOIN dept d
ON t.dept = d.id
GROUP BY d.name
-- 9.
SELECT name, CASE
WHEN dept = 1
OR dept = 2
THEN 'Sci'
WHEN dept IS NULL
THEN 'Art'
END
FROM teacher
-- 10.
SELECT name, CASE
WHEN dept = 1
OR dept = 2
THEN 'Sci'
WHEN dept = 3
THEN 'Art'
WHEN dept IS NULL
THEN 'None'
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

