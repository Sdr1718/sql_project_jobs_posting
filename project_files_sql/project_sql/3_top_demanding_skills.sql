/*
Question: what are the most in-demand skills for Data analysts?
-Join job posting to inner join table similar to query 2
-Focus on all job postings.
-why? Retrieves the top 5 in-demand skills in the job market,
providind insights for job seekers about what skills are in-demand.
*/

SELECT
  skills,
  count(skills_job_dim.job_id) demand_skills
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
      job_title='Data Analyst'
GROUP BY
     skills
ORDER BY 
     demand_skills DESC
LIMIT 5

--you can can check for different kind of job_schedule_type like Full-time or part-time,with adding extra condition in where clause that is  job_schedule_type='the type you want' 