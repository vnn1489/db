# Design Document
By VU NGUYEN NGUYEN
Video overview: https://youtu.be/5FszP6bX8c8

## Scope
* What is the purpose of your database?
>>>> Stores Vietnamese phrases (with only two words) with consonant and vowel starting each word in the same. Examples: ngẩn ngơ, ngây ngô, ngu ngốc, .... The common point of the phrases is that they start with the consonant "NG".

* Which people, places, things, etc. are you including in the scope of your database?
>>>> My database will include.
        - Vietnamese name of anyone.
        - Vietnamese phrases consisting of only 2 words.
        - Equivalent English meanings of the Vietnamese phrases.

### Requirements
* What should a user be able to do with your database?
>>>> Users can look up all phrases (only two-word) in Vietnamese with meanings existing in the database, matching the consonant or vowel sound with any consonant or vowel sound at the beginning of the name they are interested in.

* What's beyond the scope of what a user should be able to do with your database?
>>>> In the Vietnamese context, there will be a few or no have phrases that begin with the following vowels:
        - a, á, à, ạ, ã. ả
        - â, ấ, ầ, ậ, ẫ, ẩ
        - ă, ắ, ằ, ặ, ẵ, ẳ
        - e, é, è, ẹ, ẽ, ẻ
        - ê, ế, ề, ệ, ễ, ể
        - y, ý, ỳ, ỵ, ỹ, ỷ
        - u, ú, ù, ụ, ũ, ủ
        - ư, ứ, ừ, ự, ữ, ử
        - i, í, ì, ị, ĩ, ỉ
        - o, ó, ò, ọ, õ, ỏ
        - ô, ố, ồ, ộ, ỗ, ổ
        - ơ, ớ, ờ, ợ, ỡ, ở

#### Entities
The database includes the following entities:
- “vietnamese_name” table includes:
    + "id"          :INTEGER AUTOINCREMENT
    + "first_name"  :TEXT NOT NULL
    + "middle_name" :TEXT
    + "last_name"   :TEXT
    + PRIMARY KEY   :"id"

- “just_two_words” table includes:
    + "id"                          :INTEGER AUTOINCREMENT
    + "vietnamese_phrase"           :TEXT NOT NULL
    + "english_meaning"             :TEXT
    + "vietnamese_phrase_search"    :TEXT
    + PRIMARY KEY                   :"id"

- "combine_name_with_phrase" table includes:
    + "id"                      :INTEGER AUTOINCREMENT,
    + "text_combine"            :TEXT NOT NULL
    + "voted"                   :INTEGER
    + FOREIGN KEY("name_id")    :REFERENCES “vietnamese_name”("id")
    + FOREIGN KEY(”phrase_id")  :REFERENCES “just_two_words”("id")

##### Relationships
The below entity relationship diagram describes the relationships among the entities in the database.
!diagram.jpg

###### Optimizations
* Which optimizations (e.g., indexes, views) did you create? Why?
>>>> I will only create index for the “vietnamese_phrase” column of the “just_two_words” table because users are interested in searching for phrases located in the “vietnamese_phrase” column.

###### Limitations
* What are the limitations of your design?
>>>> According to the current design, my database only has three tables. This means I am optimizing the design within the scope of those three tables.
>>>> In the future, if I add or modify the design in my database, that means I will have to optimize the database as well as related queries.

* What might your database not be able to represent very well?
>>>> Currently, I haven't identified any inconsistencies in my database. If there are any issues, please leave a comment to let me know.