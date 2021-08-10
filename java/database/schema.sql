
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
beer_abv varchar(10),
beer_ibu varchar(10),
beer_style varchar(50),
beer_description varchar(1500),
beer_name varchar(50) not null,
brewery_id int not null,
beer_image varchar(500),

constraint fk_beers_brewery_id foreign key (brewery_id) references breweries(brewery_id)
);

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('6.8% ABV', '70 IBU', 'American IPA', 'This west coast style IPA is our flagship beer. We can talk about IPAs and hops all day but you better just give it a run for yourself.', 'Apocalypse IPA' , 1, 'https://ipcdn.freshop.com/resize?url=https://images.freshop.com/00850162008075/49e9ed6470ed366e4a513c803eb4ecc3_large.png&width=512&type=webp&quality=80' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('6.9% ABV', '70 IBU', 'American IPA', 'This IPA was formerly known as SAM named after its hops; Simcoe, Amarillo, & Mosaic but we were told this would be a trademark issue with a large craft brewery out of the Northeast so we had to change it. We finally arrived at the perfect name for this IPA... JOE.', 'Joe IPA' , 1, 'https://ipcdn.freshop.com/resize?url=https://images.freshop.com/00850162008051/428964322c44bf336e9bbea8312fdebd_large.png&width=512&type=webp&quality=80' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('5.0% ABV', '4 IBU', 'Sour - Berliner Weisse', 'Once again 10 Barrel gets fresh! Tonya took her award winning Berliner Weisse and added loads of cucumber flavor. The aroma is undeniably cucumber. The flavor is like biting into a crisp baby cucumber fresh from the garden. Just when you have had enough the tartness acts as a pallet cleanser leaving you ready for the next sip. Eat Beer!', 'Cucumber Crush' , 1, 'http://cdn.shopify.com/s/files/1/0277/1055/4176/products/r7djyPn0A0_1200x1200.jpg?v=1591942170' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('7.6% ABV', '37 IBU', 'Winter Ale', 'This delicately balanced Strong Ale starts with dark copper color mixed with slight reddish hues and a light tan head. Big malty aroma with a Munich character give way to a slight caramel & toffee mixed with spicy noble hop aroma, all wrapped together with a medium-bodied mouth feel. German malt flavor profile with slight roasty notes give Pray for Snow a subtle toffee sweetness balanced with spicy hop bitterness and slight alcohol warming. Served appropriately in a classic snifter.', 'Pray for Snow' , 1, 'http://www.beerawareness.com/storage/2017/01/Pray-For-Snow-1-1024x757.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('5.0% ABV', '60 IBU', 'American Pale Ale', 'Ready for the perfect pale ale? Trail Beer is ready for you too, with a refreshingly bright body layered with nuances of fresh cut oranges and pine needles.', 'Trail Beer' , 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZr7fZFb7xczacR_RITgFtAksfpYwVHuRfwQ&usqp=CAU' );



INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('7.2% ABV', '30 IBU', 'New England IPA', 'East Coasts collide and crank it up for this new New England IPA returned in Scotland. Brewed with oats and wheat and left unfiltered for a hazy appearance and super smooth delivery. Dry-hopped for a full-tilt fruit hit with pineapple, mango and a hint of zesty lime. Low on bitterness, high on haze, heavy on hops.', 'Hazy Jane' , 2, 'https://beerclubweb.files.wordpress.com/2020/12/a4567143-4c4c-49fd-bd1e-1d7b57230741.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('0.5% ABV', 'N/A IBU', 'Non-Alcoholic Beer', 'Juicy passion fruit sour', 'Pride AF' , 2, 'https://untappd.akamaized.net/photo/2021_07_22/9425d5ef971faa634ce5e1fd73573658_c_1055311843_640x640.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('4.5% ABV', 'N/A IBU', 'Sour - Fruited Gose', 'Ballistic Berry is a thirst quenching, juicy gose, loaded with fruity layers. An explosion of sweet, luscious berries, followed by a delicate shower of salinity makes for the perfect backyard celebration.', 'Ballistic Berry' , 2, 'https://untappd.akamaized.net/photos/2021_05_09/97c137275819d3645718e07c107cf285_raw.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('6.5% ABV', '40 IBU', 'American IPA', 'An American IPA with a bitter edge that will push your citrus tolerance to the brink and back; Elvis Juice is loaded with tart pithy grapefruit peel. This IPA has a caramel malt base, supporting a full frontal citrus overload - grapefruit peel piled on top of intense us aroma hops. Waves of crashing pine, orange and grapefruit round out this citrus infused IPA.', 'Elvis Juice' , 2, 'https://untappd.akamaized.net/photos/2021_08_10/945df98ca9a3d9e99a576926890a7e9a_raw.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('5.2% ABV', '35 IBU', 'American IPA', 'Punk IPA is the beer that kick-started it. This light, golden classic has been subverted with new world hops to create an explosion of flavour. Bursts of caramel and tropical fruit with an all-out riot of grapefruit, pineapple and lychee, precede a spiky bitter finish. This is the beer that started it all - and it’s not done yet...', 'Punk IPA' , 2, 'https://untappd.akamaized.net/photos/2021_08_10/b1598ad5f807a633dec2339d92c89836_raw.jpg' );



INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('5.2% ABV', '28 IBU', 'American Amber Ale', 'Our house Amber Ale, Tenpenny Ale balances sweet, caramel malt with a mildly bitter, fragrant hop nose. Underneath those flavors lurks a powerhouse yeast that contributes the classic ale ester profile rather than the too clean flavors in modern beer. Tenpenny Ale is unpasteurized and never filtered, it’s beer the way it was intended to be.', 'Tenpenny Ale' , 3, 'https://drinkupcolumbus.com/wp-content/uploads/2014/04/tenpenny-homestead-beer-co.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('7.5% ABV', '50 IBU', 'American Pale Ale', 'Snake Oils sly, mild bitter sits on top of a dry, crisp "Super" American Pale Ale and the giant hop notes reach out to bite you – dominated by those California notes of mango, grapefruit, passion fruit and backed by classic pine and resin it’s a hop lover’s paradise.', 'Snake Oil' , 3, 'https://untappd.akamaized.net/photos/2018_12_17/ef2f9762838e85780808cd475aad6466_640x640.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('4.7% ABV', '45 IBU', 'German Pilsner', 'The Germans have as many variations on the Pilsner as we do on the IPA and this one is a real classic – designed to conform to the Reinheitsgebot this Pilsner starts bitter and finishes clean. The all-German malt bill and all-German hops combine to create a beer as close to Germany as you can get without getting on a plane.', 'Pioneer Oho Pilsner' , 3, 'https://untappd.akamaized.net/photos/2021_07_04/81c9191a0480c7255560a9bf25b9089a_640x640.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('5.2% ABV', '30 IBU', 'Hefeweizen', 'We started with a giant dose of wheat, a tiny smattering of hops and a classic American Hefeweizen yeast – to match those mild notes we brought along a huge helping of citrus peel and coriander. What comes through the dense, pillowy head is a light, sweet, sessional wheat beer with a mild maltiness, a short bitter and a delightful hint of orange, spice, clove and banana to round out the beer.', 'Summer Wheat' , 3, 'https://untappd.akamaized.net/photos/2019_12_11/207db7a90fce4c57aa496e426acb4375_640x640.jpg' );

INSERT INTO beers (beer_abv, beer_ibu, beer_style, beer_description, beer_name , brewery_id , beer_image )
VALUES ('10.9% ABV', '75 IBU', 'Imperial Stout', 'The vanilla and oak blend in with the roasted notes in the nose to give you the sensation of a dark, roasted bourbon but once it hits the palate, all the notes slide toward the malt register. Coffee, chocolate, raisin and caramel dominate while the body coats your tongue and lingers as it warms.', 'Bourbon Barrel Bison' , 3, 'https://untappd.akamaized.net/photos/2020_12_11/02319ca522aa4e8b67cf4dcd3f2485da_640x640.jpg' );


COMMIT TRANSACTION;
