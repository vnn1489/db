CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_in" (
    "id" INTEGER,
    "date_time" NUMERIC NOT NULL,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    PRIMARY KEY("id")
);????

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_no" INTEGER NOT NULL,
    "operating" TEXT,



    PRIMARY KEY("id")
);