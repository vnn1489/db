
-- *** The Lost Letter ***
-- ????: At what type of address did the Lost Letter end up?
-- Get type address with datum is "900 Somerville Avenue" ---> result is: Residential
SELECT type FROM addresses WHERE address LIKE '900 Somerville Avenue';

-- ????: At what address did the Lost Letter end up?
-- Get ID of package with datum is "900 Somerville Avenue" ---> result is: 432
SELECT id FROM addresses WHERE address IS '900 Somerville Avenue';
-- After have ID package from query above (432), get receiver's address ID ---> result is: 3239
SELECT to_address_id FROM packages WHERE id IS 432;
-- When the recipient's id is available (3239), get info from "addresses" table ---> result is: 30 Atlantic Avenue
SELECT address FROM addresses WHERE id IS 3239;
-- Query with multiple related tables
SELECT address FROM addresses WHERE id = (
	SELECT to_address_id FROM packages WHERE id = (
		SELECT id FROM addresses WHERE address IS '900 Somerville Avenue'
	)
);
.
.
.
.
-- *** The Devious Delivery ***
-- ????: At what type of address did the Devious Delivery end up?
-- With datum is: "Afraid there’s no “From” address". So we have "from_address_id" is NULL & we have query to find info package with "from_address_id" is NULL
SELECT * FROM packages WHERE from_address_id ISNULL;
-- After getting information from the above query, to get type address ---> result is: Business
SELECT type FROM addresses WHERE id IS 5098;
-- Query with multiple related tables
SELECT type FROM addresses WHERE id IS (
	SELECT id FROM packages WHERE from_address_id ISNULL
);

-- ????: What were the contents of the Devious Delivery?
We already have some information in the query above (SELECT * FROM packages WHERE from_address_id ISNULL;) including CONTENT information ---> result is: Duck debugger
.
.
.
.
-- *** The Forgotten Gift ***
-- ????: What are the contents of the Forgotten Gift?
-- With datum from paragraph, we have ID address of sender & receiver respectively is (109 Tileston Street | 9873) & (728 Maple Place | 4983)
SELECT id FROM addresses WHERE address IN ('728 Maple Place', '109 Tileston Street');
-- I will take the 2 IDs above to find CONTENT information ---> result is: Flowers
SELECT contents FROM packages WHERE (from_address_id = 9873 AND to_address_id = 4983);
-- Query with multiple related tables
SELECT p.contents
FROM addresses AS a
JOIN packages AS p ON a.id = p.from_address_id
WHERE a.address
IN ('728 Maple Place', '109 Tileston Street') AND p.to_address_id = 4983;

-- ????: Who has the Forgotten Gift?
-- I need get package ID
SELECT id FROM packages WHERE (from_address_id = 9873 AND to_address_id = 4983);
-- I will look for driver ID with datum is package ID
SELECT driver_id FROM scans WHERE id = 9523;
-- Once I have the driver id, I will find the driver's name
SELECT name FROM drivers WHERE id = 17;
-- Query with multiple related tables

