Create Table PET_OWNER (
OwnerID int NOT NULL,
OwnerLastName char(100) NOT NULL,
OwnerFirstName char(100) NOT NULL,
OwnerPhone char(100) NULL,
OwnerEmail nvarchar(100) NOT NULL,
constraint PET_OWNER_PK primary key (OwnerID)
);

INSERT INTO PET_OWNER
(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
VALUES (1, 'DOWNS', 'MARSHA', '555 537 8765', 'MARSHA.DOWNS@SOMEWHERE.COM');

INSERT INTO PET_OWNER
(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
VALUES (2, 'JAMES', 'RICHARD', '555 537 7654', 'RICHARD.JAMES@SOMEWHERE.COM');

INSERT INTO PET_OWNER
(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
VALUES (3, 'FRIER', 'LIZ', '555 537 6543', 'LIZ.FRIER@SOMEWHERE.COM');

INSERT INTO PET_OWNER
(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
VALUES (4, 'TRENT', 'MILES', NULL, 'MILES.TRENT@SOMEWHERE.COM');


CREATE TABLE BREED(
	BreedName			    Nvarchar		NOT NULL,
	MinWeight			    Float			NOT NULL,
	MaxWeight				Float			NOT NULL,
	AverageLifeExpentancy   Int				NOT NULL,
	CONSTRAINT				BREED_PK		PRIMARY KEY(BreedName)
	);

Create Table PET (
PetID int NOT NULL,
PetName char(100) NOT NULL,
PetType char(100) NOT NULL,
PetBreed char(100) NOT NULL,
PetDOB date NULL,
PetWeight float NOT NULL,
OwnerID int NOT NULl,
BreedName Nvarchar	NOT NULL
constraint PET_PK Primary key (PetID),
constraint P_PET_OWNER_FK FOREIGN KEY(OwnerID)
REFERENCES PET_OWNER(OwnerID)
ON DELETE NO ACTION,
constraint BREED_FK	FOREIGN KEY (BreedName)
REFERENCES BREED(BreedName)
ON DELETE NO ACTION
);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
values (1, 'KING', 'DOG', 'STD. POODLE', '2011-02-21', 25.5, 1);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (2, 'TEDDY', 'CAT', 'CASHMIRE', '2012-02-01', 10.5, 2);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (3, 'FIDO', 'DOG', 'STD. POODLE', '2010-07-17', 28.5, 1);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (4, 'AJ', 'DOG', 'COLLIE MIX', '2011-05-05', 20.0, 3);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (5, 'CEDRO', 'CAT', 'UNKNOWN', '2009-06-06', 9.5, 2);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (6, 'WOOLEY', 'CAT','UNKNOWN', NULL, 9.5, 2);

INSERT INTO PET
(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
VALUES (7, 'BUSTER', 'DOG', 'BORDER COLLIE', '2008-12-11', 25.0, 4); 

SELECT PetBreed
FROM PET;

SELECT COUNT(*) AS PetId
FROM PET;

SELECT OwnerLastName, OwnerFirstName, OwnerEmail 
FROM PET_OWNER
WHERE OwnerPhone IS NULL;

SELECT PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = 'DOG';

SELECT PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID
FROM PET;

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerEmail LIKE '%SOMEWHERE.COM';

SELECT PetBreed, PetType, PetDOB
FROM PET 
WHERE PetType = 'DOG'
AND PetBreed = 'STD. POODLE';

SELECT PetName, PetBreed, PetType
FROM PET
WHERE PetType <>'CAT'AND PetType<> 'DOG';

SELECT DISTINCT PetBreed
FROM PET;

SELECT PetBreed, PetType
FROM PET
ORDER BY PetType;

SELECT PetName, PetBreed
FROM PET
ORDER BY PetName;

SELECT PetBreed, COUNT(*) as PetBreed
FROM PET
GROUP BY PetBreed

SELECT MIN(PetWeight) AS MinimunDogWeight,
	   MAX(PetWeight) AS MaximunDogWeight,
       AVG(PetWeight) AS AverageDogWeight
FROM PET
WHERE PetType NOT LIKE 'CAT';

SELECT AVG(PetWeight) AveragePetWeightPerBreed
FROM PET
GROUP BY PetBreed 

SELECT PetBreed, AVG(PetWeight) AveragePetWeightPerBreed
FROM PET
GROUP BY PetBreed
HAVING COUNT (PetBreed)>=2

SELECT PetBreed, AVG(PetWeight) AveragePetWeightPerBreed
FROM PET
WHERE PetBreed NOT LIKE 'UN%'
GROUP BY PetBreed
HAVING COUNT (PetBreed)>=2

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN(
SELECT DISTINCT OwnerID
FROM PET
WHERE PetType='CAT')

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN(
SELECT DISTINCT OwnerID
FROM PET
WHERE PetType='CAT' AND PetName='TEDDY')



		







