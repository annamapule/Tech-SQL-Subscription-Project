DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    join_date DATE,
    country TEXT
);
-- Folder 1: The Customers
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    join_date DATE,
    country TEXT
);

-- Folder 2: The Bills
CREATE TABLE subscriptions (
    sub_id INT PRIMARY KEY,
    user_id INT,
    price INT,
    status TEXT -- This will say 'Active' or 'Cancelled'
);

-- Put 3 customers into the folder
INSERT INTO users VALUES (1, '2026-01-01', 'USA');
INSERT INTO users VALUES (2, '2026-01-15', 'UK');
INSERT INTO users VALUES (3, '2026-02-01', 'Canada');

-- Put their bills into the folder
INSERT INTO subscriptions VALUES (101, 1, 15, 'Active');
INSERT INTO subscriptions VALUES (102, 2, 15, 'Cancelled');
INSERT INTO subscriptions VALUES (103, 3, 29, 'Active');

DELETE FROM subscriptions;
DELETE FROM users;

-- Adding 5 more customers
INSERT INTO users VALUES (4, '2026-02-10', 'USA');
INSERT INTO users VALUES (5, '2026-03-01', 'Germany');
INSERT INTO users VALUES (6, '2026-03-12', 'USA');
INSERT INTO users VALUES (7, '2026-04-05', 'India');
INSERT INTO users VALUES (8, '2026-04-20', 'UK');

-- Adding their bills
INSERT INTO subscriptions VALUES (104, 4, 15, 'Active');
INSERT INTO subscriptions VALUES (105, 5, 29, 'Cancelled');
INSERT INTO subscriptions VALUES (106, 6, 15, 'Active');
INSERT INTO subscriptions VALUES (107, 7, 9, 'Active');
INSERT INTO subscriptions VALUES (108, 8, 29, 'Cancelled');

SELECT users.country, subscriptions.price, subscriptions.status
FROM users
JOIN subscriptions 
ON users.user_id = subscriptions.user_id;

SELECT SUM(subscriptions.price) AS total_usa_sales
FROM users
JOIN subscriptions ON users.user_id = subscriptions.user_id
WHERE users.country = 'USA' AND subscriptions.status = 'Active';

DELETE FROM subscriptions;
DELETE FROM users;

INSERT OR IGNORE INTO users VALUES (1, '2026-01-01', 'USA');
INSERT OR IGNORE INTO users VALUES (2, '2026-01-15', 'UK');
INSERT OR IGNORE INTO users VALUES (3, '2026-02-01', 'Canada');

INSERT OR IGNORE INTO users VALUES (4, '2026-02-10', 'USA');
INSERT OR IGNORE INTO users VALUES (5, '2026-03-01', 'Germany');
INSERT OR IGNORE INTO users VALUES (6, '2026-03-12', 'USA');
INSERT OR IGNORE INTO users VALUES (7, '2026-04-05', 'India');
INSERT OR IGNORE INTO users VALUES (8, '2026-04-20', 'UK');


INSERT OR IGNORE INTO subscriptions VALUES (104, 4, 15, 'Active');
INSERT OR IGNORE INTO subscriptions VALUES (105, 5, 29, 'Cancelled');
INSERT OR IGNORE INTO subscriptions VALUES (106, 6, 15, 'Active');
INSERT OR IGNORE INTO subscriptions VALUES (107, 7, 9, 'Active');
INSERT OR IGNORE INTO subscriptions VALUES (108, 8, 29, 'Cancelled');


SELECT users.user_id, users.country, subscriptions.price, subscriptions.status
FROM users
JOIN subscriptions ON users.user_id = subscriptions.user_id
WHERE users.country = 'USA' AND subscriptions.status = 'Active';


