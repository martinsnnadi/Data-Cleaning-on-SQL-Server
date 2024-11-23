# Data-Cleaning-on-SQL-Server
This is a data cleaning task for the Nashville Housing Data. In this project, I will clean up the data using SQL Server to the best of my ability.
I will import the data in Excel format (Nashville Housing Data for Data Cleaning.xlsx) into SQL Server using the Import and Export Wizard in SSMS.
I will rename the database table to dbo.Nashville for simplicity. After loading the data, I will perform the following cleanup tasks.

•	Convert the SaleDate column from DateTime to Date format. The existing data looks like 2013-04-09 00:00:00.000. I will create a new column called SaleDateOnly.

•	Some PropertyAddress values are NULL and can be populated with data from other rows with the same ParcelID that have valid PropertyAddress values.

•	Remove rows that have no ownerName and address.

•	Split the PropertyAddress column into PropertyAddress and PropertyCity.

•	Split the OwnerAddress column into OwnerAddressOnly, OwnerCity, and OwnerState.

•	The SoldAsVacant column has values ‘No’, ‘N’, ‘Yes’, and ‘Y’. I will update all ‘N’ to ‘No’ and all ‘Y’ to ‘Yes’.

