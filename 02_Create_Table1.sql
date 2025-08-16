/*==============================================================
    Script Name   : 02_Create_Table.sql
    Table Name    : Swiggy_Data
    Purpose       : To store Swiggy restaurant dataset for analysis
    Description   : Contains details such as restaurant name, 
                    location, price, ratings, food type, and delivery time
    Created On    : 13-Aug-2025
    Created By    : Shaik Yakoob Pasha
==============================================================*/


CREATE TABLE Swiggy_Data (
    ID NVARCHAR(50),
    Area NVARCHAR(255),
    City NVARCHAR(255),
    Restaurant NVARCHAR(255),
    Price NVARCHAR(50),
    Avg_Ratings NVARCHAR(50),
    Total_Ratings NVARCHAR(50),
    Food_Type NVARCHAR(255),
    Address NVARCHAR(MAX),
    Delivery_Time NVARCHAR(50)
);
