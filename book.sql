CREATE TABLE item (
    id INT NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id),
);

CREATE TABLE books (
    id INT,
    title VARCHAR(50),
    publisher VARCHAR(50),
    cover_state VARCHAR(50),
    FOREIGN KEY(id) REFERENCES item(id)
)

CREATE TABLE label (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR (50)
    color VARCHAR (50)
);