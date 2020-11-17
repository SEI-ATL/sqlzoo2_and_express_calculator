-- 6 JOIN
-- 1.

SELECT matchid,
       player
FROM goal
WHERE teamid = 'GER';

-- 2.

SELECT id,
       stadium,
       team1,
       team2
FROM game
WHERE id = 1012;

-- 3.

SELECT player,
       teamid,
       stadium,
       mdate
FROM game
INNER JOIN goal ON game.id=goal.matchid
WHERE teamid = 'GER';

-- 4.

SELECT team1,
       team2,
       player
FROM game
INNER JOIN goal ON game.id = goal.matchid
WHERE player LIKE 'Mario%';

-- 5.

SELECT player,
       teamid,
       coach,
       gtime
FROM goal
INNER JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;

-- 6.

SELECT mdate,
       teamname
FROM game
INNER JOIN eteam ON game.team1 = eteam.id
WHERE coach ='Fernando Santos';

-- 7.

SELECT player
FROM goal
INNER JOIN game ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

-- 8.

SELECT DISTINCT(player)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE ((team1='GER'
        OR team2='GER')
       AND teamid != 'GER');

-- 9.

SELECT teamname,
       COUNT(player)
FROM eteam
JOIN goal ON eteam.id=goal.teamid
GROUP BY teamname;

-- 10.

SELECT stadium,
       COUNT(player)
FROM goal
INNER JOIN game ON goal.matchid = game.id
GROUP BY stadium;

-- 11.

SELECT id,
       mdate,
       COUNT(player)
FROM game
LEFT JOIN goal ON goal.matchid = game.id
WHERE team1 = 'POL'
    OR team2 = 'POL'
GROUP BY id,
         mdate;

-- 12.

SELECT matchid,
       mdate,
       COUNT(player)
FROM game
INNER JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY matchid,
         mdate;

-- 13.

SELECT mdate,
       team1,
       SUM(CASE
               WHEN teamid=team1 THEN 1
               ELSE 0
           END) score1,
       team2,
       SUM(CASE
               WHEN teamid = team2 THEN 1
               ELSE 0
           END) score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY id,
         mdate,
         team1,
         team2
ORDER BY mdate,
         matchid,
         team1,
         team2;

-- 7 More JOIN operations
-- 1.

SELECT id,
       title
FROM movie
WHERE yr=1962;

-- 2.

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3.

SELECT id,
       title,
       yr
FROM movie
WHERE title LIKE '%Star Trek%';


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

SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
WHERE movieid =
        (SELECT id
         FROM movie
         WHERE title = 'Casablanca');

-- 7.

SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
WHERE movieid =
        (SELECT id
         FROM movie
         WHERE title = 'Alien');

-- 8.

SELECT title
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
WHERE actorid =
        (SELECT id
         FROM actor
         WHERE name = 'Harrison Ford') -- 9.

    SELECT title
    FROM movie
    INNER JOIN casting ON movie.id = casting.movieid WHERE actorid =
        (SELECT id
         FROM actor
         WHERE name = 'Harrison Ford')
    AND ord !=1;

-- 10.

SELECT title,
       name
FROM movie
INNER JOIN casting ON casting.movieid = movie.id
INNER JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962
    AND ord = 1;

-- 11.

SELECT yr,
       COUNT(*)
FROM movie
INNER JOIN casting ON movie.id = movieid
INNER JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12.

SELECT DISTINCT films.title,
                leads.name
FROM
    (SELECT movie.*
     FROM movie
     JOIN casting ON casting.movieid = movie.id
     JOIN actor ON actor.id = casting.actorid
     WHERE actor.name = 'Julie Andrews') AS films
JOIN
    (SELECT actor.*,
            casting.movieid AS movieid
     FROM actor
     JOIN casting ON casting.actorid = actor.id
     WHERE casting.ord = 1) as leads ON films.id = leads.movieid
ORDER BY films.title;

-- 13.

SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY name
HAVING COUNT(*) >= 15;

-- 14.

SELECT title,
       COUNT(*)
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(*) DESC, title -- 15.

SELECT actors.name
FROM
    (SELECT movie.*
     FROM movie
     JOIN casting ON casting.movieid = movie.id
     JOIN actor ON actor.id = casting.actorid
     WHERE actor.name = 'Art Garfunkel') AS films
JOIN
    (SELECT actor.*,
            casting.movieid
     FROM actor
     JOIN casting ON casting.actorid = actor.id
     WHERE actor.name != 'Art Garfunkel') as actors ON films.id = actors.movieid;

-- 8 Using Null
-- 1.

SELECT name
FROM teacher
WHERE dept IS NULL -- 2.

    SELECT teacher.name,
           dept.name
    FROM teacher
    INNER JOIN dept ON teacher.dept=dept.id -- 3.

    SELECT teacher.name,
           dept.name
    FROM dept
    RIGHT OUTER JOIN teacher ON teacher.dept = dept.id;

-- 4.

SELECT teacher.name,
       dept.name
FROM teacher
RIGHT OUTER JOIN dept ON teacher.dept = dept.id;

-- 5.

SELECT name,
       COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 6.

SELECT teacher.name,
       COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 7.

SELECT COUNT(name),
       COUNT(mobile)
FROM teacher;

-- 8.

SELECT dept.name,
       COUNT(teacher.name)
FROM teacher
RIGHT OUTER JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

-- 9.

SELECT teacher.name,
       CASE
           WHEN teacher.dept IN (1,
                                 2) THEN 'Sci'
           ELSE 'Art'
       END
FROM teacher;

-- 10.

SELECT teacher.name,
       CASE
           WHEN teacher.dept IN (1,
                                 2) THEN 'Sci'
           WHEN teacher.dept = 3 THEN 'Art'
           ELSE 'None'
       END
FROM teacher;

-- 8+ Numeric Examples
-- 1.

SELECT a_strongly_agree
FROM nss
WHERE question='Q01'
    AND institution='Edinburgh Napier University'
    AND subject='(8) Computer Science' -- 2.

    SELECT institution,
           subject
    FROM nss WHERE question='Q15'
    AND score >=100;

-- 3.

SELECT institution,
       score
FROM nss
WHERE question='Q15'
    AND score < 50
    AND subject='(8) Computer Science';

-- 4.

SELECT subject,
       SUM(response)
FROM nss
WHERE question='Q22'
    AND (subject='(8) Computer Science'
         OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 5.

SELECT subject,
       SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question='Q22'
    AND (subject='(8) Computer Science'
         OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 6.

SELECT subject,
       ROUND(SUM(response * A_STRONGLY_AGREE / 100) / SUM(response) * 100, 0)
FROM nss
WHERE question='Q22'
    AND (subject='(8) Computer Science'
         OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 7.

SELECT institution,
       ROUND(SUM(score * response) / SUM(response), 0)
FROM nss
WHERE question='Q22'
    AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;

-- 8.

SELECT institution,
       SUM(sample),

    (SELECT sample
     FROM nss y
     WHERE subject='(8) Computer Science'
         AND x.institution = y.institution
         AND question='Q01') AS comp
FROM nss x
WHERE question='Q01'
    AND (institution LIKE '%Manchester%')
GROUP BY institution;

