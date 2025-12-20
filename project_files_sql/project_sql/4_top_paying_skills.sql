/*
Question: what are the top skills based on salary?(high-paying)
-look at the average salary associated with each skill for Data analyst roles
-Focuses on the roles with specified salaries,regardless of location
-why? It reveals how different skills impact salary levels for Data Analysts and helps identify 
  the most financially rewarding skills to aquire or improve
*/
SELECT
  skills,
  round(avg(salary_year_avg),0) Avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
      job_title='Data Analyst' and
       salary_year_avg is not NULL and job_country='India'
GROUP BY
     skills
ORDER BY 
    Avg_salary DESC
LIMIT 25

--There is job_country mentioned in where clause to check further.