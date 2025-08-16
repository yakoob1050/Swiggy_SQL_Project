/*
08_Advanced_Queries.sql

Description:
This SQL script contains advanced queries using CTEs (Common Table Expressions) 
and window functions on the Swiggy_Data table.

Key Concepts Covered:
1. CTE (Common Table Expression) – Temporary named result sets that simplify 
   complex queries, improve readability, and allow reuse within a query.
2. Window Functions – Perform calculations across a set of table rows related 
   to the current row, without collapsing rows. Useful for ranking, running totals,
   moving averages, and analytics.

Examples included:
- Ranking restaurants by rating per city (RANK, DENSE_RANK, ROW_NUMBER)
- Cumulative totals of ratings per city
- Moving averages of restaurant ratings
- Filtering top restaurants per city using CTEs
- Comparing individual restaurant performance against city averages

These queries are designed for data analysis, business intelligence reporting,
and to demonstrate advanced SQL skills often tested in interviews.
*/


--1. CTE – Top 5 highest-rated restaurants
WITH TopRated AS (
    SELECT Restaurant, City, TRY_CAST(Avg_Ratings AS FLOAT) AS Rating
    FROM Swiggy_Data
)
SELECT TOP 5 *
FROM TopRated
ORDER BY Rating DESC;

--2. CTE with aggregate – Average price per city
WITH CityAvg AS (
    SELECT City, AVG(TRY_CAST(Price AS FLOAT)) AS Avg_Price
    FROM Swiggy_Data
    GROUP BY City
)
SELECT *
FROM CityAvg
WHERE Avg_Price > 200;  -- Example filter

--3. Window Function – Rank restaurants by rating per city
SELECT Restaurant, City, TRY_CAST(Avg_Ratings AS FLOAT) AS Rating,
       RANK() OVER (PARTITION BY City ORDER BY TRY_CAST(Avg_Ratings AS FLOAT) DESC) AS Rank_In_City
FROM Swiggy_Data;

--4. Window Function – Dense rank by total ratings per city
SELECT Restaurant, City, TRY_CAST(Total_Ratings AS INT) AS Ratings,
       DENSE_RANK() OVER (PARTITION BY City ORDER BY TRY_CAST(Total_Ratings AS INT) DESC) AS DenseRank_In_City
FROM Swiggy_Data;

5. Window Function – Cumulative total ratings per city
SELECT City, Restaurant, TRY_CAST(Total_Ratings AS INT) AS Total_Ratings,
       SUM(TRY_CAST(Total_Ratings AS INT)) OVER (PARTITION BY City ORDER BY Restaurant) AS Cumulative_Ratings
FROM Swiggy_Data;

--6. Window Function – Moving average of ratings per restaurant
SELECT Restaurant, City, TRY_CAST(Avg_Ratings AS FLOAT) AS Rating,
       AVG(TRY_CAST(Avg_Ratings AS FLOAT)) OVER (PARTITION BY City ORDER BY Restaurant ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Avg_Rating
FROM Swiggy_Data;

--7. CTE + Window Function – Top restaurant in each city
WITH Ranked AS (
    SELECT Restaurant, City, TRY_CAST(Avg_Ratings AS FLOAT) AS Rating,
           ROW_NUMBER() OVER (PARTITION BY City ORDER BY TRY_CAST(Avg_Ratings AS FLOAT) DESC) AS RowNum
    FROM Swiggy_Data
)
SELECT Restaurant, City, Rating
FROM Ranked
WHERE RowNum = 1;

--8. CTE – Restaurants with above-average rating per city
WITH CityAvg AS (
    SELECT City, AVG(TRY_CAST(Avg_Ratings AS FLOAT)) AS Avg_Rating
    FROM Swiggy_Data
    GROUP BY City
)
SELECT s.Restaurant, s.City, TRY_CAST(s.Avg_Ratings AS FLOAT) AS Rating
FROM Swiggy_Data s
JOIN CityAvg c
    ON s.City = c.City
WHERE TRY_CAST(s.Avg_Ratings AS FLOAT) > c.Avg_Rating;