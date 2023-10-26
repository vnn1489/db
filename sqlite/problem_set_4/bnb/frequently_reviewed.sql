CREATE VIEW frequently_reviewed AS
SELECT listings.id, listings.property_type, listings.host_name, COUNT(reviews.listing_id) AS total_listing
FROM reviews
JOIN listings ON listings.id = reviews.listing_id
GROUP BY reviews.listing_id
ORDER BY total_listing DESC, listings.host_name ASC
LIMIT 100;