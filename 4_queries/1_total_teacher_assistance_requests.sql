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

--                                    Table "public.teachers"
--    Column   |          Type          |                       Modifiers                       
-- ------------+------------------------+-------------------------------------------------------
--  id         | integer                | not null default nextval('teachers_id_seq'::regclass)
--  name       | character varying(255) | not null
--  is_active  | boolean                | default true
--  start_date | date                   | 
--  end_date   | date     

SELECT count(assistance_requests) AS total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;
