-- CREATE THE DATABASE --


CREATE DATABASE MarketingDB;

USE MarketingDB;


-- ●	Which campaign generated the highest number of impressions, clicks, and conversions?

SELECT Campaign,==========================================================================

--	What is the average cost-per-click (CPC)  and click-through rate (CTR) for each campaign?

SELECT Campaign,
avg(Daily_Average_CPC) as AverageCPC,
avg(CTR) as AverageCTR
FROM Marketing_Data
GROUP BY Campaign;

-- ●	Which channel has the highest ROI?


SELECT Top 1 Channel,
sum(Total_conversion_value_GBP) as total_revenue,
sum(Spend_GBP) as total_amount_spend,
(sum(Total_conversion_value_GBP) - sum(Spend_GBP)) / sum(Spend_GBP) as ROI
FROM Marketing_Data
GROUP BY Channel


-- ●	How do impressions, clicks, and conversions vary across different  channels?


SELECT Channel, Impressions, clicks, conversions
FROM Marketing_Data


--●	Which cities have the highest engagement rates (likes, shares, comments)?


SELECT TOP 1 City_Location,
sum(Likes_Reactions),
sum(Shares), 
sum(Comments)
FROM Marketing_Data
GROUP BY City_Location


--●	What is the conversion rate by city?

SELECT City_Location, Conversions
FROM Marketing_Data


--●	How do ad performances compare across different devices (mobile, desktop, tablet)?
SELECT Ad, Device
FROM Marketing_Data


--●	Which device type generates the highest conversion rates?
SELECT TOP 1 Device,
sum(Conversions) as Top_Device
FROM Marketing_Data
GROUP BY Device


--●	Which specific ads are performing best in terms of engagement and conversions?
SELECT TOP 1 AD,
sum(Likes_Reactions) as total_likes,
sum(Shares) as total_shares,
sum(Comments) as total_comments,
sum(Conversions) as total_Conversions
FROM Marketing_Data
GROUP BY AD

-- ●	What are the common characteristics of high-performing ads?
SELECT Ad,
AVG(Clicks) as Average_Clicks,
(avg(likes_reactions) + avg(Shares) + avg(Comments)) as Average_engagement,
(sum(Conversions) / cast(sum(clicks) as float)) as conversion_rate,
(sum(Total_conversion_value_GBP) - SUM(Spend_GBP)) / SUM(Spend_GBP) * 100 AS ROI
FROM Marketing_Data
GROUP BY Ad; 


--●	What is the ROI for each campaign, and how does it compare across different channels and devices?
SELECT TOP 3 Campaign,
max(Channel) as Top_Channel, 
max(Device)  as Top_Device,
(sum(Total_conversion_value_GBP) - SUM(Spend_GBP)) / SUM(Spend_GBP) * 100 AS ROI
FROM Marketing_Data
GROUP BY Campaign;

-- ●	How does spend correlate with conversion value across different campaigns?
SELECT TOP 3 Campaign,
sum(Spend_GBP) as total_Spend,
sum(Conversions) as total_Conversions
FROM Marketing_Data
GROUP BY Campaign


