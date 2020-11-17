-------------- 6 JOIN

-- 1.
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER'

-- 2.
SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'

-- 3.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4.
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

-- 7.
SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw'

-- 8.
SELECT DISTINCT player
FROM game JOIN goal ON (matchid=id) 
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

-- 9.
SELECT teamname,COUNT(teamid)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10.
SELECT stadium, COUNT(teamid)
FROM game JOIN goal ON (matchid=id)
GROUP BY stadium 

-- 11.
SELECT matchid,mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid,mdate

-- 12.
SELECT matchid,mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid, mdate

-- 13. (I DIDNT GET THIS ONE TWO MUCH, I FOUND THIS ANSWER ONLINE)
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate,matchid,team1,team2



-------------- 7 MORE JOIN OPERATIONS

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
WHERE title LIKE '%Star%Trek%'
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
FROM casting JOIN actor
WHERE movieid=11768 AND actorid=actor.id

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
SELECT title
FROM movie, casting, actor
WHERE name='Harrison Ford' AND ord!='1'
AND movieid=movie.id
AND actorid=actor.id

-- 10.
SELECT title, name 
FROM movie, casting, actor
WHERE yr='1962'
AND movieid=movie.id
AND actorid=actor.id
AND ord=1

-- 11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12.
SELECT title, name
FROM movie JOIN casting ON (movieid = movie.id && ord = 1)
           JOIN actor ON (actorid = actor.id)
WHERE movie.id IN 
(SELECT movieid FROM casting
 WHERE actorid IN 
  (SELECT id FROM actor
    WHERE name = 'Julie Andrews'))

-- 13.
SELECT name
FROM actor JOIN casting ON (actorid = actor.id)
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15;

-- 14.
SELECT title, COUNT(actorid) 
FROM movie JOIN casting ON (movie.id = movieid) 
WHERE yr = 1978
GROUP BY title 
ORDER BY COUNT(actorid) DESC, title

-- 15.
SELECT name 
FROM actor JOIN casting ON (actor.id = actorid)
WHERE movieid IN (SELECT id FROM movie WHERE title IN
(SELECT title FROM movie JOIN casting ON (movie.id = movieid) 
WHERE actorid IN (SELECT id FROM actor 
WHERE name = 'Art Garfunkel'))) AND name != 'Art Garfunkel'

-------------- 8 USING NULL

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
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)

-- 10.
SELECT teacher.name,
CASE WHEN dept.id = 1 THEN 'Sci'
     WHEN dept.id = 2 THEN 'Sci'
     WHEN dept.id = 3 THEN 'Art'
     ELSE 'None' END
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)


-------------- 8+ NUMERIC EXAMPLES

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
SELECT institution, score
FROM nss
WHERE question='Q15'
AND score<50
AND subject = '(8) Computer Science'

-- 4.
SELECT subject,SUM(response)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject

-- 5.
SELECT subject, SUM((response*A_STRONGLY_AGREE)/100)
FROM nss
WHERE question = 'Q22'
GROUP BY subject HAVING subject 
IN('(8) Computer Science', '(H) Creative Arts and Design');

-- 6.
SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response) / SUM(response))
FROM nss
WHERE question='Q22'
GROUP BY subject
HAVING subject IN('(8) Computer Science',
'(H) Creative Arts and Design');

-- 7.
SELECT institution,ROUND(SUM(score * response)/SUM(response))
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution

-- 8.
SELECT institution, SUM(sample) AS sample_n, 
SUM(CASE WHEN subject = '(8) Computer Science' THEN sample
ELSE 0 END) AS computing_n
FROM nss
WHERE question='Q01' AND (institution LIKE '%Manchester%')
GROUP BY institution;