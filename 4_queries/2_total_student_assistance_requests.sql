--                                         Table "public.assistance_requests"
--       Column      |            Type             |                            Modifiers                             
-- ------------------+-----------------------------+------------------------------------------------------------------
--  id               | integer                     | not null default nextval('assistance_requests_id_seq'::regclass)
--  assignment_id    | integer                     | 
--  student_id       | integer                     | 
--  teacher_id       | integer                     | 
--  created_at       | timestamp without time zone | 
--  started_at       | timestamp without time zone | 
--  completed_at     | timestamp without time zone | 
--  student_feedback | text                        | 
--  teacher_feedback | text 

--                                    Table "public.students"
--    Column   |          Type          |                       Modifiers                       
-- ------------+------------------------+-------------------------------------------------------
--  id         | integer                | not null default nextval('students_id_seq'::regclass)
--  name       | character varying(255) | not null
--  email      | character varying(255) | 
--  phone      | character varying(32)  | 
--  github     | character varying(255) | 
--  start_date | date                   | 
--  end_date   | date                   | 
--  cohort_id  | integer                | 

SELECT count(assistance_requests) AS total_assistances, students.name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name
ORDER BY students.name;
