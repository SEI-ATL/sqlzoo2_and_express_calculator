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

-- 14.

-- 15.


-- 8 Using Null
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

