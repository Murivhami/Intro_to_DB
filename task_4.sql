#!/bin/bash

SELECT book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE
    WHERE TABLE_SCHEMA = %s AND TABLE_NAME = 'Books';
USE alx_book_store;
