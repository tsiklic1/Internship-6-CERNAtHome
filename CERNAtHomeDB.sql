--Accelerators
CREATE TABLE Accelerators(
	AcceleratorId SERIAL PRIMARY KEY,
	Name VARCHAR(40) NOT NULL
);
ALTER TABLE Accelerators
ADD CONSTRAINT UniqueAcceleratorName UNIQUE(Name);

--projects
CREATE TABLE Projects(
	ProjectId SERIAL PRIMARY KEY,
	Name VARCHAR(40) NOT NULL
);

ALTER TABLE Projects
ADD CONSTRAINT UniqueProjectName UNIQUE(Name);

--hotels
CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	Capacity INT CHECK (Capacity > 0) NOT NULL,
	City VARCHAR (40) NOT NULL
);
--ResearchPapers
CREATE TABLE ResearchPapers(
	ResearchPaperId SERIAL PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	PublishedAt TIMESTAMP,
	NumberOfCitations INT CHECK(NumberOfCitations >= 0),
	ProjectId INT REFERENCES Projects(ProjectId)
);

ALTER TABLE ResearchPapers
ADD CONSTRAINT UniqueTitle UNIQUE(Title);

--Countries
CREATE TABLE Countries(
	CountryId SERIAL PRIMARY KEY,
	Name VARCHAR (40) NOT NULL,
	Population INT CHECK (Population > 0),
	PPPCapitaInCents BIGINT CHECK (PPPCapitaInCents > 0)
);

ALTER TABLE Countries
ADD CONSTRAINT UniqueCountryName UNIQUE(Name);

--Scientists
CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	DateOfBirth TIMESTAMP NOT NULL,
	Sex VARCHAR(20) CHECK (Sex IN ('MUŠKI', 'ŽENSKI', 'NEPOZNATO', 'OSTALO')),
	Profession VARCHAR (30) CHECK (Profession IN ('programer', 'fizičar', 'inženjer', 'znanstvenik materijala')),
	CountryId INT REFERENCES Countries(CountryId)
);

ALTER TABLE Scientists
ADD COLUMN HotelId INT REFERENCES Hotels(HotelId) NOT NULL;

--AcceleratorProjects
CREATE TABLE AcceleratorProjects(
	Id SERIAL PRIMARY KEY,
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId),
	ProjectId INT REFERENCES Projects(ProjectId) NOT NULL
);

ALTER TABLE AcceleratorProjects
ALTER COLUMN AcceleratorId SET NOT NULL

ALTER TABLE AcceleratorProjects
ADD CONSTRAINT UniqueAcceleratorProjectPair UNIQUE(AcceleratorId, ProjectId);

--ScientistsPapers
CREATE TABLE ScientistsPapers(
	Id SERIAL PRIMARY KEY,
	ScientistId INT REFERENCES Scientists(ScientistId),
	ResearchPaperId INT REFERENCES ResearchPapers(ResearchPaperId)
);

ALTER TABLE ScientistsPapers
ADD CONSTRAINT UniqueScientistPaper UNIQUE (ScientistId, ResearchPaperId);

SELECT * FROM ResearchPapers

--insert into Hotels
insert into Hotels (HotelId, Capacity, City) values (1, 200, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (2, 417, 'Paris');
insert into Hotels (HotelId, Capacity, City) values (3, 330, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (4, 374, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (5, 108, 'Munchen');
insert into Hotels (HotelId, Capacity, City) values (6, 116, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (7, 72, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (8, 310, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (9, 42, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (10, 164, 'Berlin');
insert into Hotels (HotelId, Capacity, City) values (11, 174, 'Berlin');
insert into Hotels (HotelId, Capacity, City) values (12, 120, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (13, 208, 'Vienna');
insert into Hotels (HotelId, Capacity, City) values (14, 297, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (15, 259, 'Zagreb');
insert into Hotels (HotelId, Capacity, City) values (16, 388, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (17, 86, 'Munchen');
insert into Hotels (HotelId, Capacity, City) values (18, 172, 'Munchen');
insert into Hotels (HotelId, Capacity, City) values (19, 62, 'Geneva');
insert into Hotels (HotelId, Capacity, City) values (20, 270, 'Geneva');

--insert into Countries
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (1, 'Cyprus', 65440975, 50458738);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (2, 'Uzbekistan', 91290019, 36793515);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (3, 'Indonesia', 14556361, 99829582);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (4, 'Peru', 64203490, 76919393);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (5, 'Philippines', 8713761, 41111739);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (6, 'Burkina Faso', 91402752, 94437300);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (7, 'Czech Republic', 18352813, 63219524);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (8, 'China', 69157136, 96386452);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (9, 'Luxembourg', 4256887, 76133832);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (10, 'Brazil', 63948843, 1140413);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (11, 'Mauritius', 20737879, 93034974);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (12, 'Djibouti', 66633710, 56797660);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (13, 'Macedonia', 96646012, 92012835);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (14, 'Israel', 79855093, 22023184);
insert into Countries (CountryId, Name, Population, PPPCapitaInCents) values (15, 'Spain', 48835895, 3876139);


--insert into Accelerators
insert into Accelerators (AcceleratorId, Name) values (1, 'LHC');
insert into Accelerators (AcceleratorId, Name) values (2, 'Linac4');
insert into Accelerators (AcceleratorId, Name) values (3, 'PS Booster');
insert into Accelerators (AcceleratorId, Name) values (4, 'Linac3');
insert into Accelerators (AcceleratorId, Name) values (5, 'Leir');
insert into Accelerators (AcceleratorId, Name) values (6, 'ELENA');
insert into Accelerators (AcceleratorId, Name) values (7, 'Proton Synchrotron');

--insert into Projects
insert into Projects (ProjectId, Name) values (1, 'Toughjoyfax');
insert into Projects (ProjectId, Name) values (2, 'Cookley');
insert into Projects (ProjectId, Name) values (3, 'Solarbreeze');
insert into Projects (ProjectId, Name) values (4, 'Bytecard');
insert into Projects (ProjectId, Name) values (5, 'Prodder');
insert into Projects (ProjectId, Name) values (6, 'Trippledex');
insert into Projects (ProjectId, Name) values (7, 'Transcof');
insert into Projects (ProjectId, Name) values (8, 'Stronghold');
insert into Projects (ProjectId, Name) values (9, 'Alpha');
insert into Projects (ProjectId, Name) values (10, 'Lotstring');
insert into Projects (ProjectId, Name) values (11, 'Quo Lux');
insert into Projects (ProjectId, Name) values (12, 'Mat Lam Tam');
insert into Projects (ProjectId, Name) values (13, 'Regrant');
insert into Projects (ProjectId, Name) values (14, 'Span');
insert into Projects (ProjectId, Name) values (15, 'Voyatouch');
insert into Projects (ProjectId, Name) values (16, 'Flowdesk');
insert into Projects (ProjectId, Name) values (17, 'Zoolab');

--insert into Scientists
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (1, 'Boony', 'Mc Dermid', '1928-05-12', 'OSTALO', 'fizičar', 10, 20);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (2, 'Broderick', 'Larive', '1932-12-29', 'OSTALO', 'programer', 1, 4);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (3, 'Jakie', 'Sollett', '1965-05-02', 'MUŠKI', 'fizičar', 13, 19);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (4, 'Bryanty', 'Braidley', '1978-06-02', 'MUŠKI', 'inženjer', 2, 6);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (5, 'Merry', 'Hakking', '1960-01-16', 'MUŠKI', 'fizičar', 3, 17);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (6, 'Arin', 'Covington', '1950-07-04', 'MUŠKI', 'programer', 9, 11);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (7, 'Clarence', 'Pendergrast', '1929-10-17', 'NEPOZNATO', 'inženjer', 14, 10);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (8, 'Case', 'Kristoffersson', '1947-03-29', 'MUŠKI', 'inženjer', 1, 4);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (9, 'Gunner', 'Spence', '1925-08-10', 'MUŠKI', 'inženjer', 14, 2);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (10, 'Isiahi', 'Dudin', '1943-01-30', 'MUŠKI', 'inženjer', 15, 14);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (11, 'Dimitri', 'Spreckley', '1987-09-02', 'OSTALO', 'inženjer', 2, 17);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (12, 'Niel', 'Carnew', '1973-08-10', 'MUŠKI', 'fizičar', 5, 19);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (13, 'Chicky', 'Kharchinski', '2002-06-17', 'NEPOZNATO', 'inženjer', 12, 16);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (14, 'Daniel', 'Robertshaw', '1991-12-20', 'OSTALO', 'programer', 13, 11);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (15, 'Kellby', 'Clemenzi', '1955-05-14', 'MUŠKI', 'programer', 15, 13);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (16, 'James', 'Chaddock', '1959-05-12', 'MUŠKI', 'inženjer', 1, 4);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (17, 'Flinn', 'Silkstone', '2003-12-06', 'OSTALO', 'programer', 12, 5);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (18, 'Zebulon', 'Stroban', '1962-01-13', 'NEPOZNATO', 'programer', 9, 1);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (19, 'Sax', 'Gosnay', '1926-06-10', 'MUŠKI', 'programer', 7, 16);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (20, 'Zebulen', 'O''Donnell', '1998-08-06', 'MUŠKI', 'fizičar', 11, 15);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (21, 'Isaac', 'Kitcatt', '1971-02-08', 'MUŠKI', 'fizičar', 13, 5);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (22, 'Panchito', 'Burgan', '1936-08-07', 'NEPOZNATO', 'fizičar', 5, 15);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (23, 'Farlee', 'Allone', '1979-11-19', 'OSTALO', 'programer', 12, 15);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (24, 'Burton', 'Wessell', '2004-04-02', 'OSTALO', 'fizičar', 13, 16);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (25, 'Ingemar', 'Dickon', '2009-10-05', 'MUŠKI', 'fizičar', 1, 6);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (26, 'Read', 'Nitti', '1952-09-30', 'MUŠKI', 'inženjer', 3, 13);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (27, 'Berty', 'Van Arsdale', '1996-01-22', 'OSTALO', 'programer', 14, 20);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (28, 'Noe', 'Ascrofte', '1958-04-17', 'OSTALO', 'programer', 13, 14);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (29, 'Lauren', 'Hains', '1988-07-27', 'NEPOZNATO', 'inženjer', 4, 15);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (30, 'Horatius', 'Leddy', '1983-05-10', 'MUŠKI', 'programer', 4, 10);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (31, 'Nanny', 'Krop', '2000-03-06', 'ŽENSKI', 'fizičar', 5, 6);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (32, 'Kirsten', 'Skentelbury', '1983-07-11', 'ŽENSKI', 'inženjer', 8, 11);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (33, 'Marthena', 'Horsted', '1964-12-17', 'ŽENSKI', 'fizičar', 9, 5);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (34, 'Isabel', 'De Domenicis', '1991-06-13', 'ŽENSKI', 'fizičar', 3, 7);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (35, 'Siobhan', 'Kunzler', '1960-07-19', 'ŽENSKI', 'programer', 1, 5);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (36, 'Sonnie', 'Biddles', '1952-12-28', 'ŽENSKI', 'programer', 7, 19);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (37, 'Lauretta', 'Claye', '1961-01-07', 'ŽENSKI', 'programer', 5, 2);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (38, 'Sorcha', 'Crookshank', '1999-11-15', 'ŽENSKI', 'programer', 4, 2);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (39, 'Feodora', 'Merrywether', '1933-02-15', 'ŽENSKI', 'programer', 4, 9);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (40, 'Kalinda', 'Drew-Clifton', '1988-10-21', 'ŽENSKI', 'fizičar', 11, 19);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (41, 'Flory', 'Frandsen', '1977-04-12', 'MUŠKI', 'znanstvenik materijala', 2, 1);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (42, 'Wash', 'Hunnybun', '1977-08-14', 'MUŠKI', 'fizičar', 12, 14);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (43, 'Pedro', 'Upex', '1977-09-13', 'MUŠKI', 'fizičar', 14, 16);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (44, 'Pernell', 'Dupoy', '1971-05-13', 'MUŠKI', 'znanstvenik materijala', 15, 4);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (45, 'Osborn', 'Wilkennson', '1974-05-19', 'MUŠKI', 'znanstvenik materijala', 1, 3);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (46, 'Conn', 'Blaisdale', '1974-04-09', 'MUŠKI', 'znanstvenik materijala', 1, 19);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (47, 'Falkner', 'Pfeffer', '1974-04-13', 'MUŠKI', 'znanstvenik materijala', 8, 8);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (48, 'Darin', 'Stewart', '1972-09-04', 'MUŠKI', 'znanstvenik materijala', 5, 6);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (49, 'Gordie', 'Wing', '1971-09-24', 'MUŠKI', 'znanstvenik materijala', 12, 17);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (50, 'Brad', 'O''Halleghane', '1974-06-25', 'MUŠKI', 'znanstvenik materijala', 9, 14);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (51, 'Jacob', 'Addionisio', '1977-09-04', 'MUŠKI', 'fizičar', 10, 3);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (52, 'Hendrik', 'Cullnean', '1973-09-08', 'MUŠKI', 'znanstvenik materijala', 11, 17);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (53, 'Sebastien', 'Giacobazzi', '1976-04-02', 'MUŠKI', 'znanstvenik materijala', 15, 11);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (54, 'Herve', 'McGregor', '1974-02-17', 'MUŠKI', 'znanstvenik materijala', 5, 1);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (55, 'Yuma', 'Janczewski', '1974-10-22', 'MUŠKI', 'znanstvenik materijala', 12, 9);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (56, 'Thadeus', 'Hafner', '1971-09-08', 'MUŠKI', 'znanstvenik materijala', 2, 2);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (57, 'Yvon', 'Nowell', '1977-08-28', 'MUŠKI', 'znanstvenik materijala', 11, 14);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (58, 'Josh', 'Rowat', '1973-08-03', 'MUŠKI', 'znanstvenik materijala', 5, 20);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (59, 'Bennett', 'Corish', '1979-03-25', 'MUŠKI', 'znanstvenik materijala', 15, 12);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (60, 'Luca', 'Matiebe', '1979-10-12', 'MUŠKI', 'znanstvenik materijala', 1, 9);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (61, 'Matt', 'Rowatig', '1973-08-03', 'MUŠKI', 'znanstvenik materijala', 5, 20);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (62, 'Bob', 'Bond', '1979-03-25', 'MUŠKI', 'znanstvenik materijala', 15, 12);
insert into Scientists (ScientistId, FirstName, LastName, DateOfBirth, Sex, Profession, CountryId, HotelId) values (63, 'Simon', 'Bing', '1979-10-12', 'MUŠKI', 'znanstvenik materijala', 1, 9);

--insert into ResearchPapers
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (1, 'Managed interactive support', '1950-01-01', 44, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (2, 'Integrated foreground product', '1959-12-03', 44, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (3, 'User-friendly coherent intranet', '1961-12-04', 21, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (4, 'Intuitive national product', '1951-11-02', 83, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (5, 'Reactive context-sensitive secured line', '2020-10-25', 71, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (6, 'Switchable object-oriented service-desk', '1938-08-17', 40, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (7, 'Realigned 5th generation initiative', '1963-12-25', 42, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (8, 'Enterprise-wide global secured line', '1940-01-16', 78, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (9, 'Cloned didactic secured line', '1979-02-09', 23, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (10, 'Digitized incremental artificial intelligence', '1928-09-08', 54, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (11, 'Cross-group needs-based leverage', '1940-01-28', 34, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (12, 'Organized scalable Graphical User Interface', '1938-08-03', 99, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (13, 'Right-sized 5th generation application', '1950-01-15', 41, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (14, 'Public-key empowering protocol', '2004-09-30', 52, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (15, 'Synchronised didactic methodology', '1941-12-20', 60, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (16, 'Balanced directional workforce', '1976-04-02', 11, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (17, 'Compatible 3rd generation moratorium', '2013-08-17', 17, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (18, 'Progressive non-volatile strategy', '1994-03-20', 37, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (19, 'Profound 5th generation groupware', '1967-09-09', 14, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (20, 'Organized mission-critical algorithm', '1976-11-04', 79, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (21, 'Cross-group intermediate customer loyalty', '1973-08-10', 98, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (22, 'Open-source empowering infrastructure', '1957-05-16', 30, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (23, 'Digitized 6th generation protocol', '2002-03-11', 11, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (24, 'Diverse upward-trending approach', '1964-10-11', 54, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (25, 'Reverse-engineered logistical success', '1970-03-23', 73, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (26, 'Decentralized transitional open system', '1953-07-21', 11, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (27, 'Profit-focused directional product', '2012-10-29', 38, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (28, 'Mandatory zero tolerance parallelism', '1990-11-21', 92, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (29, 'Cross-platform analyzing workforce', '2007-04-05', 94, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (30, 'Down-sized interactive interface', '2020-04-06', 38, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (31, 'Advanced stable help-desk', '2001-10-26', 82, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (32, 'Future-proofed dedicated definition', '1942-11-11', 49, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (33, 'Multi-channelled cohesive projection', '2016-06-30', 57, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (34, 'Triple-buffered actuating customer loyalty', '1964-02-01', 18, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (35, 'Optional tangible knowledge user', '1927-05-07', 31, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (36, 'Programmable zero administration complexity', '2014-03-06', 48, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (37, 'Monitored radical orchestration', '1956-05-27', 71, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (38, 'Devolved bottom-line knowledge base', '2010-01-22', 58, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (39, 'Diverse radical projection', '1953-12-05', 38, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (40, 'Vision-oriented fault-tolerant hierarchy', '1987-06-15', 61, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (41, 'Triple-buffered context-sensitive implementation', '2004-07-26', 1, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (42, 'Streamlined fresh-thinking budgetary management', '2017-04-29', 78, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (43, 'Decentralized actuating synergy', '1954-08-28', 54, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (44, 'Fully-configurable coherent core', '1971-12-05', 61, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (45, 'Optional well-modulated intranet', '1971-07-12', 77, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (46, 'Sharable radical orchestration', '1958-09-18', 72, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (47, 'Front-line regional time-frame', '1934-06-08', 97, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (48, 'Progressive coherent architecture', '1982-08-03', 68, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (49, 'De-engineered impactful frame', '2019-04-22', 30, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (50, 'Ergonomic fault-tolerant application', '1984-05-15', 23, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (51, 'Extended real-time service-desk', '1925-06-26', 96, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (52, 'Configurable upward-trending solution', '2020-01-31', 79, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (53, 'Proactive contextually-based frame', '2020-12-03', 85, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (54, 'Progressive 4th generation implementation', '1932-03-21', 2, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (55, 'Implemented didactic hub', '1996-02-24', 10, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (56, 'Managed radical data-warehouse', '2019-05-23', 87, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (57, 'Exclusive 24/7 benchmark', '2021-04-20', 47, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (58, 'Enterprise-wide cohesive website', '1935-02-01', 94, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (59, 'Up-sized bottom-line infrastructure', '1956-08-25', 6, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (60, 'Synergistic solution-oriented service-desk', '2021-09-08', 4, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (61, 'Re-engineered local hub', '1929-11-22', 1, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (62, 'Programmable client-driven core', '1949-03-30', 84, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (63, 'Cloned executive standardization', '1965-01-18', 74, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (64, 'Down-sized methodical intranet', '2004-01-04', 5, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (65, 'Grass-roots bi-directional application', '1964-08-28', 44, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (66, 'Networked zero tolerance implementation', '2011-10-10', 37, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (67, 'Intuitive impactful attitude', '1946-03-20', 74, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (68, 'Implemented analyzing hardware', '1942-01-29', 2, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (69, 'Intuitive explicit forecast', '1960-06-13', 32, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (70, 'Devolved mission-critical middleware', '1935-12-05', 64, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (71, 'Robust user-facing data-warehouse', '2019-03-31', 14, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (72, 'Cross-group system-worthy policy', '1994-05-06', 92, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (73, 'Diverse exuding service-desk', '1975-07-03', 87, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (74, 'Down-sized value-added flexibility', '2011-08-06', 48, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (75, 'Automated fresh-thinking forecast', '1939-08-27', 4, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (76, 'Down-sized client-server emulation', '1979-04-13', 81, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (77, 'Progressive web-enabled paradigm', '1951-10-12', 93, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (78, 'Innovative fault-tolerant emulation', '2011-06-16', 70, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (79, 'Organic asymmetric throughput', '2014-02-23', 57, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (80, 'Re-engineered background access', '1967-06-18', 54, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (81, 'User-friendly contextually-based concept', '2018-10-27', 6, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (82, 'Sharable upward-trending toolset', '1954-09-23', 17, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (83, 'Quality-focused tertiary attitude', '1987-11-09', 68, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (84, 'Re-contextualized empowering structure', '2009-02-24', 84, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (85, 'Open-architected context-sensitive challenge', '1959-07-14', 42, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (86, 'Upgradable attitude-oriented internet solution', '1938-03-21', 98, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (87, 'Right-sized grid-enabled portal', '1971-08-25', 84, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (88, 'Automated solution-oriented collaboration', '1968-03-22', 33, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (89, 'Organic context-sensitive monitoring', '1987-08-11', 24, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (90, 'Re-contextualized dynamic hierarchy', '1957-06-14', 20, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (91, 'Expanded optimal database', '2011-10-20', 51, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (92, 'Fundamental grid-enabled system engine', '2002-01-09', 81, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (93, 'Virtual zero defect superstructure', '1959-10-20', 37, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (94, 'Compatible asynchronous task-force', '2018-02-07', 49, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (95, 'Reduced needs-based attitude', '1997-06-26', 52, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (96, 'Persistent asynchronous process improvement', '1990-07-16', 84, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (97, 'Seamless uniform neural-net', '1978-08-25', 55, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (98, 'Cross-group static productivity', '1944-11-07', 19, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (99, 'Centralized web-enabled intranet', '1987-10-17', 55, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (100, 'Reactive logistical Graphical User Interface', '2001-06-26', 4, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (101, 'Versatile logistical website', '1927-05-01', 23, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (102, 'User-centric directional moratorium', '1955-09-28', 75, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (103, 'Robust needs-based utilisation', '1983-01-13', 49, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (104, 'Operative eco-centric monitoring', '1971-12-12', 67, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (105, 'Team-oriented fresh-thinking leverage', '2010-04-12', 32, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (106, 'Public-key asymmetric intranet', '1930-01-23', 70, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (107, 'Innovative reciprocal solution', '1949-07-22', 2, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (108, 'Profit-focused tangible open architecture', '2001-04-22', 35, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (109, 'Focused fault-tolerant local area network', '1967-01-04', 71, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (110, 'Networked global project', '1922-07-18', 74, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (111, 'Operative multi-tasking data-warehouse', '2000-10-15', 13, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (112, 'Streamlined analyzing knowledge base', '1942-12-16', 61, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (113, 'Secured fresh-thinking archive', '1986-08-18', 61, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (114, 'Upgradable methodical ability', '1940-10-13', 36, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (115, 'Public-key coherent time-frame', '1993-09-30', 50, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (116, 'Right-sized composite groupware', '1927-05-25', 78, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (117, 'Open-source empowering contingency', '1970-06-24', 37, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (118, 'Operative national productivity', '1954-09-24', 18, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (119, 'Organized 24/7 paradigm', '2007-09-26', 82, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (120, 'Compatible high-level toolset', '2010-07-08', 50, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (121, 'Open-source real-time artificial intelligence', '1998-08-12', 92, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (122, 'Self-enabling dedicated monitoring', '1964-01-01', 26, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (123, 'Sharable 24/7 knowledge user', '1968-11-13', 23, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (124, 'Organized dedicated process improvement', '1958-12-13', 36, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (125, 'Ergonomic logistical collaboration', '1963-10-03', 43, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (126, 'Automated secondary array', '1953-07-07', 38, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (127, 'Switchable national hierarchy', '1927-07-14', 77, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (128, 'Seamless stable firmware', '1993-10-23', 40, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (129, 'User-centric full-range approach', '1965-02-17', 50, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (130, 'Universal bandwidth-monitored collaboration', '1965-01-22', 76, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (131, 'Up-sized user-facing frame', '2007-12-04', 91, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (132, 'Multi-layered bandwidth-monitored open system', '1952-11-07', 55, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (133, 'Persevering reciprocal info-mediaries', '2015-11-23', 89, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (134, 'Organic bottom-line knowledge user', '2004-05-05', 6, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (135, 'Decentralized homogeneous knowledge base', '1970-03-25', 48, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (136, 'Organized clear-thinking success', '1944-02-18', 24, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (137, 'Proactive dynamic system engine', '2016-11-21', 82, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (138, 'Cross-platform zero tolerance system engine', '1967-09-29', 39, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (139, 'Virtual maximized emulation', '1943-12-05', 4, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (140, 'Streamlined web-enabled middleware', '1975-11-07', 93, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (141, 'Robust multi-state artificial intelligence', '1984-01-14', 14, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (142, 'Phased national leverage', '2016-12-01', 75, 13);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (143, 'Secured foreground flexibility', '1934-11-02', 96, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (144, 'Reactive directional forecast', '1977-01-04', 37, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (145, 'Triple-buffered zero administration task-force', '2010-11-29', 32, 6);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (146, 'Extended system-worthy service-desk', '1989-01-29', 33, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (147, 'Polarised bandwidth-monitored groupware', '2007-05-08', 100, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (148, 'Cloned fault-tolerant core', '1934-08-31', 8, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (149, 'Configurable transitional function', '2021-11-13', 40, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (150, 'Customer-focused asynchronous circuit', '2015-12-22', 75, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (151, 'Quality-focused mission-critical standardization', '1940-07-03', 97, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (152, 'Phased actuating Graphic Interface', '2011-03-31', 75, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (153, 'Down-sized dynamic collaboration', '1951-02-05', 76, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (154, 'Front-line 24 hour groupware', '1962-05-02', 98, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (155, 'Seamless system-worthy attitude', '1986-04-11', 42, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (156, 'Exclusive solution-oriented framework', '1949-09-10', 38, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (157, 'Persistent discrete open system', '1926-10-30', 44, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (158, 'Down-sized dedicated infrastructure', '1947-08-29', 13, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (159, 'Robust clear-thinking info-mediaries', '1956-12-27', 70, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (160, 'Open-architected empowering orchestration', '2005-01-22', 98, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (161, 'Self-enabling leading edge framework', '1990-02-28', 96, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (162, 'Integrated needs-based attitude', '1997-03-03', 35, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (163, 'Monitored value-added ability', '1955-02-11', 30, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (164, 'Synchronised user-facing knowledge base', '1999-01-27', 26, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (165, 'Customizable intermediate forecast', '1946-03-18', 14, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (166, 'Organic clear-thinking concept', '1958-11-11', 76, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (167, 'Organic empowering firmware', '1993-09-25', 28, 15);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (168, 'Adaptive non-volatile moderator', '1941-01-10', 71, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (169, 'Customer-focused coherent portal', '1992-06-13', 11, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (170, 'Synchronised intermediate projection', '1940-07-31', 73, 8);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (171, 'Intuitive multi-state approach', '2007-10-02', 20, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (172, 'Public-key dynamic toolset', '1937-01-09', 95, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (173, 'Polarised clear-thinking pricing structure', '1947-04-08', 36, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (174, 'Digitized high-level time-frame', '2004-09-27', 91, 10);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (175, 'Switchable multi-tasking application', '1974-06-26', 14, 2);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (176, 'Vision-oriented interactive toolset', '1983-03-21', 66, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (177, 'Advanced leading edge groupware', '2011-09-12', 58, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (178, 'Customizable impactful frame', '1985-04-09', 74, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (179, 'Multi-tiered background policy', '2006-06-26', 51, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (180, 'Decentralized content-based hardware', '1923-04-08', 59, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (181, 'Digitized discrete instruction set', '1930-12-30', 8, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (182, 'Realigned upward-trending protocol', '1945-09-29', 100, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (183, 'Assimilated demand-driven complexity', '1928-11-16', 41, 17);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (184, 'Networked empowering focus group', '1965-12-16', 62, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (185, 'Optional homogeneous capability', '1955-11-21', 96, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (186, 'Team-oriented 24/7 benchmark', '1922-02-17', 64, 16);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (187, 'Optional optimal parallelism', '2017-02-15', 38, 4);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (188, 'Ameliorated hybrid benchmark', '2019-03-08', 81, 7);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (189, 'Programmable static knowledge base', '1976-12-21', 13, 5);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (190, 'Cloned hybrid orchestration', '1997-08-22', 96, 9);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (191, 'Profound eco-centric framework', '2020-08-09', 84, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (192, 'Function-based regional ability', '1942-08-08', 45, 11);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (193, 'Integrated optimizing workforce', '1959-04-25', 29, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (194, 'Up-sized static encoding', '2001-02-02', 70, 14);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (195, 'Multi-channelled multi-tasking website', '1923-08-09', 88, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (196, 'Reactive leading edge standardization', '1974-02-14', 28, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (197, 'Enterprise-wide 6th generation database', '1956-12-07', 62, 1);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (198, 'Robust grid-enabled capacity', '1971-05-10', 65, 3);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (199, 'Triple-buffered asymmetric toolset', '2006-04-08', 73, 12);
insert into ResearchPapers (ResearchPaperId, Title, PublishedAt, NumberOfCitations, ProjectId) values (200, 'Adaptive upward-trending infrastructure', '1951-11-13', 77, 10);






