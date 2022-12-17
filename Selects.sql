--selects

--1
SELECT rp.Title, rp.PublishedAt,
(SELECT STRING_AGG(s.LastName || ', ' || LEFT(s.FirstName, 1) || '.', '; ') FROM Scientists s WHERE 
(SELECT COUNT(*) FROM ScientistsPapers sp WHERE sp.ScientistId = s.ScientistId AND sp.ResearchPaperId = rp.ResearchPaperId)>0)
FROM ResearchPapers rp

--2
SELECT s.FirstName, s.LastName, s.Sex, c.Name, c.PPPCapitaInCents FROM Scientists s
JOIN Countries c ON c.CountryId = s.CountryId

--3
SELECT p.Name as ProjectName,
CASE
WHEN(a.Name IS NULL) THEN 'NEMA GA'
ELSE a.Name END AS AcceleratorName
FROM Projects p
LEFT JOIN AcceleratorProjects ap ON p.ProjectId = ap.ProjectId
LEFT JOIN Accelerators a ON a.AcceleratorId = ap.AcceleratorId

--4
SELECT * FROM Projects p
WHERE (SELECT COUNT(*) FROM ResearchPapers rp WHERE p.ProjectId = rp.ProjectId AND 
	  DATE_PART('year', rp.PublishedAt) >= 2015 AND DATE_PART('year', rp.PublishedAt) <= 2017) > 0

--5 u istoj tablici po zemlji broj radova i najpopularniji rad znanstvenika iste zemlje,
--pri čemu je najpopularniji rad onaj koji ima najviše citata
--ovo mi da najpopularniji rad po državi
/*SELECT	DISTINCT ON(c.Name) c.Name, rp.Title FROM Countries c
LEFT JOIN Scientists s ON c.CountryId = s.CountryId
LEFT JOIN ScientistsPapers sp ON sp.ScientistId = s.ScientistId
LEFT JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
ORDER BY c.Name, rp.NumberOfCitations

--ovo mi da broj radova po državi
SELECT c.Name, COUNT(sp.ResearchPaperId)
FROM Countries c
LEFT JOIN Scientists s ON c.CountryId = s.CountryId
LEFT JOIN ScientistsPapers sp ON sp.ScientistId = s.ScientistId
LEFT JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY c.Name*/

--ode je samo spojeno to dvoje 
SELECT t1.Name, t1.Title AS MostPopularResearchPaper, t2.CountOfResearchPapers FROM
(SELECT	DISTINCT ON(c.Name) c.Name, rp.Title FROM Countries c
LEFT JOIN Scientists s ON c.CountryId = s.CountryId
LEFT JOIN ScientistsPapers sp ON sp.ScientistId = s.ScientistId
LEFT JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
ORDER BY c.Name, rp.NumberOfCitations) t1
JOIN
(SELECT c.Name, COUNT(sp.ResearchPaperId) AS CountOfResearchPapers
FROM Countries c
LEFT JOIN Scientists s ON c.CountryId = s.CountryId
LEFT JOIN ScientistsPapers sp ON sp.ScientistId = s.ScientistId
LEFT JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY c.Name) t2
ON t1.Name = t2.Name



--5 

--6 
SELECT DISTINCT ON (c.CountryId) c.CountryId, c.Name, rp.Title, rp.PublishedAt FROM ResearchPapers rp
JOIN ScientistsPapers sp ON rp.ResearchPaperId = sp.ResearchPaperId
JOIN Scientists s ON s.ScientistId = sp.ScientistId
RIGHT JOIN Countries c ON c.CountryId = s.CountryId
ORDER BY c.CountryId, rp.PublishedAt

--7
SELECT h.City, COUNT(s.FirstName) FROM Hotels h
JOIN Scientists s ON s.HotelId = h.HotelId
GROUP BY h.City
ORDER BY COUNT(s.FirstName) DESC

--8 
SELECT a.Name, ROUND(AVG(rp.NumberOfCitations), 2) AS AverageCitations FROM Accelerators a
JOIN AcceleratorProjects ap ON ap.AcceleratorId = a.AcceleratorId
JOIN Projects p ON p.ProjectId = ap.ProjectId
JOIN ResearchPapers rp ON rp.ProjectId = p.ProjectId
GROUP BY a.Name

--9 ovo radi samo moran dodat u seed da zapravo ispunjava uvjete (i moran dodat znanstevnike materijala)
SELECT s.Profession, DATE_PART('decade', s.DateOfBirth) AS DecadeOfBirth, s.Sex, COUNT(*) AS NumberOfScientists FROM Scientists s
GROUP BY s.Profession, DATE_PART('decade', s.DateOfBirth), s.Sex
HAVING COUNT(*) > 20
ORDER BY  DATE_PART('decade', s.DateOfBirth)

--bonus 1

--ovo izbroji znanstvenike po svakom radu
--ovo mi da samo imena i prezimena znanstvenika (40 rows)
/*SELECT s.FirstName, s.Lastname, rp.ResearchPaperId FROM Scientists s
JOIN ScientistsPapers sp ON s.ScientistId = sp.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY s.ScientistId, rp.ResearchPaperId
ORDER BY s.Firstname, s.LastName*/

--ovo mi da broj znanstvenika po radu (189 rows)
/*SELECT rp.Title, COUNT(*) FROM Scientists s
JOIN ScientistsPapers sp ON s.ScientistId = sp.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY rp.ResearchPaperId*/

--koliko eura po radu se dobije
/*SELECT rp.ResearchPaperId, SQRT(rp.NumberOfCitations)/COUNT(*) FROM Scientists s
JOIN ScientistsPapers sp ON s.ScientistId = sp.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY rp.ResearchPaperId*/

--bonus 1 rješenje
SELECT t1.FirstName, t1.LastName, ROUND(CAST(SUM(t2.MoneyPerPaper) AS Numeric), 2) AS TotalMoney FROM
(
SELECT s.FirstName, s.Lastname, rp.ResearchPaperId FROM Scientists s
JOIN ScientistsPapers sp ON s.ScientistId = sp.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY s.ScientistId, rp.ResearchPaperId
ORDER BY s.Firstname, s.LastName
) AS t1
JOIN
(
SELECT rp.ResearchPaperId, SQRT(rp.NumberOfCitations)/COUNT(*) AS MoneyPerPaper FROM Scientists s
JOIN ScientistsPapers sp ON s.ScientistId = sp.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId = sp.ResearchPaperId
GROUP BY rp.ResearchPaperId
) AS t2
ON t1.ResearchPaperId = t2.ResearchPaperId
GROUP BY t1.FirstName, t1.LastName
ORDER BY TotalMoney DESC
LIMIT 10








