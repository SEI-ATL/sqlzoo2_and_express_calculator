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
FROM goal
  JOIN game ON (matchid = id)
WHERE teamid = 'GER';

-- 4.
SELECT team1,
  team2,
  player
FROM goal
  JOIN game ON (matchid = id)
WHERE player LIKE 'Mario%';

-- 5.
SELECT player,
  teamid,
  coach,
  gtime
FROM goal
  JOIN eteam ON (id = teamid)
WHERE gtime <= 10;

-- 6.
SELECT mdate,
  teamname
FROM game
  JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos';

-- 7.
SELECT player
FROM goal
  JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw';

-- 8.
SELECT DISTINCT player
FROM game
  JOIN goal ON (matchid = id)
WHERE (
    team1 = 'GER'
    OR team2 = 'GER'
  )
  AND teamid <> 'GER';

-- 9.
SELECT teamname,
  COUNT(player)
FROM eteam
  JOIN goal ON (id = teamid)
GROUP BY teamname;

-- 10.
SELECT stadium,
  COUNT(player)
FROM game
  JOIN goal ON (id = matchid)
GROUP BY stadium;

-- 11.
SELECT matchid,
  mdate,
  COUNT(player)
FROM game
  JOIN goal ON matchid = id
WHERE team1 = 'POL'
  OR team2 = 'POL'
GROUP BY matchid,
  mdate;

-- 12.
SELECT matchid,
  mdate,
  COUNT(player)
FROM goal
  JOIN game ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid,
  mdate;

-- 13.
SELECT mdate,
  team1,
  SUM(
    CASE
      WHEN teamid = team1 THEN 1
      ELSE 0
    END
  ) AS score1,
  team2,
  SUM(
    CASE
      WHEN teamid = team2 THEN 1
      ELSE 0
    END
  ) AS score2
FROM game
  LEFT JOIN goal ON id = matchid
GROUP BY mdate,
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
WHERE yr = 1962;

-- 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3.
SELECT id,
  title,
  yr
FROM movie
WHERE title LIKE '%Star Trek%'
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
  JOIN casting ON actor.id = actorid
  JOIN movie ON movieid = movie.id
WHERE title = 'Casablanca';

-- 7.
SELECT name
FROM actor
  JOIN casting ON actor.id = actorid
  JOIN movie ON movieid = movie.id
WHERE title = 'Alien';

-- 8.
SELECT title
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford';

-- 9.
SELECT title
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford'
  AND ord <> 1;

-- 10.
SELECT title,
  name
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE yr = 1962
  AND ord = 1;

-- 11.
SELECT yr,
  COUNT(title)
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12.
SELECT title, name
FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE ord = 1
  AND movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid IN (
      SELECT id
      FROM actor
      WHERE name = 'Julie Andrews'
    )
  )

-- 13.
SELECT name
FROM actor
  JOIN casting ON actor.id = actorid
  JOIN movie ON movieid = movie.id
WHERE ord = 1
GROUP BY name
HAVING COUNT(title) >= 15;

-- 14.
SELECT title, yr
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE yr = 1978
GROUP BY title, yr
ORDER BY COUNT(name), title;

-- 15.
SELECT name
FROM actor
  JOIN casting ON id = actorid
WHERE name <> 'Art Garfunkel'
  AND movieid IN (
    SELECT movieid
    FROM casting
      JOIN actor ON actorid = id
    WHERE name = 'Art Garfunkel'
  )

-- 8 Using Null
-- 1.
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2.
SELECT teacher.name, dept.name
FROM teacher
  INNER JOIN dept ON teacher.dept = dept.id;

-- 3.
SELECT teacher.name, dept.name
FROM teacher
  LEFT JOIN dept ON dept = dept.id;

-- 4.
SELECT teacher.name, dept.name
FROM teacher
  RIGHT JOIN dept ON dept = dept.id;

-- 5.
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
  LEFT JOIN dept ON dept = dept.id;

-- 7.
SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher;

-- 8.
SELECT dept.name, COUNT(teacher.name)
FROM teacher
  RIGHT JOIN dept ON dept = dept.id
GROUP BY dept.name;

-- 9.
SELECT teacher.name,
  CASE WHEN dept = 1 OR dept = 2
       THEN 'Sci'
       ELSE 'Art'
  END
FROM teacher;

-- 10.
SELECT teacher.name,
  CASE WHEN dept = 1 OR dept = 2
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
WHERE question = 'Q01'
  AND institution = 'Edinburgh Napier University'
  AND subject = '(8) Computer Science';

-- 2.
SELECT institution, subject
FROM nss
WHERE question = 'Q15'
  AND score >= 100;

-- 3.
SELECT institution, score
FROM nss
WHERE subject = '(8) Computer Science'
  AND question = 'Q15'
  AND score < 50;

-- 4.
SELECT subject, SUM(response)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science'
  OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 5.
SELECT subject, SUM((response * A_STRONGLY_AGREE) / 100)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science'
  OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 6.
SELECT subject, ROUND(SUM((response * A_STRONGLY_AGREE) / 100) / SUM(response) * 100, 0)
FROM nss
WHERE question = 'Q22'
  AND (subject = '(8) Computer Science'
  OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 7.
SELECT institution, ROUND((SUM((score * response) / 100) / SUM(response)) * 100, 0)
FROM nss
WHERE question = 'Q22'
  AND institution LIKE '%Manchester%'
GROUP BY institution;

-- 8.
SELECT institution, SUM(sample), (
  SELECT SUM(sample)
  FROM nss y
  WHERE subject = '(8) Computer Science'
  AND x.institution = y.institution
  AND question = 'Q01'
)
FROM nss x
WHERE institution LIKE '%Manchester%'
  AND question = 'Q01'
GROUP BY institution;