-- AFTER CREATED TABLE vietnamese_name FROM schema.sql
-- I WILL ADD MY NAME INTO vietnamese_name TABLE. 
INSERT INTO "vietnamese_name" ("first_name")
VALUES ('Nguyen'), ("Gam");

-- AFTER CREATED TABLE just_two_words FROM schema.sql
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
	"word" LIKE 'l% l%' OR
	"word" LIKE 'x% x%' OR
	"word" LIKE 'c% c%' OR
	"word" LIKE 'v% v%' OR
	"word" LIKE 'b% b%' OR
	"word" LIKE 'n% n%' OR
	"word" LIKE 'm% m%' OR
	"word" LIKE 'gi% gi%' OR
	"word" LIKE 'kh% kh%' OR
	"word" LIKE 'ng% ng%' OR
	"word" LIKE 'nh% nh%' OR
	"word" LIKE 'ph% ph%' OR
	"word" LIKE 'th% th%' OR
	"word" LIKE 'tr% tr%' OR
	"word" LIKE 'ch% ch%' OR
	"word" LIKE 'a% a%' OR
	"word" LIKE 'á% á%' OR
	"word" LIKE 'ạ% ạ%' OR
	"word" LIKE 'ã% ã%' OR
	"word" LIKE 'ả% ả%' OR
	"word" LIKE 'â% â%' OR
	"word" LIKE 'ấ% ấ%' OR
	"word" LIKE 'ậ% ậ%' OR
	"word" LIKE 'ẫ% ẫ%' OR
	"word" LIKE 'ẩ% ẩ%' OR
	"word" LIKE 'ă% ă%' OR
	"word" LIKE 'ắ% ắ%' OR
	"word" LIKE 'ặ% ặ%' OR
	"word" LIKE 'ẵ% ẵ%' OR
	"word" LIKE 'ẳ% ẳ%' OR
	"word" LIKE 'e% e%' OR
	"word" LIKE 'é% é%' OR
	"word" LIKE 'ẹ% ẹ%' OR
	"word" LIKE 'ẽ% ẽ%' OR
	"word" LIKE 'ẻ% ẻ%' OR
	"word" LIKE 'ê% ê%' OR
	"word" LIKE 'ế% ế%' OR
	"word" LIKE 'ệ% ệ%' OR
	"word" LIKE 'ễ% ễ%' OR
	"word" LIKE 'ể% ể%' OR
	"word" LIKE 'y% y%' OR
	"word" LIKE 'ý% ý%' OR
	"word" LIKE 'ỵ% ỵ%' OR
	"word" LIKE 'ỹ% ỹ%' OR
	"word" LIKE 'ỷ% ỷ%' OR
	"word" LIKE 'u% u%' OR
	"word" LIKE 'ú% ú%' OR
	"word" LIKE 'ụ% ụ%' OR
	"word" LIKE 'ũ% ũ%' OR
	"word" LIKE 'ủ% ủ%' OR
	"word" LIKE 'ư% ư%' OR
	"word" LIKE 'ứ% ứ%' OR
	"word" LIKE 'ự% ự%' OR
	"word" LIKE 'ữ% ữ%' OR
	"word" LIKE 'ử% ử%' OR
	"word" LIKE 'i% i%' OR
	"word" LIKE 'í% í%' OR
	"word" LIKE 'ị% ị%' OR
	"word" LIKE 'ĩ% ĩ%' OR
	"word" LIKE 'ỉ% ỉ%' OR
	"word" LIKE 'o% o%' OR
	"word" LIKE 'ó% ó%' OR
	"word" LIKE 'ọ% ọ%' OR
	"word" LIKE 'õ% õ%' OR
	"word" LIKE 'ỏ% ỏ%' OR
	"word" LIKE 'ô% ô%' OR
	"word" LIKE 'ố% ố%' OR
	"word" LIKE 'ộ% ộ%' OR
	"word" LIKE 'ỗ% ỗ%' OR
	"word" LIKE 'ổ% ổ%' OR
	"word" LIKE 'ơ% ơ%' OR
	"word" LIKE 'ớ% ớ%' OR
	"word" LIKE 'ợ% ợ%' OR
	"word" LIKE 'ỡ% ỡ%' OR
	"word" LIKE 'ở% ở%'
);

-- AFTER THERE ARE DATA IN just_two_words TABLE.
-- I WILL QUERY ALL THE VIETNAMESE PHRASE WHERE THE WORDS BEGIN WITH 'NG'.
-- WHY 'NG'? BECAUSE IT IS THE CONSONANT COMBINED IN MY NAME (Nguyen).
SELECT * FROM "just_two_words"
WHERE "vietnamese_phrase"
LIKE 'ng% ng%';

-- COMBINE NAME WITH VIETNAMESE PHRASE.
INSERT INTO "combine_name_with_phrase" ("name_id", "phrase_id", "text_combine")
SELECT
    "vietnamese_name"."id",
    "just_two_words"."id",
    "vietnamese_name"."first_name" || ' ' || "just_two_words"."vietnamese_phrase"
FROM "vietnamese_name"
CROSS JOIN "just_two_words"
WHERE "just_two_words"."vietnamese_phrase" LIKE 'ng% ng%'
AND "vietnamese_name"."first_name" = 'Nguyen';

-- FOR TWO-WORD PHRASES STARTING WITH g, k, n, p, t, c.
-- I WILL HAVE SPECIAL QUERY FOR THEM
-- WHY? BECAUSE WHEN QUERYING CASES g, k, n, p, t, c
-- THE RESULTS WILL INCLUDE CASES OF gi, kh, ng, nh, ph, th, tr, ch
-- AND IN VIETNAMESE CONTEXT: gi, kh, ng, nh, ph, th, tr, ch ALSO ARE CONSONANTS ---> CONSONANT COMBINED.
-- FOR THAT REASON, I WANT TO COMPLETELY SEPARATE THEM
-- BELLOW IS EXAMPLE FOR CASE g LETTER
INSERT INTO "combine_name_with_phrase" ("name_id", "phrase_id", "text_combine")
SELECT
    "vietnamese_name"."id",
    "just_two_words"."id",
    "vietnamese_name"."first_name" || ' ' || "just_two_words"."vietnamese_phrase"
FROM "vietnamese_name"
CROSS JOIN "just_two_words"
WHERE "just_two_words"."vietnamese_phrase" LIKE 'g% g%' -- OPTION
AND "just_two_words"."vietnamese_phrase" NOT LIKE 'gi% gi%' -- OPTION
AND "just_two_words"."vietnamese_phrase" NOT LIKE 'gi% g%' -- OPTION
AND "just_two_words"."vietnamese_phrase" NOT LIKE 'g% gi%' -- OPTION
AND "vietnamese_name"."first_name" = 'Gam';

	-- OTHER "OPTION"
	--    -- CASE FOR k LETTER
	--    WHERE "just_two_words"."vietnamese_phrase" LIKE 'k% k%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'kh% kh%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'kh% k%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'k% kh%'
	
	--    -- CASE FOR n LETTER
	--    WHERE "just_two_words"."vietnamese_phrase" LIKE 'n% n%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ng% ng%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ng% n%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'n% ng%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'nh% nh%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'nh% n%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'n% nh%'
	
	--    -- CASE FOR p LETTER
	--    WHERE "just_two_words"."vietnamese_phrase" LIKE 'p% p%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ph% ph%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ph% p%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'p% ph%'
	
	--    -- CASE FOR t LETTER
	--    WHERE "just_two_words"."vietnamese_phrase" LIKE 't% t%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'th% th%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'th% t%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 't% th%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'tr% tr%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'tr% t%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 't% tr%'
	
	--    -- CASE FOR c LETTER
	--    WHERE "just_two_words"."vietnamese_phrase" LIKE 'c% c%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ch% ch%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'ch% c%'
	--    AND "just_two_words"."vietnamese_phrase" NOT LIKE 'c% ch%'

-- ADD NEW VIETNAMESE PHRASE INTO DATABASE
INSERT INTO "just_two_words" ("vietnamese_phrase", "vietnamese_phrase_search")
VALUES ('ngẩn ngơ', 'ngan ngo');

-- UPDATE ENGLISH MEANING FOR VIETNAMESE PHRASE
UPDATE "just_two_words"
SET "english_meaning" = "stupid"
WHERE "vietnamese_phrase" LIKE "ngẩn ngơ";

-- CREATE VIEW FOR begin_with_combined_consonants.
CREATE VIEW "begin_with_combined_consonants" AS
SELECT * FROM "just_two_words"
WHERE
	"vietnamese_phrase" LIKE 'gi% gi%' OR
	"vietnamese_phrase" LIKE 'kh% kh%' OR
	"vietnamese_phrase" LIKE 'ng% ng%' OR
	"vietnamese_phrase" LIKE 'nh% nh%' OR
	"vietnamese_phrase" LIKE 'ph% ph%' OR
	"vietnamese_phrase" LIKE 'th% th%' OR
	"vietnamese_phrase" LIKE 'tr% tr%' OR
	"vietnamese_phrase" LIKE 'ch% ch%';