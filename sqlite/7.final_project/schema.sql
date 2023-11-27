-- INSIDE DATABASE OF THE VIETNAMESE-ENGLISH DICTIONARY FROM THE INTERNET, IT WILL HAVE THE FOLLOWING STRUCTURE:
--		- "translation":
--			+ "id": INTEGER PRIMARY KEY AUTOINCREMENT,
--			+ "word": TEXT NOT NULL,
--			+ "translation_word": TEXT NOT NULL,
--			+ "word_search": TEXT NOT NULL

-- I CREATE NEW TABLES INSIDE VIETNAMESE-ENGLISH DICTIONARY WITH THE FOLLOWING PROPERTIES
CREATE TABLE "vietnamese_name" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT
);

CREATE TABLE "just_two_words" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
  	"vietnamese_phrase" TEXT NOT NULL,
	"english_meaning" TEXT,
	"vietnamese_phrase_search" TEXT,
);

CREATE TABLE "combine_name_with_phrase" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name_id" INTEGER,
    "phrase_id" INTEGER,
    "text_combine" TEXT,
    "voted" INTEGER,
    FOREIGN KEY("name_id") REFERENCES "vietnamese_name"("id"),
    FOREIGN KEY("phrase_id") REFERENCES "just_two_words"("id")
);

-- I CREATE INDEX FOR vietnamese_phrase COLUMN OF just_two_words TABLE.
CREATE INDEX "just_two_words_indexes" ON "just_two_words"("vietnamese_phrase");