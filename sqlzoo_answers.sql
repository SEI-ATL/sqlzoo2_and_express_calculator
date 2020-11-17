-- 6 JOIN
-- 1.
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';
-- 2.
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;
-- 3.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM goal
JOIN game ON (game.id=goal.matchid)
WHERE teamid = 'GER'
-- 4.
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON (goal.matchid = game.id)
WHERE player LIKE 'Mario%';
-- 5.
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10;
-- 6.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos';
-- 7.
SELECT goal.player
FROM goal
JOIN game ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw';
-- 8.
SELECT DISTINCT goal.player
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE (game.team1='GER' OR game.team2='GER')
AND teamid != 'GER'
-- 9.
SELECT teamname, COUNT(player)
FROM eteam 
JOIN goal ON id=teamid
GROUP BY teamname
-- 10.
SELECT game.stadium, COUNT(player)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;
-- 11.
SELECT matchid, mdate, COUNT(player)
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;
-- 12.
SELECT goal.matchid, game.mdate, COUNT(player)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY matchid, mdate;
-- 13.
SELECT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;



-- 7 More JOIN operations
-- 1.
SELECT id, title
FROM movie
WHERE yr=1962
-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';
-- 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;
-- 4.
SELECT id
FROM actor
WHERE name = 'Glenn Close';
-- 5.
SELECT id
FROM movie
WHERE title = 'Casablanca';
-- 6.
SELECT actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movieid = 11768;
-- 7.
SELECT actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE title = 'Alien';
-- 8.
SELECT movie.title 
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford';
-- 9.
SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord != 1;
-- 10.
SELECT movie.title, actor.name
FROM movie 
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962 AND ord = 1;
-- 11.
SELECT yr, COUNT(title)
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
-- 12.
SELECT title,name
FROM actor JOIN casting ON casting.actorid=actor.id
JOIN movie ON movie.id=casting.movieid
WHERE movieid IN (SELECT movieid FROM casting
WHERE actorid IN (SELECT id FROM actor
WHERE name='Julie Andrews'))
AND ord=1;
-- 13.
SELECT name
FROM (movie JOIN casting ON movie.id=movieid) 
JOIN actor ON actor.id=actorid
WHERE ord=1
GROUP BY name
HAVING COUNT(name) >= 15
-- 14.
SELECT title,count(*) AS count
FROM movie JOIN casting ON movie.id=casting.movieid
WHERE yr=1978
GROUP BY title
ORDER BY count desc,title;
-- 15.
SELECT distinct actor.name
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
where movie.id IN (select movieid from casting join actor on id =actorid where 
actor.name = 'Art Garfunkel') and actor.name <> 'Art Garfunkel';

-- 8 Using Null
-- 1.
SELECT name
FROM teacher
WHERE dept IS null;
-- 2.
SELECT teacher.name, dept.name
 FROM teacher 
INNER JOIN dept ON (teacher.dept=dept.id);
-- 3.
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON teacher.dept = dept.id;
-- 4.
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;
-- 5.
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher;
-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher 
LEFT JOIN dept ON teacher.dept = dept.id;
-- 7.
SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher
-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;
-- 9.
SELECT teacher.name,
CASE WHEN dept = 1 OR dept = 2 
THEN 'Sci'
ELSE 'Art' END
FROM teacher;
-- 10.
SELECT teacher.name,
CASE WHEN dept = 1 OR dept = 2
THEN 'Sci'
WHEN dept = 3
THEN 'Art'
ELSE 'None' END
FROM teacher;



-- 8+ Numeric Examples
-- 1.
SELECT a_strongly_agree
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
-- 2.
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
AND score >= 100;
-- 3.
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
AND score < 50;
-- 4.
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject = '(H) Creative Arts and Design')
GROUP BY subject;
-- 5.
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE / 100))
  FROM nss
 WHERE question='Q22'
   AND subject='(8) Computer Science' OR subject='(H) Creative Arts and Design'
GROUP BY subject;
-- 6.
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE) / SUM(response))
FROM nss
WHERE question = 'Q22'
AND subject = '(H) Creative Arts and Design' 
OR subject = '(8) Computer Science'
GROUP BY subject
-- 7.
SELECT institution, ROUND(SUM(score*response) / SUM(response))
FROM nss
WHERE question = 'Q22'
AND   institution LIKE '%Manchester%'
GROUP BY institution
ORDER BY institution
-- 8.
SELECT institution,
SUM(sample),
SUM(CASE WHEN subject = '(8) Computer Science' THEN sample ELSE NULL END)
FROM nss
WHERE question = 'Q01'
AND institution LIKE '%Manchester%'
GROUP BY institution
