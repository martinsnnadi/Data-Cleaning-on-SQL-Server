
 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville                 




-- View Selected column in the table

SELECT ParcelID, PropertyAddress, OwnerName,          
SaleDate, OwnerAddress, SoldAsVacant 
FROM [w3school].[dbo].[Nashville] 




SELECT * FROM w3school.dbo.Nashville 
WHERE OwnerAddress is NULL



-- Here i converted and viewed the SaleDate Column which is in a Date/Time Format to Date format

SELECT CONVERT(DATE, SaleDate) AS SaleDateOnly        
FROM w3school.dbo.Nashville




--i created a new column called SaleDateOnly where i will populate the new Date.

ALTER TABLE w3school.dbo.Nashville                    
ADD SaleDateOnly DATE;




-- Here i populaed the newly created SaleDateOnly with the Date

UPDATE w3school.dbo.Nashville             
SET SaleDateOnly = CONVERT(DATE, SaleDate)



 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    




--Checking which PropertyAddress Column is Null	

SELECT * FROM w3school.dbo.Nashville				   		
WHERE ParcelID is not NULL 
AND PropertyAddress is NULL


/*
So here i populated PropertyAddress column that have NULL values
with PropertyAddress from other rows that are not NULL and 
have the same PropertyAddress, Note: All PropertyAddress 
with the same ParcelID all have the same PropertyAddress
*/

UPDATE p1											  
SET p1.PropertyAddress = p2.PropertyAddress
FROM w3school.dbo.Nashville p1
JOIN w3school.dbo.Nashville p2 ON 
p1.ParcelID = p2.ParcelID
WHERE p1.PropertyAddress IS NULL 
AND p2.PropertyAddress IS NOT NULL;



 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    



--This is where i seperated City from the PropertyAddress using comma as delimeter

SELECT 
    SUBSTRING(PropertyAddress, 1, 
	CHARINDEX(',', PropertyAddress) - 1) 
	AS PropertyAddressOnly,
    SUBSTRING(PropertyAddress, 
	CHARINDEX(',', PropertyAddress) + 1, 
	LEN(PropertyAddress)) AS PropertyCity
FROM 
    w3school.dbo.Nashville



/*
I created two new Column named PropertyAddressOnly and Property
City where i will populate the data from the previous step
*/

ALTER TABLE w3school.dbo.Nashville                    
ADD PropertyAddressOnly varchar(255), PropertyCity varchar(255);


 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    



/*
Now i will populate the seperated PropertyAddress column 
into the two new column i just created
*/

UPDATE w3school.dbo.Nashville             
SET PropertyAddressOnly = SUBSTRING(PropertyAddress, 1, 
	CHARINDEX(',', PropertyAddress) - 1), 
	PropertyCity = SUBSTRING(PropertyAddress, 
	CHARINDEX(',', PropertyAddress) + 1, 
	LEN(PropertyAddress))
WHERE 
    PropertyAddress is not NULL


 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    



/*
Here i am repeating what i did with the PropertyAddress
column on the OwnerAddress column, i will be seperating 
it into three part using comma as delimeter
*/

SELECT 
    SUBSTRING(OwnerAddress, 1, 
		CHARINDEX(',', OwnerAddress) - 1) AS 
OwnerAddressOnly,
	SUBSTRING(OwnerAddress,
		CHARINDEX(',', OwnerAddress) + 1, 
		CHARINDEX(',', OwnerAddress, 
		CHARINDEX(',', OwnerAddress) + 1) - 
		CHARINDEX(',', OwnerAddress) - 1)  AS 
OwnerCity,
	SUBSTRING(OwnerAddress, 
		CHARINDEX(',', OwnerAddress, 
		CHARINDEX(',', OwnerAddress) + 1) + 1, 
	LEN(OwnerAddress)) AS OwnerState
FROM 
    w3school.dbo.Nashville



/*
I created three new Column named OwnerAddressOnly, OwnerCity and OwnerState
where i will populate the data from the previous step
*/

ALTER TABLE w3school.dbo.Nashville                    
ADD OwnerAddressOnly varchar(255), OwnerCity varchar(255), OwnerState varchar(255);


 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    



/*
Now i will populate the seperated OwnerAddress column 
into the three new column i just created
*/

UPDATE w3school.dbo.Nashville             
SET OwnerAddressOnly = SUBSTRING(OwnerAddress, 1, 
		CHARINDEX(',', OwnerAddress) - 1), 
	OwnerCity = SUBSTRING(OwnerAddress,
		CHARINDEX(',', OwnerAddress) + 1, 
		CHARINDEX(',', OwnerAddress, 
		CHARINDEX(',', OwnerAddress) + 1) - 
		CHARINDEX(',', OwnerAddress) - 1),
	OwnerState = SUBSTRING(OwnerAddress, 
		CHARINDEX(',', OwnerAddress, 
		CHARINDEX(',', OwnerAddress) + 1) + 1, 
	LEN(OwnerAddress))
WHERE 
    PropertyAddress is not NULL



 -- View the entire Table

SELECT * FROM w3school.dbo.Nashville    




/*
here i wanted to see the number of items in the SoldAsVacant 
column that is N instead of No and Y instead of Yes
*/

SELECT SoldAsVacant, COUNT([UniqueID ]) FROM w3school.dbo.Nashville
WHERE SoldAsVacant IN ('N','Y','YES','NO')
GROUP BY SoldAsVacant




/*
I updated items in the SoldAsVacant column that 
is N instead of No and Y instead of Yes
*/

UPDATE w3school.dbo.Nashville
SET SoldAsVacant = CASE 
    WHEN SoldAsVacant = 'N' THEN 'No'
    WHEN SoldAsVacant = 'Y' THEN 'Yes'
    ELSE SoldAsVacant
END
WHERE SoldAsVacant IN ('N', 'Y');


SELECT SoldAsVacant, COUNT([UniqueID ]) FROM w3school.dbo.Nashville
WHERE SoldAsVacant IN ('N','Y','YES','NO')
GROUP BY SoldAsVacant



-- View the entire Table

SELECT * FROM w3school.dbo.Nashville    