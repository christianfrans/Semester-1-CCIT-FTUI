CREATE DATABASE TravelNow;
USE TravelNow;
--DROP DATABASE TravelNow

CREATE TABLE user_bank(
	id int PRIMARY KEY NOT NULL,
	name varchar(50),
	bank_name varchar(50)
);

CREATE TABLE users(
	id int IDENTITY(16890735,13) PRIMARY KEY,
	name varchar(230) DEFAULT 'Guest',
	email varchar(230) UNIQUE NOT NULL,
	password varchar(20) NOT NULL,
	account_id INT FOREIGN KEY REFERENCES user_bank(id) ,
	address text NOT NULL,
	city varchar(25) NOT NULL,
	phone varchar(15) UNIQUE NOT NULL,
);

CREATE TABLE passengers(
	id int IDENTITY(14890735,13) PRIMARY KEY,
	user_id INT FOREIGN KEY REFERENCES users(id),
	name varchar(230) NOT NULL,
	address text NOT NULL,
	city Varchar(25) NOT NULL,
	postal_code varchar(5) NOT NULL,
	phone varchar(15) UNIQUE NOT NULL,
	age varchar(3) NOT NULL,
);

CREATE TABLE packets(
	id int IDENTITY (10789312,13) PRIMARY KEY,
	price int NOT NULL,
	description varchar(230),
	name varchar(230),
);

CREATE TABLE airlines(
	id int IDENTITY (20789312,13) PRIMARY KEY,
	price int NOT NULL,
	description varchar(230),
	name varchar(230),
);

CREATE TABLE hotels(
	id int IDENTITY (30789312,13) PRIMARY KEY,
	price int NOT NULL,
	description varchar(230),
	name varchar(230),
);

CREATE TABLE bank_account(
	id int PRIMARY KEY NOT NULL,
	name varchar(50)
);

CREATE TABLE bookings(
	id int IDENTITY(15890735,13) PRIMARY KEY,
	users_id INT FOREIGN KEY REFERENCES users(id),
	passengers_id INT FOREIGN KEY REFERENCES passengers(id),
	hotels_id INT FOREIGN KEY REFERENCES hotels(id),
	packets_id INT FOREIGN KEY REFERENCES packets(id),
	airlines_id INT FOREIGN KEY REFERENCES airlines(id),
	estimation INT NOT NULL,
	amount int,
	transactiondate DATETIME NOT NULL,
	bank_account_id INT FOREIGN KEY REFERENCES bank_account(id) NOT NULL,
	transfers varchar(1) DEFAULT 'N',
	paid_at DATETIME
);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO user_bank(id, name, bank_name) VALUES
(1027491029, 'Hartanti Tri Kartawijaya', 'BCA');
INSERT INTO user_bank(id, name, bank_name) VALUES
(2018401922, 'Verawati Liani Susanto', 'Mandiri');
INSERT INTO user_bank(id, name, bank_name) VALUES
(1025482019, 'Fanny Shinta Budiono', 'BNI');
INSERT INTO user_bank(id, name, bank_name) VALUES
(1710299810, 'Slamet Yuda Dharmawijaya', 'BCA');
INSERT INTO user_bank(id, name, bank_name) VALUES
(2019332018, 'Suharto Yandi Budiman', 'BRI');
INSERT INTO user_bank(id, name, bank_name) VALUES
(1028103719, 'Sinta Sari Sutedja', 'Muamalat');

SELECT id AS ACCOUNT_NUMBER, name AS ACCOUNT_NAME, bank_name AS BANK FROM user_bank;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO users (name, email, password, address, city, phone, account_id) VALUES
('Hartanti Tri Kartawijaya', 'Hartanti3k@gmail.com', 'RSdnEQ5F', 'Prof Dr Latumenten Street 20 A, Jakarta', 'West Jakarta', '0216312613', 1027491029);
INSERT INTO users (name, email, password, address, city, phone, account_id) VALUES
('Verawati Liani Susanto', 'Verlisusanto@gmail.com', 'aRLM6xcz', 'Taman Cengkareng Indah Residence Bl A/1, Jakarta', 'West Jakarta', '0216190396', 2018401922);
INSERT INTO users (name, email, password, address, city, phone, account_id) VALUES
('Fanny Shinta Budiono', 'Fannyono@gmail.com', 'hTf3G2w9', 'Panataran 9 Street,Pegangsaan', 'Central Jakarta', '0212305236', 1025482019);
INSERT INTO users (name, email, password, address, city, phone, account_id) VALUES
('Slamet Yuda Dharmawijaya', 'Slametyuda@gmail.com', '6bPPCjN6', 'Kwitang Raya 8 Street, Senatama Building , Jakarta', 'South Jakarta', '0213927977', 1710299810);
INSERT INTO users (name, email, password, address, city, phone, account_id) VALUES
('Suharto Yandi Budiman', 'Suharto_yandi@gmail.com', 'T5e4wE2u', 'Pinangsia Raya Street, Glodok residence, Jakarta', 'North Jakarta', '0216280906', 2019332018);

--SELECT * FROM users
SELECT name AS USERNAME, email AS EMAIL, address AS ADDRESS, city AS CITY, phone AS NUMBER_PHONE, account_id AS ACCOUNT_NUMBER FROM users

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890735, 'Hartanti Tri Kartawijaya', 'Prof Dr Latumenten Street 20 A, Jakarta', 'West Jakarta', '11330', '0216312613', '40');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890735, 'Setiawan Bima Hardja', 'Prof Dr Latumenten Street 20 A, Jakarta', 'West Jakarta', '11330', '0218906118', '45');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890735, 'Ari Suhendra Sutedja', 'Prof Dr Latumenten Street 20 A, Jakarta', 'West Jakarta', '11330', '0215291034', '17');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890748, 'Verawati Liani Susanto', 'Taman Cengkareng Indah Residence Bl A/1, Jakarta', 'West Jakarta', '11710', '0216190396', '37');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890748, 'Susilo Irwan Santoso', 'Taman Cengkareng Indah Residence Bl A/1, Jakarta', 'West Jakarta', '11710', '0216193586', '40');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890748, 'Ratu Dian Oesman', 'Taman Cengkareng Indah Residence Bl A/1, Jakarta', 'West Jakarta', '11710', '0215265525', '16');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890761, 'Fanny Shinta Budiono', 'Panataran 9 Street,Pegangsaan', 'Central Jakarta', '10310', '0212305236', '22');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890774, 'Slamet Yuda Dharmawijaya', 'Kwitang Raya 8 Street, Senatama Building , Jakarta', 'South Jakarta', '12740', '0213927977', '45');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890774, 'Liani Siska Gunawan', 'Kwitang Raya 8 Street, Senatama Building , Jakarta', 'South Jakarta', '12740', '0216516126', '39');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890774, 'Indah Utami Sutedja', 'Kwitang Raya 8 Street, Senatama Building , Jakarta', 'South Jakarta', '12740', '0217945013', '17');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890774, 'Sinta Sari Sutedja', 'Kwitang Raya 8 Street, Senatama Building , Jakarta', 'South Jakarta', '12740', '0215696592', '15');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890787, 'Suharto Yandi Budiman', 'Pinangsia Raya Street, Glodok residence, Jakarta', 'North Jakarta', '14140', '0216280906', '27');
INSERT INTO passengers (user_id, name, address, city, postal_code, phone, age) VALUES
(16890787, 'Dwi Nirmala Cahyadi', 'Pinangsia Raya Street, Glodok residence, Jakarta', 'North Jakarta', '14140', '0218397111', '24');

--SELECT * FROM passengers;
SELECT user_id AS USER_ID, name AS PASSENGERS_NAME, address AS ADDRESS, city AS CITY, postal_code AS POSTAL_CODE, phone AS NUMBER_PHONE, age AS PASSENGER_AGE FROM passengers;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO packets (name, description, price) VALUES
('Tera', 'International Tour Guide + Transportation + Food(3x) + Destination Places = Metropolitan + Nature', 1000000);
INSERT INTO packets (name, description, price) VALUES
('Giga', 'Indonesian Tour Guide + Transportation + Food(3x) + Destination Places = Metropolitan or Nature', 750000);
INSERT INTO packets (name, description, price) VALUES
('Mega', 'Indonesian Tour Guide + Transportation + Food(3x) + Destination Places = Nature', 500000);

--SELECT * FROM packets;
SELECT id AS PACKET_ID, name AS PACKET_NAME, description AS DESCRIPTION, price AS PACKET_PRICE FROM packets;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO airlines (name, description, price) VALUES
('Kingdom', 'Japan, South Korea, China', 15000000);
INSERT INTO airlines (name, description, price) VALUES
('Phylum', 'Hongkong, Turkey, Vietnam', 13000000);
INSERT INTO airlines (name, description, price) VALUES
('Class', 'Malaysia, Thailand, Singapore', 10000000);

--SELECT * FROM airlines
SELECT id AS AIRLINE_PACKET_ID, name AS AIRLINE_PACKET_NAME, description AS DESTINATION, price AS AIRLINE_PACKET_PRICE FROM airlines;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO hotels (name, description, price) VALUES
('Intercontinental Hotel', '5 Star Hotel', 750000);
INSERT INTO hotels (name, description, price) VALUES
('Four Seasons Hotel', '4 Star Hotel', 550000);
INSERT INTO hotels (name, description, price) VALUES
('RedDoorz Hotel', '3 Star Hotel', 450000);

--SELECT * FROM hotels;
SELECT id AS HOTEL_ID, name AS NAME_HOTEL, description AS QUALITY, price AS HOTEL_PRICE FROM hotels;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO bank_account(id, name) VALUES 
(1864279304, 'TravelNow Official');
INSERT INTO bank_account(id, name) VALUES 
(1800920182, 'TravelNow Official');

SELECT id AS ACCOUNT_NUMBER, name AS ACCOUNT_NAME FROM bank_account
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, bank_account_id, estimation, transfers) VALUES
(16890735, 14890735, '2019-12-05 12:10:00', 30789312, 10789312, 1864279304, 3, 'Y');
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, bank_account_id, estimation, transfers) VALUES
(16890735, 14890748, '2019-12-05 12:15:00', 30789312, 10789312, 1864279304, 3, 'Y');
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, bank_account_id, estimation, transfers) VALUES
(16890735, 14890761, '2019-12-05 12:20:00', 30789312, 10789312, 1864279304, 3, 'Y' );

INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890748, 14890774, '2019-12-09 21:10:00', 30789325, 10789325, 20789312, 1800920182, 5, 'Y' );
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890748, 14890787, '2019-12-09 21:15:00', 30789325, 10789325, 20789312, 1800920182, 5, 'Y');
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890748, 14890800, '2019-12-09 21:20:00', 30789325, 10789325, 20789312, 1800920182, 5, 'Y');

INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, airlines_id, bank_account_id, estimation) VALUES
(16890761, 14890813, '2019-12-11 00:59:00', 30789338, 20789338, 1864279304, 2);

INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890774, 14890826, '2019-12-11 20:50:00', 30789312, 20789312, 1800920182, 9, 'Y' );
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890774, 14890839, '2019-12-11 20:53:00', 30789312, 20789312, 1800920182, 9, 'Y' );
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890774, 14890852, '2019-12-11 20:59:00', 30789312, 20789312, 1800920182, 9, 'Y' );
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, airlines_id, bank_account_id, estimation, transfers) VALUES
(16890774, 14890865, '2019-12-11 21:03:00', 30789312, 20789312, 1800920182, 9, 'Y' );

INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, airlines_id, bank_account_id, estimation) VALUES
(16890787, 14890878, '2019-12-13 10:10:00', 30789325, 10789312, 20789312, 1864279304, 7);
INSERT INTO bookings (users_id, passengers_id, transactiondate, hotels_id, packets_id, airlines_id, bank_account_id, estimation) VALUES
(16890787, 14890891, '2019-12-13 10:14:00', 30789325, 10789312, 20789312, 1864279304, 7);


--DROP TABLE bookings
--SELECT * FROM bookings
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_invoice
ON bookings AFTER INSERT
AS
BEGIN
DECLARE @transfers varchar(1);
DECLARE @id INT;
DECLARE @paid_at DATETIME;
DECLARE @users_id INT;

SELECT @id = i.id FROM inserted i;
SELECT @transfers = i.transfers FROM inserted i;
SELECT @paid_at = i.paid_at FROM inserted i;
SELECT @users_id = i.users_id FROM inserted i;

IF (@transfers IS NOT NULL)
BEGIN
	SELECT @transfers = 'Y' WHERE @id = @users_id
	UPDATE bookings SET paid_at = GETDATE() WHERE id = @id
END

IF (@transfers = 'N')
BEGIN
	SELECT @transfers = 'N' WHERE @id = @users_id
	UPDATE bookings SET paid_at = NULL WHERE id = @id
END
END;

--DROP TRIGGER tr_invoice
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_bookings_amount
ON bookings AFTER INSERT
AS
BEGIN
DECLARE @amount INT;
DECLARE @hotels_id INT;
DECLARE @hotels_price INT;
DECLARE @airlines_id INT;
DECLARE @airlines_price INT;
DECLARE @packets_id INT;
DECLARE @packets_price INT;
DECLARE @id INT;
DECLARE @estimation INT;
 
SELECT @id = i.id FROM inserted i;
SELECT @hotels_id = i.hotels_id FROM inserted i;
SELECT @hotels_price = 0;

SELECT @airlines_id = i.airlines_id FROM inserted i;
SELECT @airlines_price = 0;

SELECT @packets_id = i.packets_id FROM inserted i;
SELECT @packets_price = 0;
 
 
IF (@hotels_id IS NOT NULL)
BEGIN
    SELECT @hotels_price = price FROM hotels WHERE id = @hotels_id
END

IF (@airlines_id IS NOT NULL)
BEGIN
	SELECT @airlines_price = price FROM airlines WHERE id = @airlines_id
END

IF (@packets_id IS NOT NULL)
BEGIN
	SELECT @packets_price = price FROM packets WHERE id = @packets_id
END

UPDATE bookings SET amount = (@hotels_price + @packets_price) * estimation + @airlines_price WHERE id = @id;
END;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW TransactionTodayView AS
SELECT TOP 10 id AS BOOKING_ID, users_id AS GUEST, bank_account_id AS BANK
FROM bookings
WHERE paid_at < GETDATE()
ORDER BY id DESC;
--DROP VIEW TransactionTodayView

CREATE VIEW PassengersPaidTime AS
SELECT passengers.id, passengers.name, bookings.paid_at
FROM passengers INNER JOIN bookings ON bookings.passengers_id=passengers.id;

--DROP VIEW PassengersPaidTime
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE insertBank
@id INT,
@name varchar(230)
AS
BEGIN
	SET NOCOUNT ON
INSERT INTO user_bank (id, name) VALUES
(@id, @name)
END;

EXEC insertBank
@id = 1928300192,
@name = 'Sinta Sari Sutedja'

CREATE PROCEDURE insertUsers
@name varchar(230),
@email varchar(230),
@password varchar(20),
@account_id INT,
@address text,
@city varchar(25),
@phone varchar(15)
AS
BEGIN
	SET NOCOUNT ON
INSERT INTO users (name, email, password, account_id, address, city, phone) VALUES
(@name, @email, @password, @account_id, @address, @city, @phone)
END;

EXEC insertUsers
@name = 'Sinta Sari Sutedja',
@email = 'Sintasari@gmail.com',
@password = 'yY78ZeNB',
@account_id = '1928300192',
@address = 'Marzuki VII street, Manggis Residence, Jakarta',
@city = 'East Jakarta',
@phone = '0210281038'