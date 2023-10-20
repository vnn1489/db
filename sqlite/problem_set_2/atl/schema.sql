CREATE TABLE "passengers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER
);

CREATE TABLE "check_ins" (
    "id" INTEGER PRIMARY KEY,
    "date_time" NUMERIC NOT NULL,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "concourse" TEXT CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

CREATE TABLE "flights" (
    "id" INTEGER PRIMARY KEY,
    "flight_no" INTEGER NOT NULL,
    "from_code" TEXT,
    "to_code" TEXT,
    "from_time" TEXT,
    "to_time" TEXT,
    "airline_id" INTEGER,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
