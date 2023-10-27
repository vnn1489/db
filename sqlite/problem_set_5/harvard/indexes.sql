CREATE INDEX course_indexes ON courses (title, semester);

SELECT * 
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;






"courses"."title", "courses"."semester"