USE academy;	

# Select subject's name for group's name is "rk-17-1" 
SELECT DISTINCT groups.name 'Group', subjects.name 'Subject'  
	FROM groups  
	INNER JOIN marks
	ON marks.id_group = groups.id
	INNER JOIN subjects
	ON subjects.id = marks.id_subject
	WHERE groups.name = 'rk-17-1';	

# Select all students, who has mark "5" by Physical Culture
SELECT groups.name, passports.first_name, passports.last_name, subjects.name, marks.mark
	FROM passports
	INNER JOIN students
	ON students.id_passport = passports.id
	INNER JOIN students_groups
	ON students_groups.id_student = students.id
	INNER JOIN groups
	ON groups.id = students_groups.id_group
	INNER JOIN marks
	ON marks.id_group = groups.id
	INNER JOIN subjects
	ON subjects.id = marks.id_subject
	WHERE subjects.name = 'Physical Culture' AND marks.mark = '5'
	AND students.id = marks.id_student
	ORDER BY groups.name;

# Select all students, who has mark "5" by Physical Culture with name of teacher(do not work correct)
SELECT groups.name, passports.first_name, passports.last_name, subjects.name, marks.mark,
		passports.first_name, passports.last_name
	FROM passports
	INNER JOIN students
	ON students.id_passport = passports.id
	INNER JOIN students_groups
	ON students_groups.id_student = students.id
	INNER JOIN groups
	ON groups.id = students_groups.id_group
	INNER JOIN marks
	ON marks.id_group = groups.id
	INNER JOIN subjects
	ON subjects.id = marks.id_subject
	INNER JOIN subjects_teachers
	ON subjects_teachers.id_subject = subjects.id
	INNER JOIN teachers
	ON teachers.id = subjects_teachers.id_teacher
	WHERE subjects.name = 'Physical Culture' AND marks.mark = '4'
	AND students.id = marks.id_student
	ORDER BY groups.name;

