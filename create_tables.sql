CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    biography TEXT
);
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT REFERENCES authors(author_id),
    category_id INT,
    publication_year INT,
    isbn VARCHAR(20) UNIQUE,
    description TEXT
);
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE book_copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    is_available BOOLEAN DEFAULT TRUE
);
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    copy_id INT REFERENCES book_copies(copy_id),
    user_id INT REFERENCES users(user_id),
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE
);

