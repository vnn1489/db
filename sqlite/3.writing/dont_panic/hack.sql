-- Alter the password of the website’s administrative account, admin, to instead be “oops!”.
UPDATE users
SET password = '982c0381c279d139fd221fce974916e7'
WHERE username = 'admin';

-- Erase any logs of the above password change recorded by the database.
DELETE FROM user_logs;

-- Add false data to throw others off your trail. In particular, to frame emily33, make it only appear—in the user_logs table—as if the admin account has had its password changed to emily33’s password.
INSERT INTO user_logs (type, old_username, old_password, new_password)
VALUES ('update', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7')