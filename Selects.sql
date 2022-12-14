--selects

--1
SELECT rp.Title, rp.PublishedAt,
(SELECT STRING_AGG(s.LastName || ', ' || LEFT(s.FirstName, 1) || '.', '; ') FROM Scientists s WHERE 
(SELECT COUNT(*) FROM ScientistsPapers sp WHERE sp.ScientistId = s.ScientistId AND sp.ResearchPaperId = rp.ResearchPaperId)>0)
FROM ResearchPapers rp

--2

