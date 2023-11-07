CREATE TABLE `users` (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(16),
    last_name VARCHAR(16),
    username VARCHAR(16),
    password VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE education (
    id INT AUTO_INCREMENT,
    name VARCHAR(64),
    type VARCHAR(64),
    location VARCHAR(128),
    founded DATETIME,
    PRIMARY KEY(`id`)
);

CREATE TABLE companies (
    id INT AUTO_INCREMENT,
    name VARCHAR(128),
    type VARCHAR(128),
    location VARCHAR(128),
    PRIMARY KEY(`id`)
);




CREATE TABLE user_and_user (
    id INT AUTO_INCREMENT,
    user_1 INT,
    user_2 INT,
    time DATETIME,
    FOREIGN KEY (user_1) REFERENCES users(id),
    FOREIGN KEY (user_2) REFERENCES users(id)
);

CREATE TABLE school_and_user (
    id INT AUTO_INCREMENT,
    link TEXT,
    attend DATE,
    graduated DATE,
    degree TEXT,
    user_id INT,
    school_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(school_id) REFERENCES schools(id)
);

CREATE TABLE companie_and_user (
    id INT PRIMARY KEY,
    link TEXT,
    began DATETIME,
    left DATETIME,
    title TEXT,
    user_id INT,
    company_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);

