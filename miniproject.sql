--Create 
CREATE TABLE users (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    userName NVARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    address NVARCHAR(255) NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE categories (
    categoryId INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(50) NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE products (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    categoryId INT NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Products_Categories FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
);

CREATE TABLE orders (
    orderId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Orders_Users FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE orderItems (
    orderItemId INT IDENTITY(1,1) PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10,2) NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (orderId) REFERENCES orders(orderId),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE reviews (
    reviewId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    revtext NVARCHAR(500),
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Reviews_Users FOREIGN KEY (userId) REFERENCES users(userId),
    CONSTRAINT FK_Reviews_Products FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE payments (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    orderId INT NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    paymentStatus NVARCHAR(30) NOT NULL DEFAULT 'Pending',
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Payments_Orders FOREIGN KEY (orderId) REFERENCES orders(orderId)
);

CREATE TABLE wishlistItems (
    wishlistItemId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Wishlist_Users FOREIGN KEY (userId) REFERENCES users(userId),
    CONSTRAINT FK_Wishlist_Products FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE cart (
    cartId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Cart_Users FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE cartItems (
    cartItemsId INT IDENTITY(1,1) PRIMARY KEY,
    cartId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    isDeleted Bit Default 0,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_CartItems_Cart FOREIGN KEY (cartId) REFERENCES cart(cartId),
    CONSTRAINT FK_CartItems_Products FOREIGN KEY (productId) REFERENCES products(productId)
);

--Insert
INSERT INTO users (userName, phone, email, address) VALUES
('Ahmad Ali', '0791234567', 'ahmad.ali@example.com', 'Amman, Jordan'),
('Sara Omar', '0789876543', 'sara.omar@example.com', 'Irbid, Jordan'),
('Khaled Zaid', '0775554433', 'khaled.zaid@example.com', 'Zarqa, Jordan');

INSERT INTO categories (categoryName) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO products (productName, quantity, price, categoryId) VALUES
('Wireless Mouse', 50, 25.50, 1),
('Mechanical Keyboard', 30, 75.00, 1),
('Cotton T-Shirt', 100, 15.00, 2),
('SQL Database Guide', 20, 40.00, 3);

INSERT INTO orders (userId, totalAmount) VALUES
(1, 100.50),
(2, 15.00);

INSERT INTO orderItems (orderId, productId, quantity, unitPrice) VALUES
(1, 1, 1, 25.50),
(1, 2, 1, 75.00),
(2, 3, 1, 15.00);

INSERT INTO reviews (userId, productId, rating, revtext) VALUES
(1, 1, 5, 'Great mouse, very responsive!'),
(2, 3, 4, 'Nice fabric and fits well.');

INSERT INTO payments (orderId, totalAmount, paymentStatus) VALUES
(1, 100.50, 'Completed'),
(2, 15.00, 'Completed');

INSERT INTO wishlistItems (userId, productId) VALUES
(1, 3),
(2, 2);

INSERT INTO cart (userId) VALUES
(1),
(2);

INSERT INTO cartItems (cartId, productId, quantity) VALUES
(1, 4, 1),
(2, 1, 2);
--update 
UPDATE products
SET price = 22.00, updatedAt = GETDATE()
WHERE productId = 1;
--soft delete
UPDATE users
SET isDeleted = 1, updatedAt = GETDATE()
WHERE userId = 3;

--select
SELECT 
    o.orderId,u.userName,
    u.email,o.totalAmount,
    o.createdAt
FROM orders AS o
INNER JOIN users AS u ON o.userId = u.userId;

SELECT * from products where isDeleted=0 ORDER BY price;

SELECT 
    p.productName,
    AVG(CAST(r.rating AS DECIMAL(3,2))) AS avgRating
FROM products AS p
LEFT JOIN reviews AS r ON p.productId = r.productId
GROUP BY p.productId, p.productName;

SELECT * from wishlistItems where userId=1;

SELECT 
    u.userName, SUM(o.totalAmount) AS TotalSales
FROM users AS u
INNER JOIN orders AS o ON u.userId = o.userId
GROUP BY u.userId, u.userName;

SELECT * from products where price<20 and price>5;

SELECT TOP 5 orderId, userId,
    totalAmount,createdAt
FROM orders
ORDER BY createdAt DESC;

