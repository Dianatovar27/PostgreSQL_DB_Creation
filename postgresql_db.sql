SET datestyle = 'DMY';
CREATE TABLE students (student_id SERIAL PRIMARY KEY, full_name TEXT, birthday DATE, address TEXT);
/*Table content is going to be added through py in the future*/

CREATE TABLE coaches (coach_id SERIAL PRIMARY KEY, full_name TEXT);
INSERT INTO coaches (full_name) VALUES ('XXXXX');

CREATE TABLE laptops (laptop_id SERIAL PRIMARY KEY, laptop_number INTEGER);
INSERT INTO laptops (laptop_number) VALUES (1);

CREATE TYPE WeekdayEnum AS ENUM ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

CREATE TABLE classes(class_id SERIAL PRIMARY KEY, class_name TEXT, class_type VARCHAR(100), coach_id INTEGER, weekday WeekdayEnum, start_time TIME, duration_minutes INTEGER);

ALTER TABLE classes
ADD CONSTRAINT fk_coaches
FOREIGN KEY (coach_id)
REFERENCES coaches (coach_id)
ON UPDATE CASCADE;

INSERT INTO classes (class_name, class_type, coach_id, weekday, start_time, duration_minutes)
VALUES ('XXXXXX', 'Class', 9, 'Tuesday', '16:00:00', 50);
