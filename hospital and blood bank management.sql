create database project3;
use project3;
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

-- 5. Retrieve all blood banks in a specific state
SELECT * FROM BloodBanks WHERE State = 'Andaman And Nicobar Islands';

-- 6. Retrieve all hospitals in a specific city
SELECT * FROM Hospitals WHERE City = 'OWOSSO';

-- 7. Count the number of blood banks in each state
SELECT State, COUNT(*) AS BloodBankCount FROM BloodBanks GROUP BY State;

-- 8. Find hospitals with ZIP codes starting with '48'
SELECT * FROM Hospitals WHERE ZIPCode LIKE '48%';

-- 9. Retrieve the contact details of hospitals in a specific county
SELECT HospitalName, PhoneNumber FROM Hospitals WHERE CountyName = 'SHIAWASSEE';

-- 10. Join query to find blood banks and hospitals in the same city
SELECT 
    bb.BloodBankName, 
    bb.City AS CityName, 
    h.HospitalName
FROM BloodBanks bb
JOIN Hospitals h ON bb.City = h.City;

-- 11. Retrieve hospitals with "Memorial" in their name
SELECT * FROM Hospitals WHERE HospitalName LIKE '%Memorial%';

-- 12. List all distinct states from both tables
SELECT DISTINCT State FROM BloodBanks
UNION
SELECT DISTINCT State FROM Hospitals;

-- 13. Delete a blood bank by name
DELETE FROM BloodBanks WHERE BloodBankName = 'I.N.H.S. Dhanvantri';

-- 14. Update hospital phone number by ProviderID
UPDATE Hospitals
SET PhoneNumber = '9999999999'
WHERE ProviderID = 230100;

-- 15. Count total blood banks and hospitals
SELECT 'BloodBanks' AS Source, COUNT(*) AS TotalCount FROM BloodBanks
UNION ALL
SELECT 'Hospitals' AS Source, COUNT(*) AS TotalCount FROM Hospitals;

-- 16. Find the blood banks in districts starting with "A"
SELECT * FROM BloodBanks WHERE District LIKE 'A%';

-- 17. Retrieve hospitals sorted by ZIP code
SELECT * FROM Hospitals ORDER BY ZIPCode;

-- 18. Add a new column to BloodBanks for "Type"
ALTER TABLE BloodBanks ADD Type VARCHAR(50);

-- 19. Insert a new hospital
INSERT INTO Hospitals (ProviderID, HospitalName, Address, City, State, ZIPCode, CountyName, PhoneNumber)
VALUES (230140, 'NEW HOPE MEDICAL CENTER', '123 NEW STREET', 'NEW CITY', 'MI', '49000', 'NEW COUNTY', '9891112222');

-- 20. Retrieve blood banks where the address contains 'Hospital'
SELECT * FROM BloodBanks WHERE Address LIKE '%Hospital%';

-- 21. Calculate the percentage of blood banks in each state
SELECT 
    State, 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM BloodBanks) AS Percentage
FROM BloodBanks
GROUP BY State;

-- 22. Retrieve the top 3 cities with the most blood banks
SELECT 
    City, 
    COUNT(*) AS BloodBankCount
FROM BloodBanks
GROUP BY City
ORDER BY BloodBankCount DESC
LIMIT 3;

-- 23. Identify hospitals that share the same ZIP code
SELECT 
    ZIPCode, 
    COUNT(*) AS HospitalCount
FROM Hospitals
GROUP BY ZIPCode
HAVING COUNT(*) > 1;

-- 24. Combine blood bank and hospital data into a single view
CREATE VIEW CombinedData AS
SELECT 
    bb.BloodBankName AS Name, 
    bb.City, 
    bb.State, 
    bb.Address, 
    'BloodBank' AS Type
FROM BloodBanks bb
UNION
SELECT 
    h.HospitalName AS Name, 
    h.City, 
    h.State, 
    h.Address, 
    'Hospital' AS Type
FROM Hospitals h;

-- 25. Retrieve the total count of blood banks and hospitals per city
SELECT 
    City, 
    SUM(CASE WHEN Type = 'BloodBank' THEN 1 ELSE 0 END) AS BloodBankCount,
    SUM(CASE WHEN Type = 'Hospital' THEN 1 ELSE 0 END) AS HospitalCount
FROM CombinedData
GROUP BY City;

-- 26. Find the average number of hospitals per state
SELECT 
    State, 
    AVG(HospitalCount) AS AverageHospitals
FROM (
    SELECT State, COUNT(*) AS HospitalCount FROM Hospitals GROUP BY State
) AS StateHospitalCounts
GROUP BY State;

-- 27. Identify states with both blood banks and hospitals
SELECT DISTINCT bb.State
FROM BloodBanks bb
JOIN Hospitals h ON bb.State = h.State;

-- 28. Add a "LastUpdated" timestamp to the Hospitals table
ALTER TABLE Hospitals ADD LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 29. Find the latest updated hospital data
SELECT * FROM Hospitals ORDER BY LastUpdated DESC LIMIT 1;

-- 30. Generate a report of blood banks and hospitals grouped by state
SELECT 
    State, 
    COUNT(DISTINCT BloodBankName) AS TotalBloodBanks,
    COUNT(DISTINCT HospitalName) AS TotalHospitals
FROM (
    SELECT State, BloodBankName, NULL AS HospitalName FROM BloodBanks
    UNION ALL
    SELECT State, NULL AS BloodBankName, HospitalName FROM Hospitals
) AS StateEntities
GROUP BY State;

-- 31. Retrieve blood banks with a "Cancer" keyword in their name
SELECT * FROM BloodBanks WHERE BloodBankName LIKE '%Cancer%';

-- 32. Find hospitals located in counties ending with "URBAN"
SELECT * FROM Hospitals WHERE CountyName LIKE '%URBAN';

-- 33. Get the list of all hospitals and blood banks in a single city
SELECT DISTINCT City FROM CombinedData ORDER BY City;

-- 34. Add a "Capacity" column for hospitals and initialize data.
ALTER TABLE Hospitals ADD COLUMN Capacity INT DEFAULT 500;

-- 35. Update the "Capacity" of Hospitals matching a specific state.
UPDATE Hospitals SET Capacity = 1500 capacity specific city;
