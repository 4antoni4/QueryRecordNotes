create database RecordNotes
create table ProfessionalSchool
(
	IdProfessionalSchool varchar(20) primary key not null,
	nameSchool varchar(500)
)
create table Career
(
	IdCareer varchar(20) primary key not null,
	ProfessionalSchoolId varchar(20),
	foreign key (ProfessionalSchoolId) references ProfessionalSchool(IdProfessionalSchool),
	nameCareer varchar(200)
)
create table Semester
(
	IdSemester int primary key,
	CareerId varchar(20),
	foreign key (CareerId) references Career(IdCareer),
)
create table Teacher 
(
	IdTeacher varchar(20) primary key,
	nameTeacher varchar(50),
	APaterno varchar(25),
	AMaterno varchar(25),
	Categoria varchar(20)
)

create table Course 
(
	IdCourse varchar(20) primary key not null,
	CareerId varchar(20),
	nameCourse varchar(20),
	cantCreditos int,
	categoria varchar(20),
	foreign key (CareerId) references Career(IdCareer)
)

create table TeacherCourse(
	IdTeacherCouerse varchar(20) primary key not null,
	TeacherId varchar(20),
	CourseId varchar(20),
	foreign key (TeacherId) references Teacher(IdTeacher),
	foreign key (CourseId) references Course(IdCourse),
)

create table Student 
(
	IdStudent varchar(20) primary key,
	nameStudent varchar(50),
	APaterno varchar(25),
	AMaterno varchar(25),
)

create table StudentCourse
(
	IdStudentCourse varchar(20) primary key,
	StudentId varchar(20),
	CourseId varchar(20),
	foreign key (StudentId) references Student(IdStudent),
	foreign key (CourseId) references Course(IdCourse),

)
create table Subjects(
	IdSubjects int primary key,
	nameSubject varchar(25),
	CourseId varchar(20),
	foreign key (CourseId) references Course(IdCourse),
)
create table ExamenQuestion(
	IdExamenQuestion int primary key not null,
	CouerseId varchar(20),
	Question varchar(100),
	foreign key (CouerseId) references StudentCourse(IdStudentCourse)
)

CREATE table ExamnsAlternative(
	IdExamnsAlternative int primary key not null,
	alternativa varchar(10),
	isCorrect bit not null
)
create table ExamenQuestionAnswer(
	IdExamenQuestionAnswer int primary key not null,
	CouerseId varchar(20),
	ExamnsAlternativeId int,
	foreign key (ExamnsAlternativeId) references ExamnsAlternative(IdExamnsAlternative)
)
create table Examns
(
	IdExamns int primary key,
	limitTime time,
	StudentCourseId varchar(20),
	SubjectsId int,
	ExamenQuestionId int,
	ExamenQuestionAnswerId int,
	nota int,
	foreign key (StudentCourseId) references StudentCourse(IdStudentCourse),
	foreign key (SubjectsId) references Subjects(IdSubjects),
	foreign key (ExamenQuestionId) references ExamenQuestion(IdExamenQuestion),
	foreign key (ExamenQuestionAnswerId) references ExamenQuestionAnswer(IdExamenQuestionAnswer),


)



create table Task(
	IdTask int primary key not null,
	DescriptionT varchar(500),
	interval int,
	TimeT time
)
create table Review(
	IdReview int primary key,
	DescriptionR varchar(200),
	Interval varchar(20),
	ExamnsId int,
	taskId int,
	foreign key (ExamnsId) references Examns(IdExamns),
	foreign key (taskId) references Task(IdTask)

)

