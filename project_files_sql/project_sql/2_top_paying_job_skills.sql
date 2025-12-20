/*
Question: what are the skills required for the top-paying data analyst jobs?
-use the top 10 highest-paying Data analyst jobs from first query
-Add the specific skills required for these roles
-why? it provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries
*/

with top_paying_jobs AS
(
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
where 
      job_title='Data Analyst' and 
      salary_year_avg is not NULL AND
      job_location='Anywhere'
ORDER BY
      salary_year_avg DESC
LIMIT 10
)
SELECT 
      top_paying_jobs.*,
      skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
   salary_year_avg DESC