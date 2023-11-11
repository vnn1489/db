-- ANYONE'S VIETNAMESE NAME
CREATE TABLE "vietnamese_name" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT
);

-- FROM VIETNAMESE - ENGLISH DICTIONARY, I WILL TAKE ALL 2-WORD PHRASES THAT START WITH THE FOLLOWING LETTERS
    -- SINGLE CONSONANTS: Q, R, T, P, S, D - D, G, H, K, L, X, C, V, B, N, M
    -- COMBINED CONSONANTS: GI, KH, NG, NH, PH, TH, TR, CH
    -- CASES OF SPECIAL NAME STARTING WITH THESE LETTERS: A, Â, Ă, E, Ê, Y, U, Ư, I, O, Ô, Ơ.






    
-- THE VIETNAMESE PHRASE IN THIS TABLE CONTAIN ONLY TWO WORDS
CREATE TABLE "vietnamese_phrase" (
    "id" INTEGER PRIMARY KEY,
    "phrase" TEXT NOT NULL,
    "meaning" TEXT
);

-- ENGLISH MEANING OF VIETNAMESE PHRASE
CREATE TABLE "english_meaning" (
    "id" INTEGER,
    "meaning" TEXT,
    "vietnamese_phrase_id" INTEGER,
    FOREIGN KEY("vietnamese_phrase_id") REFERENCES "vietnamese_phrase"("id")
);

-- CREATE INDEX FOR phrase FROM VIEW MODE only_two_words.
CREATE INDEX "vietnamese_phrase_indexes" ON "vietnamese_phrase"("phrase");