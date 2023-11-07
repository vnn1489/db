CREATE VIEW message AS
SELECT id, sentence AS phrase
FROM sentences
WHERE id IN (14, 114, 618, 630, 932, 2230, 2346, 3041);

SELECT phrase FROM message;

SELECT
    CASE
        WHEN id = 14 THEN SUBSTRING(phrase, 98, 4)
        WHEN id = 114 THEN SUBSTRING(phrase, 3, 5)
        WHEN id = 618 THEN SUBSTRING(phrase, 72, 9)
        WHEN id = 630 THEN SUBSTRING(phrase, 7, 3)
        WHEN id = 932 THEN SUBSTRING(phrase, 12, 5)
        WHEN id = 2230 THEN SUBSTRING(phrase, 50, 7)
        WHEN id = 2346 THEN SUBSTRING(phrase, 44, 10)
        WHEN id = 3041 THEN SUBSTRING(phrase, 14, 5)
    END
FROM message;