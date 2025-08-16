/*==============================================================
    Table Name   : Swiggy_Offers
    Purpose      : Stores promotional offers for restaurants
    Description  : Each record links a restaurant to a current offer.
                   Designed to be joined with the Swiggy_Data table 
                   using the Restaurant column to combine general 
                   restaurant details with special promotions.
    Created On   : 13-Aug-2025
    Created By   : Shaik Yakoob Pasha
==============================================================*/

-- Create second table for demo
CREATE TABLE Swiggy_Offers (
    Restaurant NVARCHAR(255),
    Offer_Description NVARCHAR(255)
);

-- Insert sample data
INSERT INTO Swiggy_Offers (Restaurant, Offer_Description)
VALUES
(N'Dominos Pizza', N'20% off on orders above ₹500'),
(N'KFC', N'Free drink with Chicken Bucket'),
(N'Café Coffee Day', N'Buy 1 Get 1 Free on Cappuccino'),
(N'Biryani House', N'Flat ₹100 off on first order'),
(N'Starbucks', N'Extra 50 loyalty points on purchase above ₹300')
;
