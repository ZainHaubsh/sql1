--1
CREATE TABLE users (
    userID INT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE profiles (
    profileID INT PRIMARY KEY,
    userID INT,
    bio TEXT,
    birthDate DATE,
    FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE services (
    serviceId INT PRIMARY KEY,
    serviceName VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE messages (
    messageID INT PRIMARY KEY,
    senderID INT,
    receiverID INT,
    messageContent TEXT,
    status VARCHAR(20),
    FOREIGN KEY (senderID) REFERENCES users(userID),
    FOREIGN KEY (receiverID) REFERENCES users(userID)
);

CREATE TABLE payments (
    paymentId INT PRIMARY KEY,
    userId INT,
    serviceId INT,
    paymentDate TIMESTAMP,
    amount DECIMAL(10, 2),
    FOREIGN KEY (userId) REFERENCES users(userID),
    FOREIGN KEY (serviceId) REFERENCES services(serviceId)
);

-- 2
INSERT INTO users VALUES (1, 'Alice Smith', 'alice@email.com', '555-0101');
INSERT INTO users VALUES (2, 'Bob Jones', 'bob@email.com', '555-0102');
INSERT INTO users VALUES (3, 'Charlie Brown', 'charlie@email.com', '555-0103');
INSERT INTO users VALUES (4, 'Diana Prince', 'diana@email.com', '555-0104');
INSERT INTO users VALUES (5, 'Evan Wright', 'evan@email.com', '555-0105');
INSERT INTO users VALUES (6, 'Fiona Gallagher', 'fiona@email.com', '555-0106');

INSERT INTO profiles VALUES (101, 1, 'Software Engineer and tech enthusiast.', '1992-05-14');
INSERT INTO profiles VALUES (102, 2, 'Graphic designer loving art.', '1995-08-22');
INSERT INTO profiles VALUES (103, 3, 'Avid reader and coffee lover.', '1990-11-03');
INSERT INTO profiles VALUES (104, 4, 'Fitness trainer and nutritionist.', '1988-02-19');
INSERT INTO profiles VALUES (105, 5, 'Gamers gonna game.', '1997-12-05');
INSERT INTO profiles VALUES (106, 6, 'Travel blogger worldwide.', '1994-07-30');

INSERT INTO services VALUES (1, 'Ad-Free Experience', 'Remove all advertisements from the app.', 4.99);
INSERT INTO services VALUES (2, 'Priority Messaging', 'Messages are prioritized in queues.', 9.99);
INSERT INTO services VALUES (3, 'Custom Themes', 'Unlock exclusive UI color schemes.', 2.99);
INSERT INTO services VALUES (4, 'Cloud Storage Plus', 'Increase media storage limit to 50GB.', 14.99);
INSERT INTO services VALUES (5, 'HD Video Calling', 'Upgrade video resolution to 1080p.', 7.99);
INSERT INTO services VALUES (6, 'Verified Badge', 'Get a checkmark badge on your profile.', 19.99);

INSERT INTO messages VALUES (1, 1, 2, 'Hey Bob, are we still meeting today?', 'Delivered');
INSERT INTO messages VALUES (2, 2, 1, 'Yes, see you at 5 PM!', 'Read');
INSERT INTO messages VALUES (3, 3, 4, 'Can you send me the workout plan?', 'Sent');
INSERT INTO messages VALUES (4, 4, 3, 'Sure, sending it right now.', 'Delivered');
INSERT INTO messages VALUES (5, 5, 6, 'Check out this new game release.', 'Read');
INSERT INTO messages VALUES (6, 6, 5, 'Looks awesome downloading it.', 'Sent');

INSERT INTO payments VALUES (1001, 1, 1, '2026-01-10 10:00:00', 4.99);
INSERT INTO payments VALUES (1002, 2, 2, '2026-01-12 11:30:00', 9.99);
INSERT INTO payments VALUES (1003, 3, 3, '2026-01-15 14:15:00', 2.99);
INSERT INTO payments VALUES (1004, 4, 4, '2026-01-18 09:45:00', 14.99);
INSERT INTO payments VALUES (1005, 5, 5, '2026-01-20 16:20:00', 7.99);
INSERT INTO payments VALUES (1006, 6, 6, '2026-01-22 18:00:00', 19.99);

-- 3
UPDATE users SET phone = '555-9999' WHERE userID = 1;
UPDATE users SET email = 'robert.jones@email.com' WHERE userID = 2;

UPDATE profiles SET bio = 'Senior Software Engineer.' WHERE profileID = 101;
UPDATE profiles SET birthDate = '1995-08-23' WHERE profileID = 102;

UPDATE services SET price = 5.99 WHERE serviceId = 1;
UPDATE services SET description = 'Remove all ads permanently.' WHERE serviceId = 1;

UPDATE messages SET status = 'Read' WHERE messageID = 1;
UPDATE messages SET messageContent = 'Can you send me the updated workout plan?' WHERE messageID = 3;

UPDATE payments SET amount = 5.49 WHERE paymentId = 1001;
UPDATE payments SET amount = 10.99 WHERE paymentId = 1002;

--4
DELETE FROM messages WHERE senderID = 6 OR receiverID = 6;
DELETE FROM payments WHERE userId = 6;
DELETE FROM profiles WHERE userID = 6;
DELETE FROM users WHERE userID = 6;

DELETE FROM messages WHERE senderID = 5 OR receiverID = 5;
DELETE FROM payments WHERE userId = 5;
DELETE FROM profiles WHERE userID = 5;
DELETE FROM users WHERE userID = 5;

DELETE FROM profiles WHERE profileID = 103;
DELETE FROM profiles WHERE profileID = 104;

DELETE FROM payments WHERE serviceId = 5;
DELETE FROM services WHERE serviceId = 5;

DELETE FROM payments WHERE serviceId = 6;
DELETE FROM services WHERE serviceId = 6;

DELETE FROM messages WHERE messageID = 5;
DELETE FROM messages WHERE messageID = 6;

DELETE FROM payments WHERE paymentId = 1005;
DELETE FROM payments WHERE paymentId = 1006;

--5
EXEC sp_rename 'messages', 'chat_messages';

EXEC sp_rename 'payments', 'user_payments';
--6
EXEC sp_rename 'users.phone', 'mobile_number', 'COLUMN';
ALTER TABLE users ALTER COLUMN mobile_number VARCHAR(30);

EXEC sp_rename 'services.description', 'service_details', 'COLUMN';
ALTER TABLE services ALTER COLUMN service_details VARCHAR(255);