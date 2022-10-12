CREATE TABLE item (
    id INT NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
);

CREATE TABLE label (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR (50)
    color VARCHAR (50)
);