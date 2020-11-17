-- 6 JOIN
-- 1.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
-- 2.
SELECT id, stadium, team1, team2
  FROM game
  WHERE id = 1012;
-- 3.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM goal JOIN game 
  ON game.id=goal.matchid
  WHERE goal.teamid = 'GER';
-- 4.
SELECT game.team1, game.team2, goal.player FROM goal
 JOIN game
 ON goal.matchid = game.id
 WHERE goal.player LIKE 'Mario%';
-- 5.
SELECT player, teamid, coach, gtime
  FROM goal
   JOIN eteam
   ON teamid = id
 WHERE gtime <= 10;
-- 6.
SELECT game.mdate, eteam.teamname FROM game
 JOIN eteam
 ON game.team1 = eteam.id
 WHERE coach = 'Fernando Santos';
-- 7.
SELECT goal.player FROM goal
JOIN game
ON goal.matchid = game.id 
WHERE stadium = 'National Stadium, Warsaw';
-- 8. - Skip this one

-- 9.
SELECT eteam.teamname, COUNT(eteam.teamname)
  FROM eteam
 JOIN goal 
 ON eteam.id = goal.teamid
 GROUP BY eteam.teamname;
-- 10.
SELECT game.Stadium, COUNT(game.Stadium)
  FROM game
 JOIN goal 
 ON game.id = goal.matchid
 GROUP BY game.Stadium;
-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
-- 1.
SELECT id, title
 FROM movie
 WHERE yr = 1962;
-- 2.
SELECT yr FROM movie
WHERE title = 'Citizen Kane';
-- 3.
SELECT id, title, yr FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;
-- 4.
SELECT id FROM actor
WHERE name = 'Glenn Close';
-- 5.
SELECT id FROM movie
WHERE title = 'Casablanca';
-- 6.
SELECT actor.name FROM actor
 JOIN casting
 ON casting.actorid = actor.id
 WHERE movieid = 11768;
-- 7.
SELECT actor.name FROM actor
 JOIN casting
 ON casting.actorid = actor.id
 JOIN movie
 ON movie.id = casting.movieid
 WHERE movie.title = 'Alien';
-- 8.
SELECT movie.title FROM movie
 JOIN casting
 ON movie.id = casting.movieid
 JOIN actor
 ON casting.actorid = actor.id
 WHERE actor.name = 'Harrison Ford';
-- 9.
SELECT movie.title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND casting.ord > 1;
-- 10.
SELECT movie.title, actor.name FROM actor
 JOIN casting
 ON actor.id = casting.actorid
 JOIN movie
 ON movie.id = casting.movieid
 WHERE movie.yr = 1962
 AND casting.ord = 1;
-- 11.
SELECT yr, COUNT(title) FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
-- 12.
SELECT movie.title, actor.name
  FROM movie, casting, actor
  WHERE casting.movieid = movie.id
  AND casting.actorid = actor.id
  AND casting.ord = 1
  AND casting.movieid IN
   (SELECT movieid 
    FROM casting, actor
    WHERE casting.actorid = actor.id
    AND name = 'Julie Andrews');
-- 13.
SELECT actor.name FROM casting
 JOIN actor
 ON casting.actorid = actor.id
 WHERE casting.ord = 1
 GROUP BY actor.name
 HAVING COUNT(movieid) >= 15;
-- 14.
SELECT movie.title, COUNT(casting.actorid)
  FROM casting, movie                
  WHERE movie.yr = 1978
  AND casting.movieid = movie.id
  GROUP BY movie.title
  ORDER BY COUNT(casting.actorid) DESC, movie.title ASC;
-- 15.
SELECT DISTINCT a.name FROM actor a 
 JOIN casting c ON a.id=c.actorid
 WHERE c.movieid IN 
 (SELECT d.movieid FROM casting d
 JOIN actor b ON b.id = d.actorid
 WHERE b.name = 'Art Garfunkel');

-- 8 Using Null
-- 1.
SELECT name FROM teacher
 WHERE dept IS NULL;
-- 2.
SELECT teacher.name, dept.name
 FROM teacher
INNER JOIN dept
ON teacher.dept=dept.id;
-- 3.
SELECT teacher.name, dept.name
 FROM teacher
 LEFT JOIN dept
 ON (teacher.dept=dept.id);
-- 4.
SELECT teacher.name, dept.name
 FROM teacher
 RIGHT JOIN dept
 ON teacher.dept=dept.id;
-- 5.
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;
-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher
 LEFT JOIN dept
 ON dept.id = teacher.dept;
-- 7.
SELECT COUNT(name), COUNT(mobile) FROM teacher;
-- 8.
SELECT dept.name, COUNT(teacher.dept) FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;
-- 9.
SELECT name,
CASE WHEN dept IN (1,2) 
 THEN 'Sci'
 ELSE 'Art'
 END
 FROM teacher;
-- 10.
SELECT name,
CASE WHEN dept IN (1,2) 
 THEN 'Sci'
 WHEN dept = 3 
 THEN 'Art'
 ELSE 'None'
 END
 FROM teacher;

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
   AND score >= 100;
-- 3.
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score < 50
   AND subject='(8) Computer Science';
-- 4.
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(H) Creative Arts and Design', '(8) Computer Science')
 GROUP BY subject;
-- 5.
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(H) Creative Arts and Design', '(8) Computer Science')
 GROUP BY subject;
-- 6.
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE) / SUM(response), 0)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(H) Creative Arts and Design', '(8) Computer Science')
GROUP BY subject;
-- 7.
SELECT institution, ROUND(SUM(response*score) / SUM(response), 0)
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
 GROUP BY institution;
-- 8.
SELECT institution, SUM(sample), SUM(CASE WHEN subject LIKE '(8)%' THEN sample END)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
 GROUP BY institution;