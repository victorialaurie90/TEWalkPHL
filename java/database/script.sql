BEGIN TRANSACTION;

DROP TABLE IF EXISTS locations_category;
DROP TABLE IF EXISTS user_badge;
DROP TABLE IF EXISTS category_badge;
DROP TABLE IF EXISTS badges CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS check_ins CASCADE;
DROP TABLE IF EXISTS locations CASCADE;


CREATE TABLE badges (
badge_id SERIAL NOT NULL,
badge_name VARCHAR,
badge_description VARCHAR(255),
CONSTRAINT PK_badges PRIMARY KEY (badge_id) 
);

--INSERT BADGES
INSERT INTO badges (badge_id, badge_name, badge_description) 
VALUES (1, 'Defender of the Land', 'Check in at every location in WalkPHL'), 
(2, 'Bar Hopper', 'Check in at 5 bars'), 
(3, 'Sports Enthusiast', 'Check in at 5 sports arenas'), 
(4, 'Tree Hugger', 'Check in at 5 parks'), 
(5, 'Jeet Yet?', 'Check in at 5 restaurants'), 
(6, 'You Know, I''m Something of a Historian Myself', 'Check in at 5 historic sites'),
(7, 'City of Brotherly Love', 'Check in at 5 locations with another user');

CREATE TABLE category (
category_id SERIAL NOT NULL,
category VARCHAR(255),
CONSTRAINT PK_category PRIMARY KEY (category_id)
);

CREATE TABLE locations (
location_id SERIAL NOT NULL,
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
CONSTRAINT PK_locations PRIMARY KEY (location_id)
);

--locations data in locations.sql 

CREATE TABLE check_ins (
check_in_id SERIAL NOT NULL,
date_time TIMESTAMP,
location_id INTEGER,
user_id INTEGER,
CONSTRAINT PK_check_ins PRIMARY KEY (check_in_id),
FOREIGN KEY (location_id) REFERENCES locations(location_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);
--check_ins data will be procedurally generated


--INSERT CATEGORIES
INSERT INTO category (category_id, category) 
VALUES (5, 'Restaurants'), (3, 'Sports'), (4, 'Parks'), (1, 'Shopping'), (6, 'Historic Sites'), (2, 'Bars'), (7, 'Indoor'), (8, 'Outdoor'), (9, 'Fine Arts');


CREATE TABLE locations_category (
location_id INTEGER, 
category_id INTEGER
);

CREATE TABLE user_badge (
badge_id INTEGER,
user_id INTEGER,
FOREIGN KEY (badge_id) REFERENCES badges(badge_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE category_badge (
category_id INTEGER,
badge_id INTEGER,
FOREIGN KEY (category_id) REFERENCES category(category_id),
FOREIGN KEY (badge_id) REFERENCES badges(badge_id)
);

--LINK BADGES TO CORRESPONDING CATEGORIES
INSERT INTO category_badge (category_id, badge_id) VALUES (2, 2), (3,3), (4,4), (5,5), (6,6);

COMMIT TRANSACTION;


