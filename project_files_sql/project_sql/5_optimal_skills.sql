/*
Question: What are the optimal skills to learn (which is high demand and high paying skill)?
-identify skills in high demand and associated with high average salaries for Data analyst roles
-Concentrates on remote positions with specified salaries
-why? Targets skills that offer job security and financial benefits,offering strategic insights for career development in data analysis
*/

with skills_demand AS(
SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  count(skills_job_dim.job_id) demand_skills
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
      job_title='Data Analyst' AND
      salary_year_avg is not NULL AND
      job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id

),average_Salary AS (
SELECT
 skills_dim.skill_id,
  round(avg(salary_year_avg),0) Avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
      job_title='Data Analyst' and
       salary_year_avg is not NULL and 
       job_work_from_home = TRUE
GROUP BY
     skills_dim.skill_id
)

SELECT
 skills_demand.skill_id,
 skills_demand.skills,
 demand_skills,
 Avg_salary
from
  skills_demand
INNER join average_salary on skills_demand.skill_id=average_Salary.skill_id
where demand_skills>10
ORDER BY
    demand_skills DESC,
    Avg_salary DESC