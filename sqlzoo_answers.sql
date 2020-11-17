-- 6 JOIN
-- 1.
List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

-- 2.
Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

-- 3.
show the player, teamid, stadium and mdate for every German goal

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'Ger';

-- 4.
Show the team1, team2 and player for every goal scored by a player called Mario

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

-- 5.
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- 6.
List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

-- 7.
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
FROM goal JOIN game ON (id=matchid) 
WHERE stadium = 'National Stadium, Warsaw';

-- 8. - Skip this one

-- 9.
Show teamname and the total number of goals scored

SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;

-- 10.
Show the stadium and the number of goals scored in each stadium

SELECT stadium, COUNT(1)
FROM goal JOIN game ON (id=matchid)
GROUP BY stadium;

-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
-- 1.
List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2.
Give year of 'Citizen Kane'

SELECT yr FROM movie
WHERE title = 'Citizen Kane';

-- 3.
List all of the Star Trek movies, include the id, title and yr 

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

-- 4.
What id number does the actor 'Glenn Close' have?

SELECT id FROM actor
WHERE name = 'Glenn Close';

-- 5.
SELECT id FROM movie
WHERE title = 'Casablanca';

-- 6.
SELECT name
FROM casting, actor
WHERE movieid = (SELECT id 
FROM movie WHERE title = 'Casablanca') 
AND actorid=actor.id

-- 7.
Obtain the cast list for the film 'Alien'

SELECT name
FROM casting, actor
WHERE movieid = (SELECT id
FROM movie WHERE title = 'Alien')
AND actorid=actor.id;

-- 8.
List the films in which 'Harrison Ford' has appeared

SELECT title FROM movie, casting, actor
WHERE name = 'Harrison Ford'
AND movieid=movie.id
AND actorid=actor.id;

-- 9.
List the films where 'Harrison Ford' has appeared - but not in the starring role

SELECT title FROM movie, casting, actor
WHERE name = 'Harrison Ford'
AND movieid=movie.id
AND actorid=actor.id
AND ord <> 1;

-- 10.
List the films together with the leading star for all 1962 films

SELECT title, name
FROM movie, casting, actor
WHERE yr = 1962
AND movieid=movie.id
AND actorid=actor.id
AND ord = 1;

-- 11.
show the year and the number of movies he made each year for any year in which he made more than 2 movies

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12.
SELECT title, name FROM movie, casting, actor
WHERE movieid=movie.id
AND actorid=actor.id
AND ord=1
AND movieid IN
(SELECT movieid FROM casting, actor
WHERE actorid=actor.id AND name='Julie Andrews');


-- 13.
list, in alphabetical order, of actors who have had at least 15 starring roles

SELECT name FROM casting
JOIN actor ON actorid = actor.id
WHERE ord =1
GROUP BY name
HAVING COUNT(movieid)>=15;

-- 14.
List the films released in the year 1978 ordered by the number of actors in the cast, then by title

SELECT title, COUNT(actorid)
FROM casting, movie
WHERE yr = 1978 AND movieid=movie.id
GROUP BY title ORDER BY 2 DESC, 1 ASC;

-- 15.
?????


-- 8 Using Null
-- 1.
teachers who have NULL for their department

SELECT name FROM teacher
WHERE dept IS NULL;

-- 2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3.
JOIN so that all teachers are listed

SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept ON (teacher.dept=dept.id);

-- 4.
JOIN so that all departments are listed

SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON (teacher.dept=dept.id);

-- 5.
Show teacher name and mobile number or '07986 444 2266'

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 6.
print the teacher name and department name

SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher
LEFT JOIN dept ON teacher.dept=dept.id;

-- 7.
show the number of teachers and the number of mobile phones

SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher;

-- 8.
show each department and the number of staff.

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept=dept.id
GROUP BY dept.name;

-- 9.
show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise

SELECT name, CASE WHEN dept IN (1,2)
THEN 'Sci' ELSE 'Art' END
FROM teacher;

-- 10.
show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teachers dept is 3 and 'None' otherwise

SELECT name, CASE WHEN dept IN (1,2)
THEN 'Sci' 
WHEN dept = 3 THEN 'Art'
ELSE 'None' END
FROM teacher;


-- 8+ Numeric Examples
-- 1.
Show the the percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science';

-- 2.
Show the institution and subject where the score is at least 100 for question 15

SELECT institution, subject
FROM nss WHERE question='Q15'
AND score>=100;


-- 3.
Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND score < 50
AND subject = '(8) Computer Science';

-- 4.
Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'

SELECT subject,SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject;

-- 5.
Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'

SELECT subject,SUM(response*A_STRONGLY_AGREE/100) FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject;

-- 6.
????

-- 7.
????

-- 8.
????

