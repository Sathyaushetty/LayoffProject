-- Exploratory Data Analysis

Select*
from layoffs_staging2;

Select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

Select*
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

Select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

Select Min(`date`), Max(`date`)
from layoffs_staging2;

Select Industry, sum(total_laid_off)
from layoffs_staging2
group by Industry
order by 2 desc;

Select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

Select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year (`date`)
order by 2 desc;

Select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

Select substring(`date`,1,7) as `MONTH`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1 asc;

With rolling_total as
(
Select substring(`date`,1,7) as `MONTH`, sum(total_laid_off) as Total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1 asc
)
select `month`, total_off
,sum(total_off) over (order by `month`) as Rolling_total
from rolling_total;



Select company, year(`date`),sum(total_laid_off)
From layoffs_staging2
group by company, year(`date`)
order by 3 desc;


With Company_year(company, years, total_laid_off) as
(
Select company, year(`date`),sum(total_laid_off)
From layoffs_staging2
group by company, year(`date`)
), company_year_rank as
(
Select*, Dense_rank() over (partition by years order by total_laid_off desc) as ranking
from Company_year
where years is not null
)
select*
from company_year_rank
where ranking <=5
;
