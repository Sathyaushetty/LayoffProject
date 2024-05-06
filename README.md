# Layoff Analysis Project

## Table of Content
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Key Features of project](#key-features-of-project)
- [Conclusion](#conclusion)

### Project Overview
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

### Conclusion
