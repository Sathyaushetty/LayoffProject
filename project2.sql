-- Data Cleaning


Select*
From layoffs ;

-- 1. Removing Duplicates
-- 2. Standardizing the data
-- 3. Null Values or blank values
-- 4. Removing columns



--  Removing Duplicates

Create Table layoffs_staging
like layoffs;


Select *
From layoffs_staging;

Insert layoffs_staging
select*
from layoffs;


Select*,
Row_Number() over( 
Partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
From layoffs_staging;


With duplicate_cte as
(
Select *,
Row_Number() over( 
Partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
From layoffs_staging
)
Select*
from duplicate_cte
where row_num > 1;

Select*
from layoffs_staging
where company = 'casper';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select*
from layoffs_staging2
where row_num > 1;

Insert into layoffs_staging2
select*,
row_number() over(
Partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
From layoffs_staging;

Delete
from layoffs_staging2
where row_num > 1;

Select*
from layoffs_staging2;

-- Standardizing Data

Select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

Select distinct industry
from layoffs_staging2;

Update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';


Select Distinct country
from layoffs_staging2
order by 1;

Select *
from layoffs_staging2
where country like 'United States%'
order by 1;


Select Distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

Update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';


Select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

Update layoffs_staging2
set `date`= str_to_date(`date`, '%m/%d/%Y');


Select `date`
from layoffs_staging2;


Alter table layoffs_staging2
modify column `date` date;


-- Null Values or blank values


Select*
From layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

Select*
from layoffs_staging2
where industry is null
or industry= '';


Update layoffs_staging2
Set industry = null
where industry = '';

Select*
from layoffs_staging2
where company ='Airbnb';

Select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company=t2.company
    and t1.location=t2.location
where (t1.industry is null or t1.industry='')
and t2.industry is not null;


Update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null 
and t2.industry is not null;

Select*
from layoffs_staging2;



-- Removing Columns


Select*
From layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;


Delete
From layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select*
From layoffs_staging2;

Alter table layoffs_staging2
drop column row_num;



