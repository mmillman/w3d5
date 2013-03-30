CREATE TABLE chefs (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  mentor INTEGER
  -- ADD FOREIGN KEY CONSTRAINTS
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
       (NULL, 'April', 'Goldman', 3),
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
  -- ADD FOREIGN KEY CONSTRAINTS
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
  -- ADD FOREIGN KEY CONSTRAINTS
);

INSERT INTO chef_tenures (id, chef_id, restaurant_id, start_date, end_date)
VALUES (NULL, 1, 1, '2008-03-02', '2013-03-02'),
       (NULL, 2, 1, '2009-01-02', '2010-05-22'),
       (NULL, 3, 1, '2009-04-02', '2013-03-02'),
       (NULL, 4, 1, '2011-03-19', '2011-09-10'),
       (NULL, 5, 1, '2013-03-03', '2013-03-20'),

       (NULL, 6, 2, '2008-03-02', '2013-03-02'),
       (NULL, 7, 2, '2009-01-02', '2010-05-22'),
       (NULL, 8, 2, '2009-04-02', '2013-03-02'),
       (NULL, 9, 2, '2011-03-19', '2011-09-10'),
       (NULL, 10, 2, '2013-03-03', '2013-03-20');



CREATE TABLE critics (
  id INTEGER PRIMARY KEY,
  screen_name VARCHAR(255) NOT NULL
  -- ADD FOREIGN KEY CONSTRAINTS
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
  -- ADD FOREIGN KEY CONSTRAINTS
);

INSERT INTO restaurant_reviews (id, restaurant_id, critic_id, review, score, review_date)
VALUES (NULL, 1, 2, "These guys serves great code, yum!", 20, '2013-01-24'),
       (NULL, 2, 2, "Fast, cheap, and close. Awesome!", 20, '2012-12-15'),
       (NULL, 2, 1, "Fast, cheap, and close. So annoying!", 2, '2011-12-13'),
       (NULL, 2, 5, "Needs more pad thai sandwiches", 7, '2012-08-01'),
       (NULL, 2, 4, "These guys don't have a cheerios topping. Huge mistake.", 4, '2012-09-11'),
       (NULL, 3, 1, "How are these guys still in business?!", 1, '2013-01-24'),
       (NULL, 4, 3, "This name is too long.", 6, '2013-01-24'),
       (NULL, 5, 4, "This place didn't have enough cheerios.", 5, '2013-01-24'),

       (NULL, 6, 2, "Oh Em Gee, so good!", 19, '2012-09-16'),
       (NULL, 7, 4, "Found some cheerios on the floor, this place rocks!", 20, '2013-01-24'),
       (NULL, 11, 5, "They didn't have any pad thai :()", 10, '2011-05-14'),
       (NULL, 17, 5, "They had lots of pad thai! :D", 20, '2011-05-17');
