
BEGIN TRANSACTION;


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS beers;
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

CREATE TABLE breweries (
    brewery_id serial primary key,
    brewery_name varchar(100) NOT NULL,
    brewery_state varchar(200) NOT NULL,
    brewery_city varchar(30) NOT NULL,
    brewery_address varchar(300) NOT NULL,
    brewery_zip_code varchar(30) NOT NULL,
    brewery_phone_number varchar (15) NOT NULL,
    brewery_website_url varchar(1000) NOT NULL,
    description varchar(5000),
    image_url varchar(1000)
 );

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO breweries (brewery_name, brewery_state, brewery_city, brewery_address, brewery_zip_code, brewery_phone_number, brewery_website_url, description, image_url) VALUES ('10 Barrel Brewing Co', 'OR', 'Bend', '1135 NW Galveston Ave Ste B', '97703', '(541) 585-1007', 'www.10barrel.com', 'Started Back in 2006 with three guys in Bend Oregon. Committed to great beer taste, good vibes, and a lifetime of adventure', 'https://10barrel.com/wp-content/uploads/2016/05/Pub_Portland_Header.jpg');
INSERT INTO breweries (brewery_name, brewery_state, brewery_city, brewery_address, brewery_zip_code, brewery_phone_number, brewery_website_url, description, image_url) VALUES ('BrewDog Brewing Company, LLC', 'OH', 'Canal Winchester', '96 Gender Rd', '43110', '(614) 908-3051', 'http://www.brewdog.com/usa', 'BrewDog was born with the aim to revolutionize the beer industry and completely redefine beer-drinking culture. We’re determined to make a stand for independence, a stand for quality and stand for craft.', 'https://www.brewdog.com/images/cms/blog/1534839878BLOG1.jpg');
INSERT INTO breweries (brewery_name, brewery_state, brewery_city, brewery_address, brewery_zip_code, brewery_phone_number, brewery_website_url, description, image_url) VALUES ('Homestead Beer Co.', 'OH', 'Heath', '811 Irving Wick Dr W', '43056', '(740) 522-8018', 'www.homesteadbeerco.com',  'Enjoy the flavors of Ohio through our lifelong committment to excellence. On the Homestead-- We know beer.', 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-9935_12ab5_hd.jpeg');

CREATE TABLE beers (
beer_id serial primary key,
beer_name varchar(50) not null,
brewery_id int not null,
beer_image varchar(500),

constraint fk_beers_brewery_id foreign key (brewery_id) references breweries(brewery_id)
);

INSERT INTO beers (beer_name , brewery_id , beer_image )
VALUES ('Samuel Adams' , 1 , 'https://boeningbrothers.com/product/samuel-adams-jack-o/' );

INSERT INTO beers (beer_name , brewery_id , beer_image )
VALUES ('Punk IPA' , 2 , 'https://www.drinksandco.com/beer/brewdog-punk-ipa' );

INSERT INTO beers (beer_name , brewery_id , beer_image )
VALUES ('St George Amber Beer' , 3 , 'https://beerisdevine.com/wp-content/uploads/BGI-Ethiopia-St-George-Beer-678x381.jpg' );

COMMIT TRANSACTION;
