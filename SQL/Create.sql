use Esay_Intern;

create table student_personal_info(
	student_id int primary key, 
    Fname varchar(20), 
    Lname varchar(20), 
    college varchar(40), 
    gpa float, 
    major varchar(20),
    CONSTRAINT CHECK (length(student_id) = 7 AND student_id > 1)
);

create table student_location_info(
	student_id int, 
    foreign key(student_id) references student_personal_info(student_id), 
    location varchar(25),
    CONSTRAINT CHECK (length(student_id) = 7 AND student_id > 1)
);

create table company(
	company_id int primary key,
    name varchar(20),
    CONSTRAINT CHECK (length(company_id) = 4 AND company_id > 1)
);

create table company_location(
	company_id int, 
    foreign key(company_id) references company(company_id), 
    location varchar(25)
);

create table student_company(
	student_id int, foreign key(student_id) references student_personal_info(student_id), 
    company_id int, 
    foreign key(company_id) references company(company_id),
    CONSTRAINT CHECK (length(student_id) = 7 AND student_id > 1 AND (length(company_id) = 4 AND company_id > 1))
);


create table job_location(
	location_id int primary key, 
    address varchar(45),
    CONSTRAINT CHECK (length(location_id) = 4 AND location_id > 1) 
);

create table job_posting_info(
	post_id int primary key, 
    post_title varchar(30), 
    description varchar(45), 
    app_link varchar(250),
    CONSTRAINT CHECK (length(post_id) = 2 AND post_id > 1 ) 
);

create table applied_job(
	student_id int, 
    foreign key(student_id) references student_personal_info(student_id), 
    post_id int, 
    foreign key(post_id) references job_posting_info(post_id),
    CONSTRAINT CHECK (length(student_id) = 7 AND student_id > 1 AND length(post_id) = 2 AND post_id > 1)
);

create table employee_info(
	empl_id int primary key, 
    eFname varchar(20), 
    Lname varchar(20), 
    email varchar(45), 
    employee_title varchar(20),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 ) 
);

create table business_dev(
	empl_id int, 
    foreign key(empl_id) references employee_info(empl_id), 
    financial_skills varchar(45),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 )
);

create table it_specialist(
	empl_id int, 
    foreign key(empl_id) references employee_info(empl_id), 
    software_skill varchar(45),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 )
);

create table intern(
	empl_id int, foreign key(empl_id) references employee_info(empl_id),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 )
);

create table project(
	Pno int primary key, 
    Pname varchar(30), 
    Plocation varchar(30),
    CONSTRAINT CHECK (length(Pno) = 3 AND Pno > 1 )
);

create table works_on(
	Pno int, foreign key(Pno) references project(Pno), 
    empl_id int, foreign key(empl_id) references employee_info(empl_id),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 AND length(Pno) = 3 AND Pno > 1)
);

create table department_details_info(
	dept_id int primary key,
    dept_name varchar(20), 
    no_of_empl int,
    CONSTRAINT CHECK (length(dept_id) = 5 AND dept_id > 1 AND no_of_empl>1) 
);

create table department_emp(
	dept_id int, 
    foreign key(dept_id) references department_details_info(dept_id), 
    mgr_id int, foreign key(mgr_id) references employee_info(empl_id),
    CONSTRAINT CHECK (length(dept_id) = 5 AND dept_id > 1 AND length(mgr_id) = 7 AND mgr_id >1) 
);

create table department_company_info(
	dept_id int, 
    foreign key(dept_id) references department_details_info(dept_id), 
    company_id int, 
    foreign key(company_id) references company(company_id),
    CONSTRAINT CHECK (length(dept_id) = 5 AND dept_id > 1 AND length(company_id) = 4 AND company_id >1) 
);


create table employee_company(
	empl_id int, 
    foreign key(empl_id) references employee_info(empl_id), 
    company_id int, foreign key(company_id) references company(company_id),
    CONSTRAINT CHECK (length(empl_id) = 7 AND empl_id > 1 AND length(company_id) = 4 AND company_id > 1)
);


create table apply_later(
	student_id int, 
    foreign key(student_id) references student_personal_info(student_id), 
    post_id int, 
    foreign key(post_id) references job_posting_info(post_id),
    CONSTRAINT CHECK (length(student_id) = 7 AND student_id > 1 AND length(post_id) = 2 AND post_id > 1)
);

create table job_posting_location(
	post_id int, 
    foreign key(post_id) references job_posting_info(post_id), 
    location_id int, 
    foreign key(location_id) references job_location(location_id),
    CONSTRAINT CHECK (length(post_id) = 2 AND post_id > 1 AND length(location_id) = 4 AND location_id > 1) 
);
