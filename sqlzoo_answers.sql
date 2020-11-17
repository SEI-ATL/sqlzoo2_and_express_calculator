--FROM MY SUBMISSION TO THIS WEEKENDS HW:

-- 6 JOIN
-- 1.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012
-- 3.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4.
SELECT team1, team2, player FROM game 
JOIN goal ON matchid=id 
WHERE player LIKE 'Mario %'
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10
-- 6.
SELECT mdate, teamname
FROM game JOIN eteam on eteam.id = team1
WHERE coach = 'Fernando Santos'
-- 7.
SELECT player FROM goal JOIN game ON (id=matchid)
WHERE stadium='National Stadium, Warsaw'
-- 8.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid <> 'GER' AND (team1 ='GER' OR team2 = 'GER')
-- 9.
SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
-- 10.
SELECT stadium, COUNT(stadium)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
-- 11.
SELECT matchid, mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY mdate, matchid
ORDER BY matchid
-- 12.
SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON (matchid=id)
WHERE (teamid='GER')
GROUP BY matchid, mdate
-- 13.
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2



-- 7 More JOIN operations
-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962
-- 2.
SELECT yr FROM movie WHERE title='Citizen Kane'
-- 3.
SELECT id, title, yr FROM movie 
WHERE title LIKE '%Star Trek%'
ORDER BY yr
-- 4.
SELECT id FROM actor WHERE name='Glenn Close'
-- 5.
SELECT id FROM movie WHERE title='Casablanca'
-- 6.
SELECT name FROM actor JOIN casting ON actor.id=actorid WHERE movieid=11768
-- 7.
SELECT name FROM actor JOIN casting ON actor.id=actorid WHERE movieid=(SELECT id FROM movie WHERE title='Alien')
-- 8.
 SELECT DISTINCT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid= (SELECT actor.id FROM actor WHERE name='Harrison Ford')
-- 9.
 SELECT DISTINCT title FROM movie WHERE movie.id IN(SELECT movieid FROM casting JOIN actor ON actor.id=actorid WHERE actor.name='Harrison Ford' AND casting.ord <>1)
-- 10.
SELECT title, name FROM movie 
JOIN casting ON (movie.id=movieid) 
JOIN actor ON (actor.id=actorid) 
WHERE (yr=1962 AND casting.ord=1)
-- 11.
SELECT yr,COUNT(title) FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.
SELECT DISTINCT title, name FROM casting 
JOIN movie ON (movieid=movie.id)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
  SELECT movieid FROM actor JOIN casting on (actor.id=actorid)
  WHERE name='Julie Andrews') AND ord=1
-- 13.
SELECT name FROM actor JOIN casting ON (actor.id=actorid)
 WHERE ord=1 GROUP BY name
HAVING COUNT(movieid)>=15
-- 14.
SELECT title, COUNT(actorid) FROM movie 
JOIN casting ON (movie.id=movieid) 
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title
-- 15.
SELECT name FROM actor 
JOIN casting ON actor.id=actorid
JOIN movie ON movie.id=movieid
WHERE movie.id IN (
SELECT movieid FROM casting JOIN actor ON actorid=actor.id WHERE name='Art Garfunkel')
 AND name <> 'Art Garfunkel'

-- 8 Using Null
-- 1.
SELECT name FROM teacher WHERE dept IS NULL
-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)
-- 3.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
-- 4.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher 
-- 6.
SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
 LEFT JOIN dept ON dept=dept.id
-- 7.
SELECT COUNT(name), COUNT(mobile) FROM teacher 
-- 8.
SELECT dept.name, COUNT(teacher.name) FROM teacher 
RIGHT JOIN dept ON (dept.id=dept) 
GROUP BY dept.name
-- 9.
SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END 
FROM teacher

-- 10.
SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci' 
WHEN dept=3 THEN 'Art' ELSE 'None' END 
FROM teacher



-- 8+ Numeric Examples 
-- 1.
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 2.
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score>=100
-- 3.
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score < 50
   AND subject='(8) Computer Science'
-- 4.
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 5.
SELECT subject,SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 6.
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
-- 7.
SELECT institution, ROUND(SUM(response*score)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
-- 8.
SELECT institution,SUM(sample),SUM(CASE WHEN subject='(8) Computer Science' THEN nss.sample ELSE 0 END)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
