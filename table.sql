
drop sequence TrainingCode_seq;

drop sequence CourseID_seq;

drop table EMPLOYEE_MASTER cascade constraint;

drop table COURSE_MASTER cascade constraint;

drop table TRAINING_PROGRAM cascade constraint;

drop table FACULTY_SKILL cascade constraint;

drop table TRAINING_PARTICIPANT_ENROLLMENT cascade constraint;

drop table FEEDBACK_MASTER cascade constraint;




--Sequence Creation :

CREATE sequence TrainingCode_seq start with 20000 increment by 1;     --For training code
CREATE sequence CourseID_seq start with 100 increment by 1;         --For Course Id


--EMPLOYEEMASTER TABLE:

CREATE table EMPLOYEE_MASTER(
Employee_ID number(5) PRIMARY KEY,
EmployeeName varchar2(50),
Password varchar2(20),
Role varchar2(20));
--COURSEMASTER TABLE:

CREATE table COURSE_MASTER(CourseID number(5) PRIMARY KEY,
CourseName varchar2(50),NoOfDays number(5));

--TRAININGPROGRAM TABLE:

CREATE table TRAINING_PROGRAM(TrainingCode number(5) PRIMARY KEY ,CourseCode number(5) REFERENCES COURSE_MASTER(CourseID) ON DELETE CASCADE,
FacultyCode number(5) REFERENCES Employee_Master(Employee_ID) ON DELETE CASCADE,
StartDate date,EndDate date,CHECK (EndDate>StartDate));


--FACULTYSKILL TABLE:

CREATE table FACULTY_SKILL(FacultyId number(5) REFERENCES Employee_Master(Employee_ID) ON DELETE CASCADE,
SkillSet varchar2(200));

--TRAINING-PARTICIPANTENROLLMENT TABLE:

CREATE table TRAINING_PARTICIPANT_ENROLLMENT(
Training_Code number(5) REFERENCES TRAINING_PROGRAM(TrainingCode) ON DELETE CASCADE,
ParticipantId number(5) REFERENCES Employee_Master(Employee_ID) ON DELETE CASCADE,CONSTRAINT pk_enrollment PRIMARY KEY(Training_Code,ParticipantId));

--FEEDBACKMASTER TABLE:

CREATE table FEEDBACK_MASTER(TrainingCode number(5) REFERENCES TRAINING_PROGRAM(Training_Code) ON DELETE CASCADE,
ParticipantId number(5) REFERENCES Employee_Master(Employee_ID) ON DELETE CASCADE,
FB_Prs_comm number(1),FB_Clrfy_dbts number(1),
FB_TM number(1),FB_Hnd_out number(1),
FB_Hw_Sw_Ntwrk number(1),
Comments varchar2(200),
Suggestions varchar2(200),
fbDate DATE,
CHECK (FB_Prs_comm BETWEEN 1 AND 5),
CHECK (FB_Clrfy_dbts BETWEEN 1 AND 5),
CHECK (FB_TM BETWEEN 1 AND 5),
CHECK (FB_Hnd_out BETWEEN 1 AND 5),
CHECK (FB_Hw_Sw_Ntwrk BETWEEN 1 AND 5),
CONSTRAINT pk_enrollment PRIMARY KEY(TrainingCode,ParticipantId));

--Employee master details:
INSERT into EMPLOYEE_MASTER values(1000,'Admin','adm@123','admin');

INSERT into EMPLOYEE_MASTER values(1001,'Trainer1','trn1@123','coordinator');

INSERT into EMPLOYEE_MASTER values(1002,'Trainer2','trn2@123','coordinator');

INSERT into EMPLOYEE_MASTER values(1003,'Trainee1','trne1@123','participant');

INSERT into EMPLOYEE_MASTER values(1004,'Trainee2','trne2@123','participant');

--FACULTY_SKILL details:
INSERT into FACULTY_SKILL values(1001,'CoreJava,Servlet,JSP');
INSERT into FACULTY_SKILL values(1002,'Python,.Net,Oracle');

--Course master details:
INSERT into course_master values(123,'CoreJava',20);

INSERT into course_master values(456,'Oracle',40);

INSERT into course_master values(789,'.Net',50);

INSERT into course_master values(101,'Servlet',60);

--TRAININGPROGRAM details:

INSERT into TRAINING_PROGRAM values(10000,123,1001,'05-nov-2018','15-dec-2018');

INSERT into TRAINING_PROGRAM values(10001,456,1001,'20-jun-2018','30-jul-2018');

INSERT into TRAINING_PROGRAM values(10002,789,1002,'25-jan-2018','26-feb-2018');

INSERT into TRAINING_PROGRAM values(10003,101,1002,'10-aug-2018','15-sep-2018');

--TRAINING-PARTICIPANTENROLLMENT details:
INSERT into TRAINING_PARTICIPANT_ENROLLMENT values(10000,1004);

INSERT into TRAINING_PARTICIPANT_ENROLLMENT values(10000,1003);

INSERT into TRAINING_PARTICIPANT_ENROLLMENT values(10001,1004);

INSERT into TRAINING_PARTICIPANT_ENROLLMENT values(10001,1003);

--FEEDBACKMASTER details:

--INSERT into FEEDBACK_MASTER values(10000,1004,4,5,4,4,5,'Good','TimeManagement',SYSDATE,'Trainee1');
--INSERT into FEEDBACK_MASTER values(10001,1003,3,4,5,4,4,'Good','communication skills',SYSDATE,'Trainee2');

