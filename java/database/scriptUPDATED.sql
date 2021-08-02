--ADD CATEGORY_ID TO CHECK_INS TABLE
ALTER TABLE check_ins
ADD COLUMN category_id INTEGER;

ALTER TABLE check_ins
ADD FOREIGN KEY(category_id) REFERENCES category (category_id)


--CREATE BADGES
INSERT INTO badges (badge_id, badge_name) VALUES (1, 'Defender of the Land'), (2, 'Bar Hopper'), 
(3, 'Sports Enthusiast'), (4, 'Tree Hugger'), (5, 'Jeet Yet?'), (6, 'You Know, I''m Something of a Historian Myself'),
(7, 'City of Brotherly Love');


--CREATE CATEGORIES
INSERT INTO category (category_id, category) VALUES (5, 'Restaurants'), (3, 'Sports'), (4, 'Parks'), 
(1, 'Shopping'), (6, 'Historic Sites'), (2, 'Bars'), (7, 'Indoor'), (8, 'Outdoor'), (9, 'Fine Arts');


--LINK BADGES TO CORRESPONDING CATEGORIES
INSERT INTO category_badge (category_id, badge_id) VALUES (2, 2), (3,3), (4,4), (5,5), (6,6);


--REMOVED CATEGORY_ID FROM LOCATIONS, CREATED LOCATIONS_CATEGORY TABLE
--ONE ENTRY PER LOCATION IN LOCATIONS TABLE
--LOCATIONS_CATEGORY TABLE TRACKS MULTIPLE CATEGORIES PER LOCATION
ALTER TABLE locations
DROP COLUMN category_id

CREATE TABLE locations_category
(location_id INTEGER, category_id INTEGER);

-- ~*~*~*~*~*LOCATION INFORMATION!!!*~*~*~*~*~
--SOUTH PHIADELPHIA TAPROOM
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('South Philadelphia Taproom', 'American beer bar featuring a lineup of drafts that rotates often, plus unique kitchen creations.', '1509 Mifflin St, Philadelphia, PA 19145',  
'24:00:00', '12:00:00', 'https://twitter.com/SPTapRoom', 'http://southphiladelphiataproom.com', 'https://www.facebook.com/southphiladelphiataproom', 'placeholder.jpg', '75.1715', '39.9272');

INSERT INTO locations_category (location_id, category_id) VALUES (1,2);
INSERT INTO locations_category (location_id, category_id) VALUES (1,5);
INSERT INTO locations_category (location_id, category_id) VALUES (1,7);
INSERT INTO locations_category (location_id, category_id) VALUES (1,8);



--LOVE PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Love Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '75.1657', '39.9543');

INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,4);
INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,8);

--PENNYPACK PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Pennypack Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '75.1657', '39.9543');

INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,4);
INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,8);

--FDR PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Franklin Deleanor Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '75.1657', '39.9543');

INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,4);
INSERT INTO locations_category (location_id, category_id) VALUES (ENTER,8);

--TEST DATA FOR USER_BADGE AND CHECK_INS
INSERT INTO user_badge (badge_id, user_id) VALUES (1, 1);
INSERT INTO check_ins (date_time, location_id, user_id) VALUES ('2021-08-02 00:00:01', 3, 1);