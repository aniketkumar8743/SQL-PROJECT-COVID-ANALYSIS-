create table covid(
Province TEXT,
Country_Region TEXT,
Latitude FLOAT,
Longitude FLOAT,
Date DATE,
Confirmed INTEGER,
Deaths INTEGER,
Recovered INTEGER
);

select * from covid


-- Q1. Write a code to check NULL values


SELECT 
    *
FROM
    covid
WHERE
    Province IS NULL
        OR Country_Region IS NULL
        OR Latitude IS NULL
        OR Longitude IS NULL
        OR Date IS NULL
        OR Confirmed IS NULL
        OR Deaths IS NULL
        OR Recovered IS NULL;



-- Q2. If NULL values are present, update them with zeros for all columns

UPDATE covid 
SET 
    Confirmed = COALESCE(Confirmed, 0),
    Deaths = COALESCE(Deaths, 0),
    Recovered = COALESCE(Recovered, 0)
WHERE
    Confirmed IS NULL AND DEATHS IS NULL
        AND Recovered IS NULL;



-- Q4. Check what is start_date and end_date

SELECT 
    MIN(Date) AS start_date, MAX(Date) AS end_date
FROM
    covid;


-- Q3. check total number of rows

SELECT 
    COUNT(*) AS total_rows
FROM
    covid



-- Q5. Number of month present in dataset

SELECT 
    EXTRACT(MONTH FROM date) AS Month, COUNT(*) AS Num_of_months
FROM
    covid
GROUP BY EXTRACT(MONTH FROM Date)
ORDER BY EXTRACT(MONTH FROM Date);



-- Q6. Find monthly average for confirmed, deaths, recovered

SELECT 
    EXTRACT(MONTH FROM date) AS Month,
    EXTRACT(YEAR FROM date) AS Year,
    ROUND(AVG(confirmed), 3) AS AVG_confirmed,
    ROUND(AVG(Deaths), 3) AS AVG_deaths,
    ROUND(AVG(recovered), 3) AS AVG_Recovered
FROM
    covid
GROUP BY EXTRACT(YEAR FROM date) , EXTRACT(MONTH FROM date)
ORDER BY EXTRACT(YEAR FROM date) , EXTRACT(MONTH FROM date)




-- Q7. Find most frequent value for confirmed, deaths, recovered each month 

WITH AggregatedData As (
  Select 
    extract(Year from date) As Year,
    extract(Month from date) as Month,
    GROUP_CONCAT(Confirmed ORDER BY Confirmed DESC SEPARATOR ',') AS AggConfirmed,
    GROUP_CONCAT(Deaths ORDER BY Deaths DESC SEPARATOR ',') AS AggDeaths,
    GROUP_CONCAT(Recovered ORDER BY Recovered DESC SEPARATOR ',') AS AggRecovered
  From Covid
  group by Year,Month
)
Select Year,Month,
  SUBSTRING_INDEX(AggConfirmed,',',1) AS MostFrequentConfirmed,
  SUBSTRING_INDEX(AggDeaths,',',1) AS MostFrequentDeaths,
  SUBSTRING_INDEX(AggRecovered,',',1) AS MostFrequentRecovered
From AggregatedData
Order by Year, Month;



-- Q8. Find minimum values for confirmed, deaths, recovered per year

SELECT 
    EXTRACT(YEAR FROM DATE) AS YEAR,
    MIN(Confirmed) AS Min_confirmed,
    MIN(deaths) AS Min_deaths,
    MIN(recovered) AS Min_recovered
FROM
    covid
GROUP BY EXTRACT(YEAR FROM DATE)
ORDER BY year;



-- Q9. Find maximum values of confirmed, deaths, recovered per year

select 
extract(Year from date) as Year,
MAX(confirmed) as Max_confirmed,
MAX(deaths) as Max_deaths,
MAX(recovered) as Max_recovered
from 
covid
group by 
extract(Year from Date)
order by 
year;



-- Q10. The total number of case of confirmed, deaths, recovered each month

select 
extract(year from date) as Year,
extract(Month from date) as Month,
sum(confirmed) as Total_confirmed,
sum(deaths) as Total_deaths,
sum(recovered) as Total_recovered
from
covid
group by 
extract(Month from date),
extract(year from date) 
order by
Year,
Month;



-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

select 
sum(Confirmed) as total_Confirmed,
Round(avg(Confirmed),3) as Avg_Confirmed,
variance(Confirmed) as Var_Confirmed,
stddev(Confirmed) as Std_Confirmed
from
covid



-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

select 
extract(month from date) as Month,
sum(Confirmed) as Total_confirmed,
Round(avg(Confirmed),2) as Avg_Confirmed,
Round(variance(Confirmed),2) as Var_Confirmed,
Round(stddev(Confirmed),2) as Std_Confirmed
From
covid
group by
extract(month from date)
order by 
Month;



-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

select 
sum(Confirmed) as Total_Confirmed,
Round(avg(Confirmed),2) as Avg_Confirmed,
variance(Confirmed) as Var_Confirmed,
stddev(Confirmed) as std_confirmed
from 
covid 



-- Q14. Find Country having highest number of the Confirmed case

select 
Country_Region,
sum(Confirmed) as Total_confirmed
FROM
Covid
Group By
Country_Region
Order by
Total_confirmed DESC
LIMIT 5;



-- Q15. Find Country having lowest number of the death case

Select 
Country_Region,
Min(Deaths) as Min_Death
From
covid
group by Country_Region 
order by
MIN_Death DESC
limit 5;



-- Q16. Find top 5 countries having highest recovered case

select 
Country_Region,
sum(Recovered) as Highest_Recovered
FROM
covid
group by
Country_region
order by
Highest_Recovered DESC
limit 5;


