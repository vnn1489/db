CREATE TABLE "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "unit" REAL,
    "unit_type" TEXT,
    "price" REAL
);

CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "gluten-free" TEXT CHECK("gluten-free" IN ('Yes', 'No')),
    "price" REAL,
    "ingredient_id_0" INTEGER,
    "ingredient_id_1" INTEGER,
    "ingredient_id_2" INTEGER,
    FOREIGN KEY("ingredient_id_0") REFERENCES "ingredients"("id"),
    FOREIGN KEY("ingredient_id_1") REFERENCES "ingredients"("id"),
    FOREIGN KEY("ingredient_id_2") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY,
    "order_no" TEXT,
    "donut_id" INTEGER,
    "quantity" INTEGER,
    "customer_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "order_no" INTEGER,
    FOREIGN KEY("order_no") REFERENCES "orders"("order_no")
);
