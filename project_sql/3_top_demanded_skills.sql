select 
    skills as skills_name,
    count (skills_job_dim.job_id) as demand_count

from job_postings_fact

INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id

WHERE job_title_short LIKE '%Data Analyst%'
GROUP BY
    skills

ORDER BY
    demand_count DESC

limit 5