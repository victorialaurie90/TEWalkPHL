BEGIN TRANSACTION;

DROP TABLE IF EXISTS locations_category;
DROP TABLE IF EXISTS user_badge;
DROP TABLE IF EXISTS category_badge;
DROP TABLE IF EXISTS badges CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS check_ins CASCADE;
DROP TABLE IF EXISTS locations CASCADE;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('test','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('sample','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('gritty','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');


CREATE TABLE badges (
badge_id SERIAL NOT NULL,
badge_name VARCHAR,
badge_description VARCHAR(255),
badge_url VARCHAR(255),
CONSTRAINT PK_badges PRIMARY KEY (badge_id) 
);

--INSERT BADGES
INSERT INTO badges (badge_id, badge_name, badge_description, badge_url)
VALUES (1, 'Defender of the Land', 'Check in at every location in WalkPHL', 'map.png'),
(2, 'Bar Hopper', 'Check in at 5 bars', 'drink.png'),
(3, 'Sports Enthusiast', 'Check in at 5 sports arenas', 'stadium.png'),
(4, 'Tree Hugger', 'Check in at 5 parks', 'trees.png'),
(5, 'Jeet Yet?', 'Check in at 5 restaurants', 'pancakes.png'),
(6, 'You Know, I''m Something of a Historian Myself', 'Check in at 5 historic sites', 'museum.png'),
(7, 'City of Brotherly Love', 'Check in at 5 locations with another user', 'family.png');

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
categories VARCHAR(255),
isFeatured BOOLEAN DEFAULT false,
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
category_id INTEGER,
FOREIGN KEY (location_id) REFERENCES locations(location_id),
FOREIGN KEY (category_id) REFERENCES category(category_id)
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

-- ~*~*~*~*~*LOCATION INFORMATION!!!*~*~*~*~*~

--LOVE PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Love Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'love_park', '39.9543', '-75.1657', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(1, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(1, 8);

--PENNYPACK PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Pennypack Park', 'Pennypack Park is a municipal park, in Northeast Philadelphia. Established in 1905, it includes about 1,600 acres of woodlands, meadows and wetlands.', 'Pennypack Trail, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/pennypack-park/', '', '../assets/locationPictures/pennypack.jpg', '40.0401', '-75.0300', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(2, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(2, 8);

--FDR PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('FDR Park', 'Large urban park offering a golf course, sports fields, fishing lakes, and the American Swedish Museum.', 
'1500 Pattison Avenue &, S Broad St, Philadelphia, PA 19145', '21:00:00', '06:00:00', 'https://twitter.com/fdrpark', 'https://www.fdrparkphilly.org', 
'https://www.facebook.com/fdrpark',  '../assets/locationPictures/fdr.jpg', '39.9021', '-75.1838', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(3, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(3, 8);

--Mutter Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Mutter Museum', 'The Mutter Museum helps the public appreciate the mysteries and beauty of the human body while understanding the history of diagnosis and treatment of disease.', '19 S 22nd St, Philadelphia, PA 19103',  
'17:00:00', '10:00:00', 'https://twitter.com/muttermuseum', 'http://muttermuseum.org/', '', '../assets/locationPictures/mutter.jpg', '39.9532', '-75.1764', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(4, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(4, 7);

--Eastern State
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Eastern State Penitentiary', 'Eastern State Penitentiary was once the most famous prisons in the world, but stands today in ruin, a haunting world of crumbling cellblocks and empty guard towers.', 
'2027 Fairmount Ave, Philadelphia, PA 19130', '22:30:00', '10:00:00', 'https://twitter.com/easternstate', 'https://www.easternstate.org/', 'https://www.facebook.com/Eastern-State-Penitentiary-125028907507788/', '../assets/locationPictures/easternState.jpg', '39.9683', '-75.1727', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(5, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(5, 7);

--Franklin Institute
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Franklin Institute', 'Located in the heart of Philadelphia, The Franklin Institute is one of America''s most celebrated museums and is a renowned leader in science and technology.', '222 N 20th St, Philadelphia, PA 19103',  
'18:00:00', '10:00:00', 'https://twitter.com/thefranklin', 'https://www.fi.edu/', 'https://www.facebook.com/TheFranklinInstitute/', '../assets/locationPictures/franklinInstitute.jpg', '39.9582', '-75.1731', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(6, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(6, 7);

--Art Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia.', '2600 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', 'https://twitter.com/philamuseum', 'https://philamuseum.org/visit', 'https://www.facebook.com/philamuseum/', '../assets/locationPictures/artMuseum.jpg', '39.9656', '-75.1810', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(7, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(7, 9);

--Mann Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Mann Center', 'The Mann Center for the Performing Arts is a nonprofit performing arts center located in West Fairmount Park, built in 1976 as the summer home for the Philadelphia Orchestra.', '5201 Parkside Ave, Philadelphia, PA 19131',  
'24:00:00', '00:00:00', 'https://twitter.com/manncenter', 'https://manncenter.org/', 'https://www.facebook.com/themanncenter/', '../assets/locationPictures/mann_centerjpg.jpg', '39.98061', '-75.221069', 'Outdoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(8, 8);
INSERT INTO locations_category (location_id, category_id) VALUES(8, 9);

--Kimmel Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Kimmel Cultural Campus', 'The Kimmel Center for the Performing Arts is a large performing arts venue located along the stretch known as the "Avenue of the Arts" in Center City.', '300 S Broad St, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', 'https://twitter.com/kimmelcenter', 'https://www.kimmelculturalcampus.org/', 'https://www.facebook.com/KimmelCulturalCampus/', '../assets/locationPictures/kimmel.jpg', '39.9467', '-75.1657', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(9, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(9, 9);

--South Philly Taproom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('South Philadelphia Taproom', 'American beer bar featuring a lineup of drafts that rotates often, plus unique kitchen creations.', '1509 Mifflin St, Philadelphia, PA 19145',  
'24:00:00', '12:00:00', 'https://twitter.com/SPTapRoom', 'http://southphiladelphiataproom.com', 'https://www.facebook.com/southphiladelphiataproom', '../assets/locationPictures/southPhillyTaproom.jpg', '39.9272', '-75.1715', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(10, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(10, 7);

--Oscar's Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Oscar''s Tavern', 'Old-school haunt dishing up pub grub and cocktails amid red booths, wood-paneled walls, and a jukebox.', '1524 Sansom St, Philadelphia, PA 19102',  
'2:00:00', '11:00:00', '', '', 'https://www.facebook.com/pages/category/Dive-Bar/Oscars-Tavern-187176721252/', '../assets/locationPictures/oscars.jpg', '39.9504', '-75.1668', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(11, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(11, 7);

--Kosta's
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Kosta''s Bar and Restaurant', 'Casual, contemporary Greek restaurant and bar featuring TVs, pool tables, and a back patio.', '15 W Girard Ave, Philadelphia, PA 19123',  
'2:00:00', '15:00:00', '', 'https://kostasfishtown.com', 'https://www.facebook.com/KostasPhilly', '../assets/locationPictures/kostas.jpeg', '39.9504', '-75.1349', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(12, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(12, 7);

--Citizens Bank
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Citizens Bank Park', 'Citizens Bank Park is a baseball park located in the South Philadelphia Sports Complex. It is the home of the Philadelphia Phillies, the city''s Major League Baseball franchise.', '1 Citizens Bank Way, Philadelphia, PA 19148',  
'12:00:00', '09:00:00', 'https://twitter.com/philliescbp', 'https://www.mlb.com/phillies/ballpark', 'https://www.facebook.com/CitizensBankPark', '../assets/locationPictures/citBank.jpg', '39.9061', '-75.1665', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(13, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(13, 8);

--Lincoln Financial Field
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Lincoln Financial Field', 'Lincoln Financial Field is an outdoor football stadium located in the South Philadelphia Sports Complex. It seats over 67,000 people and is home field for the Philadelphia Eagles.', 'One Lincoln Financial Field Way, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/LFFStadium', 'https://www.lincolnfinancialfield.com', 'https://www.facebook.com/lincolnfinancialfield/', '../assets/locationPictures/linc.jpg', '39.90140', '-75.16794', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(14, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(14, 8);

--Wells Fargo Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Wells Fargo Center', 'The Wells Fargo Center is a multi-purpose arena located in the South Philadelphia Sports Complex. It serves as the home of the Philadelphia Flyers, the Philadelphia 76ers, and the Philadelphia Wings.', '3601 S Broad St, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/WellsFargo', 'https://www.wellsfargocenterphilly.com', 'https://www.facebook.com/wellsfargocenter/', '../assets/locationPictures/wellsFargo.jpg', '39.9012', '-75.1720', 'Sports, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(15, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(15, 7);

--2300 Arena
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('2300 Arena', '2300 Arena is a multipurpose indoor arena used primarily for professional wrestling, boxing, mixed martial arts, and concert events.', '2300 S Swanson St, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/WellsFargo', 'https://www.wellsfargocenterphilly.com', 'https://www.facebook.com/wellsfargocenter/', '../assets/locationPictures/2300_Arena.jpg', '39.91816', '-75.14730', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(16, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(16, 8);

--Dahlak
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Dahlak', 'Exotic Ethiopian and Eritrean specialties are served family-style and washed down with wine and beer.', '4708 Baltimore Ave, Philadelphia, PA 19143',  
'9:00:00', '16:00:00', 'https://twitter.com/dahlak_paradise', 'https://www.dahlakrestaurant.com', 'https://www.facebook.com/DahlakParadise', '../assets/locationPictures/dahlak.jpg', '39.94849', '-75.21728', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(17, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(17, 7);

--Dolphin Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Dolphin Tavern', 'Hip club with a throwback vibe offering craft beer, glowing walls and murals, go-go dancers, and DJs.', '1539 S Broad St, Philadelphia, PA 19147',  
'2:00:00', '16:00:00', 'https://twitter.com/dolphinphilly?lang=en', 'http://www.dolphinphilly.com', 'https://www.facebook.com/DolphinPhilly', '../assets/locationPictures/dolphin.jpg', '39.93080', '-75.16797', 'Bars, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(18, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(18, 7);

--Clark Park
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Clark Park', 'Clark Park is a municipal park in the Spruce Hill section of West Philadelphia.', 
'4300-4398 Baltimore Ave, Philadelphia, PA 19104', '24:00:00', '00:00:00', 'https://twitter.com/clarkpark', 'https://www.visitphilly.com/things-to-do/attractions/clark-park/', 
'https://m.facebook.com/profile.php?id=111787182171790',  '../assets/locationPictures/clarkPark.jpg', '39.9489', '-75.2104', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(19, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(19, 8);

--Malcolm X Park
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Malcolm X Park', 'Tree-shaded city park featuring a playground, covered benches, and paved walking paths.', 
'5100 Pine St, Philadelphia, PA 19143', '22:00:00', '05:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/clark-park/', 
'https://www.facebook.com/malcolmxpark/',  '../assets/locationPictures/malcomX.jpg', '39.9526639', '-75.225427', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(20, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(20, 8);

--Liberty Bell
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Liberty Bell', 'The Liberty Bell, previously called the State House Bell or Old State House Bell, is an iconic symbol of American independence.', 
'526 Market St, Philadelphia, PA 19106', '17:00:00', '09:00:00', '', 'https://www.nps.gov/inde/learn/historyculture/stories-libertybell.html', '', '../assets/locationPictures/libertyBell.jpg', '39.9496', '-75.1503', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(21, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(21, 7);

--Carpenters' Hall
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Carpenters'' Hall', 'Carpenters'' Hall is the official birthplace of the Commonwealth of Pennsylvania and a key meeting place in the early history of the United States.', 
'320 Chestnut St, Philadelphia, PA 19106', '16:00:00', '10:00:00', '', 'https://www.carpentershall.org/', 'https://www.facebook.com/CarpentersHallPhiladelphia/', '../assets/locationPictures/carpHall.jpg', '39.9481', '-75.1472', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(22, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(22, 7);

--Rodin Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Rodin Museum', 'The Rodin Museum is an art museum that contains one of the largest collections of sculptor Auguste Rodin''s works outside Paris.', '2151 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', '', 'https://www.rodinmuseum.org/', '', '../assets/locationPictures/rodin.jpg', '39.9619', '-75.1740', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(23, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(23, 9);

--Pennsylvania Academy of the Fine Arts
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Pennsylvania Academy of the Fine Arts', 'Founded in 1805 as the first art school and museum in the United States, PAFA celebrates the transformative power of art and art-making.', '118-128 N Broad St, Philadelphia, PA 19102',  
'16:00:00', '10:00:00', '', 'https://www.pafa.org/', 'https://www.facebook.com/PAFAcademy', '../assets/locationPictures/pafa.jpg', '39.9552373', '-75.1636673', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(24, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(24, 9);

--Three Monkeys Cafe
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Three Monkeys Cafe', 'Monkey-themed restaurant serving American food & drinks in vintage rooms and on a spacious outdoor patio.', '9645 James St, Philadelphia, PA 19114',  
'22:00:00', '11:00:00', '', '3monkeyscafe.com', 'https://www.facebook.com/3monkeyscafephilly/', '../assets/locationPictures/threeMonkey.jpg', '40.053799', '-74.983940', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(25, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(25, 7);

--Tattooed Mom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Tattooed Mom', 'Relaxed hipster bar with food and drink specials, pool tables, plus toys and candy on the bar.', '530 South St, Philadelphia, PA 19147',  
'21:00:00', '16:00:00', '', 'https://www.tattooedmomphilly.com/', 'https://www.facebook.com/tattooedmomphilly/', '../assets/locationPictures/tattooedMom.jpg', '39.941938', '-75.151813', 'Bars, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(26, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(26, 7);

--Vedge
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Vedge', 'Restaurant serving inventive vegan and vegetarian small plates in a charming old mansion.', '1221 Locust St, Philadelphia, PA 19107',  
'21:00:00', '17:00:00', '', 'https://www.vedgerestaurant.com/', 'https://www.facebook.com/vedgerestaurant/', '../assets/locationPictures/vedge.jpg', '39.9479', '-75.1614', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(27, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(27, 7);

--Sazon
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Sazon', 'Arepas and other traditional Venezuelan fare, including several gluten-free options. Cash only.', '941 Spring Garden St, Philadelphia, PA 19123',  
'21:00:00', '17:00:00', '', '', 'https://www.facebook.com/Sazon-Restaurant-Caf%C3%A9-333060150261/', '../assets/locationPictures/sazon.jpg', '39.961849', '-75.154375', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(28, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(28, 7);

--Oyster House
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Oyster House', 'Oysters, lobster, and other East Coast-style seafood feature at this stylish eatery open since 1976.', '1516 Sansom St, Philadelphia, PA 19102',  
'21:00:00', '11:30:00', '', 'https://oysterhousephilly.com/', 'https://www.facebook.com/OysterHousePhilly/', '../assets/locationPictures/oysterHouse.jpg', '39.9502', '-75.1666', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(29, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(29, 7);

--Fusion Arena
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Fusion Arena', 'Esports arena home to the Overwatch competitive team Philadelphia Fusion.', '3300 S 7th St STE 1, Philadelphia, PA 19148',
'24:00:00', '00:00:00', 'https://twitter.com/Fusion', 'https://fusionarenaphilly.com/', 'https://www.facebook.com/PhiladelphiaFusion/', '../assets/locationPictures/fusionArena.jpg', '39.906750', '-75.162920', 'Sports, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(30, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(30, 7);

--TEST Tori's House
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('TEST Tori''s House', 'Outside of Philly test location.', '55 N 3rd St, Coplay, PA 18037',
'24:00:00', '00:00:00', '', '', '', '', '40.673599', '-75.493538', 'Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(30, 7);

--Insert test check ins to locations
INSERT INTO check_ins (date_time, location_id, user_id) VALUES 
(CURRENT_TIMESTAMP, 1, 1), (CURRENT_TIMESTAMP, 3, 1), (CURRENT_TIMESTAMP, 4, 1),
(CURRENT_TIMESTAMP, 6, 3), (CURRENT_TIMESTAMP, 30, 3), (CURRENT_TIMESTAMP, 14, 3),
(CURRENT_TIMESTAMP, 8, 4), (CURRENT_TIMESTAMP, 12, 4), (CURRENT_TIMESTAMP, 28, 4),
(CURRENT_TIMESTAMP, 15, 5), (CURRENT_TIMESTAMP, 15, 5), (CURRENT_TIMESTAMP, 15, 5), (CURRENT_TIMESTAMP, 15, 5);

--Insert test badges
INSERT INTO user_badge (badge_id, user_id) VALUES
(1,1), (2,1), (4,1);


COMMIT TRANSACTION;
