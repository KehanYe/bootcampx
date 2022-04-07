-- NESTED SELECT AS ADDITIONAL COLUMN

-- SELECT (
--   SELECT count(assignments)
--   FROM assignments
-- )-count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- FRROM SUB SELECT TABLE

-- SELECT avg(total_students) as average_students
-- FROM (
--   SELECT count(students) as total_students, cohorts.name as cohort_name
--   FROM students
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts.name
-- ) as totals_table;


--                               Table "public.assignment_submissions"
--      Column      |  Type   |                              Modifiers                              
-- -----------------+---------+---------------------------------------------------------------------
--  id              | integer | not null default nextval('assignment_submissions_id_seq'::regclass)
--  assignment_id   | integer | 
--  student_id      | integer | 
--  duration        | integer | 
--  submission_date | date    | 

--                                   Table "public.assignments"
--   Column  |          Type          |                        Modifiers                         
-- ----------+------------------------+----------------------------------------------------------
--  id       | integer                | not null default nextval('assignments_id_seq'::regclass)
--  name     | character varying(255) | 
--  content  | text                   | 
--  day      | integer                | 
--  chapter  | integer                | 
--  duration | integer                | 

SELECT assignments.name
FROM assignments
WHERE id NOT IN (
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);