CREATE TABLE users (
    id serial primary key,
    player varchar(255) not null,
    score real,
    team varchar(255)
);

INSERT INTO users (player,score,team) VALUES
('库里',28.3,'勇士'),
('哈登',30.2,'火箭'),
('哈登',30.2,'火箭'),
('哈登',30.2,'火箭'),
('哈登',30.2,'火箭'),
('哈登',30.2,'火箭');