*******************
--- DDL (Create Tables)
*******************
CREATE TABLE borrower (
    borrower_id int primary key,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE publisher (
    publisher_id int primary key,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);

CREATE TABLE author (
    author_id int primary key,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE category (
    category_id int primary key,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE book (
    book_id int primary key,
    title VARCHAR(150) NOT NULL,
    publication_year int,
    available_copies int,
    category_id int,
    publisher_id int,
    foreign key (category_id) REFERENCES category(category_id),
    foreign key (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE borrowing_record (
    borrow_id int primary key,
    borrower_id int,
    book_id int,
    due_date DATE,
    return_date DATE,
    status VARCHAR(30),
    foreign key (borrower_id) REFERENCES borrower(borrower_id),
    foreign key (book_id) REFERENCES book(book_id)
);

CREATE TABLE book_author (
    book_id int,
    author_id int,
    primary key (book_id, author_id),
    foreign key (book_id) REFERENCES book(book_id),
    foreign key (author_id) REFERENCES author(author_id)
);