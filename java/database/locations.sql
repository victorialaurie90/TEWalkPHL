
-- ~*~*~*~*~*LOCATION INFORMATION!!!*~*~*~*~*~

--LOVE PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Love Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '75.1657', '39.9543');
INSERT INTO locations_category (location_id, category_id) VALUES(1, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(1, 8);

--PENNYPACK PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Pennypack Park', 'Pennypack Park is a municipal park, in Northeast Philadelphia in the U.S. state of Pennsylvania. Established in 1905 by the City of Philadelphia, it includes about 1,600 acres of woodlands, meadows and wetlands.', 'Pennypack Trail, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/pennypack-park/', '', 'placeholder.jpg', '40.0401', '75.0300');
INSERT INTO locations_category (location_id, category_id) VALUES(2, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(2, 8);

--FDR PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('FDR Park', 'Large urban park offering a golf course, sports fields, fishing lakes & the American Swedish Museum.', 
'1500 Pattison Avenue &, S Broad St, Philadelphia, PA 19145', '21:00:00', '06:00:00', 'https://twitter.com/fdrpark', 'https://www.fdrparkphilly.org', 
'https://www.facebook.com/fdrpark',  'placeholder.jpg', '75.1838', '39.9021');
INSERT INTO locations_category (location_id, category_id) VALUES(3, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(3, 8);

--Mutter Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Mütter Museum', 'The Mütter Museum helps the public appreciate the mysteries and beauty of the human body while understanding the history of diagnosis and treatment of disease.', '19 S 22nd St, Philadelphia, PA 19103',  
'17:00:00', '10:00:00', 'https://twitter.com/muttermuseum', 'http://muttermuseum.org/', '', 'placeholder.jpg', '39.9532', '75.1764');
INSERT INTO locations_category (location_id, category_id) VALUES(4, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(4, 7);

--Eastern State
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Eastern State Penitentiary', 'Eastern State Penitentiary was once the most famous prisonS in the world, but stands today in ruin, a haunting world of crumbling cellblocks and empty guard towers.', 
'2027 Fairmount Ave, Philadelphia, PA 19130', '22:30:00', '10:00:00', 'https://twitter.com/easternstate', 'https://www.easternstate.org/', 'https://www.facebook.com/Eastern-State-Penitentiary-125028907507788/', 'placeholder.jpg', '39.9683', '75.1727');
INSERT INTO locations_category (location_id, category_id) VALUES(5, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(5, 7);

--Franklin Institute
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Franklin Institute', 'Located in the heart of Philadelphia, The Franklin Institute is one of America''s most celebrated museums—a renowned leader in science and technology.', '222 N 20th St, Philadelphia, PA 19103',  
'18:00:00', '10:00:00', 'https://twitter.com/thefranklin', 'https://www.fi.edu/', 'https://www.facebook.com/TheFranklinInstitute/', 'placeholder.jpg', '39.9582', '75.1731');
INSERT INTO locations_category (location_id, category_id) VALUES(6, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(6, 7);

--Art Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia.', '2600 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', 'https://twitter.com/philamuseum', 'https://philamuseum.org/visit', 'https://www.facebook.com/philamuseum/', 'placeholder.jpg', '39.9656', '75.1810');
INSERT INTO locations_category (location_id, category_id) VALUES(7, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(7, 9);

--Mann Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('The Mann Center', 'The Mann Center for the Performing Arts is a nonprofit performing arts center located in the Centennial District of Philadelphia''s West Fairmount Park, built in 1976 as the summer home for the Philadelphia Orchestra.', '5201 Parkside Ave, Philadelphia, PA 19131',  
'24:00:00', '00:00:00', 'https://twitter.com/manncenter', 'https://manncenter.org/', 'https://www.facebook.com/themanncenter/', 'placeholder.jpg', '39.5859', '75.1322');
INSERT INTO locations_category (location_id, category_id) VALUES(8, 8);
INSERT INTO locations_category (location_id, category_id) VALUES(8, 9);

--Kimmel Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Kimmel Cultural Campus', 'The Kimmel Center for the Performing Arts is a large performing arts venue at 300 South Broad Street and the corner of Spruce Street, along the stretch known as the "Avenue of the Arts", in Center City, Philadelphia, Pennsylvania.', '300 S Broad St, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', 'https://twitter.com/kimmelcenter', 'https://www.kimmelculturalcampus.org/', 'https://www.facebook.com/KimmelCulturalCampus/', 'placeholder.jpg', '39.9467', '75.1657');
INSERT INTO locations_category (location_id, category_id) VALUES(9, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(9, 9);

--South Philly Taproom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('South Philadelphia Taproom', 'American beer bar featuring a lineup of drafts that rotates often, plus unique kitchen creations.', '1509 Mifflin St, Philadelphia, PA 19145',  
'24:00:00', '12:00:00', 'https://twitter.com/SPTapRoom', 'http://southphiladelphiataproom.com', 'https://www.facebook.com/southphiladelphiataproom', 'placeholder.jpg', '75.1715', '39.9272');
INSERT INTO locations_category (location_id, category_id) VALUES(10, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(10, 7);

--Oscar's Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Oscar''s Tavern', 'Old-school haunt dishing up pub grub & cocktails amid red booths, wood-paneled walls & a jukebox.', '1524 Sansom St, Philadelphia, PA 19102',  
'2:00:00', '11:00:00', '', '', 'https://www.facebook.com/pages/category/Dive-Bar/Oscars-Tavern-187176721252/', 'placeholder.jpg', '75.1668', '39.9504');
INSERT INTO locations_category (location_id, category_id) VALUES(11, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(11, 7);

--Kosta's
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Kosta''s Bar and Restaurant', 'Casual, contemporary Greek restaurant & bar featuring TVs, pool tables & a back patio.', '15 W Girard Ave, Philadelphia, PA 19123',  
'2:00:00', '15:00:00', '', 'https://kostasfishtown.com', 'https://www.facebook.com/KostasPhilly', 'placeholder.jpg', '75.1349', '39.9504');
INSERT INTO locations_category (location_id, category_id) VALUES(12, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(12, 7);

--Citizen's Bank
VALUES ('Citizens Bank Park', 'Citizens Bank Park is a baseball park located in Philadelphia, Pennsylvania, within the city''s South Philadelphia Sports Complex. It is the home of the Philadelphia Phillies, the city''s Major League Baseball franchise.', '1 Citizens Bank Way, Philadelphia, PA 19148',  
'12:00:00', '09:00:00', 'https://twitter.com/philliescbp', 'https://www.mlb.com/phillies/ballpark', 'https://www.facebook.com/CitizensBankPark', 'placeholder.jpg', '75.1665', '39.9061');
INSERT INTO locations_category (location_id, category_id) VALUES(13, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(13, 8);

--Dahlak
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Dahlak', 'Exotic Ethiopian & Eritrean specialties are served family-style & washed down with wine & beer.', '4708 Baltimore Ave, Philadelphia, PA 19143',  
'9:00:00', '16:00:00', 'https://twitter.com/dahlak_paradise', 'https://www.dahlakrestaurant.com', 'https://www.facebook.com/DahlakParadise', 'placeholder.jpg', '75.21728', '39.94849');
INSERT INTO locations_category (location_id, category_id) VALUES(14, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(14, 7);

--Dolphin Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long)
VALUES ('Dolphin Tavern', 'Hip club with a throwback vibe offering craft beer, glowing walls (& murals), go-go dancers & DJs.', '1539 S Broad St, Philadelphia, PA 19147',  
'2:00:00', '16:00:00', 'https://twitter.com/dolphinphilly?lang=en', 'http://www.dolphinphilly.com', 'https://www.facebook.com/DolphinPhilly', 'placeholder.jpg', '75.16797', '39.93080');
INSERT INTO locations_category (location_id, category_id) VALUES(15, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(15, 7);
