with job_demand as(
    select 
        skills_dim.skills,
        skills_job_dim.skill_id,
        count (skills_job_dim.job_id) as demand_count

    from job_postings_fact

    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id

    WHERE 
        job_title_short LIKE '%Data Analyst%' and
        job_postings_fact.salary_year_avg is not null
    GROUP BY
    skills_job_dim.skill_id, skills_dim.skills


), job_salary AS (
    select 
        skills_job_dim.skill_id,
        round(avg (job_postings_fact.salary_year_avg),0) as avg_salary

    from job_postings_fact

    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id

    WHERE 
        job_title_short LIKE '%Data Analyst%' and
        job_postings_fact.salary_year_avg is not null
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    job_demand.skill_id,
   job_demand.skills,
    job_demand.demand_count,
    job_salary.avg_salary
FROM job_demand

INNER JOIN  job_salary ON job_demand.skill_id = job_salary.skill_id

ORDER BY demand_count DESC


