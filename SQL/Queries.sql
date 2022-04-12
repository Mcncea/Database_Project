use Easy_Intern;

# Functional Requirement 1
select *
from student_personal_info;

# Functional Requirement 2
select app_link
from job_posting_info;

# Functional Requirement 3
select post_id
from applied_job;

# Functional Requirement 4
select COUNT(student_id)
from applied_job;

# Functional Requirement 5
select post_id
from apply_later;

# Functional Requirement 6
select COUNT(empl_id)
from intern;

# Functional Requirement 7
select Pname
from project;

# Functional Requirement 8
select post_id
from job_posting_info
where post_title = 'Computer Science';

# Functional Requirement 9
select job_posting_info.post_title, COUNT(applied_job.post_id)
from applied_job
JOIN job_posting_info ON job_posting_info.post_id = applied_job.post_id
group by applied_job.post_id
order by COUNT(applied_job.post_id) DESC;

# Functional Requirement 10
select COUNT(student_id)
from student_personal_info
group by major;