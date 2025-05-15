-- Vider toutes les tables dans l'ordre des dépendances
TRUNCATE TABLE 
    Asso_21,
    Asso_16,
    Hebergement_booking,
    Available,
    rental,
    Hotel,
    Room,
    Hebergement,
    Services,
    Road,
    Name,
    Bookings,
    Users,
    Roles,
    precise,
    offer,
    Options,
    Flights,
    Companies,
    locate,
    Airport,
    belong,
    Cities,
    contain,
    pay,
    Countries,
    Currency,
    Continent,
    concerne,
    Activities,
    Categories,
    Review,
    Favorites,
    Comments
RESTART IDENTITY CASCADE;


-- Continents
INSERT INTO Continent (name) VALUES 
('Europe'), ('North America'), ('Asia');

-- Pays
INSERT INTO Countries (name) VALUES 
('France'), ('United States'), ('Italy'), ('Japan'), ('Hungary');

-- Monnaies
INSERT INTO Currency (name, exchange_rate, symbol) VALUES 
('Euro', 1.00, '€'), ('Dollar', 1.10, '$'), ('Yen', 0.007, '¥');

-- Liens pays - monnaies
INSERT INTO pay (Id_Countrie, Id_Currency) VALUES 
(1, 1), (3, 1), (5, 1), -- France, Italy, Hungary => Euro
(2, 2),                -- USA => Dollar
(4, 3);                -- Japan => Yen

-- Liens pays - continent
INSERT INTO contain (Id_Countrie, Id_Continent) VALUES 
(1, 1), (2, 2), (3, 1), (4, 3), (5, 1);

-- Villes
INSERT INTO Cities (name, description, coord, image, PC) VALUES
('Paris', 'Capitale de la France', ST_GeogFromText('SRID=4326;POINT(2.3522 48.8566)'), 'paris.jpg', 75000),
('New York', 'Ville emblématique américaine', ST_GeogFromText('SRID=4326;POINT(-74.0060 40.7128)'), 'ny.jpg', 10001),
('Rome', 'Capitale historique de l’Italie', ST_GeogFromText('SRID=4326;POINT(12.4964 41.9028)'), 'rome.jpg', 184),
('Tokyo', 'Capitale du Japon', ST_GeogFromText('SRID=4326;POINT(139.6917 35.6895)'), 'tokyo.jpg', 1000001),
('Budapest', 'Ville thermale de Hongrie', ST_GeogFromText('SRID=4326;POINT(19.0402 47.4979)'), 'budapest.jpg', 1011);

-- Liens pays - villes
INSERT INTO belong (Id_Countrie, Id_Cities) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Aéroports
INSERT INTO Airport (name, code) VALUES 
('Charles de Gaulle', 'CDG'), ('JFK International', 'JFK'), ('Fiumicino', 'FCO'), 
('Haneda', 'HND'), ('Budapest Airport', 'BUD');

-- Liens villes - aéroports
INSERT INTO locate (Id_Cities, Id_Airport) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Compagnies aériennes
INSERT INTO Companies (name, nb_plane, nationality) VALUES 
('Air France', 250, 'France'), 
('Delta Airlines', 300, 'USA'),
('Alitalia', 100, 'Italy'),
('Japan Airlines', 150, 'Japan'),
('Wizz Air', 80, 'Hungary');

-- Vols
INSERT INTO Flights (Id_Airport, Id_Airport_1, departure_date, arrival_date, base_price) VALUES
(1, 2, '2025-06-01 08:00:00', '2025-06-01 11:00:00', 300.00),
(2, 3, '2025-06-02 09:00:00', '2025-06-02 12:00:00', 250.00),
(3, 4, '2025-06-03 10:00:00', '2025-06-03 17:00:00', 500.00),
(4, 5, '2025-06-04 11:00:00', '2025-06-04 15:00:00', 400.00),
(5, 1, '2025-06-05 06:00:00', '2025-06-05 09:00:00', 200.00);

-- Options de vol
INSERT INTO Options (seat_choice, luggage, class) VALUES 
(TRUE, TRUE, 'Business'), (TRUE, FALSE, 'Economy'), 
(FALSE, FALSE, 'Low Cost'), (TRUE, TRUE, 'First'), 
(TRUE, FALSE, 'Premium Economy');

-- Offres
INSERT INTO offer (Id_Airport, Id_Airport_1, Id_Flights, Id_Companie) VALUES 
(1, 2, 1, 1), (2, 3, 2, 2), (3, 4, 3, 3), (4, 5, 4, 4), (5, 1, 5, 5);

-- Précision des options
INSERT INTO precise (Id_Airport, Id_Airport_1, Id_Flights, Id_Options) VALUES 
(1, 2, 1, 1), (2, 3, 2, 2), (3, 4, 3, 3), (4, 5, 4, 4), (5, 1, 5, 5);

-- Rôles
INSERT INTO Roles (rolename) VALUES ('Client'), ('Admin'), ('Agent'), ('Guide'), ('Gestionnaire');

-- Utilisateurs
INSERT INTO Users (Id_Role, lastname, firstname, mail, pwd) VALUES 
(1, 'Doe', 'John', 'john.doe@email.com', '$2y$10$tVAU/Iqo/rBGHRGuJjCNm.bo32pl8YhMI09VhFsmOR6Dz7C7CmxIC'),
(2, 'Smith', 'Anna', 'anna.smith@email.com', '$2y$10$8uu6rHwVzxJIohRC2O2zjuULsOs11XcvZUbs0JYFzyITLCGp0L0Ie'),
(3, 'Tanaka', 'Kenji', 'kenji.tanaka@email.com', '$2y$10$qcQtpn9d.38Qf/zuHYsB2eUO7nG3HhjdAaB5KOylBojhTlz.Ujfo6'),
(4, 'Rossi', 'Luca', 'luca.rossi@email.com', '$2y$10$XC0WqIMaV7BMJZ4GAstp0uQk/cqgst.aUWhgM9P5Epr3no2Mgj5uW'),
(5, 'Nagy', 'Eva', 'eva.nagy@email.com', '$2y$10$j2Zy9XyRbTn67ey53Yo18u1MdQPxXqOc6ZnASSBKqOcm7l2xej0o.');

-- Réservations
INSERT INTO Bookings (Id_Role, Id_User, date_booking_start, budget, date_booking_end) VALUES 
(1, 1, '2025-05-01', 1500.00, '2025-05-15'),
(1, 2, '2025-06-10', 1200.00, '2025-06-20'),
(1, 3, '2025-07-01', 2000.00, '2025-07-15'),
(1, 4, '2025-08-05', 1800.00, '2025-08-20'),
(1, 5, '2025-09-10', 1600.00, '2025-09-25');

-- Noms de routes
INSERT INTO Name (name) VALUES 
('Rue de Rivoli'), ('Broadway'), ('Via del Corso'), ('Chuo-dori'), ('Andrássy út');

-- Routes
INSERT INTO Road (Id_Name, Id_Cities, type) VALUES 
(1, 1, 'rue'), (2, 2, 'avenue'), (3, 3, 'via'), (4, 4, 'dori'), (5, 5, 'út');

-- Services
INSERT INTO Services (wifi, breakfirst, spa) VALUES 
(TRUE, TRUE, TRUE), (TRUE, FALSE, FALSE), (FALSE, TRUE, TRUE), (TRUE, TRUE, FALSE), (FALSE, FALSE, FALSE);

-- Hébergements
INSERT INTO Hebergement (Id_Name, Id_Cities, Id_Road, Id_Services, name, rating, desciption, road_num) VALUES
(1, 1, 1, 1, 'Hotel Paris Centre', 4.5, 'Charmant hôtel au cœur de Paris', '12B'),
(2, 2, 2, 2, 'NY Budget Inn', 3.2, 'Hôtel abordable proche de Times Square', '88'),
(3, 3, 3, 3, 'Roma Antica', 4.0, 'Hôtel avec vue sur le Colisée', '4'),
(4, 4, 4, 4, 'Tokyo Inn', 3.8, 'Hôtel économique dans Shinjuku', '16'),
(5, 5, 5, 5, 'Danube Relax', 4.3, 'Spa hôtel au bord du Danube', '2A');

-- Chambres
INSERT INTO Room (type, capacity, price) VALUES 
('Double', 2, 120.00), ('Single', 1, 80.00), ('Suite', 4, 250.00), ('Twin', 2, 100.00), ('Triple', 3, 150.00);

-- Hôtels
INSERT INTO Hotel (Id_Room, Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement) VALUES
(1, 1, 1, 1, 1, 1), (2, 2, 2, 2, 2, 2), (3, 3, 3, 3, 3, 3), (4, 4, 4, 4, 4, 4), (5, 5, 5, 5, 5, 5);

-- Locations
INSERT INTO rental (price, Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement) VALUES
(120.00, 1, 1, 1, 1, 1), (80.00, 2, 2, 2, 2, 2), (250.00, 3, 3, 3, 3, 3), (100.00, 4, 4, 4, 4, 4), (150.00, 5, 5, 5, 5, 5);

-- Disponibilités
INSERT INTO Available (Id_rental, Id_Room, start_date, end_date, is_available) VALUES
(1, 1, '2025-06-01', '2025-06-10', TRUE),
(2, 2, '2025-06-05', '2025-06-15', TRUE),
(3, 3, '2025-06-10', '2025-06-20', FALSE),
(4, 4, '2025-07-01', '2025-07-10', TRUE),
(5, 5, '2025-07-15', '2025-07-25', TRUE);

-- Réservations hébergements
INSERT INTO Hebergement_booking (Id_Role, Id_User, Id_Bookings, Id_rental) VALUES
(1, 1, 1, 1), (1, 2, 2, 2), (1, 3, 3, 3), (1, 4, 4, 4), (1, 5, 5, 5);

-- Associations chambres-réservations
INSERT INTO Asso_21 (Id_Room, Id_Role, Id_User, Id_Bookings, Id_rental, Id_Hebergement_booking) VALUES
(1, 1, 1, 1, 1, 1), (2, 1, 2, 2, 2, 2), (3, 1, 3, 3, 3, 3), (4, 1, 4, 4, 4, 4), (5, 1, 5, 5, 5, 5);

-- Catégories d'activités
INSERT INTO Categories(name) VALUES 
('Culture'), ('Aventure'), ('Gastronomie'), ('Nature'), ('Détente');

-- Activités
INSERT INTO Activities(name, descriptioin, price, start_date, end_date, num_road) VALUES
('Visite Louvre', 'Musée célèbre à Paris', 20.00, '2025-06-01', '2025-10-01', '1'),
('Broadway Show', 'Comédie musicale à NY', 120.00, '2025-06-15', '2025-09-15', '88'),
('Tour Colisée', 'Visite guidée de Rome', 25.00, '2025-06-01', '2025-10-01', '4'),
('Atelier Sushi', 'Cours de cuisine à Tokyo', 60.00, '2025-06-01', '2025-12-01', '16'),
('Bains Gellért', 'Thermes à Budapest', 40.00, '2025-04-01', '2025-11-30', '2A');

-- Lien activité - catégories
INSERT INTO concerne(Id_Activities, Id_Categories) VALUES 
(1, 1), (2, 1), (3, 1), (4, 3), (5, 5);

-- Lien activité - routes
INSERT INTO Asso_16(Id_Name, Id_Cities, Id_Road, Id_Activities) VALUES
(1, 1, 1, 1), (2, 2, 2, 2), (3, 3, 3, 3), (4, 4, 4, 4), (5, 5, 5, 5);
