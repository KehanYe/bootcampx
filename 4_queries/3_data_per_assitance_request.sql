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

SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, (completed_at - started_at) AS duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;
