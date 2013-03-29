CREATE TABLE chefs (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  mentor INTEGER
);

INSERT INTO chefs (id, first_name, last_name, mentor)
VALUES (NULL, 'Ned', 'Ruggeri', 1),
       (NULL, 'Kush', 'Patel', 2),
       (NULL, 'Kyle', 'Lucovsky', 1),
       (NULL, 'Niranjan', 'Ramadas', 1),
       (NULL, 'Ryan', 'Sepassi', 1),

       (NULL, 'Lisa', 'Friedman', 3),
       (NULL, 'Eric', 'Xu', 3),
       (NULL, 'Ean', 'Huddleston', 3),
       (NULL, 'Dan', 'Tsui', 3),
       (NULL, 'Darwish', 'Gani', 3),

       (NULL, 'Brian', 'Heithaus', 3),
       (NULL, 'Darwish', 'Gani', 3),
       (NULL, 'Dylan', 'Clark', 4),
       (NULL, 'Rich', 'Wallett', 4),
       (NULL, 'David', 'Xu', 4),

       (NULL, 'Aaron', 'Rama', 4),
       (NULL, 'Bryant', 'Detwiller', 4),
       (NULL, 'Eric', 'Lin', 4),
       (NULL, 'Mark', 'Millman', 5),
       (NULL, 'India', 'Meisner', 5),

       (NULL, 'Josh', 'Willborn', 5),
       (NULL, 'Peter', 'Lin', 5),
       (NULL, 'Ian', 'Morrison', 5),
       (NULL, 'Nate', 'Hayflick', 5);

CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  neighborhood VARCHAR(255) NOT NULL,
  cuisine VARCHAR(255) NOT NULL
);

INSERT INTO restaurants (id, name, neighborhood, cuisine)
VALUES (NULL, 'App Academy', 'Financial District', 'Ruby'),
       (NULL, 'Subway', 'Financial District', 'Sandwiches'),
       (NULL, 'Boulevard', 'Financial District', 'French'),
       (NULL, 'Kokkari Estiatorio', 'Financial District', 'Mediterranean'),
       (NULL, 'Quince', 'Financial District', 'Mediterranean'),

       (NULL, 'Michael Mina', 'Financial District', 'American'),
       (NULL, 'Ame', 'Financial District', 'Japanese'),
       (NULL, 'Ozumo', 'Financial District', 'Japanese'),
       (NULL, 'Akikos', 'Financial District', 'Japanese'),
       (NULL, 'The butler and the chef', 'SOMA', 'French'),

       (NULL, 'Mexico au Parc', 'SOMA', 'Mexican'),
       (NULL, 'Victor''s', 'SOMA', 'Mexican'),
       (NULL, 'Dos Pinas', 'SOMA', 'Mexican'),
       (NULL, 'Ruchi', 'SOMA', 'Indian'),
       (NULL, 'Cafe Chaat', 'SOMA', 'Indian'),

       (NULL, 'Curry Up Now', 'SOMA', 'Indian'),
       (NULL, 'Chai-Yo', 'Nob Hill', 'Thai'),
       (NULL, 'Don Pisto''s', 'Nob Hill', 'Mexican');

CREATE TABLE chef_tenures (
  id INTEGER PRIMARY KEY,
  chef_id INTEGER NOT NULL,
  restaurant_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE critics (
  id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255) NOT NULL
);

INSERT INTO critics (id, screen_name)
VALUES (NULL, 'angry_guy'),
       (NULL, 'nice_guy'),
       (NULL, 'mr_judge_you'),
       (NULL, 'just_give_me_cheerios'),
       (NULL, 'thai_fan');


CREATE TABLE restaurant_reviews (
  id INTEGER PRIMARY KEY,
  restaurant_id INTEGER NOT NULL,
  critic_id INTEGER NOT NULL,
  review TEXT NOT NULL,
  score INTEGER NOT NULL,
  review_date DATE NOT NULL
);

INSERT INTO restaurant_reviews (id, restaurant_id, critic_id, review, score, review_date)
VALUES (NULL, 1, 2, "These guys serves great code, yum!", 20, '2013-1-24'),
       (NULL, 2, 2, "Fast, cheap, and close. Awesome!", 20, '2012-12-15'),
       (NULL, 3, 1, "How are these guys still in business?!", 1, '2013-1-24'),
       (NULL, 4, 3, "This name is too long.", 6, '2013-1-24'),
       (NULL, 5, 4, "This place didn't have enough cheerios.", 5, '2013-1-24'),

       (NULL, 6, 2, "Oh Em Gee, so good!", 19, '2012-9-16'),
       (NULL, 7, 4, "Found some cheerios on the floor, this place rocks!", 20, '2013-1-24'),
       (NULL, 11, 5, "They didn't have any pad thai :()", 10, '2011-5-14'),
       (NULL, 17, 5, "They had lots of pad thai! :D", 20, '2011-5-17');
