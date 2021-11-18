-- For first time set up run
CREATE TABLE users(id SERIAL PRIMARY KEY, email_address VARCHAR(60), password VARCHAR(140));

-- For updating if users database has already been created
ALTER TABLE users DROP password;
ALTER TABLE users ADD password VARCHAR(140);