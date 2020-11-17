-- 6 JOIN
-- 1.-- 1.he first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

-- 2.Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game 
WHERE id = '1012';

-- 3.Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid='GER'

-- 4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate,teamname
  FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
  FROM goal JOIN game ON (id=matchid)
 WHERE stadium = 'National Stadium, Warsaw'


-- 8. - Skip this one

-- 9.Show teamname and the total number of goals scored.
SELECT teamname,COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname


-- 10.Show the stadium and the number of goals scored in each stadium.
SELECT stadium,COUNT(1)
  FROM goal JOIN game ON id=matchid
GROUP BY stadium

-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
-- 1.List the films where the yr is 1962 [Show id, title]
 SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2.Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
-- 4.What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5.What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- 6.Obtain the cast list for 'Casablanca'.Use movieid=11768, (or whatever value you got from the previous question)
SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid = actor.id
WHERE casting.movieid = 11768;

-- 7.Obtain the cast list for the film 'Alien'
SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid = actor.id
JOIN movie
ON movie.id = casting.movieid
WHERE movie.title = 'Alien'

-- 8.List the films in which 'Harrison Ford' has appeared
SELECT movie.title
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford';

-- 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT movie.title
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1;

-- 10.List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE movie.yr = 1962
AND casting.ord = 1;


-- 11.Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT DISTINCT m.title, a.name
FROM (SELECT movie.*
      FROM movie
      JOIN casting
      ON casting.movieid = movie.id
      JOIN actor
      ON actor.id = casting.actorid
      WHERE actor.name = 'Julie Andrews') AS m
JOIN (SELECT actor.*, casting.movieid AS movieid
      FROM actor
      JOIN casting
      ON casting.actorid = actor.id
      WHERE casting.ord = 1) as a
ON m.id = a.movieid
ORDER BY m.title

-- 13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15;

-- 14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title,count(actorid) 
FROM movie 
JOIN casting 
ON id=movieid
WHERE yr=1978 
GROUP BY title
order by COUNT(actorid) DESC,title

-- 15.List all the people who have worked with 'Art Garfunkel'.
SELECT a.name
  FROM (SELECT movie.*
          FROM movie
          JOIN casting
            ON casting.movieid = movie.id
          JOIN actor
            ON actor.id = casting.actorid
         WHERE actor.name = 'Art Garfunkel') AS m
  JOIN (SELECT actor.*, casting.movieid
          FROM actor
          JOIN casting
            ON casting.actorid = actor.id
         WHERE actor.name != 'Art Garfunkel') as a
    ON m.id = a.movieid;


-- 8 Using Null
-- 1.List the teachers who have NULL for their department.
SELECT name FROM teacher 
WHERE dept is NULL
-- 2.Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher 
 INNER JOIN dept
 ON (teacher.dept = dept.id)

-- 3.Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
FROM teacher
LEFT OUTER JOIN dept
ON teacher.dept = dept.id;

-- 4.Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher
RIGHT OUTER JOIN dept
ON teacher.dept = dept.id;

-- 5.Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266')
  FROM teacher;

-- 6.Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name,'None')
FROM teacher 
LEFT JOIN dept 
ON teacher.dept = dept.id

-- 7.Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

-- 8.Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name ,COUNT(teacher.name)
FROM teacher 
RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name;

-- 9.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT teacher.name, 
  CASE
  WHEN teacher.dept IN (1, 2)
  THEN 'Sci'
  ELSE 'Art'
  END
FROM teacher;
-- 10.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT teacher.name, 
  CASE
  WHEN teacher.dept IN (1, 2)
  THEN 'Sci'
  WHEN teacher.dept = 3
  THEN 'Art'
  ELSE 'None'
  END
FROM teacher;


-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

