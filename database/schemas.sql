CREATE TABLE item
(
    id           INT GENERATED ALWAYS AS IDENTITY,
    genre_id     INT,
    author_id    INT,
    label_id     INT,
    publish_date DATE,
    archived     BOOLEAN,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
            REFERENCES genre (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES author (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_label
        FOREIGN KEY (label_id)
            REFERENCES label (id)
            ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE music_album
(
    id         INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    item       INT,
    CONSTRAINT fk_item
        FOREIGN KEY (item_id)
            REFERENCES item (id)
            ON DELETE CASCADE,
    PRIMARY KEY (id)
)

CREATE TABLE genre
(
    id   INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY (id)
);