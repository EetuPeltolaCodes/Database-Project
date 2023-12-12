-- Here is four queries and two views I created
-- This shows the user the games where on half time one team is winning but they lose at full time
SELECT MatchID, Date, FK_HomeTeam AS "Home Team", FK_AwayTeam AS "Away Team", (HTHG ||' - '|| HTAG) AS "Half Time Score", (HTG ||' - '|| ATG) AS "Final Score" FROM Matches
WHERE (Result="H" AND HT_Result="A")
OR (Result="A" AND HT_Result="H");

-- This shows the user the N:M relationship table and some added data with INNER JOIN
SELECT Team_MatchID, FK_MatchID, FK_Team_Name, Date, Score, Pos AS Position FROM( 
    SELECT * FROM TeamsInMatches
    INNER JOIN (SELECT MatchID, Date, (HTG || ' - ' || ATG) AS Score FROM Matches) ON FK_MatchID=MatchID
    INNER JOIN (SELECT Team_Name, Pos FROM Team) ON FK_Team_Name=Team_Name);

-- This shows the players who have played for multiple teams in this season
SELECT Players.* FROM 
    (SELECT Player_Name AS Player_Name, COUNT(Player_Name) FROM Players
    GROUP BY Player_Name
    HAVING COUNT(Player_Name)>1) AS t1, Players
WHERE t1.Player_Name=Players.Player_Name;

--This creates a view with the top 10 goalscorers
CREATE VIEW Top10GoalScorers AS
    SELECT * FROM Players
    ORDER BY Gls DESC
    LIMIT 10;

--This shows the Teams' wages, amount of players, position and attendance
SELECT Pos, FK_Team AS "Team Name", "# PI" AS "Player Amount", "Weekly Wages","Annual Wages", ATT AS Attendance FROM  
    (SELECT * FROM Wages
    INNER JOIN Team ON FK_Team=Team_Name);

-- This creates a view with all the Finnish players
CREATE VIEW FinnishPlayers AS
    SELECT PlayerID, Player_Name AS "Player Name", Nation,  Position, FK_Team AS "Team Name", Age, MP, Starts, "Min", Gls, Ast, CrdY, CrdR FROM
        (SELECT NationID, Nation, Players.* FROM Nation
        INNER JOIN Players ON Players.FK_NationID=Nation.NationID
        WHERE Nation="Finland");