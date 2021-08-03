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
DROP COLUMN category_id;

CREATE TABLE locations_category
(location_id INTEGER, category_id INTEGER);

ALTER TABLE badges
ADD COLUMN badge_description VARCHAR(255);

-- ~*~*~*~*~*LOCATION INFORMATION!!!*~*~*~*~*~

--LOVE PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Love Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '75.1657', '39.9543');


--PENNYPACK PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Pennypack Park', 'Pennypack Park is a municipal park, in Northeast Philadelphia in the U.S. state of Pennsylvania. Established in 1905 by the City of Philadelphia, it includes about 1,600 acres of woodlands, meadows and wetlands.', 'Pennypack Trail, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/pennypack-park/', '', 'placeholder.jpg', '40.0401', '75.0300');

--FDR PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES 'FDR Park', 'Large urban park offering a golf course, sports fields, fishing lakes & the American Swedish Museum.', 
'1500 Pattison Avenue &, S Broad St, Philadelphia, PA 19145', '21:00:00', '06:00:00', 'https://twitter.com/fdrpark', 'https://www.fdrparkphilly.org', 
'https://www.facebook.com/fdrpark',  'placeholder.jpg', '75.1838', '39.9021');

--Mutter Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Mütter Museum', 'The Mütter Museum helps the public appreciate the mysteries and beauty of the human body while understanding the history of diagnosis and treatment of disease.', '19 S 22nd St, Philadelphia, PA 19103',  
'17:00:00', '10:00:00', 'https://twitter.com/muttermuseum', 'http://muttermuseum.org/', '', 'placeholder.jpg', '39.9532', '75.1764');

--Eastern State
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Eastern State Penitentiary', 'Eastern State Penitentiary was once the most famous and expensive prison in the world, but stands today in ruin, a haunting world of crumbling cellblocks and empty guard towers. Its vaulted, sky-lit cells once held many of America''s most notorious lawbreakers, including "Slick Willie" Sutton and "Scarface" Al Capone.', 
'2027 Fairmount Ave, Philadelphia, PA 19130', '22:30:00', '10:00:00', 'https://twitter.com/easternstate', 'https://www.easternstate.org/', 'https://www.facebook.com/Eastern-State-Penitentiary-125028907507788/', 'placeholder.jpg', '39.9683', '75.1727');

--Franklin Institute
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Franklin Institute', 'Located in the heart of Philadelphia, The Franklin Institute is one of America''s most celebrated museums—a renowned leader in science and technology.', '222 N 20th St, Philadelphia, PA 19103',  
'18:00:00', '10:00:00', 'https://twitter.com/thefranklin', 'https://www.fi.edu/', 'https://www.facebook.com/TheFranklinInstitute/', 'placeholder.jpg', '39.9582', '75.1731');

--Art Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia.', '2600 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', 'https://twitter.com/philamuseum', 'https://philamuseum.org/visit', 'https://www.facebook.com/philamuseum/', 'placeholder.jpg', '39.9656', '75.1810');

--Mann Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Mann Center', 'The Mann Center for the Performing Arts is a nonprofit performing arts center located in the Centennial District of Philadelphia''s West Fairmount Park, built in 1976 as the summer home for the Philadelphia Orchestra.', '5201 Parkside Ave, Philadelphia, PA 19131',  
'24:00:00', '00:00:00', 'https://twitter.com/manncenter', 'https://manncenter.org/', 'https://www.facebook.com/themanncenter/', 'placeholder.jpg', '39.5859', '75.1322');

--Kimmel Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Kimmel Cultural Campus', 'The Kimmel Center for the Performing Arts is a large performing arts venue at 300 South Broad Street and the corner of Spruce Street, along the stretch known as the "Avenue of the Arts", in Center City, Philadelphia, Pennsylvania.', '300 S Broad St, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', 'https://twitter.com/kimmelcenter', 'https://www.kimmelculturalcampus.org/', 'https://www.facebook.com/KimmelCulturalCampus/', 'placeholder.jpg', '39.9467', '75.1657');

--South Philly Taproom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('South Philadelphia Taproom', 'American beer bar featuring a lineup of drafts that rotates often, plus unique kitchen creations.', '1509 Mifflin St, Philadelphia, PA 19145',  
'24:00:00', '12:00:00', 'https://twitter.com/SPTapRoom', 'http://southphiladelphiataproom.com', 'https://www.facebook.com/southphiladelphiataproom', 'placeholder.jpg', '75.1715', '39.9272');

--Oscar's Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Oscar''s Tavern', 'Old-school haunt dishing up pub grub & cocktails amid red booths, wood-paneled walls & a jukebox.', '1524 Sansom St, Philadelphia, PA 19102',  
'2:00:00', '11:00:00', '', '', 'https://www.facebook.com/pages/category/Dive-Bar/Oscars-Tavern-187176721252/', 'placeholder.jpg', '75.1668', '39.9504');

--Kosta's
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Kosta''s Bar and Restaurant', 'Casual, contemporary Greek restaurant & bar featuring TVs, pool tables & a back patio.', '15 W Girard Ave, Philadelphia, PA 19123',  
'2:00:00', '15:00:00', '', 'https://kostasfishtown.com', 'https://www.facebook.com/KostasPhilly', 'placeholder.jpg', '75.1349', '39.9504');
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)

--Citizen's Bank
VALUES ('Citizens Bank Park', 'Citizens Bank Park is a baseball park located in Philadelphia, Pennsylvania, within the city''s South Philadelphia Sports Complex. It is the home of the Philadelphia Phillies, the city''s Major League Baseball franchise.', '1 Citizens Bank Way, Philadelphia, PA 19148',  
'12:00:00', '09:00:00', 'https://twitter.com/philliescbp', 'https://www.mlb.com/phillies/ballpark', 'https://www.facebook.com/CitizensBankPark', 'placeholder.jpg', '75.1665', '39.9061');

--Dahlak
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Dahlak', 'Exotic Ethiopian & Eritrean specialties are served family-style & washed down with wine & beer.', '4708 Baltimore Ave, Philadelphia, PA 19143',  
'9:00:00', '16:00:00', 'https://twitter.com/dahlak_paradise', 'https://www.dahlakrestaurant.com', 'https://www.facebook.com/DahlakParadise', 'placeholder.jpg', '75.21728', '39.94849');

--Dolphin Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Dolphin Tavern', 'Hip club with a throwback vibe offering craft beer, glowing walls (& murals), go-go dancers & DJs.', '1539 S Broad St, Philadelphia, PA 19147',  
'2:00:00', '16:00:00', 'https://twitter.com/dolphinphilly?lang=en', 'http://www.dolphinphilly.com', 'https://www.facebook.com/DolphinPhilly', 'placeholder.jpg', '75.16797', '39.93080');


--TEST DATA FOR USER_BADGE AND CHECK_INS
INSERT INTO user_badge (badge_id, user_id) VALUES (1, 1);
INSERT INTO check_ins (date_time, location_id, user_id) VALUES ('2021-08-02 00:00:01', 3, 1);