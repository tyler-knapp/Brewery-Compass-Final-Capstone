<<<<<<< HEAD
BEGIN TRANSACTION;
=======
 BEGIN TRANSACTION;
>>>>>>> 5e00520ab1a389cb01dd10410fbecdfeedcae060

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
    brewery_location varchar(200) NOT NULL,
    description varchar(500),
    image_url varchar(500)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO breweries (brewery_name, brewery_location, description,image_url) VALUES ('Test Name', 'Test Location', 'Test Description','https://media.graphcms.com/eoKSfz5pS4a8Xm6Qx5Oe');
INSERT INTO breweries (brewery_name, brewery_location, description,image_url) VALUES ('Brew Dog', 'Franklinton', 'Brewdog is a family brewery where even the kids can get drunk!','https://media.graphcms.com/eoKSfz5pS4a8Xm6Qx5Oe');
INSERT INTO breweries (brewery_name, brewery_location, description,image_url) VALUES ('Snake Oil Brewery', 'Reynoldsburg', 'These beers are full of venom. Drink at your own risk!','https://media.graphcms.com/eoKSfz5pS4a8Xm6Qx5Oe');

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
