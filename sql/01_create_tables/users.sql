CREATE TABLE users(
user_id INT IDENTITY(1,1) PRIMARY KEY,
signup_date DATE NOT NULL,
country VARCHAR (50),
device VARCHAR (20),
acquisition_channel VARCHAR (50),
);