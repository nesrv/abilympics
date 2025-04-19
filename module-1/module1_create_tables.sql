CREATE TABLE Categories (
    category_value VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL
);

CREATE TABLE Warehouses (
    warehouse_id INT PRIMARY KEY,
    city_id INT NOT NULL,
    warehouse_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);


CREATE TABLE Gifts (
    gift_id INT PRIMARY KEY,
    gift_name VARCHAR(255) NOT NULL,
    category_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (category_value) REFERENCES Categories(category_value)
);

CREATE TABLE Stocks (
    stock_id INT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    gift_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (gift_id) REFERENCES Gifts(gift_id)
);

CREATE TABLE letters (
    letter_id INT AUTO_INCREMENT PRIMARY KEY,
    child_name VARCHAR(100) NOT NULL,
    child_age TINYINT UNSIGNED NOT NULL,
    city_id INT NOT NULL,
    letter_date DATE NOT NULL,
    gift_id INT,
    
    -- Ограничения для внешних ключей
    FOREIGN KEY (city_id) REFERENCES Cities(city_id),
    FOREIGN KEY (gift_id) REFERENCES Gifts(gift_id)
);

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    letter_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    send_date DATE,
    delivery_date DATE,
    FOREIGN KEY (letter_id) REFERENCES Letters(letter_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

CREATE TABLE Weather (
    weather_id INT PRIMARY KEY,
    city_id INT NOT NULL,
    date DATE NOT NULL,
    temperature DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);