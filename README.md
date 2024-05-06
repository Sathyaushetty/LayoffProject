# Layoff Analysis Project

## Table of Content
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Key Features of project](#key-features-of-project)
- [Conclusion](#conclusion)

### Project Overview
This project encompasses two key phases: Data Cleaning and Exploratory Data Analysis (EDA). The primary objective is to process and analyze a dataset regarding layoffs, aiming to derive valuable insights and enhance data quality.

### Data Sources
### Tools

### Key Features of project

### 1. Data Cleaning

#### Removing Duplicates
1. Create a staging table (layoffs_staging) based on the original table structure.
2. Insert data from the original table into the staging table.
3. Identify and remove duplicate rows based on specific columns using ROW_NUMBER() and a Common Table Expression (CTE).
4. Create another staging table (layoffs_staging2) with additional columns for further operations
5. Removes duplicate rows from layoffs_staging2.

#### Standardizing Data
1. Trim whitespace from the company column.
2. Standardize the industry column by replacing values that start with "Crypto" with just "Crypto".
3. Trim trailing periods from the country column for consistency.
4. Convert the date column from a text format ("%m/%d/%Y") to a date format.
5. Modify the date column's data type to date.

#### Handling Null Values or Blank Values
1. Identifies rows where certain columns (total_laid_off, percentage_laid_off, industry) are null or empty and makes necessary updates.
2. Handle specific cases like updating the industry based on company and location if it's null.
3. Delete rows where total_laid_off and percentage_laid_off are null simultaneously.

#### Removing Columns
1. Drop the row_num column from the layoffs_staging2 table.

### 2. Exploratory Data Analysis (EDA)

#### Maximum Values Analysis:
Finds the maximum values of total_laid_off and percentage_laid_off in the dataset. This helps identify the most significant layoffs in terms of total count and the highest percentage of layoffs.

#### High Percentage Layoffs:
Identifies rows where the percentage_laid_off is 1, indicating a complete layoff event for that entry. These rows are then sorted in descending order based on the total_laid_off count. This analysis can reveal critical instances of large-scale layoffs within the dataset.
        
#### Company-wise Analysis:
Groups the data by company and calculates the total number of layoffs for each company. The results are then ordered in descending order of total layoffs. This analysis helps identify which companies had the most significant workforce reductions.

#### Date Range Analysis:
Determines the earliest (Min) and latest (Max) dates present in the dataset. This information gives an overview of the time period covered by the data.

#### Industry and Country Analysis:
Groups the data by industry and country, calculating the total number of layoffs in each category. The results are ordered by the sum of layoffs in descending order for both industry and country. This analysis provides insights into which industries and countries experienced the most substantial layoffs.

#### Year and Stage Analysis:
Groups the data by year and the stage of layoffs (if applicable), calculating the total number of layoffs for each year and stage. The results are ordered by the sum of layoffs in descending order for both year and stage. This analysis helps understand the trends and distribution of layoffs over time and across different stages of a company's lifecycle.

#### Monthly and Rolling Total Analysis:
Groups the data by month, calculating the total number of layoffs for each month. Additionally, a rolling total of layoffs is calculated to understand the cumulative impact over time. This analysis can reveal seasonal patterns or trends in layoffs.

#### Company-Year Analysis:
Groups the data by company and year, calculating the total number of layoffs for each company in each year. The results are ordered by the sum of layoffs in descending order. Furthermore, the top 5 companies with the highest layoffs in each year are identified. This analysis provides insights into how layoffs vary across different companies over the years and highlights companies with significant layoff events in specific years.

### Conclusion
Through meticulous data cleaning processes and comprehensive exploratory analysis, this project unveils crucial insights into layoffs. The cleaned and standardized dataset, devoid of duplicates and null values, enables accurate and meaningful analysis. The EDA sheds light on critical aspects such as significant layoff events, industry trends, geographical impact, and temporal variations. These insights are instrumental in strategic decision-making, risk assessment, and understanding workforce dynamics, making this project a valuable asset for informed business actions.
