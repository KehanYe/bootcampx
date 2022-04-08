const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

//potentially malicious input from user. Stored into values array
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];


//unmalicious text
// $ references the ability to reference the pull object built-in 
const queryString = `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name
LIMIT $2;`

//pool.query is a function that accepts an SQL query as a string.
//the rows property will have an array with the expected results
pool.query(queryString, values)
.then(res => {
  // console.log(res.rows)
  res.rows.forEach(row => {
    console.log(`${row.teacher}: ${row.cohort}`);
  })
})
.catch(err => console.error('query error', err.stack));
