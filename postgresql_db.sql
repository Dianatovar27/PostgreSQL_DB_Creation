SET datestyle = 'DMY';
CREATE TABLE students (student_id SERIAL PRIMARY KEY, full_name TEXT, birthday DATE, address TEXT);
/*Table content is going to be added through py see repository named */

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

/*find duplicates*/
SELECT *
FROM students
WHERE (full_name, birthday, address) IN (
    SELECT full_name, birthday, address
    FROM students
    GROUP BY full_name, birthday, address
    HAVING COUNT(*) > 1
);

/*remove * */
UPDATE coaches
SET full_name = REPLACE(full_name, '*', '')
WHERE full_name LIKE '%*%';

/* age range column */
ALTER TABLE classes
ADD COLUMN age_range numrange;

/*many to many */

CREATE TABLE class_coaches (
    class_id INTEGER REFERENCES classes(class_id),
    coach_id INTEGER REFERENCES coaches(coach_id),
    PRIMARY KEY (class_id, coach_id)
);

ALTER TABLE classes
DROP COLUMN coach_id;
