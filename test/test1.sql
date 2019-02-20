CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT CHECK(LENGTH(content) > 8)
    is_draft BOOLEAN DEFAULT TRUE,
    is_del BOOLEAN DEFAULT FALSE,
    create_date TIMESTAMP DEFAULT 'now'
);