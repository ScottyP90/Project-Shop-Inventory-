DROP TABLE IF EXISTS  games;
DROP TABLE IF EXISTS  publishers;

CREATE TABLE publishers(
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE,
  name VARCHAR(255),
  genre VARCHAR(255),
  description TEXT,
  stock_quantity INT,
  buy_cost INT,
  selling_price INT
);
