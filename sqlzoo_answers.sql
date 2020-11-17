-- 6 JOIN
-- 1.
SELECT matchid, player 
 FROM goal
   WHERE teamid LIKE 'GER'
-- 2.
SELECT id,stadium,team1,team2
 FROM game
WHERE id=1012

-- 3.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid='GER'

-- 4.
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- 6.
SELECT mdate,teamname
  FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

-- 7.
SELECT player
  FROM goal JOIN game ON (id=matchid)
 WHERE stadium = 'National Stadium, Warsaw'
-- 8. - Skip this one

-- 9.
SELECT teamname,COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
-- 10.
SELECT stadium,COUNT(1)
  FROM goal JOIN game ON id=matchid
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
WHERE title='Citizen Kane'

-- 3.
SELECT id,title, yr FROM movie
 WHERE title LIKE 'Star Trek%'
 ORDER BY yr

-- 4.
SELECT id FROM actor
  WHERE name= 'Glenn Close'

-- 5.
SELECT id 
FROM movie 
WHERE title='Casablanca'

-- 6.
unsure...
-- 7.
SELECT name
  FROM movie, casting, actor
  WHERE title='Alien'
    AND movieid=movie.id
    AND actorid=actor.id

-- 8.
SELECT title
  FROM movie, casting, actor
 WHERE name='Harrison Ford'
    AND movieid=movie.id
    AND actorid=actor.id
-- 9.
cant get this one to work
-- 10.
having trouble with this one
-- 11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
where name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12.
Having trouble here.
-- 13.
Having trouble here.
-- 14.
  SELECT title, COUNT(actorid)
  FROM casting,movie                
  WHERE yr=1978
        AND movieid=movie.id
  GROUP BY title
  ORDER BY 2 DESC,1 ASC

-- 15.
Unsure

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
FROM teacher 
LEFT JOIN dept ON (teacher.dept=dept.id)

-- 4.
SELECT teacher.name, dept.name
FROM teacher 
RIGHT JOIN dept ON (teacher.dept=dept.id)

-- 5.
SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher
-- 6.
SELECT teacher.name, COALESCE(dept.name,'None')
FROM teacher LEFT JOIN dept
ON teacher.dept=dept.id

-- 7.
SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher

-- 8.

-- 9.
SELECT name, CASE WHEN dept IN (1,2) 
THEN 'Sci'
ELSE 'Art' END
FROM teacher

-- 10.



-- 8+ Numeric Examples
-- 1.
SELECT response
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 2.
SELECT response
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 3.
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

