--                                    Table "public.teachers"
--    Column   |          Type          |                       Modifiers                       
-- ------------+------------------------+-------------------------------------------------------
--  id         | integer                | not null default nextval('teachers_id_seq'::regclass)
--  name       | character varying(255) | not null
--  is_active  | boolean                | default true
--  start_date | date                   | 
--  end_date   | date                   | 

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
--  teacher_feedback | text                        | 

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

--                                    Table "public.cohorts"
--    Column   |          Type          |                      Modifiers                       
-- ------------+------------------------+------------------------------------------------------
--  id         | integer                | not null default nextval('cohorts_id_seq'::regclass)
--  name       | character varying(255) | not null
--  start_date | date                   | 
--  end_date   | date    

SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort,
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;