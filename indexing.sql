CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    country VARCHAR(50),
    signup_date DATE
);

INSERT INTO users (name, email, country, signup_date)
SELECT
    'User_' || gs AS name,
    'user' || gs || '@example.com' AS email,
    CASE
        WHEN gs % 5 = 0 THEN 'Bangladesh'
        WHEN gs % 5 = 1 THEN 'India'
        WHEN gs % 5 = 2 THEN 'USA'
        WHEN gs % 5 = 3 THEN 'UK'
        ELSE 'Canada'
    END AS country,
    CURRENT_DATE - (gs % 365)
FROM generate_series(1, 100000) AS gs;

EXPLAIN ANALYZE
select * from users where email = 'user1@example.com'

create index idx_users_email
on users(email)

drop index idx_users_email

EXPLAIN ANALYZE
select * from users where email = 'user1@example.com'