# SQL Project: COVID-19 Data Analysis 📊
This repository contains an Exploratory Data Analysis (EDA) of a COVID-19 dataset using SQL. The project answers 16 key business questions by querying and analyzing the dataset, providing insights into the spread, recovery, and impact of the pandemic globally.

## 📖 Overview
The COVID-19 pandemic has affected every corner of the world. This project uses SQL to analyze a dataset containing information about confirmed cases, deaths, recoveries, and their distribution across regions and time. The analysis focuses on identifying trends, key metrics, and insights about how the pandemic unfolded globally.

## 🎯 Project Goals
The main objectives of this project are:

To analyze COVID-19 data using SQL queries to derive meaningful insights.
To address 16 specific questions related to the dataset, including missing data handling, statistical analysis, and trend identification.
To provide visualizable insights into the spread, deaths, and recovery trends across countries and time.
## 📂 Dataset
Schema
The dataset is stored in a table named covid with the following structure:

sql
Copy code
CREATE TABLE covid (  
    Province TEXT,  
    Country_Region TEXT,  
    Latitude FLOAT,  
    Longitude FLOAT,  
    Date DATE,  
    Confirmed INTEGER,  
    Deaths INTEGER,  
    Recovered INTEGER  
);  
Columns
Province: Administrative region/state within a country.
Country_Region: The name of the country or region.
Latitude/Longitude: Geographic coordinates.
Date: Reporting date for the data.
Confirmed: Number of confirmed cases.
Deaths: Number of deaths.
Recovered: Number of recoveries.
## 🔍 Analysis & Insights
Below is a summary of the questions addressed in this project and the insights derived:

1. Handling Missing Values
Checked for NULL values in the dataset.
Updated missing values in numerical columns with zeros using the COALESCE function.
2. Dataset Metrics
Total number of rows in the dataset.
Start and end dates of the dataset.
3. Monthly and Yearly Analysis
Number of months present in the dataset.
Monthly averages for confirmed, deaths, and recovered cases.
Spread of confirmed cases, deaths, and recoveries (mean, variance, standard deviation) over time.
4. Key Metrics
Minimum and maximum confirmed cases, deaths, and recoveries by year.
Total confirmed cases, deaths, and recoveries each month.
5. Country-Specific Insights
Country with the highest confirmed cases.
Country with the lowest death cases.
Top 5 countries with the highest recovered cases.
6. Statistical Trends
Identified most frequent values for confirmed, deaths, and recoveries for each month.
## 🛠️ Installation
Prerequisites
A SQL database environment (e.g., MySQL, PostgreSQL, or SQLite).
COVID-19 dataset in the required table schema.
Steps to Set Up
Clone the Repository:

bash
Copy code
git clone https://github.com/yourusername/SQL-Project-COVID-Analysis.git  
cd SQL-Project-COVID-Analysis  
Import the Dataset:

Load the COVID-19 dataset into your SQL database.
Run Queries:

Execute the SQL queries provided in covid_analysis.sql to analyze the dataset.
## 🧑‍💻 Usage
Load the Dataset:
Import the dataset into your SQL database.

Run Queries:
Use the SQL queries provided in this repository to analyze the data and answer the 16 business questions.

Interpret Results:
Derive insights from the output of each query to understand the spread, recovery, and impact of COVID-19.

## 📊 Results
Key Findings
Start and End Dates:

The dataset spans from the earliest recorded date to the latest date available.
Top 5 Countries:

Highest Confirmed Cases: [Country Names].
Lowest Deaths: [Country Names].
Highest Recoveries: [Country Names].
Monthly Trends:

Months with the highest confirmed cases, deaths, and recoveries.
Statistical trends in confirmed cases, deaths, and recoveries (mean, variance, standard deviation).
## 🏆 Conclusion
This project provides a detailed SQL-based analysis of COVID-19 data, offering critical insights into the pandemic's impact. By addressing 16 specific business questions, it highlights trends, key metrics, and statistical insights that can help researchers and policymakers better understand the global impact of the virus.

## 🤝 Contributing
Contributions are welcome! If you have suggestions or additional queries to enhance this analysis
