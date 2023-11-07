
-- *** The Lost Letter ***
-- I need to make sure there is an order related to 2 addresses: "900 Somerville Avenue" and "2 Finnigan Street" inside DB.
-- I check ID address and result:
	-- "900 Somerville Avenue" ---> result is 432
	SELECT id FROM addresses WHERE address IS '900 Somerville Avenue';
	-- "2 Finnigan Street" ---> result is 854
	SELECT id FROM addresses WHERE address IS '2 Finnigan Street';
-- And I have a complete query after trying the cases to determine which is the sending address and which is the receiving address. And more, that is "ID package"
SELECT * FROM packages WHERE (from_address_id = 432 AND to_address_id = 854);

-- ????: At what type of address did the Lost Letter end up? ---> result is: Residential
-- After have receiving address, I will check it to see "type address"  belongs to which type
SELECT type FROM addresses WHERE id = (
	SELECT to_address_id FROM packages WHERE id IS 384 
);

-- ????: At what address did the Lost Letter end up? ---> result is: 2 Finnigan Street
SELECT address FROM addresses WHERE id = (
	SELECT to_address_id FROM packages WHERE id IS 384
);
.
.
.
.
-- *** The Devious Delivery ***
-- I don't know if I did it right or not.
-- Or because check50 is not working correctly.
-- But for the datum is "Afraid there’s no “From” address.".
-- I queried the entire column "from_address_id"  from  "packages" table.
-- And there is only one value "NULL".
-- And from there I followed my intuition.

-- ????: At what type of address did the Devious Delivery end up? ---> result is: Business
-- With datum is: "Afraid there’s no “From” address". So we have "from_address_id" is NULL & we have query to find info package with "from_address_id" is NULL
SELECT * FROM packages WHERE from_address_id ISNULL;
-- After getting information from the above query, to get type address ---> result is: Business
SELECT type FROM addresses WHERE id IS 5098;
-- Query with multiple related tables
SELECT type FROM addresses WHERE id IS (
	SELECT id FROM packages WHERE from_address_id ISNULL
);

-- ????: What were the contents of the Devious Delivery? ---> result is: Duck debugger
-- We already have some information in the query above 
SELECT contents FROM packages WHERE from_address_id ISNULL;
.
.
.
.
-- *** The Forgotten Gift ***
-- ????: What are the contents of the Forgotten Gift? ---> result is: Flowers
-- With datum from paragraph, we have ID address of sender & receiver respectively is (109 Tileston Street | 9873) & (728 Maple Place | 4983)
SELECT id FROM addresses WHERE address IN ('728 Maple Place', '109 Tileston Street');
-- I will take the 2 IDs above to find CONTENT information
SELECT contents FROM packages WHERE (from_address_id = 9873 AND to_address_id = 4983);
-- Query with multiple related tables
SELECT p.contents
FROM addresses AS a
JOIN packages AS p ON a.id = p.from_address_id
WHERE a.address
IN ('728 Maple Place', '109 Tileston Street') AND p.to_address_id = 4983;

-- ????: Who has the Forgotten Gift? ---> result is: Mikel
-- I need get package ID
SELECT id FROM packages WHERE (from_address_id = 9873 AND to_address_id = 4983);
-- I will look for driver ID with datum is package ID
SELECT driver_id FROM scans WHERE id = 9523;
-- Once I have the driver id, I will find the driver's name
SELECT name FROM drivers WHERE id = 17;
-- Query with multiple related tables
SELECT name FROM drivers WHERE id = (
	SELECT driver_id FROM scans WHERE id = (
		SELECT id FROM packages WHERE (from_address_id = 9873 AND to_address_id = 4983)
	)
);