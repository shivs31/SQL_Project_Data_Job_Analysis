/*
Answer : What are the top skills based on salary
- Look at the avg salary associated with each skill for data positions
-focus on roles with specified salaries, regardless of location
-Why> it reveals how different skills impact salary levels for data roleand
helps identify the most financially rewarding skills to aquire or improve
*/

SELECT
    ROUND(AVG(salary_year_avg),0) AS avg_salary,
    skills
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short IN ('Data Analyst', 'Data Scientist', 'Data Engineer')
GROUP BY
    skills
ORDER BY
    avg_salary DESC;
