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


SELECT day, COUNT(*) AS number_of_assignments, SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;