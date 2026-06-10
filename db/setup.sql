-- Active: 1781107188029@@switchyard.proxy.rlwy.net@10261@railway@public
-- Active: 1780953484038@@127.0.0.1@5432@animals_db
CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  species VARCHAR(100) NOT NULL,
  age INTEGER,
  habitat VARCHAR(100),
  endangered BOOLEAN DEFAULT FALSE
);

INSERT INTO animals (name, species, age, habitat, endangered) VALUES
  ('Leo', 'León', 8, 'Sabana', false),
  ('Dumbo', 'Elefante africano', 12, 'Sabana', true),
  ('Nemo', 'Pez payaso', 2, 'Arrecife de coral', false),
  ('Baloo', 'Oso pardo', 15, 'Bosque templado', false);