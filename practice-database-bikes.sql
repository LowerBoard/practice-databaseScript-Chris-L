START TRANSACTION;

DROP TABLE IF EXISTS riders;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS brands;

CREATE TABLE brands (
	brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) UNIQUE NOT NULL,
    brand_country_of_origin VARCHAR(50) NOT NULL
    );
    
CREATE TABLE team (
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) UNIQUE NOT NULL,
    team_country_of_origin VARCHAR(50),
    team_bike_brand VARCHAR(50) NOT NULL,
    FOREIGN KEY (team_bike_brand) REFERENCES brands(brand_name)
    );
    
CREATE TABLE rider (
	rider_id INT PRIMARY KEY AUTO_INCREMENT,
    rider_name VARCHAR(50) NOT NULL,
    rider_team VARCHAR(50) NOT NULL,
    FOREIGN KEY (rider_team) REFERENCES team(team_name)
    );
    
INSERT INTO brands (brand_name, brand_country_of_origin) VALUES
('Specialized', 'USA'),
('Cannondale', 'USA'),
('Bianchi', 'Italy'),
('Colnago', 'Italy');

INSERT INTO team (team_name, team_country_of_origin, team_bike_brand) VALUES
('Red Bull Bora', 'Germany', 'Specialized'),
('EF Education', 'USA', 'Cannondale'),
('UAE Emirates', 'UAE', 'Colnago');

INSERT INTO rider (rider_name, rider_team) VALUES
('Remco Evenepoel', 'Red Bull Bora'),
('Noah Hobbs', 'EF Education'),
('Tadej Pogacar', 'UAE Emirates'),
('Isaac Del Toro', 'UAE Emirates');

COMMIT;    

SELECT * from brands;
SELECT * from team;
SELECT * from rider;

SELECT 
    rider.rider_name, 
    team.team_name, 
    brands.brand_name AS bike_brand
FROM rider
JOIN team ON rider.rider_team = team.team_name
JOIN brands ON team.team_bike_brand = brands.brand_name;