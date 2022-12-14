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






