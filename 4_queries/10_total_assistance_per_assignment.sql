--  Table "public.assignments"
--   Column  |          Type          |                        Modifiers                         
-- ----------+------------------------+----------------------------------------------------------
--  id       | integer                | not null default nextval('assignments_id_seq'::regclass)
--  name     | character varying(255) | 
--  content  | text                   | 
--  day      | integer                | 
--  chapter  | integer                | 
--  duration | integer                | 

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


SELECT assignments.id, name, day, chapter, count(assistance_requests) AS total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;