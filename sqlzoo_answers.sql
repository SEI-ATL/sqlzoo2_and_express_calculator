-- 6 JOIN
-- 1. SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER'

-- 2. SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

-- 3. SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4. SELECT team1, team2, player FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5. SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam on (teamid=id)
WHERE gtime<=10

-- 6. SELECT mdate,teamname FROM game
JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos'

-- 7. SELECT player FROM goal
JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw'

-- 8. - Skip this one

-- 9. SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10. SELECT stadium, COUNT(*) FROM goal
JOIN game ON (matchid = id)
GROUP BY stadium

-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
-- 1. SELECT id, title
FROM movie
WHERE yr=1962

-- 2. SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3. SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- 4. SELECT id FROM actor
WHERE name = 'Glenn Close'

-- 5. SELECT id FROM movie
WHERE title = 'Casablanca'

-- 6. SELECT name FROM casting JOIN actor ON (id=actorid)
WHERE movieid=11768

-- 7. SELECT name FROM casting
JOIN actor ON (actor.id=actorid)
JOIN movie ON (movie.id=movieid)
WHERE title = 'Alien'

-- 8. SELECT title FROM casting
JOIN actor ON (actor.id=actorid)
JOIN movie ON (movie.id=movieid)
WHERE name = 'Harrison Ford'

-- 9. SELECT title FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE name = 'Harrison Ford'  AND ord > 1

-- 10. SELECT title, name FROM casting
JOIN movie ON (movie.id = movieid)
JOIN actor ON (actor.id = actorid)
WHERE yr = 1962 and ord = 1

-- 11. SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. SELECT title, name FROM casting
JOIN movie ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1
AND movie.id IN
(SELECT movie.id FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE actor.name = 'Julie Andrews')


-- 13. SELECT DISTINCT name FROM casting
JOIN movie ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE actorid IN (
SELECT actorid FROM casting
WHERE ord = 1
GROUP BY actorid
HAVING COUNT(actorid) >= 15)
ORDER BY name

-- 14. SELECT title, COUNT(actorid) FROM casting
JOIN movie ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid), title
/* #14 is incorrect, could not figure it out */

-- 15. SELECT DISTINCT name FROM casting
JOIN actor ON actorid = actor.id
WHERE name != 'Art Garfunkel'
AND movieid IN (
SELECT movieid
FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Art Garfunkel'
)


-- 8 Using Null
-- 1. SELECT name FROM teacher
WHERE dept IS NULL

-- 2. SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)

-- 3. SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id)

-- 4. SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)

-- 5. SELECT teacher.name, COALESCE(teacher.mobile,'07986 444 2266')  FROM teacher

-- 6. SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id

-- 7. SELECT COUNT(name), COUNT(mobile) FROM teacher

-- 8. SELECT dept.name, COUNT(teacher.dept) FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name

-- 9. SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
ELSE 'Art'
END
FROM teacher

-- 10. SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None'
END
FROM teacher



-- 8+ Numeric Examples
-- 1. SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science';

-- 2. SELECT institution, subject
FROM nss
WHERE question='Q15'
AND score >= 100;

-- 3.  SELECT institution,score
FROM nss
WHERE question='Q15'
AND score < 50
AND subject='(8) Computer Science';

-- 4. SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 5. SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 6. SELECT subject, 
ROUND(SUM(response * A_STRONGLY_AGREE / 100) / SUM(response) * 100, 0)
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 7. SELECT institution, ROUND(SUM(score *  response) / SUM(response), 0)
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;

-- 8. SELECT institution, SUM(sample), (SELECT sample FROM nss y
WHERE subject='(8) Computer Science'
AND x.institution = y.institution
AND question='Q01') AS comp
FROM nss x
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
GROUP BY institution;

