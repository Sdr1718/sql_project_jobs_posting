/*
Question: what are the top paying data analyst job?
-identify the top 10 highest-paying data analyst roles that are available remotely.
-focuses on the job postings with specified salaries excluding nulls.
-why? Highlight the top-paying opportunities for data analysts,offering insights into employment opportunities
*/

SELECT 
     job_id,
     job_title,
     job_location,
     job_schedule_type,
     salary_year_avg,
     job_posted_date,
     name as company_name
FROM
     job_postings_fact
left JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
where job_title='Data Analyst' and 
      salary_year_avg is not NULL AND
      job_location='Anywhere'
ORDER BY
      salary_year_avg DESC
LIMIT 10
