-- Play testing running MYSQL in VsCode
--Tutorial: https://www.youtube.com/watch?v=Cz3WcZLRaWc

--Issue: Connecting to a database
--Reason: er_not_supported_auth_mode: client does not support authentication protocol requested by server; consider upgrading mysql client
--Solution: ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
--Source: https://stackoverflow.com/questions/50093144/mysql-8-0-client-does-not-support-authentication-protocol-requested-by-server



-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

--@block
INSERT INTO Users(email,bio,country)
VALUES (
    'hello@world.com',
    'i love strangers',
    'US'
    );

--@block
SELECT email FROM users;

--@block
SELECT id, email, country FROM Users WHERE country='US' OR id < 50;

--@block
SELECT id, email, country FROM Users WHERE email LIKE 'h%'

--@block delete users table
DROP TABLE users;

--@block creating table with a relationship
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
)

--@block
INSERT INTO Rooms (owner_id, street)
VALUES
    (1,'san diego sailboat'),
    (1,'nantucket cottage'),
    (1,'vail cabin'),
    (1,'sf cardboard box');

--@block
SELECT * FROM Users
INNER JOIN Rooms
ON Rooms.owner_id = Users.id;