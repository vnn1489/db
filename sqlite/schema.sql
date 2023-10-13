CREATE TABLE "SetNameTable0" (
    "id" INTEGER NOT NULL,
    "TitleOfColumn0" INTEGER,
    "TitleOfColumn1" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "SetNameTable1" (
    "id" INTEGER NOT NULL,
    "TitleOfColumn0" INTEGER,
    "TitleOfColumn1" TEXT NOT NULL UNIQUE,
    "TitleOfColumn2"TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "SetNameTable2" (
    "TitleOfColumn0" INTEGER,
    "TitleOfColumn1" INTEGER,
    FOREIGN KEY("SetAliasNameForColumn0") REFERENCES "NameTable0"("id"),
    FOREIGN KEY("SetAliasNameForColumn1") REFERENCES "NameTable1"("id")
);