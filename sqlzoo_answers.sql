-- 6 JOIN
-- 1.
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'
-- 2.
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012
-- 3.
SELECT o.player, o.teamid, a.stadium, a.mdate
FROM game a
JOIN goal o
ON a.id = o.matchid
WHERE o.teamid = 'GER'
-- 4.
SELECT a.team1, a.team2, o.player
FROM game a
JOIN goal o
ON a.id = o.matchid
WHERE player LIKE 'Mario%'
-- 5.
SELECT o.player, o.teamid, e.coach, o.gtime
FROM goal o
JOIN eteam e
ON o.teamid = e.id
WHERE gtime<=10
-- 6.

-- 7.
SELECT o.player
FROM goal o
JOIN game a
ON o.matchid = a.id
WHERE a.stadium = 'National Stadium, Warsaw'
-- 8. - Skip this one

-- 9.
SELECT e.teamname, COUNT(o.matchid)
FROM eteam e
JOIN goal o
ON e.id = o.teamid
GROUP BY e.teamname 
-- 10.
SELECT a.stadium, COUNT(o.matchid)
FROM game a
JOIN goal o
ON a.id = o.matchid
GROUP BY a.stadium
-- 11. - Skip this one

-- 12. - Skip this one

-- 13. - Skip this one



-- 7 More JOIN operations
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

-- 11.

-- 12.

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

