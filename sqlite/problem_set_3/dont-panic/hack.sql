INSERT INTO "user_logs" ("type", "password")
SELECT 'update', (
    SELECT "password"
    FROM "users"
    WHERE "username" = 'carter'
);

UPDATE votes SET title = 'VU NGUYEN NGUYEN'
WHERE title LIKE 'VU%'

UPDATE INTO "users" ("username")
SELECT ''