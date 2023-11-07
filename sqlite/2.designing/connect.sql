CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
);

CREATE TABLE "education" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "founded" NUMERIC,
);

CREATE TABLE "companies" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
);