-- ~*~*~*~*~*LOCATION INFORMATION!!!*~*~*~*~*~

--LOVE PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Love Park', 'LOVE Park, officially known as John F. Kennedy Plaza, is a public park located in Center City.', 'Arch St, Philadelphia, PA 19102',  
'7:00:00', '22:00:00', 'https://twitter.com/loveparkphilly', 'https://www.visitphilly.com/things-to-do/attractions/love-park/', 'https://www.facebook.com/LOVEParkPhilly/', 'placeholder.jpg', '39.9543', '-75.1657', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(1, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(1, 8);

--PENNYPACK PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Pennypack Park', 'Pennypack Park is a municipal park, in Northeast Philadelphia in the U.S. state of Pennsylvania. Established in 1905 by the City of Philadelphia, it includes about 1,600 acres of woodlands, meadows and wetlands.', 'Pennypack Trail, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/pennypack-park/', '', 'placeholder.jpg', '40.0401', '-75.0300', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(2, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(2, 8);

--FDR PARK
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('FDR Park', 'Large urban park offering a golf course, sports fields, fishing lakes & the American Swedish Museum.', 
'1500 Pattison Avenue &, S Broad St, Philadelphia, PA 19145', '21:00:00', '06:00:00', 'https://twitter.com/fdrpark', 'https://www.fdrparkphilly.org', 
'https://www.facebook.com/fdrpark',  'placeholder.jpg', '39.9021', '-75.1838', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(3, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(3, 8);

--Mutter Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Mutter Museum', 'The Mutter Museum helps the public appreciate the mysteries and beauty of the human body while understanding the history of diagnosis and treatment of disease.', '19 S 22nd St, Philadelphia, PA 19103',  
'17:00:00', '10:00:00', 'https://twitter.com/muttermuseum', 'http://muttermuseum.org/', '', 'placeholder.jpg', '39.9532', '-75.1764', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(4, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(4, 7);

--Eastern State
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Eastern State Penitentiary', 'Eastern State Penitentiary was once the most famous prisonS in the world, but stands today in ruin, a haunting world of crumbling cellblocks and empty guard towers.', 
'2027 Fairmount Ave, Philadelphia, PA 19130', '22:30:00', '10:00:00', 'https://twitter.com/easternstate', 'https://www.easternstate.org/', 'https://www.facebook.com/Eastern-State-Penitentiary-125028907507788/', 'placeholder.jpg', '39.9683', '-75.1727', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(5, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(5, 7);

--Franklin Institute
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Franklin Institute', 'Located in the heart of Philadelphia, The Franklin Institute is one of America''s most celebrated museums�a renowned leader in science and technology.', '222 N 20th St, Philadelphia, PA 19103',  
'18:00:00', '10:00:00', 'https://twitter.com/thefranklin', 'https://www.fi.edu/', 'https://www.facebook.com/TheFranklinInstitute/', 'placeholder.jpg', '39.9582', '-75.1731', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(6, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(6, 7);

--Art Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia.', '2600 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', 'https://twitter.com/philamuseum', 'https://philamuseum.org/visit', 'https://www.facebook.com/philamuseum/', 'placeholder.jpg', '39.9656', '-75.1810', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(7, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(7, 9);

--Mann Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('The Mann Center', 'The Mann Center for the Performing Arts is a nonprofit performing arts center located in the Centennial District of Philadelphia''s West Fairmount Park, built in 1976 as the summer home for the Philadelphia Orchestra.', '5201 Parkside Ave, Philadelphia, PA 19131',  
'24:00:00', '00:00:00', 'https://twitter.com/manncenter', 'https://manncenter.org/', 'https://www.facebook.com/themanncenter/', 'placeholder.jpg', '39.5859', '-75.1322', 'Outdoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(8, 8);
INSERT INTO locations_category (location_id, category_id) VALUES(8, 9);

--Kimmel Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Kimmel Cultural Campus', 'The Kimmel Center for the Performing Arts is a large performing arts venue at 300 South Broad Street and the corner of Spruce Street, along the stretch known as the "Avenue of the Arts", in Center City, Philadelphia, Pennsylvania.', '300 S Broad St, Philadelphia, PA 19102',  
'24:00:00', '00:00:00', 'https://twitter.com/kimmelcenter', 'https://www.kimmelculturalcampus.org/', 'https://www.facebook.com/KimmelCulturalCampus/', 'placeholder.jpg', '39.9467', '-75.1657', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(9, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(9, 9);

--South Philly Taproom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('South Philadelphia Taproom', 'American beer bar featuring a lineup of drafts that rotates often, plus unique kitchen creations.', '1509 Mifflin St, Philadelphia, PA 19145',  
'24:00:00', '12:00:00', 'https://twitter.com/SPTapRoom', 'http://southphiladelphiataproom.com', 'https://www.facebook.com/southphiladelphiataproom', 'placeholder.jpg', '39.9272', '-75.1715', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(10, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(10, 7);

--Oscar's Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Oscar''s Tavern', 'Old-school haunt dishing up pub grub & cocktails amid red booths, wood-paneled walls & a jukebox.', '1524 Sansom St, Philadelphia, PA 19102',  
'2:00:00', '11:00:00', '', '', 'https://www.facebook.com/pages/category/Dive-Bar/Oscars-Tavern-187176721252/', 'placeholder.jpg', '39.9504', '-75.1668', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(11, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(11, 7);

--Kosta's
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Kosta''s Bar and Restaurant', 'Casual, contemporary Greek restaurant & bar featuring TVs, pool tables & a back patio.', '15 W Girard Ave, Philadelphia, PA 19123',  
'2:00:00', '15:00:00', '', 'https://kostasfishtown.com', 'https://www.facebook.com/KostasPhilly', 'placeholder.jpg', '39.9504', '-75.1349', 'Indoor, Bars');
INSERT INTO locations_category (location_id, category_id) VALUES(12, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(12, 7);

--Citizens Bank
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Citizens Bank Park', 'Citizens Bank Park is a baseball park located in Philadelphia, Pennsylvania, within the city''s South Philadelphia Sports Complex. It is the home of the Philadelphia Phillies, the city''s Major League Baseball franchise.', '1 Citizens Bank Way, Philadelphia, PA 19148',  
'12:00:00', '09:00:00', 'https://twitter.com/philliescbp', 'https://www.mlb.com/phillies/ballpark', 'https://www.facebook.com/CitizensBankPark', 'placeholder.jpg', '39.9061', '-75.1665', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(13, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(13, 8);

--Lincoln Financial Field
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Lincoln Financial Field', 'This outdoor football stadium seats over 67,000 people & is home field for the Philadelphia Eagles.', 'One Lincoln Financial Field Way, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/LFFStadium', 'https://www.lincolnfinancialfield.com', 'https://www.facebook.com/lincolnfinancialfield/', 'placeholder.jpg', '39.90140', '-75.16794', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(14, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(14, 8);

--Wells Fargo Center
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Wells Fargo Center', 'The Wells Fargo Center is a multi-purpose arena located in Philadelphia. It serves as the home of the Philadelphia Flyers, the Philadelphia 76ers, and the Philadelphia Wings.', '3601 S Broad St, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/WellsFargo', 'https://www.wellsfargocenterphilly.com', 'https://www.facebook.com/wellsfargocenter/', 'placeholder.jpg', '39.9012', '-75.1720', 'Sports, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(15, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(15, 7);

--2300 Arena
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('2300 Arena', '2300 Arena is a multipurpose indoor arena in Philadelphia, Pennsylvania used primarily for professional wrestling, boxing, mixed martial arts, and concert events.', '2300 S Swanson St, Philadelphia, PA 19148',
'12:00:00', '09:00:00', 'https://twitter.com/WellsFargo', 'https://www.wellsfargocenterphilly.com', 'https://www.facebook.com/wellsfargocenter/', 'placeholder.jpg', '39.9012', '-75.1720', 'Sports, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(16, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(16, 8);

--Dahlak
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Dahlak', 'Exotic Ethiopian & Eritrean specialties are served family-style & washed down with wine & beer.', '4708 Baltimore Ave, Philadelphia, PA 19143',  
'9:00:00', '16:00:00', 'https://twitter.com/dahlak_paradise', 'https://www.dahlakrestaurant.com', 'https://www.facebook.com/DahlakParadise', 'placeholder.jpg', '39.94849', '-75.21728', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(17, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(17, 7);

--Dolphin Tavern
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Dolphin Tavern', 'Hip club with a throwback vibe offering craft beer, glowing walls (& murals), go-go dancers & DJs.', '1539 S Broad St, Philadelphia, PA 19147',  
'2:00:00', '16:00:00', 'https://twitter.com/dolphinphilly?lang=en', 'http://www.dolphinphilly.com', 'https://www.facebook.com/DolphinPhilly', 'placeholder.jpg', '39.93080', '-75.16797', 'Bars, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(18, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(18, 7);

--Clark Park
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Clark Park', 'Clark Park is a municipal park in the Spruce Hill section of West Philadelphia.', 
'4300-4398 Baltimore Ave, Philadelphia, PA 19104', '24:00:00', '00:00:00', 'https://twitter.com/clarkpark', 'https://www.visitphilly.com/things-to-do/attractions/clark-park/', 
'https://m.facebook.com/profile.php?id=111787182171790',  'placeholder.jpg', '39.9489', '-75.2104', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(19, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(19, 8);

--Malcolm X Park
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Malcolm X Park', 'Tree-shaded city park featuring a playground, covered benches & paved walking paths.', 
'5100 Pine St, Philadelphia, PA 19143', '22:00:00', '05:00:00', '', 'https://www.visitphilly.com/things-to-do/attractions/clark-park/', 
'https://www.facebook.com/malcolmxpark/',  'placeholder.jpg', '39.9526639', '-75.225427', 'Parks, Outdoor');
INSERT INTO locations_category (location_id, category_id) VALUES(20, 4);
INSERT INTO locations_category (location_id, category_id) VALUES(20, 8);

--Liberty Bell
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Liberty Bell', 'The Liberty Bell, previously called the State House Bell or Old State House Bell, is an iconic symbol of American independence.', 
'526 Market St, Philadelphia, PA 19106', '17:00:00', '09:00:00', '', 'https://www.nps.gov/inde/learn/historyculture/stories-libertybell.html', '', 'placeholder.jpg', '39.9496', '-75.1503', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(21, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(21, 7);

--Carpenters' Hall
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Carpenters'' Hall', 'Carpenters'' Hall is the official birthplace of the Commonwealth of Pennsylvania and a key meeting place in the early history of the United States.', 
'320 Chestnut St, Philadelphia, PA 19106', '16:00:00', '10:00:00', '', 'https://www.carpentershall.org/', 'https://www.facebook.com/CarpentersHallPhiladelphia/', 'placeholder.jpg', '39.9481', '-75.1472', 'Historic Sites, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(22, 6);
INSERT INTO locations_category (location_id, category_id) VALUES(22, 7);

--Rodin Museum
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Rodin Museum', 'The Rodin Museum is an art museum located in Philadelphia, Pennsylvania that contains one of the largest collections of sculptor Auguste Rodin''s works outside Paris.', '2151 Benjamin Franklin Pkwy, Philadelphia, PA 19130',  
'17:00:00', '10:00:00', '', 'https://www.rodinmuseum.org/', '', 'placeholder.jpg', '39.9619', '-75.1740', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(23, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(23, 9);

--Pennsylvania Academy of the Fine Arts
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Pennsylvania Academy of the Fine Arts', 'Founded in 1805 as the first art school and museum in the United States, PAFA celebrates the transformative power of art and art-making.', '118-128 N Broad St, Philadelphia, PA 19102',  
'16:00:00', '10:00:00', '', 'https://www.pafa.org/', 'https://www.facebook.com/PAFAcademy', 'placeholder.jpg', '39.5718', '-75.950', 'Indoor, Fine Arts');
INSERT INTO locations_category (location_id, category_id) VALUES(24, 7);
INSERT INTO locations_category (location_id, category_id) VALUES(24, 9);

--Three Monkeys Cafe
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Three Monkeys Cafe', 'Monkey-themed restaurant serving American food & drinks in vintage rooms & on the spacious outdoor patio.', '9645 James St, Philadelphia, PA 19114',  
'22:00:00', '11:00:00', '', '3monkeyscafe.com', 'https://www.facebook.com/3monkeyscafephilly/', 'placeholder.jpg', '40.053799', '-74.983940', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(25, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(25, 7);

--Tattooed Mom
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Tattooed Mom', 'Relaxed hipster bar with food & drink specials, pool tables plus toys & candy on the bar.', '530 South St, Philadelphia, PA 19147',  
'21:00:00', '16:00:00', '', 'https://www.tattooedmomphilly.com/', 'https://www.facebook.com/tattooedmomphilly/', 'placeholder.jpg', '39.941938', '-75.151813', 'Bars, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(26, 2);
INSERT INTO locations_category (location_id, category_id) VALUES(26, 7);

--Vedge
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Vedge', 'Restaurant serving inventive vegan & vegetarian small plates in a charming old mansion.', '1221 Locust St, Philadelphia, PA 19107',  
'21:00:00', '17:00:00', '', 'https://www.vedgerestaurant.com/', 'https://www.facebook.com/vedgerestaurant/', 'placeholder.jpg', '39.9479', '-75.1614', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(27, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(27, 7);

--Sazon
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Sazon', 'Arepas & other traditional Venezuelan fare, including several gluten-free options. Cash only.', '941 Spring Garden St, Philadelphia, PA 19123',  
'21:00:00', '17:00:00', '', '', 'https://www.facebook.com/Sazon-Restaurant-Caf%C3%A9-333060150261/', 'placeholder.jpg', '39.961849', '-75.154375', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(28, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(28, 7);

--Oyster House
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Oyster House', 'Oysters, lobster, and other East Coast-style seafood feature at this stylish eatery open since 1976.', '1516 Sansom St, Philadelphia, PA 19102',  
'21:00:00', '11:30:00', '', 'https://oysterhousephilly.com/', 'https://www.facebook.com/OysterHousePhilly/', 'placeholder.jpg', '39.9502', '-75.1666', 'Restaurants, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(29, 5);
INSERT INTO locations_category (location_id, category_id) VALUES(29, 7);

--Fusion Arena
INSERT INTO locations (location_name, description, address, open_to, open_from, twitter, url, facebook, img, lat, long, categories)
VALUES ('Fusion Arena', 'Esports arena home to the Overwatch team competitive team Philadelphia Fusion.', '3300 S 7th St STE 1, Philadelphia, PA 19148',
'24:00:00', '00:00:00', 'https://twitter.com/Fusion', 'https://fusionarenaphilly.com/', 'https://www.facebook.com/PhiladelphiaFusion/', 'placeholder.jpg', '39.5413', '-75.10596', 'Sports, Indoor');
INSERT INTO locations_category (location_id, category_id) VALUES(30, 3);
INSERT INTO locations_category (location_id, category_id) VALUES(30, 7);

--Insert test check ins to locations
INSERT INTO check_ins (date_time, location_id, user_id) VALUES (CURRENT_TIMESTAMP, 1, 1), (CURRENT_TIMESTAMP, 3, 1), (CURRENT_TIMESTAMP, 4, 1);