/*==============================================================
    Script Name   : 03_Insert_Data.sql
    Purpose       : Bulk insert Swiggy dataset into Swiggy_Data table
    Description   : Loads 8,660 rows from swiggy.csv containing 
                    restaurant details for analysis
    Created On    : 13-Aug-2025
    Created By    : Shaik Yakoob Pasha
==============================================================*/

BULK INSERT Swiggy_Data
FROM 'C:\SwiggyData\swiggy.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
