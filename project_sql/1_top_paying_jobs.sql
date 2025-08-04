SELECT

    job_id,
    company_dim.name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

FROM job_postings_fact

LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id

where
    job_title_short like '%Data Analyst%' AND
    search_location = 'Germany' AND
    salary_year_avg is NOT NULL

ORDER BY
     salary_year_avg DESC

LIMIT 25
