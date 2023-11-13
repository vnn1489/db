-- AFTER I HAVE THE vietnamese_name TABLE CREATED FROM schema.sql FILE
-- I WILL ADD MY NAME INTO vietnamese_name TABLE. 
INSERT INTO "vietnamese_name" ("first_name")
VALUES ('Nguyen');

-- AFTER I HAVE THE just_two_words TABLE CREATED FROM schema.sql FILE
-- I WILL COPY THE DATA THAT I NEED TO GET FROM THE translation TABLE.
INSERT INTO "just_two_words"
SELECT "id" ,"word", "translation_word", "word_search"
FROM "translation"
WHERE LENGTH("word") - LENGTH(REPLACE("word", ' ', '')) = 1
AND (
	"word" LIKE 'q% q%' OR
	"word" LIKE 'r% r%' OR
	"word" LIKE 't% t%' OR
	"word" LIKE 'p% p%' OR
	"word" LIKE 's% s%' OR
	"word" LIKE 'd% d%' OR
	"word" LIKE 'đ% đ%' OR
	"word" LIKE 'g% g%' OR
	"word" LIKE 'h% h%' OR
	"word" LIKE 'k% k%' OR
	"word" LIKE 'l% %l' OR
	"word" LIKE 'x% x%' OR
	"word" LIKE 'c% c%' OR
	"word" LIKE 'v% v%' OR
	"word" LIKE 'b% b%' OR
	"word" LIKE 'n% n%' OR
	"word" LIKE 'm% m%' OR
	"word" LIKE 'gi% gi%' OR
	"word" LIKE 'kh% %kh' OR
	"word" LIKE 'ng% ng%' OR
	"word" LIKE 'nh% nh%' OR
	"word" LIKE 'ph% ph%' OR
	"word" LIKE 'th% th%' OR
	"word" LIKE 'tr% tr%' OR
	"word" LIKE 'ch% ch%' OR
	"word" LIKE 'a% a%' OR
	"word" LIKE 'â% â%' OR
	"word" LIKE 'ă% ă%' OR
	"word" LIKE 'e% e%' OR
	"word" LIKE 'ê% ê%' OR
	"word" LIKE 'y% y%' OR
	"word" LIKE 'u% u%' OR
	"word" LIKE 'ư% ư%' OR
	"word" LIKE 'i% i%' OR
	"word" LIKE 'o% o%' OR
	"word" LIKE 'ô% ô%' OR
	"word" LIKE 'ơ% ơ%'
);

-- AFTER THERE IS DATA IN just_two_words TABLE.
-- I WILL QUERY ALL THE PHRASES WHERE THE WORDS BEGIN WITH 'NG'.
-- WHY 'NG'? BECAUSE IT IS THE CONSONANT COMBINED IN MY NAME (Nguyen).
SELECT * FROM "just_two_words"
WHERE "vietnamese_phrase"
LIKE 'ng% ng%';

-- COMBINE NAME WITH VIETNAMESE PHRASE.
SELECT "vietnamese_name"."first_name"  || ' ' || "just_two_words"."vietnamese_phrase"
AS "combine_name_with_vietnamese_phrase"
FROM "vietnamese_name", "just_two_words"
WHERE "just_two_words"."vietnamese_phrase" LIKE 'ng% ng%'
AND "vietnamese_name"."first_name" IS 'Nguyen';

-- FOR TWO-WORD PHRASES STARTING WITH g, k, n, p, t, c.
-- I WILL HAVE SPECIAL QUERY FOR THEM
-- WHY? BECAUSE WHEN QUERYING CASES g, k, n, p, t, c
-- THE RESULTS WILL INCLUDE CASES OF gi, kh, ng, nh, ph, th, tr, ch
-- AND IN VIETNAMESE CONTEXT: gi, kh, ng, nh, ph, th, tr, ch ALSO ARE CONSONANTS ---> CONSONANT COMBINED.
-- FOR THAT REASON, I WANT TO COMPLETELY SEPARATE THEM
        -- CASE FOR g LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 'g% g%'
        AND "vietnamese_phrase" NOT LIKE 'gi% gi%'
        AND "vietnamese_phrase" NOT LIKE 'gi% g%'
        AND "vietnamese_phrase" NOT LIKE 'g% gi%';

        -- CASE FOR k LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 'k% k%'
        AND "vietnamese_phrase" NOT LIKE 'kh% kh%'
        AND "vietnamese_phrase" NOT LIKE 'kh% k%'
        AND "vietnamese_phrase" NOT LIKE 'k% kh%';

        -- CASE FOR n LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 'n% n%'
        AND "vietnamese_phrase" NOT LIKE 'ng% ng%'
        AND "vietnamese_phrase" NOT LIKE 'ng% n%'
        AND "vietnamese_phrase" NOT LIKE 'n% ng%'
        AND "vietnamese_phrase" NOT LIKE 'nh% nh%'
        AND "vietnamese_phrase" NOT LIKE 'nh% n%'
        AND "vietnamese_phrase" NOT LIKE 'n% nh%';

        -- CASE FOR p LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 'p% p%'
        AND "vietnamese_phrase" NOT LIKE 'ph% ph%'
        AND "vietnamese_phrase" NOT LIKE 'ph% p%'
        AND "vietnamese_phrase" NOT LIKE 'p% ph%';

        -- CASE FOR t LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 't% t%'
        AND "vietnamese_phrase" NOT LIKE 'th% th%'
        AND "vietnamese_phrase" NOT LIKE 'th% t%'
        AND "vietnamese_phrase" NOT LIKE 't% th%'
        AND "vietnamese_phrase" NOT LIKE 'tr% tr%'
        AND "vietnamese_phrase" NOT LIKE 'tr% t%'
        AND "vietnamese_phrase" NOT LIKE 't% tr%';

        -- CASE FOR c LETTER
        SELECT * from "just_two_words"
        WHERE "vietnamese_phrase" LIKE 'c% c%'
        AND "vietnamese_phrase" NOT LIKE 'ch% ch%'
        AND "vietnamese_phrase" NOT LIKE 'ch% c%'
        AND "vietnamese_phrase" NOT LIKE 'c% ch%';

-- ????
SELECT * FROM "just_two_words"
WHERE (
	SELECT "first_name"
	FROM "vietnamese_name"
	WHERE "first_name" LIKE 'Nguyen'; 
)
...
;

-- ADD NEW VIETNAMESE PHRASE INTO DATABASE
INSERT INTO "just_two_words" ("vietnamese_phrase", "vietnamese_phrase_search")
VALUES ('ngẩn ngơ', 'ngan ngo');

-- UPDATE ENGLISH MEANING FOR VIETNAMESE PHRASE
UPDATE "just_two_words"
SET "english_meaning" = "stupid"
WHERE "vietnamese_phrase" LIKE "ngẩn ngơ";

-- CREATE VIEW FOR combined_consonants.
CREATE VIEW "combined_consonants" AS
SELECT *
FROM "just_two_words"
WHERE
	"vietnamese_phrase" LIKE 'gi% gi%' OR
	"vietnamese_phrase" LIKE 'kh% kh%' OR
	"vietnamese_phrase" LIKE 'ng% ng%' OR
	"vietnamese_phrase" LIKE 'nh% nh%' OR
	"vietnamese_phrase" LIKE 'ph% ph%' OR
	"vietnamese_phrase" LIKE 'th% th%' OR
	"vietnamese_phrase" LIKE 'tr% tr%' OR
	"vietnamese_phrase" LIKE 'ch% ch%';

--  CREATE VIEW FOR begin_with_vowels
CREATE VIEW "begin_with_vowels" AS
SELECT * FROM "just_two_words"
WHERE
	"vietnamese_phrase" LIKE 'a% a%' OR
	"vietnamese_phrase" LIKE 'â% â%' OR
	"vietnamese_phrase" LIKE 'ă% ă%' OR
	"vietnamese_phrase" LIKE 'e% e%' OR
	"vietnamese_phrase" LIKE 'ê% ê%' OR
	"vietnamese_phrase" LIKE 'y% y%' OR
	"vietnamese_phrase" LIKE 'u% u%' OR
	"vietnamese_phrase" LIKE 'ư% ư%' OR
	"vietnamese_phrase" LIKE 'i% i%' OR
	"vietnamese_phrase" LIKE 'o% o%' OR
	"vietnamese_phrase" LIKE 'ô% ô%' OR
	"vietnamese_phrase" LIKE 'ơ% ơ%';