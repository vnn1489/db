CREATE TABLE "meteorites_temp" (
  "name" TEXT,
  "id" INTEGER,
  "nametype" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT,
  "year" REAL,
  "lat" REAL,
  "long" REAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

CREATE TABLE "meteorites" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "class" TEXT,
  "mass" REAL,
  "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
  "year" REAL,
  "lat" REAL,
  "long" REAL
);

INSERT INTO "meteorites" ("id", "name", "class", "mass", "discovery", "year", "lat", "long")
SELECT  "id",
        "name",
        "class",
        "discovery",
        CASE WHEN "year" = '' THEN NULL ELSE "year" END,
        CASE WHEN "mass" = '' THEN NULL ELSE "mass" END,
        CASE WHEN "lat" = '' THEN NULL ELSE "lat" END,
        CASE WHEN "long" = '' THEN NULL ELSE "long" END
FROM "meteorites_temp";

DROP TABLE "meteorites_temp";

