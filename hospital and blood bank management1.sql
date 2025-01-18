create database project4;
use project4;
-- 1. Create the BloodBanks table
CREATE TABLE BloodBanks (
    Sr_No INT PRIMARY KEY,
    BloodBankName VARCHAR(255),
    State VARCHAR(100),
    District VARCHAR(100),
    City VARCHAR(100),
    Address VARCHAR(255),
    Pincode VARCHAR(10)
);

-- 2. Create the Hospitals table
CREATE TABLE Hospitals (
    ProviderID INT PRIMARY KEY,
    HospitalName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZIPCode VARCHAR(10),
    CountyName VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- 3. Insert sample data into BloodBanks table
INSERT INTO BloodBanks (Sr_No, BloodBankName, State, District, City, Address, Pincode)
VALUES
(1, 'G.B. Pant Hospital Blood bank', 'Andaman And Nicobar Islands', 'SOUTH ANDAMAN', 'Port Blair', 'Atlanta Point, Near Cellular Jail', '744104'),
(2, 'I.N.H.S. Dhanvantri', 'Andaman And Nicobar Islands', 'SOUTH ANDAMAN', 'Port Blair', 'Ashvini Nagar, Port Blair', '744103'),
(3, 'Pillar Health Centre Blood Bank', 'Andaman And Nicobar Islands', 'SOUTH ANDAMAN', 'Port Blair', 'Lamba Line, P.O. Junglighat', '744104'),
(4, 'Indian Red Cross Society Blood Bank', 'Andhra Pradesh', 'ANANTAPUR', 'Anantapur', 'Near JNTU Engineering College, Sarada Nagar', '515002'),
(5, 'Government General Hospital Blood Bank', 'Andhra Pradesh', 'ANANTAPUR', 'Ananthapur', 'Government General Hospital, Ananthapur', '515001'),
(6, 'Apollo Blood Bank', 'Telangana', 'HYDERABAD', 'Hyderabad', 'Apollo Hospitals, Jubilee Hills', '500033'),
(7, 'Care Hospital Blood Bank', 'Telangana', 'HYDERABAD', 'Hyderabad', 'Care Hospitals, Banjara Hills', '500034'),
(8, 'Manipal Blood Bank', 'Karnataka', 'BANGALORE', 'Bangalore', 'Manipal Hospital, Old Airport Road', '560017'),
(9, 'NIMHANS Blood Bank', 'Karnataka', 'BANGALORE', 'Bangalore', 'NIMHANS, Hosur Road', '560029'),
(10, 'AIIMS Blood Bank', 'Delhi', 'NEW DELHI', 'New Delhi', 'AIIMS Campus, Ansari Nagar', '110029'),
(11, 'Red Cross Blood Bank', 'Kerala', 'THIRUVANANTHAPURAM', 'Trivandrum', 'Red Cross Road, Trivandrum', '695001'),
(12, 'Amrita Institute Blood Bank', 'Kerala', 'ERNAKULAM', 'Kochi', 'Ponekkara, AIMS Ponekkara', '682041'),
(13, 'Jubilee Mission Hospital Blood Bank', 'Kerala', 'THRISSUR', 'Thrissur', 'Jubilee Mission Medical College Campus', '680005'),
(14, 'Malabar Cancer Centre Blood Bank', 'Kerala', 'KANNUR', 'Thalassery', 'Kodiyeri, Thalassery', '670103'),
(15, 'CMC Vellore Blood Bank', 'Tamil Nadu', 'VELLORE', 'Vellore', 'CMC Campus, Vellore', '632004');

-- 4. Insert sample data into Hospitals table
INSERT INTO Hospitals (ProviderID, HospitalName, Address, City, State, ZIPCode, CountyName, PhoneNumber)
VALUES
(230100, 'TAWAS ST JOSEPH HOSPITAL', '200 HEMLOCK', 'TAWAS CITY', 'MI', '48764', 'IOSCO', '9893629301'),
(230121, 'MEMORIAL HEALTHCARE', '826 WEST KING STREET', 'OWOSSO', 'MI', '48867', 'SHIAWASSEE', '9897235211'),
(230118, 'HURON MEDICAL CENTER', '1100 SOUTH VAN DYKE ROAD', 'BAD AXE', 'MI', '48413', 'HURON', '9892699521'),
(230133, 'OTSEGO MEMORIAL HOSPITAL', '825 N CENTER AVE', 'GAYLORD', 'MI', '49735', 'OTSEGO', '9897312100'),
(230150, 'CLEVELAND CLINIC', '9500 EUCLID AVENUE', 'CLEVELAND', 'OH', '44195', 'CUYAHOGA', '2164442200'),
(230151, 'MAYO CLINIC', '200 FIRST ST SW', 'ROCHESTER', 'MN', '55905', 'OLMSTED', '5072842511'),
(230152, 'JOHNS HOPKINS HOSPITAL', '1800 ORLEANS STREET', 'BALTIMORE', 'MD', '21287', 'BALTIMORE CITY', '4109555000'),
(230153, 'MASSACHUSETTS GENERAL HOSPITAL', '55 FRUIT STREET', 'BOSTON', 'MA', '02114', 'SUFFOLK', '6177262000'),
(230154, 'UCLA MEDICAL CENTER', '757 WESTWOOD PLAZA', 'LOS ANGELES', 'CA', '90095', 'LOS ANGELES', '3108259111'),
(230155, 'STANFORD HOSPITAL', '300 PASTEUR DRIVE', 'STANFORD', 'CA', '94305', 'SANTA CLARA', '6507234000'),
(230156, 'FORTIS MEMORIAL RESEARCH INSTITUTE', 'Sector - 44, Opposite HUDA City Centre', 'Gurgaon', 'Haryana', '122002', 'GURGAON', '1247162200'),
(230157, 'NARAYANA HEALTH', 'NO.1, Near Bommassandra Industrial Area', 'Bangalore', 'Karnataka', '560099', 'BANGALORE URBAN', '8040026500'),
(230158, 'KIMS HOSPITAL', 'Anayara P.O.,', 'Trivandrum', 'Kerala', '695029', 'THIRUVANANTHAPURAM', '4713041000'),
(230159, 'APOLLO HOSPITAL', 'Plot No. 251, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', 'HYDERABAD', '4023621212'),
(230160, 'MAX HOSPITAL', '108A, IP Extension, Patparganj', 'Delhi', 'Delhi', '110092', 'NEW DELHI', '1122022222');

-- Advanced SQL Queries (25 New Codes)

-- 1. Retrieve the total number of blood banks in each district
SELECT District, COUNT(*) AS TotalBloodBanks
FROM BloodBanks
GROUP BY District;

-- 2. List hospitals that have "Clinic" in their name
SELECT * FROM Hospitals WHERE HospitalName LIKE '%Clinic%';

-- 3. Retrieve all blood banks with a Pincode starting with '6'
SELECT * FROM BloodBanks WHERE Pincode LIKE '6%';

-- 4. Find hospitals with a contact number ending in '00'
SELECT * FROM Hospitals WHERE PhoneNumber LIKE '%00';

-- 5. Identify blood banks and hospitals located in the same city
SELECT 
    bb.City, 
    COUNT(DISTINCT bb.BloodBankName) AS BloodBankCount,
    COUNT(DISTINCT h.HospitalName) AS HospitalCount
FROM BloodBanks bb
LEFT JOIN Hospitals h ON bb.City = h.City
GROUP BY bb.City;

-- 6. Retrieve the names of all hospitals in states that have more than 5 hospitals
SELECT State, HospitalName
FROM Hospitals
WHERE State IN (
    SELECT State
    FROM Hospitals
    GROUP BY State
    HAVING COUNT(*) > 5
);

-- 7. Find the city with the most hospitals
SELECT City, COUNT(*) AS TotalHospitals
FROM Hospitals
GROUP BY City
ORDER BY TotalHospitals DESC
LIMIT 1;

-- 8. Identify states with no blood banks
SELECT DISTINCT h.State
FROM Hospitals h
LEFT JOIN BloodBanks bb ON h.State = bb.State
WHERE bb.State IS NULL;

-- 9. Calculate the average number of blood banks per district
SELECT AVG(BloodBankCount) AS AvgBloodBanksPerDistrict
FROM (
    SELECT District, COUNT(*) AS BloodBankCount
    FROM BloodBanks
    GROUP BY District
) AS DistrictCounts;

-- 10. Add a constraint to ensure unique phone numbers in Hospitals table
ALTER TABLE Hospitals ADD CONSTRAINT unique_phone UNIQUE (PhoneNumber);

-- 11. Create a stored procedure to find blood banks in a given city
CREATE PROCEDURE GetBloodBanksByCity(IN cityName VARCHAR(100))
BEGIN
    SELECT * FROM BloodBanks WHERE City = cityName,
    END;

-- 12. Retrieve hospitals with a ZIP code between '50000' and '60000'
SELECT * FROM Hospitals WHERE ZIPCode BETWEEN '50000' AND '60000';

-- 13. Identify the top 5 cities with the most blood banks
SELECT City, COUNT(*) AS TotalBloodBanks
FROM BloodBanks
GROUP BY City
ORDER BY TotalBloodBanks DESC
LIMIT 5;

-- 14. Find duplicate hospital names in the Hospitals table
SELECT HospitalName, COUNT(*) AS DuplicateCount
FROM Hospitals
GROUP BY HospitalName
HAVING COUNT(*) > 1;

-- 15. Update the state name to uppercase in the BloodBanks table
UPDATE BloodBanks
SET State = UPPER(State);

-- 16. Create an index on the District column of the BloodBanks table
CREATE INDEX idx_district ON BloodBanks(District);

-- 17. Generate a report of blood banks and hospitals grouped by state and district
SELECT 
    bb.State, 
    bb.District, 
    COUNT(DISTINCT bb.BloodBankName) AS TotalBloodBanks,
    COUNT(DISTINCT h.HospitalName) AS TotalHospitals
FROM BloodBanks bb
LEFT JOIN Hospitals h ON bb.State = h.State AND bb.District = h.CountyName
GROUP BY bb.State, bb.District;

-- 18. Delete all hospitals in a specific city
DELETE FROM Hospitals WHERE City = 'Gurgaon';

-- 19. Create a trigger to log deletions from the Hospitals table
CREATE TRIGGER LogHospitalDeletion
AFTER DELETE ON Hospitals
FOR EACH ROW
BEGIN
    INSERT INTO HospitalDeletionLog (ProviderID, DeletedAt)
    VALUES (OLD.ProviderID, NOW());
END;

-- 20. Count the total number of entities (blood banks and hospitals) per state
SELECT State, SUM(EntityCount) AS TotalEntities
FROM (
    SELECT State, COUNT(*) AS EntityCount FROM BloodBanks GROUP BY State
    UNION ALL
    SELECT State, COUNT(*) AS EntityCount FROM Hospitals GROUP BY State
) AS StateEntities
GROUP BY State;

-- 21. Identify hospitals with no associated blood banks in the same city
SELECT *
FROM Hospitals h
WHERE NOT EXISTS (
    SELECT 1
    FROM BloodBanks bb
    WHERE bb.City = h.City
);

-- 22. Add a "LastInspected" column to the BloodBanks table
ALTER TABLE BloodBanks ADD LastInspected DATE;

-- 23. Update the "LastInspected" column for all blood banks in Karnataka
UPDATE BloodBanks
SET LastInspected = '2025-01-01'
WHERE State = 'Karnataka';

-- 24. Retrieve the name and address of hospitals and blood banks in Tamil Nadu
SELECT Name, Address
FROM (
    SELECT BloodBankName AS Name, Address FROM BloodBanks WHERE State = 'Tamil Nadu'
    UNION
    SELECT HospitalName AS Name, Address FROM Hospitals WHERE State = 'Tamil Nadu'
) AS Entities;

-- 25. Create a view to list all entities with their type (Blood Bank or Hospital)
CREATE VIEW EntityView AS
SELECT BloodBankName AS Name, 'Blood Bank' AS Type, Address, City, State FROM BloodBanks
UNION ALL
SELECT HospitalName AS Name, 'Hospital' AS Type, Address, City, State FROM Hospitals;
