DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_type VARCHAR(50) NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC(15,2),
  has_life BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  star_type VARCHAR(50) NOT NULL,
  age_in_millions_of_years INT,
  is_spherical BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_type VARCHAR(50) NOT NULL,
  age_in_millions_of_years INT,
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km INT,
  is_spherical BOOLEAN NOT NULL,
  has_life BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  size_km INT NOT NULL,
  is_dangerous BOOLEAN NOT NULL,
  description TEXT
);

INSERT INTO galaxy(name, galaxy_type, age_in_millions_of_years, distance_from_earth, has_life, description) VALUES
('Milky Way','Spiral',13600,0,FALSE,'Our galaxy'),
('Andromeda','Spiral',10000,2537000,FALSE,'Nearest large galaxy'),
('Triangulum','Spiral',12000,3000000,FALSE,'Local group galaxy'),
('Whirlpool','Spiral',5000,23000000,FALSE,'M51 galaxy'),
('Sombrero','Elliptical',13000,29000000,FALSE,'Bright central bulge'),
('Messier 87','Elliptical',14000,53000000,FALSE,'Contains black hole');

INSERT INTO star(name, galaxy_id, star_type, age_in_millions_of_years, is_spherical, description) VALUES
('Sun',1,'G-Type',4600,TRUE,'Our star'),
('Sirius',1,'A-Type',300,TRUE,'Bright star'),
('Betelgeuse',1,'Red Supergiant',10000,TRUE,'Large red star'),
('Rigel',1,'Blue Supergiant',8000,TRUE,'Blue star'),
('Proxima Centauri',1,'Red Dwarf',4500,TRUE,'Nearest star'),
('Andromeda Star',2,'Yellow Dwarf',5000,TRUE,'Star in Andromeda');

INSERT INTO planet(name, star_id, planet_type, age_in_millions_of_years, has_life, is_spherical, description) VALUES
('Mercury',1,'Terrestrial',4500,FALSE,TRUE,'Closest planet'),
('Venus',1,'Terrestrial',4500,FALSE,TRUE,'Hot planet'),
('Earth',1,'Terrestrial',4500,TRUE,TRUE,'Our planet'),
('Mars',1,'Terrestrial',4500,FALSE,TRUE,'Red planet'),
('Jupiter',1,'Gas Giant',4500,FALSE,TRUE,'Largest planet'),
('Saturn',1,'Gas Giant',4500,FALSE,TRUE,'Ringed planet'),
('Uranus',1,'Ice Giant',4500,FALSE,TRUE,'Ice giant'),
('Neptune',1,'Ice Giant',4500,FALSE,TRUE,'Farthest planet'),
('Kepler-22b',2,'Exoplanet',4000,FALSE,TRUE,'Exoplanet'),
('Proxima b',5,'Exoplanet',4500,FALSE,TRUE,'Nearby exoplanet'),
('Andromeda I',6,'Exoplanet',3000,FALSE,TRUE,'Planet in Andromeda'),
('Andromeda II',6,'Exoplanet',3200,FALSE,TRUE,'Planet in Andromeda');

INSERT INTO moon(name, planet_id, diameter_km, is_spherical, has_life, description) VALUES
('Moon',3,3474,TRUE,FALSE,'Earth moon'),
('Phobos',4,22,FALSE,FALSE,'Mars moon'),
('Deimos',4,12,FALSE,FALSE,'Mars moon'),
('Io',5,3643,TRUE,FALSE,'Jupiter moon'),
('Europa',5,3122,TRUE,FALSE,'Jupiter moon'),
('Ganymede',5,5268,TRUE,FALSE,'Jupiter moon'),
('Callisto',5,4821,TRUE,FALSE,'Jupiter moon'),
('Titan',6,5150,TRUE,FALSE,'Saturn moon'),
('Rhea',6,1528,TRUE,FALSE,'Saturn moon'),
('Iapetus',6,1469,TRUE,FALSE,'Saturn moon'),
('Dione',6,1123,TRUE,FALSE,'Saturn moon'),
('Tethys',6,1062,TRUE,FALSE,'Saturn moon'),
('Enceladus',6,504,TRUE,FALSE,'Saturn moon'),
('Mimas',6,396,TRUE,FALSE,'Saturn moon'),
('Titania',7,1578,TRUE,FALSE,'Uranus moon'),
('Oberon',7,1523,TRUE,FALSE,'Uranus moon'),
('Umbriel',7,1169,TRUE,FALSE,'Uranus moon'),
('Ariel',7,1158,TRUE,FALSE,'Uranus moon'),
('Triton',8,2706,TRUE,FALSE,'Neptune moon'),
('Nereid',8,340,TRUE,FALSE,'Neptune moon');

INSERT INTO asteroid(name, size_km, is_dangerous, description) VALUES
('Ceres',939,FALSE,'Largest asteroid'),
('Vesta',525,FALSE,'Main belt asteroid'),
('Eros',17,TRUE,'Near Earth asteroid');
