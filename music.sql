-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL,
  art_song_id INTEGER NOT NULL REFERENCES songs
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL,
  prod_song_id INTEGER NOT NULL REFERENCES songs
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');


INSERT INTO artists
  (artist_name, art_song_id)
VALUES
  ('Hason', 1),
  ('Queen', 2),
  ('Mariah Cary', 3),
  ('Boyz II Men', 3),
  ('Lady Gaga', 4),
  ('Bradley Cooper', 4),
  ('Nickelback', 5),
  ('Jay Z', 6),
  ('Alicia Keys', 6),
  ('Katy Perry', 7),
  ('Juicy J', 7),
  ('Maroon 5', 8),
  ('Christina Aguilera', 8),
  ('Avril Lavigne', 9),
  ('Destiny''s Child', 10);

INSERT INTO producers
  (producer_name, prod_song_id)
VALUES
  ('Dust Brothers', 1),
  ('Stephen Lironi', 1),
  ('Roy Thomas Baker', 2),
  ('Walter Afanasieff', 3),
  ('Benjamin Rice', 4),
  ('Rick Parashar', 5),
  ('Al Shux', 6),
  ('Max Martin', 7),
  ('Cirkut', 7),
  ('Shellback', 8),
  ('Benny Blanco', 8),
  ('The Matrix', 9),
  ('Darkchild', 10);
