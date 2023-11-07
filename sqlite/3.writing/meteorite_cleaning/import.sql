CREATE TABLE "meteorites_temp" (
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT,
  "year" INTEGER,
  "lat" REAL,
  "long" REAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

CREATE TABLE "meteorites" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
  "year" INTEGER,
  "lat" REAL,
  "long" REAL
);

DELETE FROM "meteorites_temp" WHERE "nametype" IS 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT  "name",
        "class",
        CASE WHEN "mass" = '' THEN NULL ELSE ROUND("mass", 2) END,
        "discovery",
        CASE WHEN "year" = '' THEN NULL ELSE "year" END,
        CASE WHEN "lat" = '' THEN NULL ELSE ROUND("lat", 2) END,
        CASE WHEN "long" = '' THEN NULL ELSE ROUND("long", 2) END
FROM "meteorites_temp"
ORDER BY COALESCE("year", '') ASC, "name" ASC;

DROP TABLE "meteorites_temp";