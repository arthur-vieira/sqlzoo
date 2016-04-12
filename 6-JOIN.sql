--1. Modify it to show the matchid and player name for all goals scored by Germany.

SELECT matchid, player FROM goal 
	WHERE teamid = 'GER';

--2. Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
	FROM game WHERE id = 1012;

--3. The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.
--Modify it to show the player, teamid, stadium and mdate and for every German goal.

SELECT go.player, go.teamid, ga.stadium, ga.mdate
	FROM game ga JOIN goal go ON (id=matchid)
		WHERE teamid = 'GER';

--4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT ga.team1, ga.team2, go.player
	FROM game ga JOIN goal go ON (id=matchid)
		WHERE player LIKE 'Mario%';

--5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT go.player, go.teamid, t.coach, go.gtime
	FROM eteam t JOIN goal go ON (id=teamid)
		WHERE gtime<=10;

--6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT ga.mdate, t.teamname
	FROM eteam t JOIN game ga ON (t.id=team1)
		WHERE coach = 'Fernando Santos';

--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT go.player
	FROM game ga JOIN goal go ON (id=matchid)
		WHERE ga.stadium = 'National Stadium, Warsaw';

--8. The example query shows all goals scored in the Germany-Greece quarterfinal. Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
	FROM goal JOIN game ON matchid = id 
		WHERE (teamid = team1 AND team2 = 'GER') OR (teamid = team2 AND team1 = 'GER');

--9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(teamid)
	FROM eteam JOIN goal ON id=teamid
		GROUP BY teamname;

--10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(teamid)
	FROM game JOIN goal ON id=matchid
		GROUP BY stadium;

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate, COUNT(teamid)
	FROM game JOIN goal ON id = matchid 
		WHERE (team1 = 'POL' OR team2 = 'POL')
			GROUP BY matchid;

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(teamid)
	FROM game JOIN goal ON id = matchid 
		WHERE teamid = 'GER'
			GROUP BY matchid;

--13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
--Sort your result by mdate, matchid, team1 and team2.

SELECT mdate, team1,
	SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
	team2,
	SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
		FROM game LEFT OUTER JOIN goal ON id = matchid
		  GROUP BY id
			  ORDER BY mdate, matchid, team1, team2;
