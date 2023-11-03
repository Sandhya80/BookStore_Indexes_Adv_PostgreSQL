

-- Existing Structure:
-- task 1:
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM books LIMIT 10;

-- task 2:
SELECT * FROM pg_Indexes
WHERE tablename IN ('customers', 'orders','books');

-- Create Indexes:
-- task 3:
CREATE INDEX orders_customer_id_idx ON orders(customer_id);
CREATE INDEX orders_book_id_idx ON orders(book_id);

-- Is a multicolumn index good here?
-- tasks 4:
EXPLAIN ANALYZE SELECT (original_language, title, sales_in_millions) FROM books
WHERE original_language = 'French';

-- task 5:
SELECT pg_size_pretty(pg_total_relation_size('books'));

-- task 6:
CREATE INDEX original_language_title_sales_in_millions_idx ON books(original_language, title, sales_in_millions);

-- task 7:
SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_Indexes
WHERE tablename = 'books';

SELECT pg_size_pretty(pg_total_relation_size('books'));

-- Clean up:
-- task 8:
DROP INDEX IF EXISTS original_language_title_sales_in_millions_idx;

-- task 10(part-1):
DROP INDEX IF EXISTS orders_customer_id_idx;
DROP INDEX IF EXISTS orders_book_id_idx;

-- Bulk insert:
-- task 9:
SELECT NOW();

\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;

SELECT NOW();

-- task 10(part-2):
CREATE INDEX orders_customer_id_idx ON orders(customer_id);
CREATE INDEX orders_book_id_idx ON orders(book_id);

-- task 11:
CREATE INDEX customers_first_name_email_address_idx ON customers(first_name, email_address);

-- checking the size of the table:
SELECT pg_size_pretty(pg_total_relation_size('customers'));














