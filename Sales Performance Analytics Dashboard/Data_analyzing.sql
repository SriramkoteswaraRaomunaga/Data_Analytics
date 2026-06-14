create database job_market;
 use job_market;
 select * from jbm;
 
SELECT Company, Year, COUNT(Job_ID) AS Total_Jobs
FROM jbm
GROUP BY Company, Year
ORDER BY Company, Year;

select location,count(*) as total_emp from jbm 
group by location;

select location,count(*) as total_emp from jbm 
group by location order by count(*) desc limit 3;

select job_category,count(location) as total_emp from jbm 
group by job_category having count(*) > 5 ;

SELECT Job_Title, Location, Company, Experience_Required_years,
       RANK() OVER (PARTITION BY Location ORDER BY Experience_Required_years ASC) AS Experience_Rank
FROM jbm;

select job_category,avg(experience_required_years) as total_emp from jbm 
group by job_category;

WITH CategoryCounts AS (
    SELECT Job_Category, COUNT(*) AS Category_Count
    FROM jbm
    GROUP BY Job_Category
),
RankedCategories AS (
    SELECT Job_Category, DENSE_RANK() OVER (ORDER BY Category_Count DESC) AS Rank_Num
    FROM CategoryCounts
)
SELECT Job_Category
FROM RankedCategories
WHERE Rank_Num = 2;
select job_category,count(*) as total_emp from jbm 
group by  job_category order by count(*) desc limit 1,1;

select company,year,count(job_category) as total_emp from jbm 
group by  company,year;

select location,count(*) as total_emp from jbm 
group by location having count(*) > 10;

select company,max(year) as recentposting  from jbm 
group by  company ;

SELECT Company, Job_Title, Job_Category 
FROM jbm
WHERE Year = 2025;
