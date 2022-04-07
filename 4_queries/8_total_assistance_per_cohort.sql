-- Table "public.cohorts"
--    Column   |          Type          |                      Modifiers                       
-- ------------+------------------------+------------------------------------------------------
--  id         | integer                | not null default nextval('cohorts_id_seq'::regclass)
--  name       | character varying(255) | not null
--  start_date | date                   | 
--  end_date   | date                 


SELECT cohorts.name AS name, SUM(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;