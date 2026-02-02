CREATE TABLE sessions (
    session_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    session_date DATE NOT NULL,
    channel VARCHAR(50),
    device VARCHAR(20),
    CONSTRAINT fk_sessions_users
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);
