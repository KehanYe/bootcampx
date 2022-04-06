-- Table "public.assignment_submissions"
--      Column      |  Type   |                              Modifiers                              
-- -----------------+---------+---------------------------------------------------------------------
--  id              | integer | not null default nextval('assignment_submissions_id_seq'::regclass)
--  assignment_id   | integer | 
--  student_id      | integer | 
--  duration        | integer | 
--  submission_date | date    | 
-- Indexes:
--     "assignment_submissions_pkey" PRIMARY KEY, btree (id)
-- Foreign-key constraints:
--     "assignment_submissions_assignment_id_fkey" FOREIGN KEY (assignment_id) REFERENCES assignments(id) ON DELETE CASCADE
--     "assignment_submissions_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE

--   Column   |          Type          |                       Modifiers                       
-- ------------+------------------------+-------------------------------------------------------
--  id         | integer                | not null default nextval('students_id_seq'::regclass)
--  name       | character varying(255) | not null
--  email      | character varying(255) | 
--  phone      | character varying(32)  | 
--  github     | character varying(255) | 
--  start_date | date                   | 
--  end_date   | date                   | 
--  cohort_id  | integer                | 
-- Indexes:
--     "students_pkey" PRIMARY KEY, btree (id)
-- Foreign-key constraints:
--     "students_cohort_id_fkey" FOREIGN KEY (cohort_id) REFERENCES cohorts(id) ON DELETE CASCADE
-- Referenced by:
--     TABLE "assignment_submissions" CONSTRAINT "assignment_submissions_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE

SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;
