CREATE TABLE badges (
badge_id INTEGER PRIMARY KEY,
badge_name VARCHAR 
);

CREATE TABLE user_badge (
badge_id INTEGER,
user_id INTEGER,
FOREIGN KEY (badge_id) REFERENCES badges(badge_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE locations (
location_id SERIAL PRIMARY KEY,
category_id INTEGER,
location_name VARCHAR(255),
description VARCHAR(255),
address VARCHAR(255),
open_to TIME,
open_from TIME,
twitter VARCHAR(255),
url VARCHAR(255),
facebook VARCHAR(255),
img VARCHAR(255),
lat DECIMAL(8,6),
long DECIMAL(8,6),
FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE check_ins (
check_in_id SERIAL PRIMARY KEY,
date_time TIMESTAMP,
location_id INTEGER,
user_id INTEGER,
FOREIGN KEY (location_id) REFERENCES locations(location_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE category (
category_id SERIAL PRIMARY KEY,
category VARCHAR(255)
);

CREATE TABLE category_badge (
category_id INTEGER,
badge_id INTEGER,
FOREIGN KEY (category_id) REFERENCES category(category_id),
FOREIGN KEY (badge_id) REFERENCES badges(badge_id)
);

