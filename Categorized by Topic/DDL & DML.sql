--Provide SQL scripts for creating below tables Movie, Rating, Review.--
CREATE TABLE Movie (
    mID INT,
    mName VARCHAR(255),
    mYear INT,
    mLanguage VARCHAR(50),
    mRelDate DATE
);

CREATE TABLE Rating (
    mID INT,
    rID INT,
    rStars DECIMAL(3,1),
    noOfRatings INT
);

CREATE TABLE Review (
    revID INT,
    revName VARCHAR(255)
);


--Provide Insert scripts for adding below sample data into tables Movie, Rating, Review.--
INSERT INTO Movie (mID, mName, mYear, mLanguage, mRelDate) VALUES
(901, 'Vertigo', 1958, 'English', '1958-08-24'),
(902, 'The Innocents', 1961, 'English', '1962-02-19'),
(903, 'Lawrence of Arabia', 1962, 'English', '1962-12-11'),
(904, 'The Deer Hunter', 1978, 'English', '1979-03-08'),
(905, 'Amadeus', 1984, 'English', '1985-01-07'),
(906, 'Blade Runner', 1982, 'English', '1982-09-09'),
(907, 'Eyes Wide Shut', 1999, 'English', NULL),
(908, 'The Usual Suspects', 1995, 'English', '1995-08-25');

INSERT INTO Rating (mID, rID, rStars, noOfRatings) VALUES
(901, 9001, 8.4, 263575),
(902, 9002, 7.9, 20207),
(903, 9003, 8.3, 202778),
(906, 9005, 8.2, 484746),
(924, 9006, 7.3, NULL),
(908, 9007, 8.6, 779489);

INSERT INTO Review (revID, revName) VALUES
(9001, 'Righty Sock'),
(9002, 'Jack Malvern'),
(9003, 'Flagrant Baronessa'),
(9004, 'Alec Shaw'),
(9005, NULL),
(9006, 'Victor Woeltjen'),
(9007, 'Simon Wright');
