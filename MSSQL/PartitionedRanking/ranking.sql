select a.UserID, ('"' + a.Name + '"'), a.Level from 
(
	SELECT RANK() OVER (PARTITION BY UserID ORDER BY Level desc, Offset1 desc, Offset2 desc, Offset3 desc) as Ranking,
	UserID, Name, Level, Offset1, Offset2, Offset3
	FROM CharInfo 
) as a
where a.Ranking = 1 order by a.UserID
