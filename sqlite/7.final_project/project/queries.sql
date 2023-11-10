-- GET ALL WORDS STARTING WITH THE CONSONANT "NG".
SELECT * FROM "only_two_words" WHERE "phrase" LIKE 'ng% ng%';

-- ADD NEW PHRASE INTO DB
INSERT INTO "vietnamese_phrase" ("phrase", "meaning")
VALUES ('ngẩn ngơ', 'thể hiện trạng thái không tỉnh táo của con người');

-- CREATE A VIEW OF THE ENGLISH MEANING OF VIETNAMESE PHRASE FROM VIEW only_two_words AND TABLE english_word.
CREATE VIEW "english_meaning_of_vietnamese_phrase" AS
SELECT
    "vietnamese_phrase"."phrase" AS "vietnamese_phrase",
    "vietnamese_phrase"."meaning" AS "vietnamese_meaning",
    "english_meaning"."meaning" AS "english_meaning"
FROM "vietnamese_phrase"
JOIN "english_meaning" ON "vietnamese_phrase"."id" = "english_meaning"."vietnamese_phrase_id";

-- SEE ALL ENGLISH MEANINGS OF ALL PHRASES BEGINNING WITH THE LETTER "NG"
SELECT * FROM "english_meaning_of_vietnamese_phrase"
WHERE "vietnamese_phrase" LIKE 'ng% ng%';

-- 





-- GET ALL VIETNAMESE WORDS CONTAINING TWO WORDS WITH THE CONDITIONS BELOW.
CREATE VIEW "only_two_words" AS
SELECT "id", "word_and_phrase" AS "phrase", "meaning" FROM "vietnamese_dictionary"
WHERE LENGTH("word_and_phrase") - LENGTH(REPLACE("word_and_phrase", ' ', '')) = 1
AND (
	"word_and_phrase" LIKE 'q% q%' OR
	"word_and_phrase" LIKE 'r% r%' OR
	"word_and_phrase" LIKE 't% t%' OR
	"word_and_phrase" LIKE 'p% p%' OR
	"word_and_phrase" LIKE 's% s%' OR
	"word_and_phrase" LIKE 'd% d%' OR
	"word_and_phrase" LIKE 'đ% đ%' OR
	"word_and_phrase" LIKE 'g% g%' OR
	"word_and_phrase" LIKE 'h% h%' OR
	"word_and_phrase" LIKE 'k% k%' OR
	"word_and_phrase" LIKE 'l% %l' OR
	"word_and_phrase" LIKE 'x% x%' OR
	"word_and_phrase" LIKE 'c% c%' OR
	"word_and_phrase" LIKE 'v% v%' OR
	"word_and_phrase" LIKE 'b% b%' OR
	"word_and_phrase" LIKE 'n% n%' OR
	"word_and_phrase" LIKE 'm% m%' OR
	"word_and_phrase" LIKE 'gi% gi%' OR
	"word_and_phrase" LIKE 'kh% %kh' OR
	"word_and_phrase" LIKE 'ng% ng%' OR
	"word_and_phrase" LIKE 'nh% nh%' OR
	"word_and_phrase" LIKE 'ph% ph%' OR
	"word_and_phrase" LIKE 'th% th%' OR
	"word_and_phrase" LIKE 'tr% tr%' OR
    "word_and_phrase" LIKE 'tr% ch%' OR
	"word_and_phrase" LIKE 'ch% ch%' OR
    "word_and_phrase" LIKE 'ch% tr%'
) OR (
	"word_and_phrase" LIKE 'a% a%' OR
	"word_and_phrase" LIKE 'â% â%' OR
	"word_and_phrase" LIKE 'ă% ă%' OR
	"word_and_phrase" LIKE 'e% e%' OR
	"word_and_phrase" LIKE 'ê% ê%' OR
	"word_and_phrase" LIKE 'y% y%' OR
	"word_and_phrase" LIKE 'u% u%' OR
	"word_and_phrase" LIKE 'ư% ư%' OR
	"word_and_phrase" LIKE 'i% i%' OR
	"word_and_phrase" LIKE 'o% o%' OR
	"word_and_phrase" LIKE 'ô% ô%' OR
	"word_and_phrase" LIKE 'ơ% ơ%'
);





