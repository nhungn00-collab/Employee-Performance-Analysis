/* 1.1. So dong, so nhan vien duy nhat */
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT employee_id) AS distinct_employee_id
FROM [data employees];


SELECT
    employee_id,
    COUNT(*) AS dup_count
FROM [data employees]
GROUP BY employee_id
HAVING COUNT(*) > 1 
ORDER BY dup_count DESC, employee_id;


SELECT *
FROM [data employees]
WHERE employee_id IS NULL
   OR department IS NULL
   OR region IS NULL;


   SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS missing_education,
    ROUND(100.0 * SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS missing_education_pct,
    SUM(CASE WHEN previous_year_rating IS NULL THEN 1 ELSE 0 END) AS missing_previous_year_rating,
    ROUND(100.0 * SUM(CASE WHEN previous_year_rating IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS missing_previous_year_rating_pct
FROM [data employees]


SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1 ELSE 0 END) AS kpi_over_80_count,
    SUM(CASE WHEN KPIs_met_more_than_80 = 0 THEN 1 ELSE 0 END) AS kpi_not_over_80_count,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]



SELECT
    COALESCE(education, 'Missing') AS education_group,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY COALESCE(education, 'Missing')
ORDER BY kpi_over_80_rate_pct DESC, n DESC;


SELECT
    department,
    COUNT(*) AS n,
    SUM(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1 ELSE 0 END) AS kpi_over_80_count,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY department
ORDER BY kpi_over_80_rate_pct DESC, n DESC;


SELECT
    gender,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY gender
ORDER BY kpi_over_80_rate_pct DESC;


SELECT
    recruitment_channel,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY recruitment_channel
ORDER BY kpi_over_80_rate_pct DESC;


SELECT
    awards_won,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY awards_won
ORDER BY awards_won DESC;

SELECT
    previous_year_rating,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY previous_year_rating
ORDER BY previous_year_rating DESC;




SELECT
    CASE
        WHEN age <= 20 THEN '<=20'
        WHEN age <= 30 THEN '20-30'
        WHEN age <= 40 THEN '30-40'
        WHEN age <= 50 THEN '40-50'
        WHEN age <= 60 THEN '50-60'
        ELSE '61+'
    END AS age_group,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY
    CASE
       WHEN age <= 20 THEN '<=20'
        WHEN age <= 30 THEN '20-30'
        WHEN age <= 40 THEN '30-40'
        WHEN age <= 50 THEN '40-50'
        WHEN age <= 60 THEN '50-60'
        ELSE '61+'
    END
ORDER BY age_group;


SELECT
    CASE
        WHEN length_of_service <= 5 THEN '0-5'
        WHEN length_of_service <= 10 THEN '6-10'
        WHEN length_of_service <= 15 THEN '11-15'
        WHEN length_of_service <= 20 THEN '16-20'
        WHEN length_of_service <= 25 THEN '21-25'
        ELSE '25+'
    END AS service_group,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY
    CASE
       WHEN length_of_service <= 5 THEN '0-5'
        WHEN length_of_service <= 10 THEN '6-10'
        WHEN length_of_service <= 15 THEN '11-15'
        WHEN length_of_service <= 20 THEN '16-20'
        WHEN length_of_service <= 25 THEN '21-25'
        ELSE '25+'
    END
ORDER BY service_group;






SELECT
    CASE
        WHEN avg_training_score <= 50 THEN '<=50'
        WHEN avg_training_score <= 60 THEN '51-60'
        WHEN avg_training_score <= 70 THEN '61-70'
        WHEN avg_training_score <= 80 THEN '71-80'
        WHEN avg_training_score <= 90 THEN '81-90'
        ELSE '91-100'
    END AS training_score_group,
    COUNT(*) AS n,
    ROUND(100.0 * AVG(CASE WHEN KPIs_met_more_than_80 = 1 THEN 1.0 ELSE 0.0 END), 2) AS kpi_over_80_rate_pct
FROM [data employees]
GROUP BY
    CASE
        WHEN avg_training_score <= 50 THEN '<=50'
        WHEN avg_training_score <= 60 THEN '51-60'
        WHEN avg_training_score <= 70 THEN '61-70'
        WHEN avg_training_score <= 80 THEN '71-80'
        WHEN avg_training_score <= 90 THEN '81-90'
        ELSE '91-100'
    END
ORDER BY training_score_group;



SELECT
    KPIs_met_more_than_80,
    ROUND(AVG(no_of_trainings), 2) AS avg_no_of_trainings,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(previous_year_rating), 2) AS avg_previous_year_rating,
    ROUND(AVG(length_of_service), 2) AS avg_length_of_service,
    ROUND(AVG(avg_training_score), 2) AS avg_training_score
FROM [data employees]
GROUP BY KPIs_met_more_than_80
ORDER BY KPIs_met_more_than_80;