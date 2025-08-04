select 
    skills as skills_name,
    round(avg (job_postings_fact.salary_year_avg),0) as avg_salary

from job_postings_fact

INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id

WHERE 
    job_title_short LIKE '%Data Analyst%' and
    job_postings_fact.salary_year_avg is not null
GROUP BY
    skills

ORDER BY
    avg_salary DESC

limit 25