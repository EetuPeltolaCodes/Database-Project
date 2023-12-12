-- You can use this file to create the table if the databse is empty

CREATE TABLE Team (
	Pos INT NOT NULL UNIQUE, 
	Team_Name VARCHAR(50) NOT NULL PRIMARY KEY, 
	MP INT, 
	W INT, 
	D INT, 
	L INT, 
	GF INT, 
	GA INT, 
	GD INT, 
	Pts INT, 
	ATT INT , 
	CHECK (ATT>=0));

CREATE TABLE Matches (
	MatchID INT NOT NULL PRIMARY KEY, 
	Date VARCHAR(50), 
	Result VARCHAR(1), 
	HT_Result VARCHAR(1), 
	FK_HomeTeam VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE CASCADE, 
	HTG INT, 
	HTHG INT, 
	HS INT, 
	HST INT, 
	HF INT, 
	HC INT, 
	HY INT, 
	HR INT, 
	FK_AwayTeam VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE CASCADE, 
	ATG INT, 
	HTAG INT, 
	'AS' INT, 
	AST INT, 
	AF INT, 
	AC INT, 
	AY INT, 
	AR INT);

CREATE TABLE TeamsInMatches (
	Team_MatchID INT NOT NULL PRIMARY KEY, 
	FK_MatchID INT REFERENCES Matches(MatchID) ON DELETE CASCADE, 
	FK_Team_Name VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE CASCADE);

CREATE TABLE Wages (
	FK_Team VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE CASCADE PRIMARY KEY, 
	'# PI' INT, 
	'Weekly Wages' INT, 
	'Annual Wages' INT);

CREATE TABLE Nation (
	NationID VARCHAR(5) NOT NULL PRIMARY KEY, 
	Nation VARCHAR(20) NOT NULL, 
	'# Players' INT, 
	'Min' INT DEFAULT 0);

CREATE TABLE Players (
	PlayerID INT NOT NULL PRIMARY KEY, 
	Player_Name VARCHAR(50) NOT NULL, 
	FK_NationID VARCHAR(5) REFERENCES Nation(NationID) ON DELETE SET NULL, 
	Position VARCHAR(20), 
	FK_Team VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE SET NULL, 
	Age INT, 
	MP INT, 
	Starts INT, 
	'Min' INT, 
	Gls INT, 
	Ast INT, 
	CrdY INT, 
	CrdR INT);

CREATE TABLE Goalkeeper (
	FK_PlayerID INT REFERENCES Players(PlayerID) ON DELETE CASCADE PRIMARY KEY, 
	FK_Player_Name VARCHAR(50) REFERENCES Players(Player_Name) ON DELETE CASCADE, 
	FK_NationID VARCHAR(5) REFERENCES Nation(NationID) ON DELETE CASCADE, 
	FK_Team VARCHAR(50) REFERENCES Team(Team_Name) ON DELETE CASCADE, 
	Age INT, 
	MP INT, 
	Starts INT, 
	'Min' INT, 
	GA INT, 
	GA90 REAL, 
	Saves INT, 
	'Save%' REAL, 
	W INT, 
	D INT, 
	L INT, 
	CS INT, 
	PKatt INT, 
	PKA INT, 
	PKsv INT, 
	PKm INT, 
	'PKSave%' REAL);

CREATE INDEX FK_TeamIndex ON Players(FK_Team);
CREATE INDEX FK_HomeTeamIndex ON Matches(FK_HomeTeam);
CREATE INDEX FK_AwayTeamIndex ON Matches(FK_AwayTeam);

INSERT INTO Team VALUES(1,'Bayern Munich',34,24,6,4,88,32,56,78,60984);
INSERT INTO Team VALUES(2,'Dortmund',34,23,7,4,81,44,37,76,63636);
INSERT INTO Team VALUES(3,'RB Leipzig',34,19,9,6,63,29,34,66,39979);
INSERT INTO Team VALUES(4,'Leverkusen',34,18,4,12,69,52,17,58,35611);
INSERT INTO Team VALUES(5,'Mgladbach',34,16,7,11,55,42,13,55,47579);
INSERT INTO Team VALUES(6,'Wolfsburg',34,16,7,11,62,50,12,55,33306);
INSERT INTO Team VALUES(7,'Ein Frankfurt',34,15,9,10,60,48,12,54,46496);
INSERT INTO Team VALUES(8,'Werder Bremen',34,14,11,9,58,49,9,53,43345);
INSERT INTO Team VALUES(9,'Hoffenheim',34,13,12,9,70,52,18,51,35683);
INSERT INTO Team VALUES(10,'Fortuna Dusseldorf',34,13,5,16,49,65,-16,44,43496);
INSERT INTO Team VALUES(11,'Hertha',34,11,10,13,49,57,-8,43,45563);
INSERT INTO Team VALUES(12,'Mainz',34,12,7,15,46,57,-11,43,33962);
INSERT INTO Team VALUES(13,'Freiburg',34,8,12,14,46,61,-15,36,33828);
INSERT INTO Team VALUES(14,'Schalke 04',34,8,9,17,37,55,-18,33,52576);
INSERT INTO Team VALUES(15,'Augsburg',34,8,8,18,51,71,-20,32,35256);
INSERT INTO Team VALUES(16,'Stuttgart',34,7,7,20,32,70,-38,28,48786);
INSERT INTO Team VALUES(17,'Hannover',34,5,6,23,31,71,-40,21,40479);
INSERT INTO Team VALUES(18,'Nurnberg',34,3,10,21,26,68,-42,19,4159);


INSERT INTO Matches VALUES(1,'24/08/2018','H','H','Bayern Munich',3,1,16,5,2,7,1,0,'Hoffenheim',1,0,8,5,21,2,4,0);
INSERT INTO TeamsInMatches VALUES(1,1,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(2,1,'Hoffenheim');
INSERT INTO Matches VALUES(2,'25/08/2018','A','H','Fortuna Dusseldorf',1,1,9,5,11,7,1,0,'Augsburg',2,0,14,7,10,5,0,0);
INSERT INTO TeamsInMatches VALUES(3,2,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(4,2,'Augsburg');
INSERT INTO Matches VALUES(3,'25/08/2018','A','A','Freiburg',0,0,22,6,7,6,1,0,'Ein Frankfurt',2,1,10,2,12,4,2,0);
INSERT INTO TeamsInMatches VALUES(5,3,'Freiburg');
INSERT INTO TeamsInMatches VALUES(6,3,'Ein Frankfurt');
INSERT INTO Matches VALUES(4,'25/08/2018','H','H','Hertha',1,1,10,3,13,8,2,0,'Nurnberg',0,0,12,3,10,4,2,0);
INSERT INTO TeamsInMatches VALUES(7,4,'Hertha');
INSERT INTO TeamsInMatches VALUES(8,4,'Nurnberg');
INSERT INTO Matches VALUES(5,'25/08/2018','H','D','Mgladbach',2,0,17,7,10,9,1,0,'Leverkusen',0,0,13,3,10,5,2,0);
INSERT INTO TeamsInMatches VALUES(9,5,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(10,5,'Leverkusen');
INSERT INTO Matches VALUES(6,'25/08/2018','D','D','Werder Bremen',1,0,15,3,5,4,0,0,'Hannover',1,0,13,4,6,3,0,0);
INSERT INTO TeamsInMatches VALUES(11,6,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(12,6,'Hannover');
INSERT INTO Matches VALUES(7,'25/08/2018','H','H','Wolfsburg',2,1,11,7,16,7,5,0,'Schalke 04',1,0,9,4,11,2,3,1);
INSERT INTO TeamsInMatches VALUES(13,7,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(14,7,'Schalke 04');
INSERT INTO Matches VALUES(8,'26/08/2018','H','H','Dortmund',4,3,10,5,8,7,2,0,'RB Leipzig',1,1,10,7,11,9,2,0);
INSERT INTO TeamsInMatches VALUES(15,8,'Dortmund');
INSERT INTO TeamsInMatches VALUES(16,8,'RB Leipzig');
INSERT INTO Matches VALUES(9,'26/08/2018','H','D','Mainz',1,0,8,3,15,6,1,0,'Stuttgart',0,0,12,3,6,3,2,0);
INSERT INTO TeamsInMatches VALUES(17,9,'Mainz');
INSERT INTO TeamsInMatches VALUES(18,9,'Stuttgart');
INSERT INTO Matches VALUES(10,'31/08/2018','D','D','Hannover',0,0,7,0,11,4,0,0,'Dortmund',0,0,8,3,5,1,0,0);
INSERT INTO TeamsInMatches VALUES(19,10,'Hannover');
INSERT INTO TeamsInMatches VALUES(20,10,'Dortmund');
INSERT INTO Matches VALUES(11,'01/09/2018','D','H','Augsburg',1,1,18,7,12,9,1,0,'Mgladbach',1,0,7,2,12,4,2,0);
INSERT INTO TeamsInMatches VALUES(21,11,'Augsburg');
INSERT INTO TeamsInMatches VALUES(22,11,'Mgladbach');
INSERT INTO Matches VALUES(12,'01/09/2018','A','A','Ein Frankfurt',1,0,5,1,6,8,1,1,'Werder Bremen',2,1,11,6,11,3,2,0);
INSERT INTO TeamsInMatches VALUES(23,12,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(24,12,'Werder Bremen');
INSERT INTO Matches VALUES(13,'01/09/2018','H','A','Hoffenheim',3,0,20,7,13,6,1,0,'Freiburg',1,1,9,4,14,4,2,0);
INSERT INTO TeamsInMatches VALUES(25,13,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(26,13,'Freiburg');
INSERT INTO Matches VALUES(14,'01/09/2018','A','D','Leverkusen',1,1,16,3,13,5,3,0,'Wolfsburg',3,1,12,5,13,3,3,0);
INSERT INTO TeamsInMatches VALUES(27,14,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(28,14,'Wolfsburg');
INSERT INTO Matches VALUES(15,'01/09/2018','D','A','Nurnberg',1,0,19,4,10,5,2,0,'Mainz',1,1,6,1,11,1,2,0);
INSERT INTO TeamsInMatches VALUES(29,15,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(30,15,'Mainz');
INSERT INTO Matches VALUES(16,'01/09/2018','A','A','Stuttgart',0,0,4,0,3,0,0,0,'Bayern Munich',3,1,20,6,5,12,0,0);
INSERT INTO TeamsInMatches VALUES(31,16,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(32,16,'Bayern Munich');
INSERT INTO Matches VALUES(17,'02/09/2018','D','D','RB Leipzig',1,0,23,7,11,3,1,0,'Fortuna Dusseldorf',1,0,14,8,15,3,4,0);
INSERT INTO TeamsInMatches VALUES(33,17,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(34,17,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(18,'02/09/2018','A','A','Schalke 04',0,0,16,4,16,9,1,1,'Hertha',2,1,5,3,15,0,1,0);
INSERT INTO TeamsInMatches VALUES(35,18,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(36,18,'Hertha');
INSERT INTO Matches VALUES(19,'14/09/2018','H','H','Dortmund',3,1,10,6,11,7,0,0,'Ein Frankfurt',1,0,5,2,11,1,1,0);
INSERT INTO TeamsInMatches VALUES(37,19,'Dortmund');
INSERT INTO TeamsInMatches VALUES(38,19,'Ein Frankfurt');
INSERT INTO Matches VALUES(20,'15/09/2018','H','H','Bayern Munich',3,2,18,5,4,9,0,0,'Leverkusen',1,1,3,1,12,1,1,1);
INSERT INTO TeamsInMatches VALUES(39,20,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(40,20,'Leverkusen');
INSERT INTO Matches VALUES(21,'15/09/2018','H','H','Fortuna Dusseldorf',2,1,8,4,10,0,1,0,'Hoffenheim',1,0,18,5,19,9,2,0);
INSERT INTO TeamsInMatches VALUES(41,21,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(42,21,'Hoffenheim');
INSERT INTO Matches VALUES(22,'15/09/2018','H','D','Mainz',2,0,22,7,9,5,1,0,'Augsburg',1,0,13,4,16,4,2,0);
INSERT INTO TeamsInMatches VALUES(43,22,'Mainz');
INSERT INTO TeamsInMatches VALUES(44,22,'Augsburg');
INSERT INTO Matches VALUES(23,'15/09/2018','H','H','Mgladbach',2,1,15,4,5,6,0,0,'Schalke 04',1,0,15,6,12,6,4,0);
INSERT INTO TeamsInMatches VALUES(45,23,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(46,23,'Schalke 04');
INSERT INTO Matches VALUES(24,'15/09/2018','H','H','RB Leipzig',3,2,15,6,12,4,4,0,'Hannover',2,1,16,8,12,12,4,0);
INSERT INTO TeamsInMatches VALUES(47,24,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(48,24,'Hannover');
INSERT INTO Matches VALUES(25,'15/09/2018','D','D','Wolfsburg',2,0,15,6,10,7,1,0,'Hertha',2,0,9,5,13,2,2,0);
INSERT INTO TeamsInMatches VALUES(49,25,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(50,25,'Hertha');
INSERT INTO Matches VALUES(26,'16/09/2018','D','D','Freiburg',3,1,12,5,13,5,3,1,'Stuttgart',3,1,11,6,11,8,4,0);
INSERT INTO TeamsInMatches VALUES(51,26,'Freiburg');
INSERT INTO TeamsInMatches VALUES(52,26,'Stuttgart');
INSERT INTO Matches VALUES(27,'16/09/2018','D','H','Werder Bremen',1,1,14,2,17,4,2,0,'Nurnberg',1,0,11,2,5,7,0,0);
INSERT INTO TeamsInMatches VALUES(53,27,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(54,27,'Nurnberg');
INSERT INTO Matches VALUES(28,'21/09/2018','D','D','Stuttgart',0,0,10,1,8,2,0,0,'Fortuna Dusseldorf',0,0,19,7,19,9,2,0);
INSERT INTO TeamsInMatches VALUES(55,28,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(56,28,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(29,'22/09/2018','A','A','Augsburg',2,1,21,7,10,7,2,0,'Werder Bremen',3,2,12,7,11,4,2,0);
INSERT INTO TeamsInMatches VALUES(57,29,'Augsburg');
INSERT INTO TeamsInMatches VALUES(58,29,'Werder Bremen');
INSERT INTO Matches VALUES(30,'22/09/2018','H','H','Hertha',4,2,16,7,9,8,2,0,'Mgladbach',2,1,17,4,13,7,2,0);
INSERT INTO TeamsInMatches VALUES(59,30,'Hertha');
INSERT INTO TeamsInMatches VALUES(60,30,'Mgladbach');
INSERT INTO Matches VALUES(31,'22/09/2018','D','H','Hoffenheim',1,1,17,5,12,4,2,0,'Dortmund',1,0,8,2,10,4,1,1);
INSERT INTO TeamsInMatches VALUES(61,31,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(62,31,'Dortmund');
INSERT INTO Matches VALUES(32,'22/09/2018','H','D','Nurnberg',2,0,14,6,16,9,3,0,'Hannover',0,0,9,3,7,3,1,1);
INSERT INTO TeamsInMatches VALUES(63,32,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(64,32,'Hannover');
INSERT INTO Matches VALUES(33,'22/09/2018','A','A','Schalke 04',0,0,10,2,12,0,2,0,'Bayern Munich',2,1,14,7,11,8,1,0);
INSERT INTO TeamsInMatches VALUES(65,33,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(66,33,'Bayern Munich');
INSERT INTO Matches VALUES(34,'22/09/2018','A','A','Wolfsburg',1,0,17,9,12,7,0,0,'Freiburg',3,2,12,8,17,7,3,0);
INSERT INTO TeamsInMatches VALUES(67,34,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(68,34,'Freiburg');
INSERT INTO Matches VALUES(35,'23/09/2018','D','H','Ein Frankfurt',1,1,8,5,14,4,1,0,'RB Leipzig',1,0,9,2,8,2,1,0);
INSERT INTO TeamsInMatches VALUES(69,35,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(70,35,'RB Leipzig');
INSERT INTO Matches VALUES(36,'23/09/2018','H','D','Leverkusen',1,0,18,5,12,7,2,0,'Mainz',0,0,12,5,13,4,2,0);
INSERT INTO TeamsInMatches VALUES(71,36,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(72,36,'Mainz');
INSERT INTO Matches VALUES(37,'25/09/2018','D','D','Bayern Munich',1,0,16,8,6,8,3,0,'Augsburg',1,0,12,4,15,4,2,0);
INSERT INTO TeamsInMatches VALUES(73,37,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(74,37,'Augsburg');
INSERT INTO Matches VALUES(38,'25/09/2018','H','D','Freiburg',1,0,15,4,12,3,2,0,'Schalke 04',0,0,15,3,11,3,4,0);
INSERT INTO TeamsInMatches VALUES(75,38,'Freiburg');
INSERT INTO TeamsInMatches VALUES(76,38,'Schalke 04');
INSERT INTO Matches VALUES(39,'25/09/2018','A','A','Hannover',1,0,17,8,12,8,2,0,'Hoffenheim',3,1,17,9,13,5,2,0);
INSERT INTO TeamsInMatches VALUES(77,39,'Hannover');
INSERT INTO TeamsInMatches VALUES(78,39,'Hoffenheim');
INSERT INTO Matches VALUES(40,'25/09/2018','H','H','Werder Bremen',3,2,14,6,13,2,1,0,'Hertha',1,0,12,2,9,3,3,0);
INSERT INTO TeamsInMatches VALUES(79,40,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(80,40,'Hertha');
INSERT INTO Matches VALUES(41,'26/09/2018','H','H','Dortmund',7,2,19,10,6,4,0,0,'Nurnberg',0,0,4,1,10,5,2,0);
INSERT INTO TeamsInMatches VALUES(81,41,'Dortmund');
INSERT INTO TeamsInMatches VALUES(82,41,'Nurnberg');
INSERT INTO Matches VALUES(42,'26/09/2018','A','D','Fortuna Dusseldorf',1,0,16,4,6,7,2,0,'Leverkusen',2,0,6,3,12,5,2,0);
INSERT INTO TeamsInMatches VALUES(83,42,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(84,42,'Leverkusen');
INSERT INTO Matches VALUES(43,'26/09/2018','D','D','Mainz',0,0,11,2,13,5,1,0,'Wolfsburg',0,0,12,4,15,11,2,0);
INSERT INTO TeamsInMatches VALUES(85,43,'Mainz');
INSERT INTO TeamsInMatches VALUES(86,43,'Wolfsburg');
INSERT INTO Matches VALUES(44,'26/09/2018','H','D','Mgladbach',3,0,21,9,7,9,0,0,'Ein Frankfurt',1,0,12,2,11,6,0,0);
INSERT INTO TeamsInMatches VALUES(87,44,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(88,44,'Ein Frankfurt');
INSERT INTO Matches VALUES(45,'26/09/2018','H','H','RB Leipzig',2,1,18,8,11,4,2,0,'Stuttgart',0,0,9,0,8,2,3,0);
INSERT INTO TeamsInMatches VALUES(89,45,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(90,45,'Stuttgart');
INSERT INTO Matches VALUES(46,'28/09/2018','H','H','Hertha',2,2,6,4,14,1,3,0,'Bayern Munich',0,0,25,5,10,14,1,0);
INSERT INTO TeamsInMatches VALUES(91,46,'Hertha');
INSERT INTO TeamsInMatches VALUES(92,46,'Bayern Munich');
INSERT INTO Matches VALUES(47,'29/09/2018','A','D','Hoffenheim',1,0,13,6,4,4,1,0,'RB Leipzig',2,0,18,7,14,8,3,0);
INSERT INTO TeamsInMatches VALUES(93,47,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(94,47,'RB Leipzig');
INSERT INTO Matches VALUES(48,'29/09/2018','A','H','Leverkusen',2,2,14,6,11,6,1,0,'Dortmund',4,0,16,10,12,8,1,0);
INSERT INTO TeamsInMatches VALUES(95,48,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(96,48,'Dortmund');
INSERT INTO Matches VALUES(49,'29/09/2018','H','H','Nurnberg',3,1,10,6,10,4,0,0,'Fortuna Dusseldorf',0,0,13,4,9,4,2,0);
INSERT INTO TeamsInMatches VALUES(97,49,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(98,49,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(50,'29/09/2018','H','H','Schalke 04',1,1,15,2,22,4,2,0,'Mainz',0,0,15,5,21,5,2,0);
INSERT INTO TeamsInMatches VALUES(99,50,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(100,50,'Mainz');
INSERT INTO Matches VALUES(51,'29/09/2018','H','H','Stuttgart',2,1,18,5,15,6,3,0,'Werder Bremen',1,0,14,3,14,8,4,1);
INSERT INTO TeamsInMatches VALUES(101,51,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(102,51,'Werder Bremen');
INSERT INTO Matches VALUES(52,'29/09/2018','D','D','Wolfsburg',2,1,13,3,6,6,2,0,'Mgladbach',2,1,10,3,14,3,2,0);
INSERT INTO TeamsInMatches VALUES(103,52,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(104,52,'Mgladbach');
INSERT INTO Matches VALUES(53,'30/09/2018','H','H','Augsburg',4,2,21,10,12,5,0,0,'Freiburg',1,0,13,6,8,3,1,0);
INSERT INTO TeamsInMatches VALUES(105,53,'Augsburg');
INSERT INTO TeamsInMatches VALUES(106,53,'Freiburg');
INSERT INTO Matches VALUES(54,'30/09/2018','H','H','Ein Frankfurt',4,2,15,7,16,3,1,0,'Hannover',1,0,4,1,11,4,2,0);
INSERT INTO TeamsInMatches VALUES(107,54,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(108,54,'Hannover');
INSERT INTO Matches VALUES(55,'05/10/2018','H','H','Werder Bremen',2,1,15,5,12,7,1,0,'Wolfsburg',0,0,10,4,13,5,2,0);
INSERT INTO TeamsInMatches VALUES(109,55,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(110,55,'Wolfsburg');
INSERT INTO Matches VALUES(56,'06/10/2018','A','A','Bayern Munich',0,0,14,3,7,1,2,0,'Mgladbach',3,2,7,3,4,3,2,0);
INSERT INTO TeamsInMatches VALUES(111,56,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(112,56,'Mgladbach');
INSERT INTO Matches VALUES(57,'06/10/2018','H','A','Dortmund',4,0,20,8,5,9,1,0,'Augsburg',3,1,12,6,29,6,7,0);
INSERT INTO TeamsInMatches VALUES(113,57,'Dortmund');
INSERT INTO TeamsInMatches VALUES(114,57,'Augsburg');
INSERT INTO Matches VALUES(58,'06/10/2018','A','D','Fortuna Dusseldorf',0,0,9,3,17,4,3,0,'Schalke 04',2,0,15,5,15,6,1,0);
INSERT INTO TeamsInMatches VALUES(115,58,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(116,58,'Schalke 04');
INSERT INTO Matches VALUES(59,'06/10/2018','H','H','Hannover',3,2,15,6,16,5,1,0,'Stuttgart',1,0,11,5,11,7,2,0);
INSERT INTO TeamsInMatches VALUES(117,59,'Hannover');
INSERT INTO TeamsInMatches VALUES(118,59,'Stuttgart');
INSERT INTO Matches VALUES(60,'06/10/2018','D','D','Mainz',0,0,23,3,12,5,0,0,'Hertha',0,0,11,1,9,6,2,0);
INSERT INTO TeamsInMatches VALUES(119,60,'Mainz');
INSERT INTO TeamsInMatches VALUES(120,60,'Hertha');
INSERT INTO Matches VALUES(61,'07/10/2018','D','D','Freiburg',0,0,7,1,11,3,3,0,'Leverkusen',0,0,14,0,12,4,1,0);
INSERT INTO TeamsInMatches VALUES(121,61,'Freiburg');
INSERT INTO TeamsInMatches VALUES(122,61,'Leverkusen');
INSERT INTO Matches VALUES(62,'07/10/2018','A','A','Hoffenheim',1,0,20,4,15,6,2,0,'Ein Frankfurt',2,1,6,4,16,0,4,1);
INSERT INTO TeamsInMatches VALUES(123,62,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(124,62,'Ein Frankfurt');
INSERT INTO Matches VALUES(63,'07/10/2018','H','H','RB Leipzig',6,4,18,8,11,6,0,0,'Nurnberg',0,0,3,0,12,1,1,1);
INSERT INTO TeamsInMatches VALUES(125,63,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(126,63,'Nurnberg');
INSERT INTO Matches VALUES(64,'19/10/2018','H','H','Ein Frankfurt',7,3,21,13,13,5,0,0,'Fortuna Dusseldorf',1,0,10,5,12,1,2,0);
INSERT INTO TeamsInMatches VALUES(127,64,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(128,64,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(65,'20/10/2018','D','D','Augsburg',0,0,6,0,20,2,2,0,'RB Leipzig',0,0,15,3,24,2,5,0);
INSERT INTO TeamsInMatches VALUES(129,65,'Augsburg');
INSERT INTO TeamsInMatches VALUES(130,65,'RB Leipzig');
INSERT INTO Matches VALUES(66,'20/10/2018','D','D','Leverkusen',2,1,19,7,14,9,1,0,'Hannover',2,1,9,7,18,5,5,1);
INSERT INTO TeamsInMatches VALUES(131,66,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(132,66,'Hannover');
INSERT INTO Matches VALUES(67,'20/10/2018','A','H','Nurnberg',1,1,7,2,8,1,4,0,'Hoffenheim',3,0,20,12,9,7,2,0);
INSERT INTO TeamsInMatches VALUES(133,67,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(134,67,'Hoffenheim');
INSERT INTO Matches VALUES(68,'20/10/2018','A','A','Schalke 04',0,0,14,4,13,3,1,0,'Werder Bremen',2,1,8,3,9,1,4,0);
INSERT INTO TeamsInMatches VALUES(135,68,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(136,68,'Werder Bremen');
INSERT INTO Matches VALUES(69,'20/10/2018','A','A','Stuttgart',0,0,13,5,7,10,0,0,'Dortmund',4,3,12,4,5,2,0,0);
INSERT INTO TeamsInMatches VALUES(137,69,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(138,69,'Dortmund');
INSERT INTO Matches VALUES(70,'20/10/2018','A','A','Wolfsburg',1,0,8,1,9,2,2,0,'Bayern Munich',3,1,13,11,12,9,4,1);
INSERT INTO TeamsInMatches VALUES(139,70,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(140,70,'Bayern Munich');
INSERT INTO Matches VALUES(71,'21/10/2018','D','D','Hertha',1,1,13,5,12,8,2,0,'Freiburg',1,1,8,3,14,3,0,0);
INSERT INTO TeamsInMatches VALUES(141,71,'Hertha');
INSERT INTO TeamsInMatches VALUES(142,71,'Freiburg');
INSERT INTO Matches VALUES(72,'21/10/2018','H','H','Mgladbach',4,1,16,8,4,4,0,0,'Mainz',0,0,13,4,10,6,2,0);
INSERT INTO TeamsInMatches VALUES(143,72,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(144,72,'Mainz');
INSERT INTO Matches VALUES(73,'26/10/2018','H','D','Freiburg',3,1,13,7,9,3,1,0,'Mgladbach',1,1,11,2,12,10,1,0);
INSERT INTO TeamsInMatches VALUES(145,73,'Freiburg');
INSERT INTO TeamsInMatches VALUES(146,73,'Mgladbach');
INSERT INTO Matches VALUES(74,'27/10/2018','D','D','Dortmund',2,1,19,5,7,8,2,0,'Hertha',2,1,10,4,15,2,3,0);
INSERT INTO TeamsInMatches VALUES(147,74,'Dortmund');
INSERT INTO TeamsInMatches VALUES(148,74,'Hertha');
INSERT INTO Matches VALUES(75,'27/10/2018','A','A','Fortuna Dusseldorf',0,0,8,1,12,4,3,0,'Wolfsburg',3,1,18,6,11,9,6,0);
INSERT INTO TeamsInMatches VALUES(149,75,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(150,75,'Wolfsburg');
INSERT INTO Matches VALUES(76,'27/10/2018','A','A','Hannover',1,0,17,4,15,5,2,0,'Augsburg',2,1,9,4,16,4,3,0);
INSERT INTO TeamsInMatches VALUES(151,76,'Hannover');
INSERT INTO TeamsInMatches VALUES(152,76,'Augsburg');
INSERT INTO Matches VALUES(77,'27/10/2018','H','D','Hoffenheim',4,0,22,10,11,6,1,0,'Stuttgart',0,0,6,0,9,3,1,1);
INSERT INTO TeamsInMatches VALUES(153,77,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(154,77,'Stuttgart');
INSERT INTO Matches VALUES(78,'27/10/2018','A','A','Mainz',1,0,6,1,13,2,3,0,'Bayern Munich',2,1,21,5,6,7,1,0);
INSERT INTO TeamsInMatches VALUES(155,78,'Mainz');
INSERT INTO TeamsInMatches VALUES(156,78,'Bayern Munich');
INSERT INTO Matches VALUES(79,'28/10/2018','D','D','Nurnberg',1,0,10,3,11,8,2,0,'Ein Frankfurt',1,0,10,2,13,6,3,0);
INSERT INTO TeamsInMatches VALUES(157,79,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(158,79,'Ein Frankfurt');
INSERT INTO Matches VALUES(80,'28/10/2018','D','D','RB Leipzig',0,0,15,2,11,7,3,0,'Schalke 04',0,0,6,0,13,4,2,0);
INSERT INTO TeamsInMatches VALUES(159,80,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(160,80,'Schalke 04');
INSERT INTO Matches VALUES(81,'28/10/2018','A','A','Werder Bremen',2,0,14,6,9,6,2,0,'Leverkusen',6,3,17,10,8,6,2,0);
INSERT INTO TeamsInMatches VALUES(161,81,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(162,81,'Leverkusen');
INSERT INTO Matches VALUES(82,'02/11/2018','A','A','Stuttgart',0,0,10,0,4,1,1,0,'Ein Frankfurt',3,2,15,7,10,3,2,0);
INSERT INTO TeamsInMatches VALUES(163,82,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(164,82,'Ein Frankfurt');
INSERT INTO Matches VALUES(83,'03/11/2018','D','H','Augsburg',2,1,17,4,16,6,3,0,'Nurnberg',2,0,13,5,11,6,3,0);
INSERT INTO TeamsInMatches VALUES(165,83,'Augsburg');
INSERT INTO TeamsInMatches VALUES(166,83,'Nurnberg');
INSERT INTO Matches VALUES(84,'03/11/2018','D','D','Bayern Munich',1,0,24,6,9,14,1,0,'Freiburg',1,0,10,1,8,2,1,0);
INSERT INTO TeamsInMatches VALUES(167,84,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(168,84,'Freiburg');
INSERT INTO Matches VALUES(85,'03/11/2018','A','A','Hertha',0,0,12,5,6,3,2,0,'RB Leipzig',3,1,25,11,11,7,1,0);
INSERT INTO TeamsInMatches VALUES(169,85,'Hertha');
INSERT INTO TeamsInMatches VALUES(170,85,'RB Leipzig');
INSERT INTO Matches VALUES(86,'03/11/2018','A','A','Leverkusen',1,1,21,9,6,6,0,0,'Hoffenheim',4,2,10,4,17,7,2,0);
INSERT INTO TeamsInMatches VALUES(171,86,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(172,86,'Hoffenheim');
INSERT INTO Matches VALUES(87,'03/11/2018','H','D','Schalke 04',3,0,16,6,10,7,2,0,'Hannover',1,0,20,6,10,7,3,0);
INSERT INTO TeamsInMatches VALUES(173,87,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(174,87,'Hannover');
INSERT INTO Matches VALUES(88,'03/11/2018','A','A','Wolfsburg',0,0,13,3,6,6,0,0,'Dortmund',1,1,12,1,9,14,2,0);
INSERT INTO TeamsInMatches VALUES(175,88,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(176,88,'Dortmund');
INSERT INTO Matches VALUES(89,'04/11/2018','H','H','Mainz',2,1,13,6,7,3,0,0,'Werder Bremen',1,0,14,4,8,6,2,0);
INSERT INTO TeamsInMatches VALUES(177,89,'Mainz');
INSERT INTO TeamsInMatches VALUES(178,89,'Werder Bremen');
INSERT INTO Matches VALUES(90,'04/11/2018','H','D','Mgladbach',3,0,21,7,15,10,1,0,'Fortuna Dusseldorf',0,0,13,6,8,4,2,0);
INSERT INTO TeamsInMatches VALUES(179,90,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(180,90,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(91,'09/11/2018','H','H','Hannover',2,1,10,4,14,3,4,0,'Wolfsburg',1,0,19,9,8,5,2,0);
INSERT INTO TeamsInMatches VALUES(181,91,'Hannover');
INSERT INTO TeamsInMatches VALUES(182,91,'Wolfsburg');
INSERT INTO Matches VALUES(92,'10/11/2018','H','A','Dortmund',3,0,11,5,4,0,3,0,'Bayern Munich',2,1,9,3,8,6,3,0);
INSERT INTO TeamsInMatches VALUES(183,92,'Dortmund');
INSERT INTO TeamsInMatches VALUES(184,92,'Bayern Munich');
INSERT INTO Matches VALUES(93,'10/11/2018','H','D','Fortuna Dusseldorf',4,0,20,9,15,2,1,0,'Hertha',1,0,11,5,15,6,3,1);
INSERT INTO TeamsInMatches VALUES(185,93,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(186,93,'Hertha');
INSERT INTO Matches VALUES(94,'10/11/2018','A','A','Freiburg',1,0,15,4,19,3,1,0,'Mainz',3,2,12,9,10,4,2,0);
INSERT INTO TeamsInMatches VALUES(187,94,'Freiburg');
INSERT INTO TeamsInMatches VALUES(188,94,'Mainz');
INSERT INTO Matches VALUES(95,'10/11/2018','H','D','Hoffenheim',2,0,18,7,14,6,1,0,'Augsburg',1,0,22,7,6,6,1,0);
INSERT INTO TeamsInMatches VALUES(189,95,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(190,95,'Augsburg');
INSERT INTO Matches VALUES(96,'10/11/2018','A','D','Nurnberg',0,0,10,3,14,3,1,0,'Stuttgart',2,0,13,4,10,9,0,0);
INSERT INTO TeamsInMatches VALUES(191,96,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(192,96,'Stuttgart');
INSERT INTO Matches VALUES(97,'10/11/2018','A','A','Werder Bremen',1,0,20,5,7,9,0,0,'Mgladbach',3,1,16,6,2,5,0,0);
INSERT INTO TeamsInMatches VALUES(193,97,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(194,97,'Mgladbach');
INSERT INTO Matches VALUES(98,'11/11/2018','H','D','Ein Frankfurt',3,0,14,4,7,10,0,0,'Schalke 04',0,0,5,1,13,4,2,0);
INSERT INTO TeamsInMatches VALUES(195,98,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(196,98,'Schalke 04');
INSERT INTO Matches VALUES(99,'11/11/2018','H','H','RB Leipzig',3,1,14,7,12,4,0,0,'Leverkusen',0,0,7,2,12,3,1,0);
INSERT INTO TeamsInMatches VALUES(197,99,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(198,99,'Leverkusen');
INSERT INTO Matches VALUES(100,'23/11/2018','H','D','Leverkusen',2,0,17,4,13,6,3,0,'Stuttgart',0,0,10,2,8,9,3,0);
INSERT INTO TeamsInMatches VALUES(199,100,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(200,100,'Stuttgart');
INSERT INTO Matches VALUES(101,'24/11/2018','A','A','Augsburg',1,0,25,10,3,8,1,0,'Ein Frankfurt',3,1,15,7,12,5,2,0);
INSERT INTO TeamsInMatches VALUES(201,101,'Augsburg');
INSERT INTO TeamsInMatches VALUES(202,101,'Ein Frankfurt');
INSERT INTO Matches VALUES(102,'24/11/2018','D','H','Bayern Munich',3,2,17,5,4,9,0,0,'Fortuna Dusseldorf',3,1,9,5,7,2,1,0);
INSERT INTO TeamsInMatches VALUES(203,102,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(204,102,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(103,'24/11/2018','D','A','Hertha',3,1,23,8,9,8,1,0,'Hoffenheim',3,2,13,6,13,5,2,0);
INSERT INTO TeamsInMatches VALUES(205,103,'Hertha');
INSERT INTO TeamsInMatches VALUES(206,103,'Hoffenheim');
INSERT INTO Matches VALUES(104,'24/11/2018','A','D','Mainz',1,0,15,7,9,6,2,0,'Dortmund',2,0,11,7,11,5,1,0);
INSERT INTO TeamsInMatches VALUES(207,104,'Mainz');
INSERT INTO TeamsInMatches VALUES(208,104,'Dortmund');
INSERT INTO Matches VALUES(105,'24/11/2018','H','H','Schalke 04',5,2,20,10,7,7,1,0,'Nurnberg',2,1,12,6,12,2,2,1);
INSERT INTO TeamsInMatches VALUES(209,105,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(210,105,'Nurnberg');
INSERT INTO Matches VALUES(106,'24/11/2018','H','D','Wolfsburg',1,0,5,3,10,2,1,0,'RB Leipzig',0,0,10,4,13,9,2,0);
INSERT INTO TeamsInMatches VALUES(211,106,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(212,106,'RB Leipzig');
INSERT INTO Matches VALUES(107,'25/11/2018','D','H','Freiburg',1,1,23,9,6,6,0,0,'Werder Bremen',1,0,19,8,10,3,2,0);
INSERT INTO TeamsInMatches VALUES(213,107,'Freiburg');
INSERT INTO TeamsInMatches VALUES(214,107,'Werder Bremen');
INSERT INTO Matches VALUES(108,'25/11/2018','H','H','Mgladbach',4,2,20,6,8,5,1,0,'Hannover',1,1,5,3,10,5,1,0);
INSERT INTO TeamsInMatches VALUES(215,108,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(216,108,'Hannover');
INSERT INTO Matches VALUES(109,'30/11/2018','A','D','Fortuna Dusseldorf',0,0,20,7,8,12,1,0,'Mainz',1,0,15,3,7,5,1,0);
INSERT INTO TeamsInMatches VALUES(217,109,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(218,109,'Mainz');
INSERT INTO Matches VALUES(110,'01/12/2018','H','H','Dortmund',2,1,11,4,6,2,1,0,'Freiburg',0,0,5,1,11,3,1,0);
INSERT INTO TeamsInMatches VALUES(219,110,'Dortmund');
INSERT INTO TeamsInMatches VALUES(220,110,'Freiburg');
INSERT INTO Matches VALUES(111,'01/12/2018','A','A','Hannover',0,0,10,2,9,3,2,0,'Hertha',2,1,14,8,14,6,3,0);
INSERT INTO TeamsInMatches VALUES(221,111,'Hannover');
INSERT INTO TeamsInMatches VALUES(222,111,'Hertha');
INSERT INTO Matches VALUES(112,'01/12/2018','D','D','Hoffenheim',1,0,20,7,11,4,3,0,'Schalke 04',1,0,13,5,13,10,3,0);
INSERT INTO TeamsInMatches VALUES(223,112,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(224,112,'Schalke 04');
INSERT INTO Matches VALUES(113,'01/12/2018','H','H','Stuttgart',1,1,13,3,11,3,4,0,'Augsburg',0,0,17,4,10,8,2,0);
INSERT INTO TeamsInMatches VALUES(225,113,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(226,113,'Augsburg');
INSERT INTO Matches VALUES(114,'01/12/2018','A','D','Werder Bremen',1,1,9,3,13,3,3,1,'Bayern Munich',2,1,16,5,8,10,2,0);
INSERT INTO TeamsInMatches VALUES(227,114,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(228,114,'Bayern Munich');
INSERT INTO Matches VALUES(115,'02/12/2018','A','A','Ein Frankfurt',1,0,13,2,10,9,3,0,'Wolfsburg',2,1,10,3,9,3,7,0);
INSERT INTO TeamsInMatches VALUES(229,115,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(230,115,'Wolfsburg');
INSERT INTO Matches VALUES(116,'02/12/2018','H','H','RB Leipzig',2,2,14,6,9,5,2,0,'Mgladbach',0,0,7,4,9,4,2,0);
INSERT INTO TeamsInMatches VALUES(231,116,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(232,116,'Mgladbach');
INSERT INTO Matches VALUES(117,'03/12/2018','D','A','Nurnberg',1,0,11,4,14,3,3,0,'Leverkusen',1,1,20,6,10,6,2,0);
INSERT INTO TeamsInMatches VALUES(233,117,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(234,117,'Leverkusen');
INSERT INTO Matches VALUES(118,'07/12/2018','H','D','Werder Bremen',3,1,22,9,13,6,3,0,'Fortuna Dusseldorf',1,1,12,3,18,4,4,0);
INSERT INTO TeamsInMatches VALUES(235,118,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(236,118,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(119,'08/12/2018','H','H','Bayern Munich',3,2,20,8,9,11,1,0,'Nurnberg',0,0,4,1,6,1,0,0);
INSERT INTO TeamsInMatches VALUES(237,119,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(238,119,'Nurnberg');
INSERT INTO Matches VALUES(120,'08/12/2018','H','H','Freiburg',3,2,12,9,9,3,1,0,'RB Leipzig',0,0,15,4,16,12,2,0);
INSERT INTO TeamsInMatches VALUES(239,120,'Freiburg');
INSERT INTO TeamsInMatches VALUES(240,120,'RB Leipzig');
INSERT INTO Matches VALUES(121,'08/12/2018','H','H','Hertha',1,1,7,4,15,5,1,0,'Ein Frankfurt',0,0,18,4,14,9,0,0);
INSERT INTO TeamsInMatches VALUES(241,121,'Hertha');
INSERT INTO TeamsInMatches VALUES(242,121,'Ein Frankfurt');
INSERT INTO Matches VALUES(122,'08/12/2018','H','D','Leverkusen',1,0,21,7,11,4,1,0,'Augsburg',0,0,13,1,17,2,2,0);
INSERT INTO TeamsInMatches VALUES(243,122,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(244,122,'Augsburg');
INSERT INTO Matches VALUES(123,'08/12/2018','A','A','Schalke 04',1,0,6,3,12,3,4,0,'Dortmund',2,1,10,3,9,1,3,0);
INSERT INTO TeamsInMatches VALUES(245,123,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(246,123,'Dortmund');
INSERT INTO Matches VALUES(124,'08/12/2018','D','H','Wolfsburg',2,2,10,3,9,6,1,0,'Hoffenheim',2,1,19,6,9,4,2,0);
INSERT INTO TeamsInMatches VALUES(247,124,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(248,124,'Hoffenheim');
INSERT INTO Matches VALUES(125,'09/12/2018','D','A','Mainz',1,0,28,5,12,9,4,0,'Hannover',1,1,11,3,9,1,3,1);
INSERT INTO TeamsInMatches VALUES(249,125,'Mainz');
INSERT INTO TeamsInMatches VALUES(250,125,'Hannover');
INSERT INTO Matches VALUES(126,'09/12/2018','H','D','Mgladbach',3,0,23,7,7,7,2,0,'Stuttgart',0,0,7,2,12,4,4,1);
INSERT INTO TeamsInMatches VALUES(251,126,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(252,126,'Stuttgart');
INSERT INTO Matches VALUES(127,'14/12/2018','A','D','Nurnberg',0,0,11,0,13,6,2,0,'Wolfsburg',2,0,10,4,13,3,1,0);
INSERT INTO TeamsInMatches VALUES(253,127,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(254,127,'Wolfsburg');
INSERT INTO Matches VALUES(128,'15/12/2018','D','H','Augsburg',1,1,17,9,17,6,2,0,'Schalke 04',1,0,15,5,8,7,1,0);
INSERT INTO TeamsInMatches VALUES(255,128,'Augsburg');
INSERT INTO TeamsInMatches VALUES(256,128,'Schalke 04');
INSERT INTO Matches VALUES(129,'15/12/2018','H','H','Dortmund',2,2,16,9,11,4,1,0,'Werder Bremen',1,1,9,5,14,10,4,0);
INSERT INTO TeamsInMatches VALUES(257,129,'Dortmund');
INSERT INTO TeamsInMatches VALUES(258,129,'Werder Bremen');
INSERT INTO Matches VALUES(130,'15/12/2018','H','D','Fortuna Dusseldorf',2,0,20,8,13,4,2,0,'Freiburg',0,0,6,2,9,1,1,0);
INSERT INTO TeamsInMatches VALUES(259,130,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(260,130,'Freiburg');
INSERT INTO Matches VALUES(131,'15/12/2018','A','A','Hannover',0,0,3,0,9,0,1,0,'Bayern Munich',4,2,32,14,5,14,0,0);
INSERT INTO TeamsInMatches VALUES(261,131,'Hannover');
INSERT INTO TeamsInMatches VALUES(262,131,'Bayern Munich');
INSERT INTO Matches VALUES(132,'15/12/2018','D','D','Hoffenheim',0,0,27,6,9,6,0,0,'Mgladbach',0,0,5,1,10,2,2,0);
INSERT INTO TeamsInMatches VALUES(263,132,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(264,132,'Mgladbach');
INSERT INTO Matches VALUES(133,'15/12/2018','H','A','Stuttgart',2,0,9,4,11,5,1,0,'Hertha',1,1,15,3,13,5,3,0);
INSERT INTO TeamsInMatches VALUES(265,133,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(266,133,'Hertha');
INSERT INTO Matches VALUES(134,'16/12/2018','H','H','Ein Frankfurt',2,1,17,7,9,10,6,0,'Leverkusen',1,0,12,6,8,7,2,0);
INSERT INTO TeamsInMatches VALUES(267,134,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(268,134,'Leverkusen');
INSERT INTO Matches VALUES(135,'16/12/2018','H','H','RB Leipzig',4,2,17,7,9,6,3,0,'Mainz',1,1,11,5,13,2,3,0);
INSERT INTO TeamsInMatches VALUES(269,135,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(270,135,'Mainz');
INSERT INTO Matches VALUES(136,'18/12/2018','H','H','Fortuna Dusseldorf',2,1,8,3,8,2,1,0,'Dortmund',1,0,11,3,13,2,2,0);
INSERT INTO TeamsInMatches VALUES(271,136,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(272,136,'Dortmund');
INSERT INTO Matches VALUES(137,'18/12/2018','D','D','Hertha',2,2,17,7,17,3,1,0,'Augsburg',2,2,8,2,13,2,0,0);
INSERT INTO TeamsInMatches VALUES(273,137,'Hertha');
INSERT INTO TeamsInMatches VALUES(274,137,'Augsburg');
INSERT INTO Matches VALUES(138,'18/12/2018','H','D','Mgladbach',2,0,17,7,5,6,2,0,'Nurnberg',0,0,7,2,19,7,3,0);
INSERT INTO TeamsInMatches VALUES(275,138,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(276,138,'Nurnberg');
INSERT INTO Matches VALUES(139,'18/12/2018','H','H','Wolfsburg',2,2,16,5,10,4,1,0,'Stuttgart',0,0,11,1,17,8,2,0);
INSERT INTO TeamsInMatches VALUES(277,139,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(278,139,'Stuttgart');
INSERT INTO Matches VALUES(140,'19/12/2018','H','D','Bayern Munich',1,0,10,4,9,5,2,1,'RB Leipzig',0,0,8,2,20,5,2,1);
INSERT INTO TeamsInMatches VALUES(279,140,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(280,140,'RB Leipzig');
INSERT INTO Matches VALUES(141,'19/12/2018','D','D','Freiburg',1,1,14,7,13,5,0,0,'Hannover',1,1,18,3,14,2,2,0);
INSERT INTO TeamsInMatches VALUES(281,141,'Freiburg');
INSERT INTO TeamsInMatches VALUES(282,141,'Hannover');
INSERT INTO Matches VALUES(142,'19/12/2018','D','D','Mainz',2,2,17,6,13,3,3,0,'Ein Frankfurt',2,2,12,4,15,2,3,0);
INSERT INTO TeamsInMatches VALUES(283,142,'Mainz');
INSERT INTO TeamsInMatches VALUES(284,142,'Ein Frankfurt');
INSERT INTO Matches VALUES(143,'19/12/2018','A','A','Schalke 04',1,1,18,4,14,7,4,0,'Leverkusen',2,2,8,5,19,1,4,0);
INSERT INTO TeamsInMatches VALUES(285,143,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(286,143,'Leverkusen');
INSERT INTO Matches VALUES(144,'19/12/2018','D','A','Werder Bremen',1,0,26,5,7,6,0,0,'Hoffenheim',1,1,14,4,13,3,1,0);
INSERT INTO TeamsInMatches VALUES(287,144,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(288,144,'Hoffenheim');
INSERT INTO Matches VALUES(145,'21/12/2018','H','D','Dortmund',2,1,12,4,5,4,0,0,'Mgladbach',1,1,3,2,12,2,1,0);
INSERT INTO TeamsInMatches VALUES(289,145,'Dortmund');
INSERT INTO TeamsInMatches VALUES(290,145,'Mgladbach');
INSERT INTO Matches VALUES(146,'22/12/2018','A','A','Ein Frankfurt',0,0,10,3,9,3,2,0,'Bayern Munich',3,1,9,7,4,4,1,0);
INSERT INTO TeamsInMatches VALUES(291,146,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(292,146,'Bayern Munich');
INSERT INTO Matches VALUES(147,'22/12/2018','A','D','Hannover',0,0,17,3,14,4,2,0,'Fortuna Dusseldorf',1,0,13,6,19,6,3,0);
INSERT INTO TeamsInMatches VALUES(293,147,'Hannover');
INSERT INTO TeamsInMatches VALUES(294,147,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(148,'22/12/2018','H','H','Leverkusen',3,2,15,7,3,4,0,0,'Hertha',1,1,13,8,12,5,1,0);
INSERT INTO TeamsInMatches VALUES(295,148,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(296,148,'Hertha');
INSERT INTO Matches VALUES(149,'22/12/2018','A','A','Nurnberg',0,0,16,3,16,12,2,0,'Freiburg',1,1,7,3,16,3,3,0);
INSERT INTO TeamsInMatches VALUES(297,149,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(298,149,'Freiburg');
INSERT INTO Matches VALUES(150,'22/12/2018','H','H','RB Leipzig',3,2,11,5,15,4,2,0,'Werder Bremen',2,0,15,6,9,4,0,0);
INSERT INTO TeamsInMatches VALUES(299,150,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(300,150,'Werder Bremen');
INSERT INTO Matches VALUES(151,'22/12/2018','A','A','Stuttgart',1,0,17,5,9,2,3,0,'Schalke 04',3,1,15,6,17,5,5,0);
INSERT INTO TeamsInMatches VALUES(301,151,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(302,151,'Schalke 04');
INSERT INTO Matches VALUES(152,'23/12/2018','A','A','Augsburg',2,0,10,4,12,3,2,0,'Wolfsburg',3,2,16,5,11,4,3,0);
INSERT INTO TeamsInMatches VALUES(303,152,'Augsburg');
INSERT INTO TeamsInMatches VALUES(304,152,'Wolfsburg');
INSERT INTO Matches VALUES(153,'23/12/2018','D','D','Hoffenheim',1,1,28,7,11,9,1,0,'Mainz',1,1,12,5,10,2,0,0);
INSERT INTO TeamsInMatches VALUES(305,153,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(306,153,'Mainz');
INSERT INTO Matches VALUES(154,'18/01/2019','A','A','Hoffenheim',1,0,13,5,13,2,3,0,'Bayern Munich',3,2,21,9,9,6,2,0);
INSERT INTO TeamsInMatches VALUES(307,154,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(308,154,'Bayern Munich');
INSERT INTO Matches VALUES(155,'19/01/2019','A','A','Augsburg',1,0,13,6,13,5,3,0,'Fortuna Dusseldorf',2,1,11,3,9,3,1,0);
INSERT INTO TeamsInMatches VALUES(309,155,'Augsburg');
INSERT INTO TeamsInMatches VALUES(310,155,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(156,'19/01/2019','H','H','Ein Frankfurt',3,3,9,4,13,5,2,0,'Freiburg',1,0,21,7,8,5,1,0);
INSERT INTO TeamsInMatches VALUES(311,156,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(312,156,'Freiburg');
INSERT INTO Matches VALUES(157,'19/01/2019','A','A','Hannover',0,0,10,1,17,7,3,0,'Werder Bremen',1,1,23,13,19,8,1,0);
INSERT INTO TeamsInMatches VALUES(313,157,'Hannover');
INSERT INTO TeamsInMatches VALUES(314,157,'Werder Bremen');
INSERT INTO Matches VALUES(158,'19/01/2019','A','A','Leverkusen',0,0,22,10,9,10,1,0,'Mgladbach',1,1,7,3,14,3,2,0);
INSERT INTO TeamsInMatches VALUES(315,158,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(316,158,'Mgladbach');
INSERT INTO Matches VALUES(159,'19/01/2019','A','A','RB Leipzig',0,0,12,5,12,6,3,0,'Dortmund',1,1,8,4,9,7,2,0);
INSERT INTO TeamsInMatches VALUES(317,159,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(318,159,'Dortmund');
INSERT INTO Matches VALUES(160,'19/01/2019','A','A','Stuttgart',2,0,28,8,9,13,2,0,'Mainz',3,2,14,4,16,8,2,0);
INSERT INTO TeamsInMatches VALUES(319,160,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(320,160,'Mainz');
INSERT INTO Matches VALUES(161,'20/01/2019','A','D','Nurnberg',1,1,14,3,13,4,2,0,'Hertha',3,1,16,8,9,4,1,0);
INSERT INTO TeamsInMatches VALUES(321,161,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(322,161,'Hertha');
INSERT INTO Matches VALUES(162,'20/01/2019','H','D','Schalke 04',2,1,20,5,11,4,1,0,'Wolfsburg',1,1,12,5,5,6,0,0);
INSERT INTO TeamsInMatches VALUES(323,162,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(324,162,'Wolfsburg');
INSERT INTO Matches VALUES(163,'25/01/2019','D','D','Hertha',2,2,11,4,15,3,2,0,'Schalke 04',2,2,14,7,10,6,1,0);
INSERT INTO TeamsInMatches VALUES(325,163,'Hertha');
INSERT INTO TeamsInMatches VALUES(326,163,'Schalke 04');
INSERT INTO Matches VALUES(164,'26/01/2019','H','H','Dortmund',5,1,18,9,7,6,1,0,'Hannover',1,0,11,3,10,3,1,0);
INSERT INTO TeamsInMatches VALUES(327,164,'Dortmund');
INSERT INTO TeamsInMatches VALUES(328,164,'Hannover');
INSERT INTO Matches VALUES(165,'26/01/2019','A','D','Freiburg',2,1,20,8,17,6,0,0,'Hoffenheim',4,1,16,11,14,1,2,0);
INSERT INTO TeamsInMatches VALUES(329,165,'Freiburg');
INSERT INTO TeamsInMatches VALUES(330,165,'Hoffenheim');
INSERT INTO Matches VALUES(166,'26/01/2019','H','D','Mainz',2,1,20,4,12,5,3,0,'Nurnberg',1,1,8,3,16,5,1,0);
INSERT INTO TeamsInMatches VALUES(331,166,'Mainz');
INSERT INTO TeamsInMatches VALUES(332,166,'Nurnberg');
INSERT INTO Matches VALUES(167,'26/01/2019','H','D','Mgladbach',2,0,14,6,9,4,2,0,'Augsburg',0,0,4,1,15,0,4,0);
INSERT INTO TeamsInMatches VALUES(333,167,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(334,167,'Augsburg');
INSERT INTO Matches VALUES(168,'26/01/2019','D','D','Werder Bremen',2,1,18,9,11,8,4,0,'Ein Frankfurt',2,1,8,4,10,3,2,0);
INSERT INTO TeamsInMatches VALUES(335,168,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(336,168,'Ein Frankfurt');
INSERT INTO Matches VALUES(169,'26/01/2019','A','A','Wolfsburg',0,0,10,4,10,5,5,0,'Leverkusen',3,1,23,14,14,6,3,0);
INSERT INTO TeamsInMatches VALUES(337,169,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(338,169,'Leverkusen');
INSERT INTO Matches VALUES(170,'27/01/2019','H','D','Bayern Munich',4,1,19,6,9,8,1,0,'Stuttgart',1,1,7,2,9,1,1,0);
INSERT INTO TeamsInMatches VALUES(339,170,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(340,170,'Stuttgart');
INSERT INTO Matches VALUES(171,'27/01/2019','A','A','Fortuna Dusseldorf',0,0,10,0,11,8,1,0,'RB Leipzig',4,3,12,9,11,2,0,0);
INSERT INTO TeamsInMatches VALUES(341,171,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(342,171,'RB Leipzig');
INSERT INTO Matches VALUES(172,'01/02/2019','A','A','Hannover',0,0,5,1,14,0,2,0,'RB Leipzig',3,1,19,8,17,7,2,0);
INSERT INTO TeamsInMatches VALUES(343,172,'Hannover');
INSERT INTO TeamsInMatches VALUES(344,172,'RB Leipzig');
INSERT INTO Matches VALUES(173,'02/02/2019','D','D','Ein Frankfurt',1,1,12,7,15,6,2,0,'Dortmund',1,1,13,4,6,4,2,0);
INSERT INTO TeamsInMatches VALUES(345,173,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(346,173,'Dortmund');
INSERT INTO Matches VALUES(174,'02/02/2019','A','D','Hertha',0,0,11,4,19,3,3,0,'Wolfsburg',1,0,8,4,12,7,1,0);
INSERT INTO TeamsInMatches VALUES(347,174,'Hertha');
INSERT INTO TeamsInMatches VALUES(348,174,'Wolfsburg');
INSERT INTO Matches VALUES(175,'02/02/2019','D','H','Hoffenheim',1,1,12,4,22,5,3,0,'Fortuna Dusseldorf',1,0,8,6,12,5,4,0);
INSERT INTO TeamsInMatches VALUES(349,175,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(350,175,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(176,'02/02/2019','H','A','Leverkusen',3,0,11,4,13,7,3,0,'Bayern Munich',1,1,17,6,13,4,2,0);
INSERT INTO TeamsInMatches VALUES(351,176,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(352,176,'Bayern Munich');
INSERT INTO Matches VALUES(177,'02/02/2019','D','D','Nurnberg',1,0,11,2,17,3,4,0,'Werder Bremen',1,0,10,3,17,7,1,0);
INSERT INTO TeamsInMatches VALUES(353,177,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(354,177,'Werder Bremen');
INSERT INTO Matches VALUES(178,'02/02/2019','A','D','Schalke 04',0,0,9,1,9,1,1,1,'Mgladbach',2,0,16,9,8,6,2,0);
INSERT INTO TeamsInMatches VALUES(355,178,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(356,178,'Mgladbach');
INSERT INTO Matches VALUES(179,'03/02/2019','H','H','Augsburg',3,2,19,8,18,7,0,0,'Mainz',0,0,6,0,10,3,1,0);
INSERT INTO TeamsInMatches VALUES(357,179,'Augsburg');
INSERT INTO TeamsInMatches VALUES(358,179,'Mainz');
INSERT INTO Matches VALUES(180,'03/02/2019','D','A','Stuttgart',2,0,17,4,8,7,5,1,'Freiburg',2,1,16,4,9,8,0,0);
INSERT INTO TeamsInMatches VALUES(359,180,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(360,180,'Freiburg');
INSERT INTO Matches VALUES(181,'08/02/2019','A','A','Mainz',1,1,15,2,13,4,3,0,'Leverkusen',5,4,18,7,5,4,1,0);
INSERT INTO TeamsInMatches VALUES(361,181,'Mainz');
INSERT INTO TeamsInMatches VALUES(362,181,'Leverkusen');
INSERT INTO Matches VALUES(182,'09/02/2019','H','H','Bayern Munich',3,2,17,4,8,7,1,0,'Schalke 04',1,1,7,5,9,2,2,0);
INSERT INTO TeamsInMatches VALUES(363,182,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(364,182,'Schalke 04');
INSERT INTO Matches VALUES(183,'09/02/2019','D','H','Dortmund',3,2,16,7,7,7,0,0,'Hoffenheim',3,0,14,6,14,8,3,0);
INSERT INTO TeamsInMatches VALUES(365,183,'Dortmund');
INSERT INTO TeamsInMatches VALUES(366,183,'Hoffenheim');
INSERT INTO Matches VALUES(184,'09/02/2019','D','D','Freiburg',3,1,10,4,15,9,3,0,'Wolfsburg',3,1,15,4,10,2,2,0);
INSERT INTO TeamsInMatches VALUES(367,184,'Freiburg');
INSERT INTO TeamsInMatches VALUES(368,184,'Wolfsburg');
INSERT INTO Matches VALUES(185,'09/02/2019','H','H','Hannover',2,1,18,8,16,4,2,0,'Nurnberg',0,0,9,1,16,4,2,1);
INSERT INTO TeamsInMatches VALUES(369,185,'Hannover');
INSERT INTO TeamsInMatches VALUES(370,185,'Nurnberg');
INSERT INTO Matches VALUES(186,'09/02/2019','A','A','Mgladbach',0,0,13,4,7,5,0,0,'Hertha',3,1,11,4,11,5,2,0);
INSERT INTO TeamsInMatches VALUES(371,186,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(372,186,'Hertha');
INSERT INTO Matches VALUES(187,'09/02/2019','D','D','RB Leipzig',0,0,14,1,9,7,4,0,'Ein Frankfurt',0,0,6,2,10,4,2,0);
INSERT INTO TeamsInMatches VALUES(373,187,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(374,187,'Ein Frankfurt');
INSERT INTO Matches VALUES(188,'10/02/2019','H','H','Fortuna Dusseldorf',3,1,15,6,18,5,3,0,'Stuttgart',0,0,15,2,8,4,4,1);
INSERT INTO TeamsInMatches VALUES(375,188,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(376,188,'Stuttgart');
INSERT INTO Matches VALUES(189,'10/02/2019','H','H','Werder Bremen',4,3,11,5,5,3,0,0,'Augsburg',0,0,13,3,12,2,1,0);
INSERT INTO TeamsInMatches VALUES(377,189,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(378,189,'Augsburg');
INSERT INTO Matches VALUES(190,'15/02/2019','A','D','Augsburg',2,2,8,2,13,1,1,0,'Bayern Munich',3,2,17,8,12,9,2,0);
INSERT INTO TeamsInMatches VALUES(379,190,'Augsburg');
INSERT INTO TeamsInMatches VALUES(380,190,'Bayern Munich');
INSERT INTO Matches VALUES(191,'16/02/2019','D','H','Hertha',1,1,11,2,16,4,3,0,'Werder Bremen',1,0,8,2,11,3,3,0);
INSERT INTO TeamsInMatches VALUES(381,191,'Hertha');
INSERT INTO TeamsInMatches VALUES(382,191,'Werder Bremen');
INSERT INTO Matches VALUES(192,'16/02/2019','H','H','Hoffenheim',3,2,26,11,15,10,0,0,'Hannover',0,0,5,1,6,6,1,0);
INSERT INTO TeamsInMatches VALUES(383,192,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(384,192,'Hannover');
INSERT INTO Matches VALUES(193,'16/02/2019','D','D','Schalke 04',0,0,15,2,10,4,0,1,'Freiburg',0,0,12,3,13,9,4,1);
INSERT INTO TeamsInMatches VALUES(385,193,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(386,193,'Freiburg');
INSERT INTO Matches VALUES(194,'16/02/2019','A','D','Stuttgart',1,1,7,3,18,5,1,0,'RB Leipzig',3,1,7,4,11,4,1,0);
INSERT INTO TeamsInMatches VALUES(387,194,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(388,194,'RB Leipzig');
INSERT INTO Matches VALUES(195,'16/02/2019','H','H','Wolfsburg',3,1,16,6,6,4,1,0,'Mainz',0,0,12,4,11,7,1,0);
INSERT INTO TeamsInMatches VALUES(389,195,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(390,195,'Mainz');
INSERT INTO Matches VALUES(196,'17/02/2019','D','H','Ein Frankfurt',1,1,12,3,12,8,3,0,'Mgladbach',1,0,14,5,8,7,1,0);
INSERT INTO TeamsInMatches VALUES(391,196,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(392,196,'Mgladbach');
INSERT INTO Matches VALUES(197,'17/02/2019','H','H','Leverkusen',2,1,13,7,6,5,1,0,'Fortuna Dusseldorf',0,0,3,0,11,4,3,0);
INSERT INTO TeamsInMatches VALUES(393,197,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(394,197,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(198,'18/02/2019','D','D','Nurnberg',0,0,7,2,8,3,1,0,'Dortmund',0,0,17,6,9,11,1,0);
INSERT INTO TeamsInMatches VALUES(395,198,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(396,198,'Dortmund');
INSERT INTO Matches VALUES(199,'22/02/2019','D','D','Werder Bremen',1,1,15,4,7,4,1,0,'Stuttgart',1,1,8,3,9,2,3,0);
INSERT INTO TeamsInMatches VALUES(397,199,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(398,199,'Stuttgart');
INSERT INTO Matches VALUES(200,'23/02/2019','H','D','Bayern Munich',1,0,12,4,12,11,2,0,'Hertha',0,0,9,2,6,3,0,1);
INSERT INTO TeamsInMatches VALUES(399,200,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(400,200,'Hertha');
INSERT INTO Matches VALUES(201,'23/02/2019','H','A','Fortuna Dusseldorf',2,0,19,7,14,7,3,0,'Nurnberg',1,1,5,2,7,3,4,1);
INSERT INTO TeamsInMatches VALUES(401,201,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(402,201,'Nurnberg');
INSERT INTO Matches VALUES(202,'23/02/2019','H','H','Freiburg',5,3,19,11,13,8,0,0,'Augsburg',1,0,14,4,16,1,3,1);
INSERT INTO TeamsInMatches VALUES(403,202,'Freiburg');
INSERT INTO TeamsInMatches VALUES(404,202,'Augsburg');
INSERT INTO Matches VALUES(203,'23/02/2019','H','H','Mainz',3,1,21,6,10,1,4,0,'Schalke 04',0,0,10,3,15,3,2,0);
INSERT INTO TeamsInMatches VALUES(405,203,'Mainz');
INSERT INTO TeamsInMatches VALUES(406,203,'Schalke 04');
INSERT INTO Matches VALUES(204,'23/02/2019','A','A','Mgladbach',0,0,15,5,14,12,2,0,'Wolfsburg',3,1,5,3,11,1,1,0);
INSERT INTO TeamsInMatches VALUES(407,204,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(408,204,'Wolfsburg');
INSERT INTO Matches VALUES(205,'24/02/2019','H','H','Dortmund',3,2,9,4,10,3,1,0,'Leverkusen',2,1,13,4,9,8,2,0);
INSERT INTO TeamsInMatches VALUES(409,205,'Dortmund');
INSERT INTO TeamsInMatches VALUES(410,205,'Leverkusen');
INSERT INTO Matches VALUES(206,'24/02/2019','A','D','Hannover',0,0,11,3,11,3,1,0,'Ein Frankfurt',3,0,14,8,12,5,1,0);
INSERT INTO TeamsInMatches VALUES(411,206,'Hannover');
INSERT INTO TeamsInMatches VALUES(412,206,'Ein Frankfurt');
INSERT INTO Matches VALUES(207,'25/02/2019','D','A','RB Leipzig',1,0,15,4,16,6,0,0,'Hoffenheim',1,1,7,4,21,4,1,0);
INSERT INTO TeamsInMatches VALUES(413,207,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(414,207,'Hoffenheim');
INSERT INTO Matches VALUES(208,'01/03/2019','H','H','Augsburg',2,1,9,4,15,1,1,0,'Dortmund',1,0,18,8,11,4,2,0);
INSERT INTO TeamsInMatches VALUES(415,208,'Augsburg');
INSERT INTO TeamsInMatches VALUES(416,208,'Dortmund');
INSERT INTO Matches VALUES(209,'02/03/2019','H','D','Ein Frankfurt',3,1,18,10,8,4,0,0,'Hoffenheim',2,1,20,7,16,3,3,1);
INSERT INTO TeamsInMatches VALUES(417,209,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(418,209,'Hoffenheim');
INSERT INTO Matches VALUES(210,'02/03/2019','H','D','Hertha',2,0,11,4,13,4,0,0,'Mainz',1,0,13,1,10,1,2,0);
INSERT INTO TeamsInMatches VALUES(419,210,'Hertha');
INSERT INTO TeamsInMatches VALUES(420,210,'Mainz');
INSERT INTO Matches VALUES(211,'02/03/2019','H','H','Leverkusen',2,1,17,5,11,7,0,0,'Freiburg',0,0,8,3,7,2,0,0);
INSERT INTO TeamsInMatches VALUES(421,211,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(422,211,'Freiburg');
INSERT INTO Matches VALUES(212,'02/03/2019','A','A','Mgladbach',1,1,11,2,6,1,2,0,'Bayern Munich',5,2,19,14,11,9,2,0);
INSERT INTO TeamsInMatches VALUES(423,212,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(424,212,'Bayern Munich');
INSERT INTO Matches VALUES(213,'02/03/2019','A','A','Nurnberg',0,0,7,1,8,5,2,0,'RB Leipzig',1,1,12,5,17,8,3,0);
INSERT INTO TeamsInMatches VALUES(425,213,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(426,213,'RB Leipzig');
INSERT INTO Matches VALUES(214,'02/03/2019','A','A','Schalke 04',0,0,7,2,16,1,4,0,'Fortuna Dusseldorf',4,1,13,5,16,1,2,0);
INSERT INTO TeamsInMatches VALUES(427,214,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(428,214,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(215,'03/03/2019','H','H','Stuttgart',5,3,14,8,15,7,2,0,'Hannover',1,0,3,1,16,0,2,0);
INSERT INTO TeamsInMatches VALUES(429,215,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(430,215,'Hannover');
INSERT INTO Matches VALUES(216,'03/03/2019','D','D','Wolfsburg',1,0,13,5,8,6,0,0,'Werder Bremen',1,0,12,3,22,4,2,0);
INSERT INTO TeamsInMatches VALUES(431,216,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(432,216,'Werder Bremen');
INSERT INTO Matches VALUES(217,'08/03/2019','H','D','Werder Bremen',4,1,20,7,17,4,2,0,'Schalke 04',2,1,14,8,10,5,1,0);
INSERT INTO TeamsInMatches VALUES(433,217,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(434,217,'Schalke 04');
INSERT INTO Matches VALUES(218,'09/03/2019','H','H','Bayern Munich',6,2,22,12,9,7,0,0,'Wolfsburg',0,0,4,1,6,2,1,0);
INSERT INTO TeamsInMatches VALUES(435,218,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(436,218,'Wolfsburg');
INSERT INTO Matches VALUES(219,'09/03/2019','H','D','Dortmund',3,0,18,8,6,7,3,0,'Stuttgart',1,0,7,1,10,1,3,0);
INSERT INTO TeamsInMatches VALUES(437,219,'Dortmund');
INSERT INTO TeamsInMatches VALUES(438,219,'Stuttgart');
INSERT INTO Matches VALUES(220,'09/03/2019','H','H','Freiburg',2,1,10,4,10,3,1,0,'Hertha',1,0,16,6,14,6,3,0);
INSERT INTO TeamsInMatches VALUES(439,220,'Freiburg');
INSERT INTO TeamsInMatches VALUES(440,220,'Hertha');
INSERT INTO Matches VALUES(221,'09/03/2019','A','D','Mainz',0,0,15,2,12,2,2,0,'Mgladbach',1,0,11,4,4,6,0,0);
INSERT INTO TeamsInMatches VALUES(441,221,'Mainz');
INSERT INTO TeamsInMatches VALUES(442,221,'Mgladbach');
INSERT INTO Matches VALUES(222,'09/03/2019','D','D','RB Leipzig',0,0,17,4,13,7,1,0,'Augsburg',0,0,5,3,9,4,1,0);
INSERT INTO TeamsInMatches VALUES(443,222,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(444,222,'Augsburg');
INSERT INTO Matches VALUES(223,'10/03/2019','A','A','Hannover',2,0,11,5,14,6,3,0,'Leverkusen',3,2,15,5,15,6,1,0);
INSERT INTO TeamsInMatches VALUES(445,223,'Hannover');
INSERT INTO TeamsInMatches VALUES(446,223,'Leverkusen');
INSERT INTO Matches VALUES(224,'10/03/2019','H','H','Hoffenheim',2,1,18,6,10,8,3,0,'Nurnberg',1,0,11,5,7,3,2,0);
INSERT INTO TeamsInMatches VALUES(447,224,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(448,224,'Nurnberg');
INSERT INTO Matches VALUES(225,'11/03/2019','A','D','Fortuna Dusseldorf',0,0,7,3,9,1,1,0,'Ein Frankfurt',3,0,15,6,14,5,2,0);
INSERT INTO TeamsInMatches VALUES(449,225,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(450,225,'Ein Frankfurt');
INSERT INTO Matches VALUES(226,'15/03/2019','D','D','Mgladbach',1,1,13,2,10,10,0,0,'Freiburg',1,1,10,2,13,6,3,0);
INSERT INTO TeamsInMatches VALUES(451,226,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(452,226,'Freiburg');
INSERT INTO Matches VALUES(227,'16/03/2019','H','A','Augsburg',3,0,22,10,11,2,1,0,'Hannover',1,1,13,4,10,3,4,0);
INSERT INTO TeamsInMatches VALUES(453,227,'Augsburg');
INSERT INTO TeamsInMatches VALUES(454,227,'Hannover');
INSERT INTO Matches VALUES(228,'16/03/2019','A','H','Hertha',2,2,7,4,10,4,3,2,'Dortmund',3,1,25,8,5,10,3,0);
INSERT INTO TeamsInMatches VALUES(455,228,'Hertha');
INSERT INTO TeamsInMatches VALUES(456,228,'Dortmund');
INSERT INTO Matches VALUES(229,'16/03/2019','A','A','Schalke 04',0,0,14,3,12,0,1,0,'RB Leipzig',1,1,15,4,16,6,1,0);
INSERT INTO TeamsInMatches VALUES(457,229,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(458,229,'RB Leipzig');
INSERT INTO Matches VALUES(230,'16/03/2019','D','A','Stuttgart',1,0,13,2,10,4,4,0,'Hoffenheim',1,1,21,8,15,9,2,0);
INSERT INTO TeamsInMatches VALUES(459,230,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(460,230,'Hoffenheim');
INSERT INTO Matches VALUES(231,'16/03/2019','H','D','Wolfsburg',5,1,19,10,15,7,1,0,'Fortuna Dusseldorf',2,1,18,6,9,5,1,0);
INSERT INTO TeamsInMatches VALUES(461,231,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(462,231,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(232,'17/03/2019','H','H','Bayern Munich',6,3,22,11,7,13,1,0,'Mainz',0,0,7,1,5,2,0,0);
INSERT INTO TeamsInMatches VALUES(463,232,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(464,232,'Mainz');
INSERT INTO Matches VALUES(233,'17/03/2019','H','H','Ein Frankfurt',1,1,24,4,4,8,0,0,'Nurnberg',0,0,9,3,13,3,2,0);
INSERT INTO TeamsInMatches VALUES(465,233,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(466,233,'Nurnberg');
INSERT INTO Matches VALUES(234,'17/03/2019','A','A','Leverkusen',1,0,15,2,8,10,3,0,'Werder Bremen',3,2,10,5,11,3,2,0);
INSERT INTO TeamsInMatches VALUES(467,234,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(468,234,'Werder Bremen');
INSERT INTO Matches VALUES(235,'29/03/2019','H','D','Hoffenheim',4,1,13,5,8,4,2,0,'Leverkusen',1,1,18,6,6,7,2,0);
INSERT INTO TeamsInMatches VALUES(469,235,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(470,235,'Leverkusen');
INSERT INTO Matches VALUES(236,'30/03/2019','H','D','Dortmund',2,0,11,5,11,5,0,0,'Wolfsburg',0,0,7,3,13,4,3,0);
INSERT INTO TeamsInMatches VALUES(471,236,'Dortmund');
INSERT INTO TeamsInMatches VALUES(472,236,'Wolfsburg');
INSERT INTO Matches VALUES(237,'30/03/2019','H','H','Fortuna Dusseldorf',3,3,8,4,14,1,2,0,'Mgladbach',1,0,13,6,13,2,3,0);
INSERT INTO TeamsInMatches VALUES(473,237,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(474,237,'Mgladbach');
INSERT INTO Matches VALUES(238,'30/03/2019','D','D','Freiburg',1,1,12,5,8,1,3,0,'Bayern Munich',1,1,26,8,9,7,1,0);
INSERT INTO TeamsInMatches VALUES(475,238,'Freiburg');
INSERT INTO TeamsInMatches VALUES(476,238,'Bayern Munich');
INSERT INTO Matches VALUES(239,'30/03/2019','H','D','Nurnberg',3,0,12,4,8,4,1,0,'Augsburg',0,0,14,3,12,4,3,0);
INSERT INTO TeamsInMatches VALUES(477,239,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(478,239,'Augsburg');
INSERT INTO Matches VALUES(240,'30/03/2019','H','H','RB Leipzig',5,2,21,9,7,6,1,0,'Hertha',0,0,6,0,6,3,1,0);
INSERT INTO TeamsInMatches VALUES(479,240,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(480,240,'Hertha');
INSERT INTO Matches VALUES(241,'30/03/2019','H','H','Werder Bremen',3,2,8,4,11,7,0,0,'Mainz',1,0,12,5,9,8,1,0);
INSERT INTO TeamsInMatches VALUES(481,241,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(482,241,'Mainz');
INSERT INTO Matches VALUES(242,'31/03/2019','H','H','Ein Frankfurt',3,1,11,5,13,5,2,0,'Stuttgart',0,0,10,3,10,5,1,0);
INSERT INTO TeamsInMatches VALUES(483,242,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(484,242,'Stuttgart');
INSERT INTO Matches VALUES(243,'31/03/2019','A','A','Hannover',0,0,15,3,16,8,1,0,'Schalke 04',1,1,6,3,17,2,1,0);
INSERT INTO TeamsInMatches VALUES(485,243,'Hannover');
INSERT INTO TeamsInMatches VALUES(486,243,'Schalke 04');
INSERT INTO Matches VALUES(244,'05/04/2019','H','H','Mainz',5,3,9,5,17,2,3,0,'Freiburg',0,0,17,5,7,7,1,0);
INSERT INTO TeamsInMatches VALUES(487,244,'Mainz');
INSERT INTO TeamsInMatches VALUES(488,244,'Freiburg');
INSERT INTO Matches VALUES(245,'06/04/2019','H','H','Bayern Munich',5,4,22,10,9,11,1,0,'Dortmund',0,0,5,1,12,1,2,0);
INSERT INTO TeamsInMatches VALUES(489,245,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(490,245,'Dortmund');
INSERT INTO Matches VALUES(246,'06/04/2019','A','D','Hertha',1,1,13,3,18,2,2,0,'Fortuna Dusseldorf',2,1,13,7,11,6,1,0);
INSERT INTO TeamsInMatches VALUES(491,246,'Hertha');
INSERT INTO TeamsInMatches VALUES(492,246,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(247,'06/04/2019','A','H','Leverkusen',2,2,11,4,10,6,2,0,'RB Leipzig',4,1,8,4,12,2,1,0);
INSERT INTO TeamsInMatches VALUES(493,247,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(494,247,'RB Leipzig');
INSERT INTO Matches VALUES(248,'06/04/2019','A','D','Schalke 04',1,1,6,4,16,3,5,1,'Ein Frankfurt',2,1,16,5,8,6,1,0);
INSERT INTO TeamsInMatches VALUES(495,248,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(496,248,'Ein Frankfurt');
INSERT INTO Matches VALUES(249,'06/04/2019','D','A','Stuttgart',1,0,14,4,8,12,1,0,'Nurnberg',1,1,19,6,11,5,3,0);
INSERT INTO TeamsInMatches VALUES(497,249,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(498,249,'Nurnberg');
INSERT INTO Matches VALUES(250,'06/04/2019','H','D','Wolfsburg',3,1,13,5,9,9,1,0,'Hannover',1,1,11,4,11,2,2,0);
INSERT INTO TeamsInMatches VALUES(499,250,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(500,250,'Hannover');
INSERT INTO Matches VALUES(251,'07/04/2019','A','A','Augsburg',0,0,8,0,9,4,1,0,'Hoffenheim',4,1,18,9,10,3,1,0);
INSERT INTO TeamsInMatches VALUES(501,251,'Augsburg');
INSERT INTO TeamsInMatches VALUES(502,251,'Hoffenheim');
INSERT INTO Matches VALUES(252,'07/04/2019','D','D','Mgladbach',1,0,15,3,7,7,2,0,'Werder Bremen',1,0,12,6,6,1,2,0);
INSERT INTO TeamsInMatches VALUES(503,252,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(504,252,'Werder Bremen');
INSERT INTO Matches VALUES(253,'12/04/2019','D','D','Nurnberg',1,0,17,6,12,11,1,0,'Schalke 04',1,0,16,2,13,9,2,0);
INSERT INTO TeamsInMatches VALUES(505,253,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(506,253,'Schalke 04');
INSERT INTO Matches VALUES(254,'13/04/2019','H','H','Dortmund',2,2,11,7,10,4,0,0,'Mainz',1,0,17,9,6,4,1,0);
INSERT INTO TeamsInMatches VALUES(507,254,'Dortmund');
INSERT INTO TeamsInMatches VALUES(508,254,'Mainz');
INSERT INTO Matches VALUES(255,'13/04/2019','A','D','Hannover',0,0,12,5,10,3,0,0,'Mgladbach',1,0,18,9,8,12,0,0);
INSERT INTO TeamsInMatches VALUES(509,255,'Hannover');
INSERT INTO TeamsInMatches VALUES(510,255,'Mgladbach');
INSERT INTO Matches VALUES(256,'13/04/2019','H','H','RB Leipzig',2,2,21,10,19,9,1,0,'Wolfsburg',0,0,6,2,12,3,1,0);
INSERT INTO TeamsInMatches VALUES(511,256,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(512,256,'Wolfsburg');
INSERT INTO Matches VALUES(257,'13/04/2019','A','D','Stuttgart',0,0,13,5,13,7,1,1,'Leverkusen',1,0,18,5,11,6,0,0);
INSERT INTO TeamsInMatches VALUES(513,257,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(514,257,'Leverkusen');
INSERT INTO Matches VALUES(258,'13/04/2019','H','D','Werder Bremen',2,0,17,7,18,7,1,0,'Freiburg',1,0,9,5,7,3,3,0);
INSERT INTO TeamsInMatches VALUES(515,258,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(516,258,'Freiburg');
INSERT INTO Matches VALUES(259,'14/04/2019','A','A','Ein Frankfurt',1,1,17,4,17,8,3,1,'Augsburg',3,2,18,6,9,2,1,0);
INSERT INTO TeamsInMatches VALUES(517,259,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(518,259,'Augsburg');
INSERT INTO Matches VALUES(260,'14/04/2019','A','A','Fortuna Dusseldorf',1,0,7,2,11,2,1,0,'Bayern Munich',4,2,21,10,8,6,0,0);
INSERT INTO TeamsInMatches VALUES(519,260,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(520,260,'Bayern Munich');
INSERT INTO Matches VALUES(261,'14/04/2019','H','H','Hoffenheim',2,1,30,7,8,9,1,0,'Hertha',0,0,5,2,16,3,0,0);
INSERT INTO TeamsInMatches VALUES(521,261,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(522,261,'Hertha');
INSERT INTO Matches VALUES(262,'20/04/2019','H','H','Augsburg',6,3,24,13,13,9,0,0,'Stuttgart',0,0,14,4,6,4,0,0);
INSERT INTO TeamsInMatches VALUES(523,262,'Augsburg');
INSERT INTO TeamsInMatches VALUES(524,262,'Stuttgart');
INSERT INTO Matches VALUES(263,'20/04/2019','H','D','Bayern Munich',1,0,28,7,10,14,0,0,'Werder Bremen',0,0,3,0,12,3,2,1);
INSERT INTO TeamsInMatches VALUES(525,263,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(526,263,'Werder Bremen');
INSERT INTO Matches VALUES(264,'20/04/2019','H','D','Leverkusen',2,0,20,9,11,11,0,0,'Nurnberg',0,0,5,1,7,1,0,0);
INSERT INTO TeamsInMatches VALUES(527,264,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(528,264,'Nurnberg');
INSERT INTO Matches VALUES(265,'20/04/2019','H','D','Mainz',3,1,21,5,10,3,0,0,'Fortuna Dusseldorf',1,1,17,7,14,7,3,0);
INSERT INTO TeamsInMatches VALUES(529,265,'Mainz');
INSERT INTO TeamsInMatches VALUES(530,265,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(266,'20/04/2019','A','A','Mgladbach',1,0,14,4,13,2,0,0,'RB Leipzig',2,1,14,4,14,4,2,0);
INSERT INTO TeamsInMatches VALUES(531,266,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(532,266,'RB Leipzig');
INSERT INTO Matches VALUES(267,'20/04/2019','A','A','Schalke 04',2,0,15,5,13,6,2,0,'Hoffenheim',5,2,11,6,15,1,3,0);
INSERT INTO TeamsInMatches VALUES(533,267,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(534,267,'Hoffenheim');
INSERT INTO Matches VALUES(268,'21/04/2019','A','A','Freiburg',0,0,9,2,10,5,2,0,'Dortmund',4,1,10,6,6,3,0,0);
INSERT INTO TeamsInMatches VALUES(535,268,'Freiburg');
INSERT INTO TeamsInMatches VALUES(536,268,'Dortmund');
INSERT INTO Matches VALUES(269,'21/04/2019','D','D','Hertha',0,0,16,3,13,5,4,0,'Hannover',0,0,13,5,9,8,1,0);
INSERT INTO TeamsInMatches VALUES(537,269,'Hertha');
INSERT INTO TeamsInMatches VALUES(538,269,'Hannover');
INSERT INTO Matches VALUES(270,'22/04/2019','D','D','Wolfsburg',1,0,21,8,10,13,2,0,'Ein Frankfurt',1,0,12,3,8,6,3,0);
INSERT INTO TeamsInMatches VALUES(539,270,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(540,270,'Ein Frankfurt');
INSERT INTO Matches VALUES(271,'26/04/2019','A','D','Augsburg',1,1,8,2,11,3,1,0,'Leverkusen',4,1,13,7,8,3,0,0);
INSERT INTO TeamsInMatches VALUES(541,271,'Augsburg');
INSERT INTO TeamsInMatches VALUES(542,271,'Leverkusen');
INSERT INTO Matches VALUES(272,'27/04/2019','A','A','Dortmund',2,1,8,2,9,2,0,2,'Schalke 04',4,2,8,4,18,4,6,0);
INSERT INTO TeamsInMatches VALUES(543,272,'Dortmund');
INSERT INTO TeamsInMatches VALUES(544,272,'Schalke 04');
INSERT INTO Matches VALUES(273,'27/04/2019','D','D','Ein Frankfurt',0,0,10,4,13,2,0,0,'Hertha',0,0,10,3,15,4,5,1);
INSERT INTO TeamsInMatches VALUES(545,273,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(546,273,'Hertha');
INSERT INTO Matches VALUES(274,'27/04/2019','H','H','Fortuna Dusseldorf',4,2,13,6,10,4,1,0,'Werder Bremen',1,1,18,9,13,9,3,0);
INSERT INTO TeamsInMatches VALUES(547,274,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(548,274,'Werder Bremen');
INSERT INTO Matches VALUES(275,'27/04/2019','H','D','Hannover',1,0,7,3,10,4,2,0,'Mainz',0,0,23,4,14,7,1,0);
INSERT INTO TeamsInMatches VALUES(549,275,'Hannover');
INSERT INTO TeamsInMatches VALUES(550,275,'Mainz');
INSERT INTO Matches VALUES(276,'27/04/2019','H','H','RB Leipzig',2,1,15,4,15,5,3,0,'Freiburg',1,0,14,8,15,4,5,0);
INSERT INTO TeamsInMatches VALUES(551,276,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(552,276,'Freiburg');
INSERT INTO Matches VALUES(277,'27/04/2019','H','D','Stuttgart',1,0,13,6,18,2,2,0,'Mgladbach',0,0,17,4,8,7,1,0);
INSERT INTO TeamsInMatches VALUES(553,277,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(554,277,'Mgladbach');
INSERT INTO Matches VALUES(278,'28/04/2019','A','D','Hoffenheim',1,1,19,7,13,9,2,0,'Wolfsburg',4,1,22,10,9,3,2,0);
INSERT INTO TeamsInMatches VALUES(555,278,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(556,278,'Wolfsburg');
INSERT INTO Matches VALUES(279,'28/04/2019','D','D','Nurnberg',1,0,9,4,11,5,1,0,'Bayern Munich',1,0,18,6,8,5,2,0);
INSERT INTO TeamsInMatches VALUES(557,279,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(558,279,'Bayern Munich');
INSERT INTO Matches VALUES(280,'03/05/2019','D','A','Mainz',3,1,14,6,14,6,1,0,'RB Leipzig',3,2,15,5,12,4,1,0);
INSERT INTO TeamsInMatches VALUES(559,280,'Mainz');
INSERT INTO TeamsInMatches VALUES(560,280,'RB Leipzig');
INSERT INTO Matches VALUES(281,'04/05/2019','H','H','Bayern Munich',3,2,27,14,9,11,0,0,'Hannover',1,0,2,1,5,0,3,1);
INSERT INTO TeamsInMatches VALUES(561,281,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(562,281,'Hannover');
INSERT INTO Matches VALUES(282,'04/05/2019','H','H','Hertha',3,2,11,6,13,2,1,0,'Stuttgart',1,0,14,1,17,5,1,0);
INSERT INTO TeamsInMatches VALUES(563,282,'Hertha');
INSERT INTO TeamsInMatches VALUES(564,282,'Stuttgart');
INSERT INTO Matches VALUES(283,'04/05/2019','D','A','Mgladbach',2,0,10,5,10,2,2,0,'Hoffenheim',2,1,26,9,18,7,4,0);
INSERT INTO TeamsInMatches VALUES(565,283,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(566,283,'Hoffenheim');
INSERT INTO Matches VALUES(284,'04/05/2019','D','A','Werder Bremen',2,0,14,4,17,4,2,0,'Dortmund',2,2,21,8,7,8,1,0);
INSERT INTO TeamsInMatches VALUES(567,284,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(568,284,'Dortmund');
INSERT INTO Matches VALUES(285,'04/05/2019','H','H','Wolfsburg',2,1,10,4,8,4,0,0,'Nurnberg',0,0,12,3,12,5,0,0);
INSERT INTO TeamsInMatches VALUES(569,285,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(570,285,'Nurnberg');
INSERT INTO Matches VALUES(286,'05/05/2019','D','D','Freiburg',1,1,9,3,12,5,2,1,'Fortuna Dusseldorf',1,1,16,3,11,4,3,0);
INSERT INTO TeamsInMatches VALUES(571,286,'Freiburg');
INSERT INTO TeamsInMatches VALUES(572,286,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(287,'05/05/2019','H','H','Leverkusen',6,6,17,11,3,1,0,0,'Ein Frankfurt',1,1,4,2,11,4,3,0);
INSERT INTO TeamsInMatches VALUES(573,287,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(574,287,'Ein Frankfurt');
INSERT INTO Matches VALUES(288,'05/05/2019','D','D','Schalke 04',0,0,14,3,4,7,1,0,'Augsburg',0,0,7,3,7,4,0,0);
INSERT INTO TeamsInMatches VALUES(575,288,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(576,288,'Augsburg');
INSERT INTO Matches VALUES(289,'11/05/2019','A','H','Augsburg',3,1,5,3,11,1,0,0,'Hertha',4,0,24,8,4,9,1,0);
INSERT INTO TeamsInMatches VALUES(577,289,'Augsburg');
INSERT INTO TeamsInMatches VALUES(578,289,'Hertha');
INSERT INTO Matches VALUES(290,'11/05/2019','H','H','Dortmund',3,1,15,5,11,2,1,0,'Fortuna Dusseldorf',2,0,8,3,12,4,0,1);
INSERT INTO TeamsInMatches VALUES(579,290,'Dortmund');
INSERT INTO TeamsInMatches VALUES(580,290,'Fortuna Dusseldorf');
INSERT INTO Matches VALUES(291,'11/05/2019','H','H','Hannover',3,1,18,6,15,5,0,0,'Freiburg',0,0,5,1,12,3,2,0);
INSERT INTO TeamsInMatches VALUES(581,291,'Hannover');
INSERT INTO TeamsInMatches VALUES(582,291,'Freiburg');
INSERT INTO Matches VALUES(292,'11/05/2019','A','A','Hoffenheim',0,0,19,3,16,1,3,0,'Werder Bremen',1,1,11,6,10,4,4,0);
INSERT INTO TeamsInMatches VALUES(583,292,'Hoffenheim');
INSERT INTO TeamsInMatches VALUES(584,292,'Werder Bremen');
INSERT INTO Matches VALUES(293,'11/05/2019','D','H','Leverkusen',1,1,18,5,10,4,2,0,'Schalke 04',1,0,8,3,10,4,1,0);
INSERT INTO TeamsInMatches VALUES(585,293,'Leverkusen');
INSERT INTO TeamsInMatches VALUES(586,293,'Schalke 04');
INSERT INTO Matches VALUES(294,'11/05/2019','A','D','Nurnberg',0,0,12,2,4,1,0,0,'Mgladbach',4,0,16,5,14,5,2,0);
INSERT INTO TeamsInMatches VALUES(587,294,'Nurnberg');
INSERT INTO TeamsInMatches VALUES(588,294,'Mgladbach');
INSERT INTO Matches VALUES(295,'11/05/2019','D','D','RB Leipzig',0,0,10,3,11,1,0,0,'Bayern Munich',0,0,11,5,9,6,2,0);
INSERT INTO TeamsInMatches VALUES(589,295,'RB Leipzig');
INSERT INTO TeamsInMatches VALUES(590,295,'Bayern Munich');
INSERT INTO Matches VALUES(296,'11/05/2019','H','H','Stuttgart',3,1,11,4,14,4,1,0,'Wolfsburg',0,0,8,2,10,3,2,0);
INSERT INTO TeamsInMatches VALUES(591,296,'Stuttgart');
INSERT INTO TeamsInMatches VALUES(592,296,'Wolfsburg');
INSERT INTO Matches VALUES(297,'12/05/2019','A','D','Ein Frankfurt',0,0,13,4,10,9,1,0,'Mainz',2,0,15,4,20,6,1,0);
INSERT INTO TeamsInMatches VALUES(593,297,'Ein Frankfurt');
INSERT INTO TeamsInMatches VALUES(594,297,'Mainz');
INSERT INTO Matches VALUES(298,'18/05/2019','H','H','Bayern Munich',5,1,23,14,7,5,2,0,'Ein Frankfurt',1,0,6,2,13,3,2,0);
INSERT INTO TeamsInMatches VALUES(595,298,'Bayern Munich');
INSERT INTO TeamsInMatches VALUES(596,298,'Ein Frankfurt');
INSERT INTO Matches VALUES(299,'18/05/2019','H','D','Fortuna Dusseldorf',2,0,15,7,13,2,2,0,'Hannover',1,0,14,3,9,7,1,0);
INSERT INTO TeamsInMatches VALUES(597,299,'Fortuna Dusseldorf');
INSERT INTO TeamsInMatches VALUES(598,299,'Hannover');
INSERT INTO Matches VALUES(300,'18/05/2019','H','H','Freiburg',5,2,18,8,15,4,2,0,'Nurnberg',1,0,14,5,9,2,1,0);
INSERT INTO TeamsInMatches VALUES(599,300,'Freiburg');
INSERT INTO TeamsInMatches VALUES(600,300,'Nurnberg');
INSERT INTO Matches VALUES(301,'18/05/2019','A','A','Hertha',1,1,9,4,10,4,1,0,'Leverkusen',5,2,13,8,14,3,1,0);
INSERT INTO TeamsInMatches VALUES(601,301,'Hertha');
INSERT INTO TeamsInMatches VALUES(602,301,'Leverkusen');
INSERT INTO Matches VALUES(302,'18/05/2019','H','A','Mainz',4,0,22,12,17,8,2,0,'Hoffenheim',2,2,19,7,9,5,4,1);
INSERT INTO TeamsInMatches VALUES(603,302,'Mainz');
INSERT INTO TeamsInMatches VALUES(604,302,'Hoffenheim');
INSERT INTO Matches VALUES(303,'18/05/2019','A','A','Mgladbach',0,0,7,0,8,2,1,0,'Dortmund',2,1,12,3,6,2,1,0);
INSERT INTO TeamsInMatches VALUES(605,303,'Mgladbach');
INSERT INTO TeamsInMatches VALUES(606,303,'Dortmund');
INSERT INTO Matches VALUES(304,'18/05/2019','D','D','Schalke 04',0,0,12,3,10,7,0,0,'Stuttgart',0,0,16,8,8,5,1,0);
INSERT INTO TeamsInMatches VALUES(607,304,'Schalke 04');
INSERT INTO TeamsInMatches VALUES(608,304,'Stuttgart');
INSERT INTO Matches VALUES(305,'18/05/2019','H','H','Werder Bremen',2,1,6,3,16,3,2,0,'RB Leipzig',1,0,10,3,12,9,2,0);
INSERT INTO TeamsInMatches VALUES(609,305,'Werder Bremen');
INSERT INTO TeamsInMatches VALUES(610,305,'RB Leipzig');
INSERT INTO Matches VALUES(306,'18/05/2019','H','H','Wolfsburg',8,3,18,10,5,6,0,0,'Augsburg',1,0,12,4,11,5,2,0);
INSERT INTO TeamsInMatches VALUES(611,306,'Wolfsburg');
INSERT INTO TeamsInMatches VALUES(612,306,'Augsburg');

INSERT INTO Wages VALUES
	('Bayern Munich',78,3730731,193998000),
	('Dortmund',86,1856808,96554000),
	('Schalke 04',93,1345654,69974000),
	('Wolfsburg',98,1261494,65597700),
	('Leverkusen',82,1194356,62106500),
	('RB Leipzig',84,1052471,54728500),
	('Mgladbach',92,87226,45357500),
	('Ein Frankfurt',116,732365,38083000),
	('Hoffenheim',92,728731,37894000),
	('Stuttgart',86,69919,36357900),
	('Werder Bremen',94,676038,35154000),
	('Hertha',101,601702,31288500),
	('Augsburg',101,459529,23895500),
	('Mainz',96,412394,21444500),
	('Freiburg',89,327779,17044500),
	('Dusseldorf',92,291394,15152500),
	('Nurnberg',85,210904,1096700)
;

INSERT INTO Nation VALUES
	('de','Germany',237,263742),
	('at','Austria',31,37622),
	('fr','France',20,30728),
	('ch','Switzerland',17,28632),
	('nl','Netherlands',16,19491),
	('br','Brazil',16,1641),
	('us','United States',13,10194),
	('es','Spain',9,10496),
	('hr','Croatia',9,826),
	('se','Sweden',8,11302),
	('ar','Argentina',8,9724),
	('pl','Poland',8,7792),
	('tr','Turkiye',8,7607),
	('cz','Czech Republic',7,11237),
	('jp','Japan',7,9032),
	('rs','Serbia',6,12931),
	('dk','Denmark',6,6141),
	('be','Belgium',5,11694),
	('hu','Hungary',5,7241),
	('no','Norway',5,4667),
	('pt','Portugal',5,4279),
	('ma','Morocco',5,4254),
	('it','Italy',4,6442),
	('sk','Slovakia',4,3748),
	('eng','England',4,3638),
	('kr','Korea Republic',4,2536),
	('ng','Nigeria',4,1806),
	('gh','Ghana',4,1117),
	('ci','Cote dIvoire',3,7171),
	('fi','Finland',3,5724),
	('ba','Bosnia and Herzegovina',3,3622),
	('gr','Greece',3,1927),
	('au','Australia',3,1031),
	('sn','Senegal',2,4993),
	('dz','Algeria',2,3655),
	('cl','Chile',2,3551),
	('xk','Kosovo',2,2229),
	('cm','Cameroon',2,2025),
	('cd','Congo DR',2,1411),
	('gn','Guinea',2,1152),
	('ml','Mali',2,897),
	('al','Albania',2,791),
	('mx','Mexico',2,522),
	('si','Slovenia',1,2113),
	('jm','Jamaica',1,1914),
	('is','Iceland',1,1335),
	('co','Colombia',1,1138),
	('tg','Togo',1,1066),
	('pe','Peru',1,692),
	('ua','Ukraine',1,656),
	('uy','Uruguay',1,653),
	('ro','Romania',1,579),
	('ve','Venezuela',1,531),
	('wls','Wales',1,189),
	('ph','Philippines',1,145),
	('il','Israel',1,125),
	('lu','Luxembourg',1,90),
	('ca','Canada',1,80)
;
INSERT INTO Nation (NationID, Nation,'# Players') VALUES ('ao','Angola',1);
-- Angola's player hasn't played any minutes so we use the default value of 0

INSERT INTO Players VALUES
	(1,'Issah Abbas','gh','FW','Mainz ',19,1,0,9,0,0,0,0
),
	(2,'David Abraham','ar','DF','Ein Frankfurt',32,17,17,142,0,0,2,0
),
	(3,'Amir Abrashi','al','MF','Freiburg',28,10,9,790,0,0,5,0
),
	(4,'Tyler Adams','us','MF','RB Leipzig',19,10,8,721,0,2,0,0
),
	(5,'Antonis Aidonis','de','DF','Stuttgart',17,2,1,80,0,0,1,0
),
	(6,'Manuel Akanji','ch','DF','Dortmund',23,25,25,2205,1,0,1,0
),
	(7,'Chadrac Akolo','cd','MF FW','Stuttgart',23,16,5,525,0,1,0,0
),
	(8,'Kevin Akpoguma','ng','DF','Hoffenheim',23,8,5,499,0,0,2,0
),
	(9,'Kevin Akpoguma','ng','DF','Hannover ',23,4,4,313,0,0,2,0
),
	(10,'David Alaba','at','DF','Bayern Munich',26,31,29,253,3,3,4,0
),
	(11,'Lucas Alario','ar','FW MF','Leverkusen',25,27,11,1265,9,3,1,0
),
	(12,'Miiko Albornoz','cl','DF MF','Hannover ',27,22,19,166,1,3,3,1
),
	(13,'Paco Alcácer','es','FW','Dortmund',24,26,11,1211,18,0,0,0
),
	(14,'Thiago Alcántara','es','MF','Bayern Munich',27,30,26,2408,2,6,5,0
),
	(15,'Allan','br','MF','Ein Frankfurt',21,4,2,176,0,0,1,0
),
	(16,'Alfons Amade','de','MF','Hoffenheim',18,1,0,9,0,0,0,0
),
	(17,'Nadiem Amiri','de','MF','Hoffenheim',21,13,10,754,3,1,1,0
),
	(18,'Waldemar Anton','de','DF','Hannover ',22,34,34,306,1,0,4,0
),
	(19,'Dennis Aogo','de','MF','Stuttgart',31,15,13,1025,0,0,1,0
),
	(20,'Charles Aránguiz','cl','MF','Leverkusen',29,24,22,1891,2,7,3,0
),
	(21,'Maximilian Arnold','de','MF','Wolfsburg',24,33,33,2872,2,6,7,0
),
	(22,'Takuma Asano','jp','MF FW','Hannover ',23,13,9,699,0,0,0,0
),
	(23,'Santiago Ascacíbar','ar','MF','Stuttgart',21,27,27,2428,0,0,10,1
),
	(24,'Simon Asta','de','DF','Augsburg',17,1,1,90,0,0,1,0
),
	(25,'Jean-Kévin Augustin','fr','FW','RB Leipzig',21,17,4,461,3,0,0,0
),
	(26,'Ludwig Augustinsson','se','DF','Werder Bremen',24,34,34,3026,1,4,5,0
),
	(27,'Kaan Ayhan','tr','DF','Dusseldorf',23,28,28,2449,4,1,10,0
),
	(28,'Florian Baak','de','MF','Hertha',19,1,0,1,0,0,0,0
),
	(29,'Holger Badstuber','de','DF','Stuttgart',29,10,5,522,0,0,1,0
),
	(30,'Daniel Baier','de','MF','Augsburg',34,33,33,2815,0,1,7,0
),
	(31,'Leon Bailey','jm','FW','Leverkusen',20,29,21,1914,5,1,4,0
),
	(32,'Marvin Bakalorz','de','MF','Hannover ',28,25,16,147,1,0,5,0
),
	(33,'Ridle Baku','de','MF','Mainz ',20,15,10,937,0,0,1,0
),
	(34,'Philipp Bargfrede','de','MF DF','Werder Bremen',29,15,13,1079,0,0,6,0
),
	(35,'Aymen Barkok','ma','MF','Dusseldorf',20,12,4,510,0,0,0,0
),
	(36,'Leandro Barreiro Martins','lu','MF','Mainz ',18,1,1,90,0,0,1,0
),
	(37,'Fin Bartels','de','MF FW','Werder Bremen',31,2,0,23,0,0,0,0
),
	(38,'Robert Bauer','de','DF','Nurnberg',23,22,19,1722,0,0,4,1
),
	(39,'Oliver Baumann','de','GK','Hoffenheim',28,33,33,297,0,1,0,0
),
	(40,'Timo Baumgartl','de','DF','Stuttgart',22,18,18,162,1,0,2,0
),
	(41,'Julian Baumgartlinger','at','MF','Leverkusen',30,21,16,1559,0,1,2,0
),
	(42,'Christoph Baumgartner','at','MF','Hoffenheim',18,2,1,85,0,0,2,1
),
	(43,'Noah Joel Sarenren Bazee','ng','FW MF','Hannover ',21,3,3,155,0,0,0,0
),
	(44,'Ihlas Bebou','tg','MF FW','Hannover ',24,12,12,1066,4,3,1,0
),
	(45,'Uffe Bech','dk','FW','Hannover ',25,2,0,19,0,0,1,0
),
	(46,'Andreas Beck','de','DF','Stuttgart',31,24,21,1776,0,2,2,0
),
	(47,'Hanno Behrens','de','MF','Nurnberg',28,30,30,2639,4,1,3,0
),
	(48,'Ishak Belfodil','dz','FW MF','Hoffenheim',26,28,20,1863,16,3,3,0
),
	(49,'Stefan Bell','de','DF','Mainz ',26,25,25,225,0,0,7,0
),
	(50,'Karim Bellarabi','de','FW','Leverkusen',28,19,14,1057,5,4,4,1
),
	(51,'Lars Bender','de','MF DF','Leverkusen',29,20,18,1361,1,4,2,0
),
	(52,'Sven Bender','de','DF','Leverkusen',29,27,25,1991,0,0,3,0
),
	(53,'László Bénes','sk','MF FW','Mgladbach',20,1,0,27,0,0,0,0
),
	(54,'Nabil Bentaleb','dz','MF','Schalke 04',23,25,19,1792,3,0,4,0
),
	(55,'Louis Beyer','de','DF','Mgladbach',18,9,8,720,0,0,1,0
),
	(56,'Ermin Bičakčić','ba','DF','Hoffenheim',28,25,20,179,1,2,0,0
),
	(57,'Leonardo Bittencourt','de','MF','Hoffenheim',24,21,13,1069,1,3,1,0
),
	(58,'Pablo de Blasis','ar','FW','Mainz ',30,1,1,90,0,0,0,0
),
	(59,'Danny Blum','de','MF','Ein Frankfurt',27,1,0,3,0,0,0,0
),
	(60,'Jérôme Boateng','de','DF','Bayern Munich',29,20,19,1693,0,2,1,0
),
	(61,'Adam Bodzek','de','MF DF','Dusseldorf',32,21,20,1596,0,1,5,1
),
	(62,'Jean-Paul Boëtius','nl','MF','Mainz ',24,30,25,2127,4,7,8,0
),
	(63,'Robin Bormuth','de','DF','Dusseldorf',22,10,6,616,0,0,2,0
),
	(64,'Nassim Boujellab','ma','MF','Schalke 04',19,7,4,378,0,1,0,0
),
	(65,'Julian Brandt','de','MF FW','Leverkusen',22,33,30,2666,7,11,0,0
),
	(66,'Fabian Bredlow','de','GK','Nurnberg',23,13,12,1128,0,0,1,0
),
	(67,'Josip Brekalo','hr','FW MF','Wolfsburg',20,25,15,1415,3,3,2,0
),
	(68,'Joshua Brenet','nl','DF','Hoffenheim',24,14,10,906,2,1,0,0
),
	(69,'John Brooks','us','DF','Wolfsburg',25,29,29,261,3,2,7,0
),
	(70,'Daniel Brosinski','de','DF','Mainz ',30,26,26,2203,3,5,2,0
),
	(71,'Bruma','pt','MF','RB Leipzig',23,14,6,553,1,1,1,0
),
	(72,'Jeffrey Bruma','nl','DF','Schalke 04',26,9,7,624,0,0,4,0
),
	(73,'Jacob Bruun Larsen','dk','FW','Dortmund',19,24,16,1265,2,2,0,0
),
	(74,'Niko Bungert','de','DF','Mainz ',31,7,3,284,0,0,0,0
),
	(75,'Guido Burgstaller','at','FW','Schalke 04',29,24,17,1526,4,0,4,0
),
	(76,'Jonathan Burkardt','de','FW MF','Mainz ',18,4,4,259,0,0,0,0
),
	(77,'Roman Burki','ch','GK','Dortmund',27,32,32,288,0,0,1,0
),
	(78,'Gaëtan Bussmann','fr','DF','Mainz ',27,1,1,90,0,0,0,0
),
	(79,'Jakub Błaszczykowski','pl','MF','Wolfsburg',32,1,0,13,0,0,0,0
),
	(80,'Caiuby','br','MF FW','Augsburg',30,14,10,1006,1,1,3,0
),
	(81,'Daniel Caligiuri','it','DF FW','Schalke 04',30,31,31,2756,7,3,9,0
),
	(82,'Jan-Ingwer Callsen-Bracker','de','DF','Augsburg',33,1,0,7,0,0,1,0
),
	(83,'Ignacio Camacho','es','MF','Wolfsburg',28,6,6,540,0,0,3,0
),
	(84,'Jonas Carls','de','FW','Schalke 04',21,1,1,90,0,0,0,0
),
	(85,'Koen Casteels','be','GK','Wolfsburg',26,26,26,2295,0,0,0,0
),
	(86,'Gonzalo Castro','de','MF','Stuttgart',31,25,19,1692,2,4,4,0
),
	(87,'Timothy Chandler','us','DF','Ein Frankfurt',28,1,0,17,0,0,0,0
),
	(88,'Per Ciljan Skjelbred','no','MF','Hertha',31,16,12,997,0,1,3,0
),
	(89,'Kingsley Coman','fr','FW MF','Bayern Munich',22,21,17,1378,6,4,2,0
),
	(90,'Sergio Córdova','ve','FW','Augsburg',20,20,3,531,3,0,1,0
),
	(91,'Danny da Costa','de','DF FW','Ein Frankfurt',25,34,34,3033,2,4,1,0
),
	(92,'Mickaël Cuisance','fr','MF','Mgladbach',18,11,1,279,0,1,3,0
),
	(93,'Matheus Cunha','br','FW MF','RB Leipzig',19,25,9,853,2,0,1,0
),
	(94,'Christoph Daferner','de','FW','Freiburg',20,1,0,25,0,0,0,0
),
	(95,'Mahmoud Dahoud','de','MF','Dortmund',22,14,7,697,1,0,2,0
),
	(96,'Leon Dajaku','de','DF MF','Stuttgart',17,2,0,27,0,0,0,0
),
	(97,'Kevin Danso','at','DF','Augsburg',19,18,13,1247,1,1,3,0
),
	(98,'Palkó Dárdai','hu','FW MF','Hertha',19,7,1,113,0,0,0,0
),
	(99,'Vladimír Darida','cz','MF','Hertha',27,10,3,376,0,1,1,0
),
	(100,'Alphonso Davies','ca','MF FW','Bayern Munich',17,6,0,80,1,0,1,0
),
	(101,'Thomas Delaney','dk','MF','Dortmund',26,30,27,2283,3,5,7,0
),
	(102,'Kerem Demirbay','de','MF','Hoffenheim',25,26,24,2017,4,9,6,0
),
	(103,'Diego Demme','de','MF','RB Leipzig',26,26,24,2055,0,2,4,0
),
	(104,'Franco Di Santo','ar','MF FW','Schalke 04',29,4,3,245,0,0,0,0
),
	(105,'Abdou Diallo','sn','DF','Dortmund',22,28,27,2379,1,1,1,1
),
	(106,'Daniel Didavi','de','MF FW','Stuttgart',28,20,8,956,2,2,0,0
),
	(107,'Tim Dierßen','de','MF','Hannover ',22,1,0,16,0,0,0,0
),
	(108,'Javairô Dilrosun','nl','FW MF','Hertha',20,17,7,898,2,3,2,0
),
	(109,'Giulio Donati','it','DF','Mainz ',28,9,6,625,0,0,2,0
),
	(110,'Ji Dong-won','kr','MF FW','Augsburg',27,14,10,891,4,1,2,0
),
	(111,'Anastasios Donis','gr','FW MF','Stuttgart',21,24,11,962,5,2,4,0
),
	(112,'Aleksandar Dragović','at','DF','Leverkusen',27,18,13,1335,2,0,4,0
),
	(113,'Josip Drmić','ch','FW','Mgladbach',25,5,2,222,2,0,0,0
),
	(114,'Jaroslav Drobný','cz','GK','Dusseldorf',38,2,2,180,0,0,0,0
),
	(115,'Marvin Ducksch','de','FW','Dusseldorf',24,16,8,823,1,1,1,0
),
	(116,'Ondrej Duda','sk','MF','Hertha',23,32,30,2563,11,5,7,0
),
	(117,'Johannes Eggestein','de','FW MF','Werder Bremen',20,23,12,1113,4,1,0,0
),
	(118,'Maximilian Eggestein','de','MF','Werder Bremen',21,34,34,3052,5,4,4,0
),
	(119,'Josip Elez','hr','DF','Hannover ',24,10,7,646,0,0,1,0
),
	(120,'Nico Elvedi','ch','DF','Mgladbach',21,30,30,2623,2,1,1,0
),
	(121,'Breel Embolo','ch','FW','Schalke 04',21,20,15,1345,5,1,4,0
),
	(122,'Patrick Erras','de','MF','Nurnberg',23,19,13,1222,0,1,1,0
),
	(123,'Michael Esser','de','GK','Hannover ',30,32,32,288,0,0,3,0
),
	(124,'Alexander Esswein','de','MF FW','Stuttgart',28,17,15,1251,0,0,3,0
),
	(125,'Ewerton','br','DF','Nurnberg',29,18,15,1341,0,0,2,0
),
	(126,'Marco Fabián','mx','FW','Ein Frankfurt',29,1,1,62,0,0,0,0
),
	(127,'Ralf Fährmann','de','GK','Schalke 04',29,17,16,147,0,0,0,0
),
	(128,'Simon Falette','gn','DF','Ein Frankfurt',26,7,7,600,0,0,0,0
),
	(129,'Felipe','br','DF','Hannover ',31,17,14,1095,2,0,5,1
),
	(130,'Ohis Felix Uduokhai','de','DF','Wolfsburg',20,11,2,244,0,0,2,0
),
	(131,'Gelson Fernandes','ch','MF','Ein Frankfurt',31,28,28,2225,1,0,10,1
),
	(132,'Oliver Fink','de','MF','Dusseldorf',36,18,13,1055,3,0,4,0
),
	(133,'Alfreð Finnbogason','is','FW','Augsburg',29,18,17,1335,10,1,2,0
),
	(134,'Mark Flekken','nl','GK','Freiburg',25,1,1,90,0,0,0,0
),
	(135,'Emil Forsberg','se','MF FW','RB Leipzig',26,20,14,1249,4,7,0,0
),
	(136,'Iver Fossum','no','MF','Hannover ',22,9,5,455,0,0,0,0
),
	(137,'Raphael Framberger','de','DF MF','Augsburg',22,7,6,548,0,0,2,0
),
	(138,'Mike Frantz','de','MF FW','Freiburg',31,31,29,2216,2,1,2,0
),
	(139,'Marco Friedl','at','DF','Werder Bremen',20,7,5,474,0,0,3,0
),
	(140,'Alexander Fuchs','de','MF FW','Nurnberg',21,9,8,655,1,0,3,0
),
	(141,'Niclas Fullkrug','de','FW','Hannover ',25,14,13,1112,2,1,1,0
),
	(142,'Mijat Gaćinović','rs','MF','Ein Frankfurt',23,29,16,1626,0,1,3,0
),
	(143,'Jean-Philippe Gbamin','ci','MF','Mainz ',22,31,30,2672,2,1,3,0
),
	(144,'Theodor Gebre Selassie','cz','DF','Werder Bremen',31,32,32,2814,3,2,2,0
),
	(145,'Dennis Geiger','de','MF','Hoffenheim',20,4,2,246,0,1,1,0
),
	(146,'Christian Gentner','de','MF FW','Stuttgart',32,29,24,2018,0,5,3,0
),
	(147,'Yannick Gerhardt','de','MF','Wolfsburg',24,30,28,2455,2,2,2,0
),
	(148,'Fabian Giefer','de','GK','Augsburg',28,4,4,360,0,0,0,0
),
	(149,'Niko Gießelmann','de','DF','Dusseldorf',26,30,29,2593,0,3,2,0
),
	(150,'Daniel Ginczek','de','FW','Wolfsburg',27,24,12,1276,6,2,4,0
),
	(151,'Matthias Ginter','de','DF','Mgladbach',24,27,27,2379,2,0,2,0
),
	(152,'Serge Gnabry','de','FW MF','Bayern Munich',23,30,21,1762,10,5,0,0
),
	(153,'Kevin Goden','de','DF MF','Nurnberg',19,5,3,273,0,0,1,0
),
	(154,'Mario Gómez','de','FW','Stuttgart',33,31,25,2211,7,2,4,1
),
	(155,'Jérôme Gondorf','de','MF FW','Freiburg',30,25,13,1296,2,2,3,0
),
	(156,'Nicolás González','ar','FW MF','Stuttgart',20,30,23,2162,2,3,2,1
),
	(157,'Leon Goretzka','de','MF','Bayern Munich',23,30,23,2023,8,4,3,0
),
	(158,'Felix Götze','de','MF','Augsburg',20,6,0,126,1,0,0,0
),
	(159,'Mario Götze','de','FW MF','Dortmund',26,26,19,1674,7,7,0,0
),
	(160,'Jeffrey Gouweleeuw','nl','DF','Augsburg',27,25,24,2092,0,2,4,0
),
	(161,'Michael Gregoritsch','at','MF FW','Augsburg',24,32,28,2487,6,2,4,0
),
	(162,'Vincenzo Grifo','it','MF FW','Hoffenheim',25,7,3,335,1,2,0,0
),
	(163,'Vincenzo Grifo','it','MF FW','Freiburg',25,16,16,1427,6,3,1,0
),
	(164,'Florian Grillitsch','at','MF','Hoffenheim',22,30,27,2394,0,3,8,0
),
	(165,'Marko Grujić','rs','MF','Hertha',22,22,20,178,5,1,5,0
),
	(166,'Raphaël Guerreiro','pt','FW DF','Dortmund',24,23,17,1527,2,6,2,0
),
	(167,'Josuha Guilavogui','fr','MF','Wolfsburg',27,19,18,157,2,1,5,0
),
	(168,'Péter Gulácsi','hu','GK','RB Leipzig',28,33,33,2925,0,0,0,0
),
	(169,'Manuel Gulde','de','DF','Freiburg',27,21,20,1712,1,0,3,0
),
	(170,'Christian Gunter','de','DF MF','Freiburg',25,32,32,2879,0,5,4,1
),
	(171,'Ahmet Gurleyen','de','DF','Mainz ',19,1,0,13,0,0,0,0
),
	(172,'Jonathan de Guzmán','nl','MF','Ein Frankfurt',30,28,17,1564,3,6,4,0
),
	(173,'Janik Haberer','de','MF FW','Freiburg',24,27,26,234,1,3,5,1
),
	(174,'Alexander Hack','de','DF','Mainz ',24,14,11,102,1,1,1,0
),
	(175,'Benjamin Hadžić','ba','FW MF','Hannover ',19,3,0,25,0,1,0,0
),
	(176,'André Hahn','de','FW MF','Augsburg',27,28,21,2052,4,4,7,0
),
	(177,'Amadou Haidara','ml','MF','RB Leipzig',20,9,4,378,1,0,1,0
),
	(178,'Achraf Hakimi','ma','DF','Dortmund',19,21,19,174,2,4,4,0
),
	(179,'Sébastien Haller','ci','FW','Ein Frankfurt',24,29,23,2182,15,9,3,0
),
	(180,'Marcel Halstenberg','de','DF FW','RB Leipzig',26,28,27,2414,3,6,2,0
),
	(181,'Genki Haraguchi','jp','MF DF','Hannover ',27,28,22,2133,0,3,1,0
),
	(182,'Amine Harit','ma','MF FW','Schalke 04',21,18,12,1082,1,1,1,0
),
	(183,'Martin Harnik','at','FW MF','Werder Bremen',31,18,10,828,4,2,2,0
),
	(184,'Makoto Hasebe','jp','DF MF','Ein Frankfurt',34,28,28,252,0,0,4,0
),
	(185,'Kai Havertz','de','MF FW','Leverkusen',19,34,33,2894,17,3,2,0
),
	(186,'Thorgan Hazard','be','FW MF','Mgladbach',25,33,33,2873,10,11,1,0
),
	(187,'Dominique Heintz','de','DF','Freiburg',24,34,34,3053,1,1,5,0
),
	(188,'Rouwen Hennings','de','FW','Dusseldorf',30,29,19,1833,7,4,3,0
),
	(189,'Benjamin Henrichs','de','DF','Leverkusen',21,1,1,63,0,0,1,0
),
	(190,'Patrick Herrmann','de','FW DF','Mgladbach',27,24,10,1079,3,2,1,0
),
	(191,'Martin Hinteregger','at','DF','Augsburg',25,18,18,1575,2,0,0,0
),
	(192,'Martin Hinteregger','at','DF','Ein Frankfurt',25,14,14,1142,1,0,3,0
),
	(193,'Marwin Hitz','ch','GK','Dortmund',30,2,2,180,0,0,1,0
),
	(194,'André Hoffmann','de','DF MF','Dusseldorf',25,13,11,1049,0,0,4,0
),
	(195,'Nicolas Höfler','de','MF','Freiburg',28,18,18,1615,0,0,6,0
),
	(196,'Jonas Hofmann','de','MF','Mgladbach',26,27,21,1911,5,5,2,0
),
	(197,'Lucas Höler','de','FW','Freiburg',24,26,11,1006,4,0,0,0
),
	(198,'Gerrit Holtmann','ph','FW MF','Mainz ',23,4,1,145,0,0,2,0
),
	(199,'Justin Hoogma','nl','DF MF','Hoffenheim',20,2,1,111,0,0,0,0
),
	(200,'Lukáš Hrádecký','fi','GK','Leverkusen',28,32,32,288,0,0,1,0
),
	(201,'Branimir Hrgota','se','FW','Ein Frankfurt',25,1,0,5,0,0,0,0
),
	(202,'Benjamin Hubner','de','DF','Hoffenheim',29,10,9,813,0,0,2,0
),
	(203,'Mats Hummels','de','DF','Bayern Munich',29,21,20,1775,1,1,1,0
),
	(204,'Vedad Ibišević','ba','FW','Hertha',33,28,24,1807,10,2,5,1
),
	(205,'Ivo Iličević','hr','MF','Nurnberg',31,3,0,39,0,0,1,0
),
	(206,'Stefan Ilsanker','at','DF MF','RB Leipzig',29,19,10,933,0,0,5,1
),
	(207,'Emiliano Insúa','ar','DF','Stuttgart',29,27,24,2114,2,2,4,1
),
	(208,'Mikael Ishak','se','FW','Nurnberg',25,29,22,1917,4,3,1,0
),
	(209,'Gian-Luca Itter','de','DF','Wolfsburg',19,2,1,94,0,0,0,0
),
	(210,'Koo Ja-cheol','kr','MF','Augsburg',29,26,19,164,2,1,3,0
),
	(211,'Lukas Jäger','at','FW MF','Nurnberg',24,2,0,27,0,0,0,0
),
	(212,'Christoph Janker','de','MF FW','Augsburg',33,4,1,72,0,0,0,0
),
	(213,'Tony Jantschke','de','DF','Mgladbach',28,14,10,933,0,1,0,0
),
	(214,'Rune Jarstein','no','GK','Hertha',33,31,31,2745,0,0,2,0
),
	(215,'Dennis Jastrzembski','pl','FW DF','Hertha',18,5,0,61,0,0,1,0
),
	(216,'Tin Jedvaj','hr','DF','Leverkusen',22,16,13,1121,0,0,3,0
),
	(217,'Fredrik Jensen','fi','FW MF','Augsburg',20,6,2,207,0,0,0,0
),
	(218,'Joelinton','br','FW MF','Hoffenheim',21,28,25,213,7,5,5,0
),
	(219,'Aron Jóhannsson','us','MF','Werder Bremen',27,1,0,4,0,0,0,0
),
	(220,'Fabian Johnson','us','DF FW','Mgladbach',30,18,11,1012,1,0,1,0
),
	(221,'Jonathas','br','FW','Hannover ',29,10,6,607,3,1,3,1
),
	(222,'Luka Jović','rs','FW MF','Ein Frankfurt',20,32,25,2243,17,5,1,0
),
	(223,'Sebastian Jung','de','DF','Wolfsburg',28,1,1,56,0,0,0,0
),
	(224,'Ozan Kabak','tr','DF','Stuttgart',18,15,15,135,3,0,4,0
),
	(225,'Pavel Kadeřábek','cz','DF','Hoffenheim',26,29,28,2509,3,4,7,0
),
	(226,'Shinji Kagawa','jp','MF','Dortmund',29,2,1,98,0,0,0,0
),
	(227,'Florian Kainz','at','FW','Werder Bremen',25,8,5,373,0,1,2,0
),
	(228,'Salomon Kalou','ci','FW MF','Hertha',32,30,27,2317,8,2,0,0
),
	(229,'Marcin Kamiński','pl','DF','Dusseldorf',26,27,27,243,0,1,1,0
),
	(230,'Patrick Kammerbauer','de','FW','Freiburg',21,1,0,2,0,0,0,0
),
	(231,'Kevin Kampl','si','MF','RB Leipzig',27,27,25,2113,2,5,5,0
),
	(232,'Stefanos Kapino','gr','GK','Werder Bremen',24,1,0,45,0,0,0,0
),
	(233,'Kenan Karaman','tr','FW MF','Dusseldorf',24,21,9,919,3,1,0,0
),
	(234,'Marc-Oliver Kempf','de','DF','Stuttgart',23,23,23,2025,2,0,3,0
),
	(235,'Sebastian Kerk','de','MF FW','Nurnberg',24,21,17,1179,0,1,0,0
),
	(236,'Rani Khedira','de','DF MF','Augsburg',24,30,30,2624,4,1,6,0
),
	(237,'Isaac Kiese Thelin','se','FW MF','Leverkusen',26,6,1,180,0,0,1,0
),
	(238,'Joshua Kimmich','de','DF MF','Bayern Munich',23,34,34,306,2,13,4,0
),
	(239,'Davy Klaassen','nl','MF','Werder Bremen',25,33,33,2816,5,4,5,0
),
	(240,'Felix Klaus','de','FW MF','Wolfsburg',25,15,5,443,1,1,0,0
),
	(241,'Tim Kleindienst','de','FW','Freiburg',22,4,2,200,0,0,0,0
),
	(242,'Lukas Klostermann','de','DF','RB Leipzig',22,26,22,2003,5,1,1,0
),
	(243,'Lukas Klunter','de','DF','Hertha',22,10,7,592,0,0,2,1
),
	(244,'Robin Knoche','de','DF','Wolfsburg',26,31,31,279,3,0,0,0
),
	(245,'Törles Knöll','de','FW MF','Nurnberg',20,16,2,370,1,0,0,0
),
	(246,'Gregor Kobel','ch','GK','Hoffenheim',20,1,1,90,0,0,0,0
),
	(247,'Gregor Kobel','ch','GK','Augsburg',20,16,16,1389,0,0,0,0
),
	(248,'Robin Koch','de','MF DF','Freiburg',22,24,21,1901,1,0,3,0
),
	(249,'Dominik Kohr','de','MF','Leverkusen',24,18,10,973,0,2,4,0
),
	(250,'Ibrahima Konaté','fr','DF','RB Leipzig',19,28,27,2431,1,1,7,0
),
	(251,'Yevhen Konoplyanka','ua','FW MF','Schalke 04',28,13,7,656,1,1,0,1
),
	(252,'Pascal Köpke','de','FW MF','Hertha',22,7,0,74,0,0,0,0
),
	(253,'Julian Korb','de','DF','Hannover ',26,12,11,1006,0,0,0,0
),
	(254,'Filip Kostić','rs','DF FW','Ein Frankfurt',25,34,33,2956,6,10,4,0
),
	(255,'Dawid Kownacki','pl','MF FW','Dusseldorf',21,10,7,575,4,0,2,0
),
	(256,'Thomas Kraft','de','GK','Hertha',30,4,3,315,0,0,0,0
),
	(257,'Andrej Kramarić','hr','MF FW','Hoffenheim',27,30,28,2396,17,4,2,0
),
	(258,'Christoph Kramer','de','MF','Mgladbach',27,18,13,1136,2,1,6,0
),
	(259,'Max Kruse','de','FW MF','Werder Bremen',30,32,32,2832,11,9,0,0
),
	(260,'Lukas Kubler','de','DF MF','Freiburg',25,16,15,1184,0,2,2,0
),
	(261,'Yuya Kubo','jp','FW MF','Nurnberg',24,22,15,1357,1,0,2,0
),
	(262,'Pierre Kunde','cm','MF','Mainz ',23,29,23,1909,0,0,5,0
),
	(263,'Ahmed Kutucu','tr','FW MF','Schalke 04',18,13,3,425,2,0,0,0
),
	(264,'Konrad Laimer','at','MF DF','RB Leipzig',21,29,20,1874,1,1,7,0
),
	(265,'Michael Lang','ch','DF','Mgladbach',27,17,15,1255,1,0,0,0
),
	(266,'Sebastian Langkamp','de','DF','Werder Bremen',30,21,15,1414,0,0,4,0
),
	(267,'Danny Latza','de','MF','Mainz ',28,24,22,1863,0,3,4,0
),
	(268,'Valentino Lazaro','at','DF FW','Hertha',22,31,31,2741,3,6,6,0
),
	(269,'Mathew Leckie','au','FW MF','Hertha',27,18,10,941,2,0,3,0
),
	(270,'Tim Leibold','de','DF','Nurnberg',24,32,32,2765,0,2,6,1
),
	(271,'Robert Lewandowski','pl','FW','Bayern Munich',29,33,33,2957,22,7,2,0
),
	(272,'Philipp Lienhart','at','DF','Freiburg',22,14,7,614,0,0,0,0
),
	(273,'Davor Lovren','hr','MF','Dusseldorf',19,2,0,46,0,0,0,0
),
	(274,'Eduard Löwen','de','MF FW','Nurnberg',21,22,17,1623,3,2,3,0
),
	(275,'Derrick Luckassen','nl','DF','Hertha',23,4,2,250,0,0,0,0
),
	(276,'Dodi Lukebakio','be','FW MF','Dusseldorf',20,31,22,1972,10,3,6,0
),
	(277,'Fabian Lustenberger','ch','DF MF','Hertha',30,29,24,2172,0,1,2,0
),
	(278,'Andreas Luthe','de','GK','Augsburg',31,15,14,1311,0,0,0,0
),
	(279,'Pablo Maffeo','es','DF MF','Stuttgart',21,8,8,597,0,0,1,0
),
	(280,'Arne Maier','de','MF','Hertha',19,24,23,2064,0,0,2,0
),
	(281,'Linton Maina','de','FW MF','Hannover ',19,20,17,1414,1,3,0,0
),
	(282,'Yunus Mallı','tr','MF FW','Wolfsburg',26,21,5,701,1,1,0,0
),
	(283,'Georg Margreitter','at','DF','Nurnberg',29,27,22,2064,2,0,2,0
),
	(284,'Aarón Martín','es','DF','Mainz ',21,33,32,2878,0,3,3,0
),
	(285,'Javi Martínez','es','MF','Bayern Munich',29,21,16,1309,3,0,3,0
),
	(286,'Omar Mascarell','es','MF','Schalke 04',25,14,11,993,0,2,2,0
),
	(287,'Jean-Philippe Mateta','fr','FW','Mainz ',21,34,29,2483,14,2,2,0
),
	(288,'Christian Mathenia','de','GK','Nurnberg',26,22,22,1932,0,0,2,0
),
	(289,'Rabbi Matondo','wls','FW MF','Schalke 04',17,7,1,189,0,0,0,0
),
	(290,'Philipp Max','de','DF MF','Augsburg',24,30,30,2569,4,2,1,0
),
	(291,'Alexandru Maxim','ro','MF FW','Mainz ',28,22,3,579,1,0,3,0
),
	(292,'Weston McKennie','us','MF FW','Schalke 04',19,24,19,1746,1,4,6,0
),
	(293,'Admir Mehmedi','ch','FW MF','Wolfsburg',27,26,20,1692,6,5,1,0
),
	(294,'Hamza Mendyl','ma','DF','Schalke 04',20,9,7,544,0,0,5,0
),
	(295,'Virgil Misidjan','nl','MF FW','Nurnberg',25,23,17,1543,1,1,5,0
),
	(296,'Maximilian Mittelstädt','de','DF MF','Hertha',21,25,20,1804,1,1,3,1
),
	(297,'Kevin Möhwald','de','MF','Werder Bremen',25,23,7,873,3,1,2,0
),
	(298,'Niklas Moisander','fi','DF','Werder Bremen',32,30,30,2637,0,0,7,1
),
	(299,'Alfredo Morales','us','MF','Dusseldorf',28,23,16,1532,1,1,6,0
),
	(300,'Jan Morávek','cz','MF','Augsburg',28,13,7,757,0,2,1,0
),
	(301,'Lukas Muhl','de','DF','Nurnberg',21,31,31,279,1,0,4,0
),
	(302,'Nordi Mukiele','fr','DF','RB Leipzig',20,19,14,1225,1,1,3,0
),
	(303,'Florian Muller','de','GK','Mainz ',20,24,24,216,0,0,0,0
),
	(304,'Nicolai Muller','de','MF FW','Hannover ',30,14,11,899,3,0,2,0
),
	(305,'Nicolai Muller','de','FW MF','Ein Frankfurt',30,7,3,217,2,0,1,0
),
	(306,'Thomas Muller','de','MF FW','Bayern Munich',28,32,28,2378,6,9,1,0
),
	(307,'Florent Muslija','xk','MF FW','Hannover ',20,17,6,679,2,0,1,0
),
	(308,'Yvon Mvogo','ch','GK','RB Leipzig',24,2,1,135,0,0,0,0
),
	(309,'Phillipp Mwene','at','DF MF','Mainz ',24,6,2,274,0,0,0,0
),
	(310,'Obite NDicka','fr','DF','Ein Frankfurt',18,27,24,2304,1,1,3,0
),
	(311,'Naldo','br','DF','Schalke 04',35,7,7,630,0,0,1,0
),
	(312,'Matija Nastasić','rs','DF','Schalke 04',25,28,28,2449,1,0,6,1
),
	(313,'Reiss Nelson','eng','MF FW','Hoffenheim',18,23,5,643,7,0,0,0
),
	(314,'Manuel Neuer','de','GK','Bayern Munich',32,26,26,2302,0,0,1,0
),
	(315,'Florian Neuhaus','de','MF','Mgladbach',21,32,25,2062,3,8,5,0
),
	(316,'Moussa Niakhate','fr','DF','Mainz ',22,33,32,2789,1,1,3,0
),
	(317,'Florian Niederlechner','de','FW MF','Freiburg',27,24,12,970,4,1,3,0
),
	(318,'Håvard Nordtveit','no','MF DF','Hoffenheim',28,8,4,470,0,0,2,0
),
	(319,'Alexander Nubel','de','GK','Schalke 04',21,18,18,1588,0,0,1,1
),
	(320,'Kasim Nuhu','gh','DF','Hoffenheim',23,13,11,904,0,1,5,1
),
	(321,'Hans Nunoo Sarpei','gh','FW MF','Stuttgart',19,2,0,42,0,0,0,0
),
	(322,'Bastian Oczipka','de','DF FW','Schalke 04',29,21,21,1875,1,5,3,0
),
	(323,'Chima Okoroji','ng','DF MF','Freiburg',21,2,1,104,0,0,0,0
),
	(324,'Karim Onisiwo','at','FW MF','Mainz ',26,26,11,1161,7,3,2,0
),
	(325,'Willi Orban','hu','DF','RB Leipzig',25,24,23,2049,4,0,5,0
),
	(326,'Yuya Osako','jp','FW MF','Werder Bremen',28,21,15,1346,3,2,2,0
),
	(327,'Matthias Ostrzolek','de','DF','Hannover ',28,18,16,1468,0,0,2,0
),
	(328,'David Otto','de','MF FW','Hoffenheim',19,3,0,28,0,0,0,0
),
	(329,'Reece Oxford','eng','DF','Augsburg',19,8,6,505,0,1,0,1
),
	(330,'Berkay Özcan','tr','MF DF','Stuttgart',20,3,0,51,0,0,0,0
),
	(331,'Ramazan Özcan','at','GK','Leverkusen',34,2,2,180,0,0,0,0
),
	(332,'Levin Öztunalı','de','MF FW','Mainz ',22,15,11,921,0,1,3,0
),
	(333,'Gonçalo Paciência','pt','FW','Ein Frankfurt',23,11,4,390,3,1,1,0
),
	(334,'Federico Palacios Martínez','de','MF FW','Nurnberg',23,17,9,942,2,0,1,0
),
	(335,'Paulinho','br','FW MF','Leverkusen',18,15,0,180,0,0,0,0
),
	(336,'Benjamin Pavard','fr','DF','Stuttgart',22,29,29,261,0,0,3,0
),
	(337,'Jiří Pavlenka','cz','GK','Werder Bremen',26,34,34,2977,0,0,2,0
),
	(338,'Peter Pekarík','sk','DF','Hertha',31,3,2,217,0,0,0,0
),
	(339,'Matheus Pereira','pt','MF FW','Nurnberg',22,19,16,1232,3,2,3,1
),
	(340,'Pavao Pervan','at','GK','Wolfsburg',30,9,8,765,0,0,1,0
),
	(341,'Nils Petersen','de','FW','Freiburg',29,24,20,1929,10,3,0,0
),
	(342,'Ondřej Petrák','cz','MF','Nurnberg',26,22,18,1624,0,0,5,0
),
	(343,'Maximilian Philipp','de','FW MF','Dortmund',24,18,9,758,1,1,0,0
),
	(344,'Łukasz Piszczek','pl','DF','Dortmund',33,20,20,1756,1,6,3,0
),
	(345,'Claudio Pizarro','pe','FW','Werder Bremen',39,26,3,692,5,2,1,0
),
	(346,'Marvin Plattenhardt','de','DF','Hertha',26,22,22,1924,1,2,4,0
),
	(347,'Alassane Pléa','fr','FW','Mgladbach',25,34,28,2503,12,4,2,0
),
	(348,'Luca Plogmann','de','GK','Werder Bremen',18,1,0,38,0,0,0,0
),
	(349,'Stefan Posch','at','DF','Hoffenheim',21,17,16,1402,0,0,5,0
),
	(350,'Yussuf Poulsen','dk','FW','RB Leipzig',24,31,27,2451,15,3,2,0
),
	(351,'Edgar Prib','de','MF','Hannover ',28,4,2,202,0,1,1,0
),
	(352,'Christian Pulisic','us','FW','Dortmund',19,20,9,932,4,4,2,0
),
	(353,'Robin Quaison','se','FW MF','Mainz ',24,28,25,2194,7,3,1,0
),
	(354,'Raffael','br','FW','Mgladbach',33,13,5,543,2,1,0,0
),
	(355,'Rafinha','br','DF','Bayern Munich',32,16,9,901,1,1,1,0
),
	(356,'Baba Rahman','gh','DF','Schalke 04',24,2,2,162,0,0,0,0
),
	(357,'Benito Raman','be','MF FW','Dusseldorf',23,30,19,1681,10,4,1,0
),
	(358,'Milot Rashica','xk','FW MF','Werder Bremen',22,26,19,155,9,5,1,0
),
	(359,'Yoric Ravet','fr','FW MF','Freiburg',28,4,0,75,0,0,0,0
),
	(360,'Ante Rebić','hr','FW MF','Ein Frankfurt',24,28,23,1978,9,4,4,1
),
	(361,'Karim Rekik','nl','DF','Hertha',23,24,24,2068,0,0,4,1
),
	(362,'Michael Rensing','de','GK','Dusseldorf',34,32,32,288,0,0,1,0
),
	(363,'Marco Reus','de','MF FW','Dortmund',29,27,27,2316,17,8,3,1
),
	(364,'Elvis Rexhbeçaj','de','MF','Wolfsburg',20,24,13,1144,2,2,4,0
),
	(365,'Simon Rhein','de','MF','Nurnberg',20,8,7,494,0,0,1,1
),
	(366,'Franck Ribéry','fr','MF FW','Bayern Munich',35,25,10,1174,6,3,3,0
),
	(367,'Marco Richter','de','MF FW','Augsburg',20,25,17,1426,4,6,4,0
),
	(368,'Sascha Riether','de','FW','Schalke 04',35,1,0,2,0,0,0,0
),
	(369,'Arjen Robben','nl','FW MF','Bayern Munich',34,12,7,567,4,0,1,1
),
	(370,'Sebastian Rode','de','MF','Ein Frankfurt',27,12,12,923,0,0,4,0
),
	(371,'James Rodríguez','co','MF','Bayern Munich',27,20,13,1138,7,3,2,0
),
	(372,'Jérôme Roussillon','fr','DF','Wolfsburg',25,28,28,2461,3,4,4,0
),
	(373,'Sebastian Rudy','de','MF','Schalke 04',28,21,17,1356,0,0,4,0
),
	(374,'Lukas Rupp','de','MF DF','Hoffenheim',27,1,0,25,0,0,0,0
),
	(375,'Marco Russ','de','DF','Ein Frankfurt',32,5,3,380,0,0,1,0
),
	(376,'Frederik Rønnow','dk','GK','Ein Frankfurt',25,2,1,123,0,0,0,0
),
	(377,'Marcel Sabitzer','at','MF','RB Leipzig',24,30,26,2352,4,3,9,0
),
	(378,'Nuri Şahin','tr','MF','Werder Bremen',29,20,19,1476,1,1,5,0
),
	(379,'Samuel Şahin-Radlinger','at','GK','Hannover ',25,1,1,90,0,0,0,0
),
	(380,'Carlos Salcedo','mx','DF','Ein Frankfurt',24,6,6,460,0,0,3,0
),
	(381,'Roland Sallai','hu','MF','Freiburg',21,10,5,527,2,0,3,0
),
	(382,'Edgar Salli','cm','FW MF','Nurnberg',25,3,1,116,0,0,1,0
),
	(383,'Renato Sanches','pt','MF','Bayern Munich',20,17,4,577,1,1,2,1
),
	(384,'Jadon Sancho','eng','FW MF','Dortmund',18,34,26,2461,12,14,2,0
),
	(385,'Salif Sané','sn','DF','Schalke 04',27,30,29,2614,2,0,4,0
),
	(386,'Marcelo Saracchi','uy','DF','RB Leipzig',20,9,7,653,0,1,2,0
),
	(387,'Josh Sargent','us','FW','Werder Bremen',18,10,1,212,2,0,1,0
),
	(388,'Julian Schieber','de','FW','Augsburg',29,9,3,258,1,0,1,0
),
	(389,'Keven Schlotterbeck','de','DF','Freiburg',21,9,8,773,0,0,1,0
),
	(390,'Nico Schlotterbeck','de','DF','Freiburg',18,4,2,226,0,0,1,0
),
	(391,'Marcel Schmelzer','de','DF','Dortmund',30,9,6,566,0,1,1,0
),
	(392,'Jonathan Schmid','fr','DF','Augsburg',28,28,28,252,3,7,1,0
),
	(393,'Alessandro Schöpf','at','MF DF','Schalke 04',24,15,11,1004,1,0,3,0
),
	(394,'Nico Schulz','de','DF','Hoffenheim',25,30,29,2537,1,5,6,0
),
	(395,'Pirmin Schwegler','ch','MF','Hannover ',31,27,25,2075,0,1,7,0
),
	(396,'Alexander Schwolow','de','GK','Freiburg',26,33,33,297,0,1,1,0
),
	(397,'Davie Selke','de','FW','Hertha',23,30,16,1739,3,5,4,0
),
	(398,'Suat Serdar','de','MF','Schalke 04',21,26,20,1729,2,1,4,2
),
	(399,'Meritan Shabani','al','MF','Bayern Munich',19,1,0,1,0,0,0,0
),
	(400,'Steven Skrzybski','de','FW MF','Schalke 04',25,12,8,664,3,1,1,0
),
	(401,'Emile Smith Rowe','eng','MF','RB Leipzig',18,3,0,29,0,0,0,0
),
	(402,'Marcel Sobottka','de','MF','Dusseldorf',24,14,11,942,0,0,3,0
),
	(403,'Yann Sommer','ch','GK','Mgladbach',29,34,34,306,0,0,1,0
),
	(404,'Oliver Sorg','de','DF','Hannover ',28,19,18,158,0,0,6,1
),
	(405,'Borna Sosa','hr','DF MF','Stuttgart',20,12,7,616,0,1,3,0
),
	(406,'Sebastian Soto','us','MF FW','Hannover ',18,3,0,29,0,0,0,0
),
	(407,'Kostas Stafylidis','gr','DF','Augsburg',24,12,11,920,0,0,1,0
),
	(408,'Benjamin Stambouli','fr','DF MF','Schalke 04',27,21,20,1763,0,2,3,0
),
	(409,'Jozo Stanić','hr','MF','Augsburg',19,1,0,3,0,0,0,0
),
	(410,'Niklas Stark','de','DF','Hertha',23,22,22,1868,1,0,5,0
),
	(411,'Renato Steffen','ch','FW MF','Wolfsburg',26,31,18,1503,5,1,4,0
),
	(412,'Marc Stendera','de','MF','Ein Frankfurt',22,7,0,110,0,0,0,0
),
	(413,'Pascal Stenzel','de','DF MF','Freiburg',22,21,16,1449,0,2,5,1
),
	(414,'Lars Stindl','de','FW MF','Mgladbach',29,21,19,1508,3,1,3,0
),
	(415,'Kevin Stöger','at','MF','Dusseldorf',24,25,24,2118,1,7,8,0
),
	(416,'Tobias Strobl','de','MF DF','Mgladbach',28,29,26,2293,0,4,4,0
),
	(417,'Niklas Sule','de','DF','Bayern Munich',22,31,29,2654,2,0,3,0
),
	(418,'Markus Suttner','at','DF MF','Dusseldorf',31,6,6,489,1,1,1,0
),
	(419,'Ádám Szalai','hu','FW','Hoffenheim',30,30,15,1627,6,3,3,0
),
	(420,'Jonathan Tah','de','DF','Leverkusen',22,33,33,2937,3,1,3,0
),
	(421,'Taleb Tawatha','il','FW DF','Ein Frankfurt',26,3,1,125,0,0,0,0
),
	(422,'Georg Teigl','at','MF FW','Augsburg',27,6,2,296,0,0,0,0
),
	(423,'Marco Terrazzino','de','MF FW','Freiburg',27,13,7,517,1,0,0,0
),
	(424,'Cedric Teuchert','de','FW MF','Schalke 04',21,5,2,160,0,0,0,0
),
	(425,'Erik Thommy','de','MF FW','Stuttgart',23,19,6,794,1,1,3,1
),
	(426,'Timothy Tillman','de','FW MF','Nurnberg',19,6,1,206,0,0,0,0
),
	(427,'George Timotheou','au','DF','Schalke 04',21,1,1,90,0,0,0,0
),
	(428,'Marcel Tisserand','cd','DF','Wolfsburg',25,10,10,886,1,0,2,0
),
	(429,'Corentin Tolisso','fr','MF','Bayern Munich',23,2,1,52,1,0,0,0
),
	(430,'Ömer Toprak','tr','DF','Dortmund',29,9,1,236,0,0,0,0
),
	(431,'Lucas Torró','es','MF','Ein Frankfurt',24,8,6,560,0,0,1,0
),
	(432,'Jordan Torunarigha','de','DF','Hertha',20,14,13,1158,2,2,3,1
),
	(433,'Almamy Touré','ml','DF MF','Ein Frankfurt',22,7,6,519,0,0,0,0
),
	(434,'Ibrahima Traoré','gn','FW MF','Mgladbach',30,16,5,552,0,2,1,0
),
	(435,'Kevin Trapp','de','GK','Ein Frankfurt',28,33,33,2937,0,0,2,0
),
	(436,'Philipp Tschauner','de','GK','Hannover ',32,1,1,90,0,0,0,0
),
	(437,'Anthony Ujah','ng','FW','Mainz ',27,22,6,735,4,0,2,0
),
	(438,'Sven Ulreich','de','GK','Bayern Munich',29,9,8,758,0,0,0,0
),
	(439,'Dayot Upamecano','fr','DF','RB Leipzig',19,15,14,1293,0,0,5,0
),
	(440,'Takashi Usami','jp','MF FW','Dusseldorf',26,19,10,879,1,2,1,0
),
	(441,'Mark Uth','de','FW MF','Schalke 04',26,20,15,1407,2,1,3,0
),
	(442,'Enrico Valentini','it','DF','Nurnberg',29,15,15,1299,0,2,2,0
),
	(443,'Miloš Veljković','rs','DF','Werder Bremen',22,23,21,1877,1,0,7,2
),
	(444,'Paul Verhaegh','nl','DF','Wolfsburg',34,2,2,180,0,0,0,0
),
	(445,'Kevin Vogt','de','DF','Hoffenheim',26,28,28,2391,0,0,5,0
),
	(446,'Kevin Volland','de','FW','Leverkusen',26,34,32,2814,14,9,4,0
),
	(447,'Sandro Wagner','de','FW','Bayern Munich',30,7,1,143,0,0,2,0
),
	(448,'Walace','br','MF','Hannover ',23,26,23,1996,1,1,5,0
),
	(449,'Luca Waldschmidt','de','FW MF','Freiburg',22,30,16,1717,9,1,1,0
),
	(450,'Wout Weghorst','nl','FW','Wolfsburg',25,34,33,2925,17,7,4,0
),
	(451,'Julian Weigl','de','DF MF','Dortmund',22,18,16,1455,1,0,3,0
),
	(452,'Mitchell Weiser','de','DF','Leverkusen',24,30,22,2111,1,3,3,0
),
	(453,'Wendell','br','DF','Leverkusen',25,28,25,2277,2,2,5,0
),
	(454,'Oscar Wendt','se','DF','Mgladbach',32,32,30,2731,1,1,2,0
),
	(455,'Timo Werner','de','FW','RB Leipzig',22,30,29,2509,16,7,1,0
),
	(456,'Hendrik Weydandt','de','FW','Hannover ',23,28,18,1723,6,1,1,0
),
	(457,'Jetro Willems','nl','MF DF','Ein Frankfurt',24,23,7,730,0,1,2,1
),
	(458,'William','br','DF','Wolfsburg',23,31,30,2675,2,1,10,0
),
	(459,'Kevin Wimmer','at','DF','Hannover ',25,22,17,1683,0,0,5,0
),
	(460,'Axel Witsel','be','MF','Dortmund',29,33,32,2873,4,1,2,0
),
	(461,'Marius Wolf','de','DF FW','Dortmund',23,16,10,828,1,0,1,1
),
	(462,'Jeong Woo-yeong','kr','FW','Bayern Munich',18,1,0,5,0,0,0,0
),
	(463,'Bobby Wood','us','FW MF','Hannover ',25,20,12,1182,3,1,1,0
),
	(464,'Haji Wright','us','FW','Schalke 04',20,7,2,197,1,0,0,0
),
	(465,'John Yeboah','de','MF FW','Wolfsburg',18,2,0,55,0,0,0,0
),
	(466,'Dan-Axel Zagadou','fr','DF','Dortmund',19,17,15,1267,2,0,4,0
),
	(467,'Denis Zakaria','ch','MF','Mgladbach',21,31,21,1959,4,0,7,0
),
	(468,'Robin Zentner','de','GK','Mainz ',23,10,10,900,0,0,1,0
),
	(469,'Ron-Robert Zieler','de','GK','Stuttgart',29,34,34,306,0,0,3,0
),
	(470,'Jean Zimmer','de','DF FW','Dusseldorf',24,18,17,1435,1,2,2,0
),
	(471,'Matthias Zimmermann','de','DF MF','Dusseldorf',26,34,34,3049,1,3,4,0
),
	(472,'Adam Zreľák','sk','FW','Nurnberg',24,14,10,941,2,1,4,0
),
	(473,'Steven Zuber','ch','MF FW','Hoffenheim',26,9,6,571,0,1,1,0
),
	(474,'Steven Zuber','ch','MF FW','Stuttgart',26,13,13,1051,5,1,3,0)
;

INSERT INTO Goalkeeper VALUES
	(39,'Oliver Baumann','de','Hoffenheim',28,33,33,297,51,1.55,116,72.9,12,12,9,5,6,6,0,0,0.0
),
	(66,'Fabian Bredlow','de','Nurnberg',23,14,12,1127,28,2.24,32,54.1,2,3,7,2,2,0,1,1,100.0
),
	(77,'Roman Burki','ch','Dortmund',27,32,32,288,40,1.25,88,71.9,21,7,4,10,4,4,0,0,0.0
),
	(85,'Koen Casteels','be','Wolfsburg',26,26,26,2295,39,1.53,79,70.6,11,6,9,8,5,4,1,0,20.0
),
	(114,'Jaroslav Drobny','cz','Dusseldorf',38,2,2,180,3,1.50,6,66.7,1,0,1,0,0,0,0,0,NULL),
	(123,'Michael Esser','de','Hannover ',30,32,32,288,66,2.06,148,71.5,5,6,21,5,6,5,1,0,16.7
),
	(127,'Ralf Fährmann','de','Schalke 04',29,17,16,1469,26,1.59,58,71.1,4,3,9,3,2,2,0,0,0.0
),
	(134,'Mark Flekken','nl','Freiburg',25,1,1,90,1,1.00,4,80.0,1,0,0,0,0,0,0,0,NULL),
	(148,'Fabian Giefer','de','Augsburg',28,4,4,360,7,1.75,12,63.2,1,1,2,0,0,0,0,0,NULL),
	(168,'Peter Gulasci','hu','RB Leipzig',28,33,33,2925,27,0.83,91,80.3,19,9,5,15,5,4,0,1,0.0
),
	(193,'Marwin Hitz','ch','Dortmund',30,2,2,180,4,2.00,2,33.3,2,0,0,0,1,0,0,1,NULL),
	(200,'Lukas Hradecky','fi','Leverkusen',28,32,32,288,47,1.47,81,65.4,18,4,10,9,4,3,1,0,25.0
),
	(214,'Rune Jarstein','no','Hertha ',33,31,31,2745,48,1.57,96,67.8,9,10,12,8,4,2,1,1,33.3
),
	(232,'Stefanos Kapino','gr','Werder Bremen',24,1,0,45,1,2.00,2,66.7,0,0,0,0,0,0,0,0,NULL),
	(246,'Gregor Kobel','ch','Hoffenheim',20,1,1,90,1,1.00,6,100.0,1,0,0,0,1,1,0,0,0.0
),
	(247,'Gregor Kobel','ch','Augsburg',20,16,16,139,42,2.72,51,55.9,4,2,10,3,2,1,1,0,50.0
),
	(256,'Thomas Kraft','de','Hertha ',30,4,3,315,9,2.57,7,56.3,2,0,1,1,2,2,0,0,0.0
),
	(278,'Andreas Luthe','de','Augsburg',31,15,14,131,22,1.51,57,71.8,3,5,6,2,0,0,0,0,NULL),
	(288,'Christian Mathenia','de','Nurnberg',26,22,22,1933,40,1.86,80,67.8,1,7,14,2,2,2,0,0,0.0
),
	(303,'Florian Muller','de','Mainz ',20,24,24,216,43,1.79,81,67.7,8,3,13,5,4,3,0,1,0.0
),
	(308,'Yvon Mvogo','ch','RB Leipzig',24,2,1,135,2,1.33,2,75.0,0,0,1,1,1,1,0,0,0.0
),
	(314,'Manuel Neuer','de','Bayern Munich',32,26,26,2303,23,0.90,34,64.3,20,3,3,10,3,3,0,0,0.0
),
	(319,'Alexander Nubel','de','Schalke 04',21,18,18,1588,29,1.64,53,68.7,4,6,8,4,4,3,1,0,25.0
),
	(331,'Ramazan Özcan','at','Leverkusen',34,2,2,180,5,2.50,7,66.7,0,0,2,0,2,1,1,0,50.0
),
	(337,'Jiri Pavlenka','cz','Werder Bremen',26,34,34,2978,47,1.42,106,71.2,14,11,9,5,4,3,0,1,0.0
),
	(340,'Pavao Pervan','at','Wolfsburg',30,10,8,765,11,1.29,29,72.5,5,1,2,1,1,0,0,1,NULL),
	(348,'Luca Plogmann','de','Werder Bremen',18,1,0,37,1,2.43,0,100.0,0,0,0,0,1,1,0,0,0.0
),
	(362,'Michael Rensing','de','Dusseldorf',34,32,32,288,62,1.94,108,67.6,12,5,15,5,7,7,0,0,0.0
),
	(376,'Frederik Ronnow','dk','Eint Frankfurt',25,2,1,122,0,0.00,7,100.0,1,0,0,1,0,0,0,0,NULL),
	(379,'Samuel Åžahin-Radlinger','at','Hannover ',25,1,1,90,2,2.00,4,66.7,0,0,1,0,0,0,0,0,NULL),
	(396,'Alexander Schwolow','de','Freiburg',26,33,33,297,60,1.82,110,68.8,7,12,14,5,7,7,0,0,0.0
),
	(403,'Yann Sommer','ch','Mgladbach',29,34,34,306,42,1.24,114,75.0,16,7,11,13,3,3,0,0,0.0
),
	(435,'Kevin Trapp','de','Ein Frankfurt',28,33,33,2938,48,1.47,111,70.3,14,9,10,8,1,1,0,0,0.0
),
	(436,'Philipp Tschauner','de','Hannover ',32,1,1,90,3,3.00,3,66.7,0,0,1,0,1,1,0,0,0.0
),
	(438,'Sven Ulreich','de','Bayern Munich',29,9,8,757,9,1.07,14,69.6,4,3,1,2,3,2,0,1,0.0
),
	(468,'Robin Zentner','de','Mainz ',23,10,10,900,14,1.40,35,71.4,4,4,2,2,0,0,0,0,NULL),
	(469,'Ron-Robert Zieler','de','Stuttgart',29,34,34,306,70,2.06,113,62.0,7,7,20,6,3,2,0,1,0.0)
;