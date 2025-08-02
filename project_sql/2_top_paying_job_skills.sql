WITH top_paying_job AS (
    SELECT
        job_id,
        company_dim.name as company_name,
        job_title,
        salary_year_avg
    FROM job_postings_fact

    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id

    where
        job_title_short like '%Data Analyst%' AND
        job_location = 'Germany' AND
        salary_year_avg is NOT NULL

    ORDER BY
        salary_year_avg DESC

    LIMIT 10
)

SELECT
    top_paying_job.*,
    skills_dim.skills as skills_name
FROM top_paying_job

INNER JOIN skills_job_dim on top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id