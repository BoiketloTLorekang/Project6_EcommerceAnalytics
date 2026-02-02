CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20),
    payment_method VARCHAR(30),
    CONSTRAINT fk_orders_users
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);
