-- CREATE EXTENSION postgis; extention à installer avec stack builder


CREATE TABLE Roles(
   Id_Role SERIAL,
   rolename VARCHAR(50) ,
   PRIMARY KEY(Id_Role)
);

CREATE TABLE Countries(
   Id_Countrie SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(Id_Countrie)
);

CREATE TABLE Currency(
   Id_Currency SERIAL,
   name VARCHAR(50) ,
   exchange_rate NUMERIC(15,2)  ,
   symbol VARCHAR(50) ,
   PRIMARY KEY(Id_Currency)
);

CREATE TABLE Continent(
   Id_Continent SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(Id_Continent)
);

CREATE TABLE Cities(
   Id_Cities SERIAL,
   name VARCHAR(50) ,
   description VARCHAR(50) ,
   coord GEOGRAPHY,
   image VARCHAR(50) ,
   PC INTEGER,
   PRIMARY KEY(Id_Cities)
);

CREATE TABLE Airport(
   Id_Airport SERIAL,
   name VARCHAR(50) ,
   code VARCHAR(50) ,
   PRIMARY KEY(Id_Airport)
);

CREATE TABLE Companies(
   Id_Companie SERIAL,
   name VARCHAR(50) ,
   nb_plane INTEGER,
   nationality VARCHAR(50) ,
   PRIMARY KEY(Id_Companie)
);

CREATE TABLE Options(
   Id_Options SERIAL,
   seat_choice BOOLEAN,
   luggage BOOLEAN,
   class VARCHAR(50) ,
   PRIMARY KEY(Id_Options)
);

CREATE TABLE Services(
   Id_Services SERIAL,
   wifi BOOLEAN,
   breakfirst BOOLEAN,
   spa BOOLEAN,
   PRIMARY KEY(Id_Services)
);

CREATE TABLE Room(
   Id_Room SERIAL,
   type VARCHAR(50) ,
   capacity NUMERIC(15,2)  ,
   price MONEY,
   PRIMARY KEY(Id_Room)
);

CREATE TABLE Name(
   Id_Name SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(Id_Name)
);

CREATE TABLE Activities(
   Id_Activities SERIAL,
   name VARCHAR(50) ,
   descriptioin VARCHAR(500) ,
   price MONEY,
   start_date TIMESTAMP,
   end_date TIMESTAMP,
   num_road VARCHAR(50) ,
   PRIMARY KEY(Id_Activities)
);

CREATE TABLE Categories(
   Id_Categories SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(Id_Categories)
);

CREATE TABLE Users(
   Id_Role INTEGER,
   Id_User SERIAL,
   lastname VARCHAR(50) ,
   firstname VARCHAR(50) ,
   mail VARCHAR(50) ,
   pwd VARCHAR(50) ,
   PRIMARY KEY(Id_Role, Id_User),
   FOREIGN KEY(Id_Role) REFERENCES Roles(Id_Role)
);

CREATE TABLE Flights(
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights SERIAL,
   departure_date TIMESTAMP,
   arrival_date TIMESTAMP,
   base_price MONEY,
   PRIMARY KEY(Id_Airport, Id_Airport_1, Id_Flights),
   FOREIGN KEY(Id_Airport) REFERENCES Airport(Id_Airport),
   FOREIGN KEY(Id_Airport_1) REFERENCES Airport(Id_Airport)
);

CREATE TABLE Road(
   Id_Name INTEGER,
   Id_Cities INTEGER,
   Id_Road SERIAL,
   type VARCHAR(50) ,
   PRIMARY KEY(Id_Name, Id_Cities, Id_Road),
   FOREIGN KEY(Id_Name) REFERENCES Name(Id_Name),
   FOREIGN KEY(Id_Cities) REFERENCES Cities(Id_Cities)
);

CREATE TABLE Airtrip(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Trip SERIAL,
   date_booking_start TIMESTAMP,
   budget MONEY,
   date_booking_end VARCHAR(50) ,
   preference VARCHAR(50) ,
   PRIMARY KEY(Id_Role, Id_User, Id_Trip),
   FOREIGN KEY(Id_Role, Id_User) REFERENCES Users(Id_Role, Id_User)
);

CREATE TABLE Review(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Role_1 INTEGER,
   Id_User_1 INTEGER,
   Id_Trip INTEGER,
   Id_Review SERIAL,
   comments VARCHAR(500) ,
   review_date TIMESTAMP DEFAULT NOW(),
   rating NUMERIC(2,1)   CHECK (rating >= 0 AND rating <= 5),
   PRIMARY KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review),
   FOREIGN KEY(Id_Role, Id_User) REFERENCES Users(Id_Role, Id_User),
   FOREIGN KEY(Id_Role_1, Id_User_1, Id_Trip) REFERENCES Airtrip(Id_Role, Id_User, Id_Trip)
);

CREATE TABLE review_flight(
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights INTEGER,
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Role_1 INTEGER,
   Id_User_1 INTEGER,
   Id_Trip INTEGER,
   Id_Review INTEGER,
   Id_review_flight SERIAL,
   PRIMARY KEY(Id_Airport, Id_Airport_1, Id_Flights, Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review, Id_review_flight),
   FOREIGN KEY(Id_Airport, Id_Airport_1, Id_Flights) REFERENCES Flights(Id_Airport, Id_Airport_1, Id_Flights),
   FOREIGN KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review) REFERENCES Review(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review)
);

CREATE TABLE review_activities(
   Id_Activities INTEGER,
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Role_1 INTEGER,
   Id_User_1 INTEGER,
   Id_Trip INTEGER,
   Id_Review INTEGER,
   Id_review_activities SERIAL,
   PRIMARY KEY(Id_Activities, Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review, Id_review_activities),
   FOREIGN KEY(Id_Activities) REFERENCES Activities(Id_Activities),
   FOREIGN KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review) REFERENCES Review(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review)
);

CREATE TABLE review_room(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Role_1 INTEGER,
   Id_User_1 INTEGER,
   Id_Trip INTEGER,
   Id_Review INTEGER,
   Id_Room INTEGER,
   Id_review_room SERIAL,
   PRIMARY KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review, Id_Room, Id_review_room),
   FOREIGN KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review) REFERENCES Review(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review),
   FOREIGN KEY(Id_Room) REFERENCES Room(Id_Room)
);

CREATE TABLE Hebergement(
   Id_Name INTEGER,
   Id_Cities INTEGER,
   Id_Road INTEGER,
   Id_Services INTEGER,
   Id_Hebergement SERIAL,
   name VARCHAR(50) ,
   rating NUMERIC(15,2)  ,
   desciption VARCHAR(500) ,
   road_num VARCHAR(50) ,
   PRIMARY KEY(Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement),
   FOREIGN KEY(Id_Name, Id_Cities, Id_Road) REFERENCES Road(Id_Name, Id_Cities, Id_Road),
   FOREIGN KEY(Id_Services) REFERENCES Services(Id_Services)
);

CREATE TABLE Hotel(
   Id_Room INTEGER,
   Id_Hotel SERIAL,
   Id_Name INTEGER NOT NULL,
   Id_Cities INTEGER NOT NULL,
   Id_Road INTEGER NOT NULL,
   Id_Services INTEGER NOT NULL,
   Id_Hebergement INTEGER NOT NULL,
   PRIMARY KEY(Id_Room, Id_Hotel),
   UNIQUE(Id_Hebergement),
   FOREIGN KEY(Id_Room) REFERENCES Room(Id_Room),
   FOREIGN KEY(Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement) REFERENCES Hebergement(Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement)
);

CREATE TABLE rental(
   Id_rental SERIAL,
   price MONEY,
   Id_Name INTEGER NOT NULL,
   Id_Cities INTEGER NOT NULL,
   Id_Road INTEGER NOT NULL,
   Id_Services INTEGER NOT NULL,
   Id_Hebergement INTEGER NOT NULL,
   PRIMARY KEY(Id_rental),
   UNIQUE(Id_Hebergement),
   FOREIGN KEY(Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement) REFERENCES Hebergement(Id_Name, Id_Cities, Id_Road, Id_Services, Id_Hebergement)
);

CREATE TABLE Available(
   Id_rental INTEGER,
   Id_Room INTEGER,
   Id_Available SERIAL,
   start_date TIMESTAMP,
   end_date TIMESTAMP,
   is_available BOOLEAN,
   PRIMARY KEY(Id_rental, Id_Room, Id_Available),
   FOREIGN KEY(Id_rental) REFERENCES rental(Id_rental),
   FOREIGN KEY(Id_Room) REFERENCES Room(Id_Room)
);

CREATE TABLE Flight_booking(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Trip INTEGER,
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights INTEGER,
   Id_Flight_booking SERIAL,
   PRIMARY KEY(Id_Role, Id_User, Id_Trip, Id_Airport, Id_Airport_1, Id_Flights, Id_Flight_booking),
   FOREIGN KEY(Id_Role, Id_User, Id_Trip) REFERENCES Airtrip(Id_Role, Id_User, Id_Trip),
   FOREIGN KEY(Id_Airport, Id_Airport_1, Id_Flights) REFERENCES Flights(Id_Airport, Id_Airport_1, Id_Flights)
);

CREATE TABLE Activity_booking(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Trip INTEGER,
   Id_Activities INTEGER,
   Id_Activity_booking SERIAL,
   PRIMARY KEY(Id_Role, Id_User, Id_Trip, Id_Activities, Id_Activity_booking),
   FOREIGN KEY(Id_Role, Id_User, Id_Trip) REFERENCES Airtrip(Id_Role, Id_User, Id_Trip),
   FOREIGN KEY(Id_Activities) REFERENCES Activities(Id_Activities)
);

CREATE TABLE Hebergement_booking(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Trip INTEGER,
   Id_Room INTEGER,
   Id_rental INTEGER,
   Id_Hebergement_booking SERIAL,
   PRIMARY KEY(Id_Role, Id_User, Id_Trip, Id_Room, Id_rental, Id_Hebergement_booking),
   FOREIGN KEY(Id_Role, Id_User, Id_Trip) REFERENCES Airtrip(Id_Role, Id_User, Id_Trip),
   FOREIGN KEY(Id_Room) REFERENCES Room(Id_Room),
   FOREIGN KEY(Id_rental) REFERENCES rental(Id_rental)
);

CREATE TABLE Favory(
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Room INTEGER,
   Id_rental INTEGER,
   Id_Activities INTEGER,
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights INTEGER,
   Id_Favory SERIAL,
   added_at TIMESTAMP DEFAULT NOW(),
   PRIMARY KEY(Id_Role, Id_User, Id_Room, Id_rental, Id_Activities, Id_Airport, Id_Airport_1, Id_Flights, Id_Favory),
   FOREIGN KEY(Id_Role, Id_User) REFERENCES Users(Id_Role, Id_User),
   FOREIGN KEY(Id_Room) REFERENCES Room(Id_Room),
   FOREIGN KEY(Id_rental) REFERENCES rental(Id_rental),
   FOREIGN KEY(Id_Activities) REFERENCES Activities(Id_Activities),
   FOREIGN KEY(Id_Airport, Id_Airport_1, Id_Flights) REFERENCES Flights(Id_Airport, Id_Airport_1, Id_Flights)
);

CREATE TABLE review_rental(
   Id_rental INTEGER,
   Id_Role INTEGER,
   Id_User INTEGER,
   Id_Role_1 INTEGER,
   Id_User_1 INTEGER,
   Id_Trip INTEGER,
   Id_Review INTEGER,
   Id_review_rental SERIAL,
   PRIMARY KEY(Id_rental, Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review, Id_review_rental),
   FOREIGN KEY(Id_rental) REFERENCES rental(Id_rental),
   FOREIGN KEY(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review) REFERENCES Review(Id_Role, Id_User, Id_Role_1, Id_User_1, Id_Trip, Id_Review)
);

CREATE TABLE pay(
   Id_Countrie INTEGER,
   Id_Currency INTEGER,
   PRIMARY KEY(Id_Countrie, Id_Currency),
   FOREIGN KEY(Id_Countrie) REFERENCES Countries(Id_Countrie),
   FOREIGN KEY(Id_Currency) REFERENCES Currency(Id_Currency)
);

CREATE TABLE contain(
   Id_Countrie INTEGER,
   Id_Continent INTEGER,
   PRIMARY KEY(Id_Countrie, Id_Continent),
   FOREIGN KEY(Id_Countrie) REFERENCES Countries(Id_Countrie),
   FOREIGN KEY(Id_Continent) REFERENCES Continent(Id_Continent)
);

CREATE TABLE belong(
   Id_Countrie INTEGER,
   Id_Cities INTEGER,
   PRIMARY KEY(Id_Countrie, Id_Cities),
   FOREIGN KEY(Id_Countrie) REFERENCES Countries(Id_Countrie),
   FOREIGN KEY(Id_Cities) REFERENCES Cities(Id_Cities)
);

CREATE TABLE locate(
   Id_Cities INTEGER,
   Id_Airport INTEGER,
   PRIMARY KEY(Id_Cities, Id_Airport),
   FOREIGN KEY(Id_Cities) REFERENCES Cities(Id_Cities),
   FOREIGN KEY(Id_Airport) REFERENCES Airport(Id_Airport)
);

CREATE TABLE offer(
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights INTEGER,
   Id_Companie INTEGER,
   PRIMARY KEY(Id_Airport, Id_Airport_1, Id_Flights, Id_Companie),
   FOREIGN KEY(Id_Airport, Id_Airport_1, Id_Flights) REFERENCES Flights(Id_Airport, Id_Airport_1, Id_Flights),
   FOREIGN KEY(Id_Companie) REFERENCES Companies(Id_Companie)
);

CREATE TABLE precise(
   Id_Airport INTEGER,
   Id_Airport_1 INTEGER,
   Id_Flights INTEGER,
   Id_Options INTEGER,
   PRIMARY KEY(Id_Airport, Id_Airport_1, Id_Flights, Id_Options),
   FOREIGN KEY(Id_Airport, Id_Airport_1, Id_Flights) REFERENCES Flights(Id_Airport, Id_Airport_1, Id_Flights),
   FOREIGN KEY(Id_Options) REFERENCES Options(Id_Options)
);

CREATE TABLE Asso_16(
   Id_Name INTEGER,
   Id_Cities INTEGER,
   Id_Road INTEGER,
   Id_Activities INTEGER,
   PRIMARY KEY(Id_Name, Id_Cities, Id_Road, Id_Activities),
   FOREIGN KEY(Id_Name, Id_Cities, Id_Road) REFERENCES Road(Id_Name, Id_Cities, Id_Road),
   FOREIGN KEY(Id_Activities) REFERENCES Activities(Id_Activities)
);

CREATE TABLE concerne(
   Id_Activities INTEGER,
   Id_Categories INTEGER,
   PRIMARY KEY(Id_Activities, Id_Categories),
   FOREIGN KEY(Id_Activities) REFERENCES Activities(Id_Activities),
   FOREIGN KEY(Id_Categories) REFERENCES Categories(Id_Categories)
);
