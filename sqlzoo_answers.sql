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

-- 12.

-- 13.

-- 14.

-- 15.

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

-- 8.

-- 9.

-- 10.

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

-- 6.

-- 7.

-- 8.